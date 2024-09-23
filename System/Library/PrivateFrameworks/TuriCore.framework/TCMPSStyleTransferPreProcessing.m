@implementation TCMPSStyleTransferPreProcessing

- (TCMPSStyleTransferPreProcessing)initWithParameters:(id)a3 inputNode:(id)a4 scaleNode:(id)a5 meanNode:(id)a6
{
  id v9;
  id v10;
  id v11;
  TCMPSStyleTransferPreProcessing *v12;
  uint64_t v13;
  MPSNNMultiplicationNode *multiplicationNode;
  void *v15;
  void *v16;
  uint64_t v17;
  MPSNNSubtractionNode *subtractionNode;
  uint64_t v19;
  MPSNNImageNode *output;
  objc_super v22;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TCMPSStyleTransferPreProcessing;
  v12 = -[TCMPSStyleTransferPreProcessing init](&v22, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDDE4B0], "nodeWithLeftSource:rightSource:", v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    multiplicationNode = v12->_multiplicationNode;
    v12->_multiplicationNode = (MPSNNMultiplicationNode *)v13;

    v15 = (void *)MEMORY[0x24BDDE4E0];
    -[MPSNNMultiplicationNode resultImage](v12->_multiplicationNode, "resultImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "nodeWithLeftSource:rightSource:", v16, v11);
    v17 = objc_claimAutoreleasedReturnValue();
    subtractionNode = v12->_subtractionNode;
    v12->_subtractionNode = (MPSNNSubtractionNode *)v17;

    -[MPSNNSubtractionNode resultImage](v12->_subtractionNode, "resultImage");
    v19 = objc_claimAutoreleasedReturnValue();
    output = v12->_output;
    v12->_output = (MPSNNImageNode *)v19;

  }
  return v12;
}

- (id)backwardPass:(id)a3
{
  void *v4;
  MPSNNMultiplicationNode *multiplicationNode;
  void *v6;
  void *v7;
  void *v8;

  -[MPSNNSubtractionNode gradientFilterWithSource:](self->_subtractionNode, "gradientFilterWithSource:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  multiplicationNode = self->_multiplicationNode;
  objc_msgSend(v4, "resultImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSNNMultiplicationNode gradientFilterWithSource:](multiplicationNode, "gradientFilterWithSource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resultImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MPSNNImageNode)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (MPSNNMultiplicationNode)multiplicationNode
{
  return self->_multiplicationNode;
}

- (void)setMultiplicationNode:(id)a3
{
  objc_storeStrong((id *)&self->_multiplicationNode, a3);
}

- (MPSNNSubtractionNode)subtractionNode
{
  return self->_subtractionNode;
}

- (void)setSubtractionNode:(id)a3
{
  objc_storeStrong((id *)&self->_subtractionNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtractionNode, 0);
  objc_storeStrong((id *)&self->_multiplicationNode, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end
