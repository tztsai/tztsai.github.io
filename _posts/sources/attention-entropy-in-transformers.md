[Source](https://gauranshiitd.medium.com/attention-entropy-in-transformers-8418421a1ff9)

Attention entropy measures how widely or narrowly an attention head distributes its focus across tokens in a sequence.

High Entropy
When an attention head has high entropy, it means it’s paying attention to many different tokens more evenly, leading to better contextualization and stability. The attention weights are spread out across multiple tokens rather than concentrated on just a few.

Low Entropy
Low entropy (entropy collapse) occurs when attention heads become hyper-focused on specific tokens, like the first token or special tokens. This concentrated attention can lead to:
• Training instability
• Oscillating loss values
• Model divergence in severe cases
Practical Implications

Training Stability
There is a direct correlation between attention entropy and model stability. When entropy collapses too low, it often results in:
• Slower convergence
• Fluctuating training loss
• Potential training failures

Model Performance
Higher attention entropy generally leads to:
• Better contextualization of tokens
• More robust model behavior
• Improved handling of broader context

Solutions
To prevent problematic low entropy situations, researchers have proposed:
• Using spectral normalization on query and key projections
• Replacing softmax with ReLU
• Switching from Adam to SGD optimizer
• Implementing entropy-based attention regularization
