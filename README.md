# Quantum walk simulation on a line using Hadamard coin
***

The protocol for the walk is to flip a quantum coin followed by the shift
operator. THe unitary evolution can then be writeen as $\hat{U}=\hat{T}\hat{C}$. Here $\hat{C}$ is the Hadamard
operator,

$$
\begin{equation}
\hat{C}=\frac{1}{\sqrt{2}}\left(\left|\uparrow\right\rangle \left\langle \uparrow\right|+\left|\uparrow\right\rangle \left\langle \downarrow\right|+\left|\downarrow\right\rangle \left\langle \uparrow\right|-\left|\downarrow\right\rangle \left\langle \downarrow\right|\right),
\end{equation}
$$

and $\hat{T}$ is the translation operator.

$$
\begin{equation}
\hat{T}=\sum_{m=-\infty}^{\infty}\left(\left|\uparrow\right\rangle \left\langle \uparrow\right|\otimes\left|m+1\right\rangle \left\langle m\right|+\left|\downarrow\right\rangle \left\langle \downarrow\right|\otimes\left|m-1\right\rangle \left\langle m\right|\right).
\end{equation}
$$

An example for 100 steps in shown here.

![1DQW](https://user-images.githubusercontent.com/100057270/157162175-c494eb78-73f4-46c2-bccd-7069733730b6.svg)
***
