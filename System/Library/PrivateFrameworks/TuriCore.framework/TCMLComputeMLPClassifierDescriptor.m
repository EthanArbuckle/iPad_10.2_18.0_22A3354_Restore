@implementation TCMLComputeMLPClassifierDescriptor

- (BOOL)isComplete
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TCMLComputeMLPClassifierDescriptor inputTensor](self, "inputTensor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || !-[TCMLComputeMLPClassifierDescriptor outputChannels](self, "outputChannels"))
    return 0;
  -[TCMLComputeMLPClassifierDescriptor layerSizes](self, "layerSizes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)fullyConnectedLayerForIndex:(unint64_t)a3 outputChannels:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fc%lu_bias"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fc%lu_weight"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeMLPClassifierDescriptor tensors](self, "tensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeMLPClassifierDescriptor tensors](self, "tensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue") / a4;

  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", 1, 1, v16, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAD8], "layerWithWeights:biases:descriptor:", v12, v10, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)addFullyConnectedLayerWithIndex:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  -[TCMLComputeMLPClassifierDescriptor fullyConnectedLayerForIndex:outputChannels:](self, "fullyConnectedLayerForIndex:outputChannels:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeWithLayer:source:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = 0;
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAA98], "layerWithDescriptor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeWithLayer:source:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (MLCTensor)inputTensor
{
  return self->_inputTensor;
}

- (void)setInputTensor:(id)a3
{
  objc_storeStrong((id *)&self->_inputTensor, a3);
}

- (unint64_t)outputChannels
{
  return self->_outputChannels;
}

- (void)setOutputChannels:(unint64_t)a3
{
  self->_outputChannels = a3;
}

- (NSArray)layerSizes
{
  return self->_layerSizes;
}

- (void)setLayerSizes:(id)a3
{
  objc_storeStrong((id *)&self->_layerSizes, a3);
}

- (NSDictionary)tensors
{
  return self->_tensors;
}

- (void)setTensors:(id)a3
{
  objc_storeStrong((id *)&self->_tensors, a3);
}

- (MLCTensor)fcFinalTensor
{
  return self->_fcFinalTensor;
}

- (void)setFcFinalTensor:(id)a3
{
  objc_storeStrong((id *)&self->_fcFinalTensor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fcFinalTensor, 0);
  objc_storeStrong((id *)&self->_tensors, 0);
  objc_storeStrong((id *)&self->_layerSizes, 0);
  objc_storeStrong((id *)&self->_inputTensor, 0);
}

@end
