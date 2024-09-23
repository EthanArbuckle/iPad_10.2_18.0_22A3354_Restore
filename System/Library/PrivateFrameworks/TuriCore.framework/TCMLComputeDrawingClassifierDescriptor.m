@implementation TCMLComputeDrawingClassifierDescriptor

- (BOOL)isComplete
{
  void *v3;

  -[TCMLComputeDrawingClassifierDescriptor inputTensor](self, "inputTensor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 && -[TCMLComputeDrawingClassifierDescriptor outputChannels](self, "outputChannels") != 0;
}

- (id)addConvLayer:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  v44 = a6;
  v11 = a5;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("drawing_conv%lu_bias"), a3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drawing_conv%lu_weight"), a3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeDrawingClassifierDescriptor weights](self, "weights");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v46);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeDrawingClassifierDescriptor weights](self, "weights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v45);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntegerValue") / a4;

  objc_msgSend(v14, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shape");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedIntegerValue");

  objc_msgSend(v14, "descriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "unsignedIntegerValue");

  v27 = (void *)MEMORY[0x24BDDAAB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", v30, v18, a4, &unk_24D95FA40, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v14, v43, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "nodeWithLayer:source:", v32, v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x24BDDAA98];
  LODWORD(v35) = 0;
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layerWithDescriptor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "nodeWithLayer:source:", v37, v33);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAB30], "maxPoolingDescriptorWithKernelSizes:strides:paddingPolicy:paddingSizes:", &unk_24D95FA58, &unk_24D95FA70, 1, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAB38], "layerWithDescriptor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "nodeWithLayer:source:", v40, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)addDenseLayer:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = a6;
  v12 = a5;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("drawing_dense%lu_bias"), a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("drawing_dense%lu_weight"), a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeDrawingClassifierDescriptor weights](self, "weights");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeDrawingClassifierDescriptor weights](self, "weights");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue") / a4;

  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", &unk_24D95FA88, v21, a4, &unk_24D95FAA0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAD8], "layerWithWeights:biases:descriptor:", v17, v15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nodeWithLayer:source:", v23, v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (MLCTensor)inputTensor
{
  return self->_inputTensor;
}

- (void)setInputTensor:(id)a3
{
  objc_storeStrong((id *)&self->_inputTensor, a3);
}

- (MLCTensor)outputTensor
{
  return self->_outputTensor;
}

- (void)setOutputTensor:(id)a3
{
  objc_storeStrong((id *)&self->_outputTensor, a3);
}

- (unint64_t)outputChannels
{
  return self->_outputChannels;
}

- (void)setOutputChannels:(unint64_t)a3
{
  self->_outputChannels = a3;
}

- (NSDictionary)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
  objc_storeStrong((id *)&self->_weights, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_outputTensor, 0);
  objc_storeStrong((id *)&self->_inputTensor, 0);
}

@end
