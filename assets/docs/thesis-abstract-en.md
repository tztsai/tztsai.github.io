# Mobile Traffic Classification and Multi-Cell Base Station Control for Energy-Efficient 5G Networks

**Author:** Cai, Tianzhang

## Abstract

The global energy consumption of mobile networks is rapidly increasing due to the exponential
growth of mobile network traffic. The advent of next-generation cellular technologies such
as fifth-generation (5G) and beyond promises higher network throughput and lower latency
but also demands higher power consumption for its denser base station (BS) deployment and
more energy-intensive processors. It is one of the key design pillars of next-generation mobile
networks to improve network energy efficiency. In this thesis, we aim to address this problem
by applying machine learning to analyze mobile traffic and control the operation of 5G BSs
with the goal of reducing network energy consumption while dynamically meeting the network
traffic demand. To obtain some preliminary insights into the temporal and spatial patterns
of mobile network traffic, we first analyze a real-world network flow dataset collected by a
Swedish mobile operator. We find that mobile traffic exhibits a strong periodicity in time and
a distinct locality in space. In order to develop a simulation environment to train and evaluate
the artificial intelligence (AI)-based BS control algorithm, we apply a clustering algorithm to
categorize the network traffic with different latency requirements into five traffic scenarios, e.g.
urban, rural, and office. Other necessary network models are also implemented such as energy
consumption, massive MIMO (multiple-input multiple-output) channel, user association, etc.
in the simulation environment endeavoring to mimic the real-world 5G network.

The main contribution of this thesis is the development of a multi-agent reinforcement learning
algorithm to jointly control the operations of 5G BSs such as multi-level sleeping, antenna
switching, and user association. The algorithm is designed to minimize the total energy
consumption of a multi-cell 5G network while preserving its overall quality of service (QoS).
The trained algorithm has shown its ability to adaptively save energy by switching on/off the
sleep modes and antennas of BSs according to the varying traffic intensity. Moreover, the
multi-agent BS control policy produced by the algorithm has also demonstrated collaborative
behaviours such as user offloading that reduces inter-cell interference which degrades the QoS.
The evaluation results show that in comparison to the always-on configuration, the proposed
algorithm can reduce the total energy consumption of a network by about 50%, double that of
today’s symbol-level sleeping strategy (25%), while with negligible degradation of QoS. The
algorithm is also shown to be robust to variations in the volume and the QoS requirement of the
network traffic after being evaluated in different traffic scenarios.
