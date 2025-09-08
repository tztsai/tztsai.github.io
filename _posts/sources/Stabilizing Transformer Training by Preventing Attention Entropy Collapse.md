Training stability is of great importance to Transformers. In this work, we investigate the training dynamics of Transformers by examining the evolution of the attention layers. In particular, we track the attention entropy for each attention head during the course of training, which is a proxy for model sharpness. We identify a common pattern across different architectures and tasks, where low attention entropy is accompanied by high training instability, which can take the form of oscillating loss or divergence. We denote the pathologically low attention entropy, corresponding to highly concentrated attention scores, as \textit{entropy collapse}. As a remedy, we propose \sigmaReparam, a simple and efficient solution where we reparametrize all linear layers with spectral normalization and an additional learned scalar. We demonstrate that \sigmaReparam successfully prevents entropy collapse in the attention layers, promoting more stable training. Additionally, we prove a tight lower bound of the attention entropy, which decreases exponentially fast with the spectral norm of the attention logits, providing additional motivation for our approach. We conduct experiments with \sigmaReparam on image classification, image self-supervised learning, machine translation, speech recognition, and language modeling tasks. We show that \sigmaReparam provides stability and robustness with respect to the choice of hyperparameters, going so far as enabling training (a) a Vision Transformer {to competitive performance} without warmup, weight decay, layer normalization or adaptive optimizers; (b) deep architectures in machine translation and (c) speech recognition to competitive performance without warmup and adaptive optimizers. Code is available at \url{this https URL}.

# Stabilizing Transformer Training by Preventing Attention Entropy Collapse

This software project accompanies the research paper, [Stabilizing Transformer Training by Preventing Attention Entropy Collapse](https://proceedings.mlr.press/v202/zhai23a/zhai23a.pdf), published at ICML 2023.

## Introduction
Transformers are difficult to train. In this work, we study the training stability of Transformers by proposing a novel lense named `Attention Entropy Collapse`. Attention Entropy is defined as the quantity 

$$\text{Ent}(A_i) = -\sum_{j=1}^T A_{i,j}\log(A_{i,j})$$

for an attention matrix $A$, with $A_{i,j}$ corresponding to the $i$ -th query and $j$ -th key/value, respectively. Our observation is that training instability often occurrs in conjunction with sharp decreases of the average attention entropy, and we denote this phenomenon as entropy collapse. This is illustrated in Figure below. 

<p align="center">
<img src="demo.png" alt="drawing" width="500"/>
</p>


We provide both theoretical and emprical analyses to the entropy collapse phenomenon, and propose a simple fix named $\sigma$ Reparam, where we reparamaeterize all the weights in a Transformer with 


$$\widehat{W}=\frac{\gamma}{\sigma(W)}W$$



## Getting Started 

We provide two reference implementations. One in PyTorch, applied to the Vision Transformer (VIT) setting; and another in JAX, applied to speech recognition (ASR). Please refer to the [vision](vision) and [speech](speech) folders for details. The same PyTorch implementation was used for language modeling (LM) and machine translation (MT) experiments.

## BibTex

```
@inproceedings{zhai2023stabilizing,
  title={Stabilizing Transformer Training by Preventing Attention Entropy Collapse},
  author={Zhai, Shuangfei and Likhomanenko, Tatiana and Littwin, Etai and Busbridge, Dan and Ramapuram, Jason and Zhang, Yizhe and Gu, Jiatao and Susskind, Joshua M},
  booktitle={International Conference on Machine Learning},
  pages={40770--40803},
  year={2023},
  organization={PMLR}
}
```
