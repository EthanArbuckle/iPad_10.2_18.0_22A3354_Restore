@implementation TCMPSVgg16Network

- (TCMPSVgg16Network)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  TCMPSVgg16Network *v18;
  TCMPSVgg16Block1 *v19;
  void *v20;
  uint64_t v21;
  TCMPSVgg16Block1 *block1;
  TCMPSVgg16Block1 *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  TCMPSVgg16Block1 *block2;
  TCMPSVgg16Block2 *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  TCMPSVgg16Block2 *block3;
  TCMPSVgg16Block2 *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  TCMPSVgg16Block2 *block4;
  uint64_t v38;
  MPSNNImageNode *reluOut1;
  uint64_t v40;
  MPSNNImageNode *reluOut2;
  uint64_t v42;
  MPSNNImageNode *reluOut3;
  uint64_t v44;
  MPSNNImageNode *reluOut4;
  uint64_t v46;
  MPSNNImageNode *output;
  objc_super v49;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v49.receiver = self;
  v49.super_class = (Class)TCMPSVgg16Network;
  v18 = -[TCMPSVgg16Network init](&v49, sel_init);
  if (v18)
  {
    v19 = [TCMPSVgg16Block1 alloc];
    objc_msgSend(v16, "block1");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[TCMPSVgg16Block1 initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v19, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("vgg_block_1_"), v13, v14, v15, v20, v17);
    block1 = v18->_block1;
    v18->_block1 = (TCMPSVgg16Block1 *)v21;

    v23 = [TCMPSVgg16Block1 alloc];
    -[TCMPSVgg16Block1 output](v18->_block1, "output");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "block2");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[TCMPSVgg16Block1 initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v23, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("vgg_block_2_"), v24, v14, v15, v25, v17);
    block2 = v18->_block2;
    v18->_block2 = (TCMPSVgg16Block1 *)v26;

    v28 = [TCMPSVgg16Block2 alloc];
    -[TCMPSVgg16Block1 output](v18->_block2, "output");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "block3");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[TCMPSVgg16Block2 initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v28, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("vgg_block_3_"), v29, v14, v15, v30, v17);
    block3 = v18->_block3;
    v18->_block3 = (TCMPSVgg16Block2 *)v31;

    v33 = [TCMPSVgg16Block2 alloc];
    -[TCMPSVgg16Block2 output](v18->_block3, "output");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "block4");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[TCMPSVgg16Block2 initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v33, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("vgg_block_4_"), v34, v14, v15, v35, v17);
    block4 = v18->_block4;
    v18->_block4 = (TCMPSVgg16Block2 *)v36;

    -[TCMPSVgg16Block1 features](v18->_block1, "features");
    v38 = objc_claimAutoreleasedReturnValue();
    reluOut1 = v18->_reluOut1;
    v18->_reluOut1 = (MPSNNImageNode *)v38;

    -[TCMPSVgg16Block1 features](v18->_block2, "features");
    v40 = objc_claimAutoreleasedReturnValue();
    reluOut2 = v18->_reluOut2;
    v18->_reluOut2 = (MPSNNImageNode *)v40;

    -[TCMPSVgg16Block2 features](v18->_block3, "features");
    v42 = objc_claimAutoreleasedReturnValue();
    reluOut3 = v18->_reluOut3;
    v18->_reluOut3 = (MPSNNImageNode *)v42;

    -[TCMPSVgg16Block2 features](v18->_block4, "features");
    v44 = objc_claimAutoreleasedReturnValue();
    reluOut4 = v18->_reluOut4;
    v18->_reluOut4 = (MPSNNImageNode *)v44;

    -[TCMPSVgg16Block2 output](v18->_block4, "output");
    v46 = objc_claimAutoreleasedReturnValue();
    output = v18->_output;
    v18->_output = (MPSNNImageNode *)v46;

  }
  return v18;
}

- (id)backwardPass:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TCMPSVgg16Block2 backwardPass:](self->_block4, "backwardPass:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSVgg16Block2 backwardPass:](self->_block3, "backwardPass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSVgg16Block1 backwardPass:](self->_block2, "backwardPass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSVgg16Block1 backwardPass:](self->_block1, "backwardPass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setLearningRate:(float)a3
{
  double v5;
  double v6;
  double v7;

  -[TCMPSVgg16Block1 setLearningRate:](self->_block1, "setLearningRate:");
  *(float *)&v5 = a3;
  -[TCMPSVgg16Block1 setLearningRate:](self->_block2, "setLearningRate:", v5);
  *(float *)&v6 = a3;
  -[TCMPSVgg16Block2 setLearningRate:](self->_block3, "setLearningRate:", v6);
  *(float *)&v7 = a3;
  -[TCMPSVgg16Block2 setLearningRate:](self->_block4, "setLearningRate:", v7);
}

- (MPSNNImageNode)reluOut1
{
  return self->_reluOut1;
}

- (void)setReluOut1:(id)a3
{
  objc_storeStrong((id *)&self->_reluOut1, a3);
}

- (MPSNNImageNode)reluOut2
{
  return self->_reluOut2;
}

- (void)setReluOut2:(id)a3
{
  objc_storeStrong((id *)&self->_reluOut2, a3);
}

- (MPSNNImageNode)reluOut3
{
  return self->_reluOut3;
}

- (void)setReluOut3:(id)a3
{
  objc_storeStrong((id *)&self->_reluOut3, a3);
}

- (MPSNNImageNode)reluOut4
{
  return self->_reluOut4;
}

- (void)setReluOut4:(id)a3
{
  objc_storeStrong((id *)&self->_reluOut4, a3);
}

- (MPSNNImageNode)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (TCMPSVgg16Block1)block1
{
  return self->_block1;
}

- (void)setBlock1:(id)a3
{
  objc_storeStrong((id *)&self->_block1, a3);
}

- (TCMPSVgg16Block1)block2
{
  return self->_block2;
}

- (void)setBlock2:(id)a3
{
  objc_storeStrong((id *)&self->_block2, a3);
}

- (TCMPSVgg16Block2)block3
{
  return self->_block3;
}

- (void)setBlock3:(id)a3
{
  objc_storeStrong((id *)&self->_block3, a3);
}

- (TCMPSVgg16Block2)block4
{
  return self->_block4;
}

- (void)setBlock4:(id)a3
{
  objc_storeStrong((id *)&self->_block4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_block4, 0);
  objc_storeStrong((id *)&self->_block3, 0);
  objc_storeStrong((id *)&self->_block2, 0);
  objc_storeStrong((id *)&self->_block1, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_reluOut4, 0);
  objc_storeStrong((id *)&self->_reluOut3, 0);
  objc_storeStrong((id *)&self->_reluOut2, 0);
  objc_storeStrong((id *)&self->_reluOut1, 0);
}

@end
