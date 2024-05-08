title: High-threshold and low-overhead fault-tolerant quantum memory - Bivariate Bicycle Codes 
date: 2024-05-07 21:00
author: Weilei Zeng
tags: qLDPC, bicycle codes, QEC

随着量子计算的产业逐年扩大，量子硬件不断规模化，量子比特数上升到1000量级。为进一步实现容错量子计算，量子纠错的理论创新和实验进展显得愈发重要。IBM针对NISQ规模的量子芯片，提出了基于qLDPC码的高编码率编码方案，例如用144个物理比特编码出12个逻辑比特，四月发表在nature上。本期将对这篇文章进行图文解读，反应qLDPC的整体脉络和前沿进展。


### 研究背景I，为什么需要量子纠错？
为了量子系统中的噪声，量子芯片需要尽可能与外界环境相互隔离。而实现量子计算需要对量子比特进行操控，因此需要将量子芯片与所处环境进行耦合，从而不可避免的引入了噪声。

量子计算通过对量子比特进行门操作来实现

### Abstract

The accumulation of physical errors1–3 prevents the execution of large-scale algorithms in current quantum computers. Quantum error correction4 promises
a solution by encoding k logical qubits onto a larger number n of physical qubits,
such that the physical errors are suppressed enough to allow running a desired computation with tolerable fidelity. Quantum error correction becomes practically realizable once the physical error rate is below a threshold value that depends on the choice of quantum code, syndrome measurement circuit and decoding algorithm5. We present an end-to-end quantum error correction protocol that implements fault-tolerant memory on the basis of a family of low-density parity-check codes6.
Our approach achieves an error threshold of 0.7% for the standard circuit-based noise model, on par with the surface code7–10 that for 20 years was the leading code in terms of error threshold. The syndrome measurement cycle for a length-n code in our family requires n ancillary qubits and a depth-8 circuit with CNOT gates, qubit initializations and measurements. The required qubit connectivity is a degree-6 graph composed
of two edge-disjoint planar subgraphs. In particular, we show that 12 logical qubits can be preserved for nearly 1 million syndrome cycles using 288 physical qubits in total, assuming the physical error rate of 0.1%, whereas the surface code would require nearly 3,000 physical qubits to achieve said performance. Our findings bring demonstrations of a low-overhead fault-tolerant quantum memory within the reach of near-term quantum processors.

摘要

物理噪声的累积阻碍了大规模量子算法的实现。量子纠错提供了一个解决方案，将k个逻辑比特编码在更多数量的n个物理比特上，以此来将噪声降低到可以接受的范围。只要物理噪声低于某个容错阈值，量子纠错就是有效的。这个容错阈值依赖于量子纠错码的选择、症状测量线路和解码算法。本文提出了一个端到端的量子纠错协议，基于一类LDPC码实现了容错内存。

本方法的线路噪声模型的容错阈值达到了0.7%，与在容错性能上领先了20年的表面码相当。

### 研究背景II：为什么需要qLDPC码？

量子纠错码在数学上，可以定义成希尔伯特空间的一个子空间。不同的子空间对应了不用的纠错码。最常见的选取子空间的方式使稳定子生成法(Stabilizer formalism)，即先定义测量算符，由所有测量算符构成了本征值全为+1的本征态空间就是用来存储逻辑信息的子空间。量子纠错码比较重要的参数包括$[[n,k,d]],w,p_{th}$，分别是物理比特数、逻辑比特数、距离、测量权重、容错阈值。其中，距离与纠错能力正相关，低的测量权重和高的容错阈值对实验友好，逻辑比特数与物理比特数的比值$k/n$为编码率，编码率越高，资源利用率越高。另外，测量算符是否是近邻的，与实验难度和硬件要求息息相关，也因此引出了目前的两大类纠错码。一类是基于近邻算符的拓扑码，包括表面码。近邻算符的代价是受限的距离和趋向于零的编码率。 另一类属于qLDPC码，没有近邻要求，但要求低测量权重，也就是说，其测量矩阵是稀疏的随机矩阵。qLDPC码已经可以实现线性的编码率和线性的距离。

表面码的理论已经相对完善，已经有多个基于表面码的量子计算体系架构，从物理比特的硬件实现一直到应用算法的编译。【参考】qLDPC码要实现高编码率，也必须在体系架构的每个层面给出解决方案。brayi给出了离实用性最近的一次方案，为目前NISQ芯片的容错方案提供了参考。第一次给出了高容错阈值，且包含线路。

【比较 图片】


## 主要结果

## qLDPC的构造思路
本文的核心贡献包括

- 给出了几百比特规模的显性构造方式，权重是6
- 高编码率，高距离
- 给出了测量线路
- 给出了解码器，并拓展到线路模型，和距离计算
- 模拟出高容错阈值
- 给出了平面layout

## 技术背景：
希尔伯特空间的任意子空间都可以被定义成一个量子纠错码。为了缩小好的纠错码的搜索空间，往往在构造方式上增加各种限制，同时得到理想的性质。两种常见的构造方式就是乘积和循环。

张量乘可以将一维空间上升到二维以及更高维度，从而将乘积系统中的测量、解码和逻辑算符等分解为低维度的操作。比如Hypergraph product codes, homological product codes, subsystem product codes, lifted product codes, etc. 因为张量乘定义具有对称性，此处我们规定A是行，B是列。在测量矩阵中，A的每一行是一个测量算符，作用在量子比特阵列的每一行上。B的每一行也是一个测量算符，作用在量子比特阵列的每一列上。

![img](/images/dash_images/concatenation/lattice.pdf)
*lattice $A\otimes B$*


循环测量矩阵的优势是使其测量算符为一定范围内的近邻算符，如图所示，每一行代表一个测量，不管系统所大，都只需要同时测量相距不超过4的比特。相对于随机矩阵来说，环状矩阵不要求任意两个位置的物理比特的连接，可适用于有低拓展性的硬件架构。





循环矩阵有几种描述方式。除了直接写出整个矩阵，我们可以借助单位矩阵I和平移矩阵S，以下是大小为7的平移矩阵。

![](/images/bicycle/S_shift7.png)

S作用在任意向量上，将使向量平移一个单位，并且最后一位回到第一位。S^T则会反向平移，如下图所示。其中箭头端点和顶点所在位置组成了一个向量。

![](/images/bicycle/shift_1D.png)

现在H可以用S的多项式来表示
$H = I + S^2 + S^3$。

其中，$S^2$代表将单位矩阵平移两个单位，$S^3$代表将单位矩阵平移三个单位，相加后得到了以$1011000$为生成元的循环矩阵

因为H是一个循环矩阵，S作用在H上，在允许行变换的情况下，会得到H本身。





## 构造

本文中Bivariate Bicycle Codes的构造用到了以下二维平移矩阵

$$x = S_l \otimes I_m, y = I_l \otimes S_m $$

单位矩阵I“不起作用”，当平移矩阵S位于前面时，代表了在行方向进行平移；当平移矩阵S位于后面时，代表了在列方向进行平移。l m决定了二维阵列的大小是$m \times l$。因此x的作用是向右平移，y向下。翻过来，$x^T$向左，$y^T$向上。


![](/images/bicycle/shift_2D.png)

基于这几个基本元素的多项式，我们可以构建二维向量，（也可以认为是矩阵）。BB码的构建是基于两个项数为3的矩阵多项式。

$$A = A_1 + A_2 + A_3, B=B_1 + B_2 + B_3$$

其中$A_i,B_j$是x或y的幂。

那么BB码定义为

$$H^X=(A|B),H^Z=(B^T|A^T)$$

因为循环矩阵的特性，可以验证这两个测量矩阵$H^X(H^Z)^T = 0$ mod 2, 是合格的CSS码的定义条件。Lemma 1给出了其参数。【补充】

接下来以$[[144,12,12]]$码为例进行图解，其多项式为

$$A = x^3 + y + y^2, B = y^3 + x + x^2, l=12,m=6$$

在二维阵列中用下图表示,测量比特位于箭头顶点。
![](/images/bicycle/AB.png)

BB码将所有物理比特划分为四个区块的叠加，分别标记为LRXZ，每一个区块都是mxl的矩形阵列。

上图的A在L区块上，B在R区块上。A和B的相对位置是可以调整的，作者为了实现四个近邻比特的测量，将AB以下图的形式组合。

![](/images/bicycle/hx.png)


类似的，描述At Bt

![](/images/bicycle/hz.png)

因为LRXZ四个区块的相对位置是不确定的，所以需要某个方式来确定。作者选择了图中的黑色菱形来作为基准，菱形的圆顶点代表了需要长距离连接的比特位置，近处顶点代表了X和Z测量的辅助比特的位置。这样每个菱形就对应了唯一的X测量和Z测量，以及对应辅助比特的位置。通过对菱形进行平移可以得到新的测量算符。这样选择的好处是拥有四个近邻比特，且测量比特位于其正中，并且在后续工作中作者在两个平行二维阵列上实现了没有交叉的测量线路。但事实上，并没有足够证据说明这个选择是最优的，比如可以选择让A中的两个近邻比特与B中的远比特相邻，也是一个可选的方案。


这样就完整的定义了144码。

现在回顾一下Bivariate Bicycle Codes的定义和命名。
Bicycle是因为H由左侧 的A和右侧的B两个循环矩阵构成。Bivariate代表定义循环矩阵用到了两个变量x和y，对应了两个方向的平移。因此将这个码命名为双变量自行车码

![Pininterest img](https://i.pinimg.com/originals/25/05/16/25051662be929d78194985190aeee50a.gif)
*@Image by Pinterest*

本文除了144码，一共测试了6种码，它们由不同的大小或者不同的多项式。

![](/images/bicycle/bb_list.png)
*@Slides by Ted Yodar 2024*

## Syndrome Circuit 测量线路
本文中的BB码的测量权重全部为6.其测量可以由一个辅助比特和6个CNOT门来实现，如下图所示。

![](/images/bicycle/xx6.png)

平均下来，在每一轮测量中，每个数据比特和辅助比特上都会作用6个CNOT门。通过恰当的对CNOT门进行排序，可以是整个电路更加紧凑，耗时最少，积累的噪声也更少。作者用程序搜索了936中排序方式，选择了下图中深度为7的线路。其线路距离$d\leq 10$

![Fig 2 in the paper](/images/bicycle/syndrome_circuit.png)
*@Fig 2 in the paper*


## Decoding: BP+OSD

*Acronym 缩写*

- ancilla qubit
- quantum error-correctin codes
- qLDPC
- syndrome
- stabilizer
- check/measurement

## Reference

--------


Definition of Quantum Error Correction (QEC):
A subspace in the Hilbert space


Idea: Use redundancy to reveal noise

Key parameters: [[𝑛,𝑘,𝑑]],𝑤,𝑝_𝑡ℎ

$[[n,k,d]],w,p_{th}$



## Main results of Bravyi et al 2024






## Method

## Open


