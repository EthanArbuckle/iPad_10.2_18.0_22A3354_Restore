@implementation TCMLComputeActivityClassifierDescriptor

- (BOOL)isComplete
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TCMLComputeActivityClassifierDescriptor inputTensor](self, "inputTensor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)addLSTMLayerWithInputSize:(unint64_t)a3 outputSize:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[6];

  v55[4] = *MEMORY[0x24BDAC8D0];
  v47 = a6;
  v46 = a5;
  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lstm_i2h_i_weight"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("lstm_i2h_c_weight"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lstm_i2h_f_weight"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("lstm_i2h_o_weight"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v55[0] = v51;
  v55[1] = v49;
  v55[2] = v50;
  v55[3] = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "mutableCopy");

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("lstm_h2h_i_weight"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("lstm_h2h_c_weight"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("lstm_h2h_f_weight"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("lstm_h2h_o_weight"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = v45;
  v54[1] = v43;
  v54[2] = v44;
  v54[3] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("lstm_h2h_i_bias"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("lstm_h2h_c_bias"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("lstm_h2h_f_bias"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("lstm_h2h_o_bias"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v53[0] = v41;
  v53[1] = v39;
  v53[2] = v40;
  v53[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  LODWORD(v29) = 0;
  objc_msgSend(MEMORY[0x24BDDAB00], "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:isBidirectional:dropout:", a3, a4, 1, 1, 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:", 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:", 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x24BDDAB08];
  v52[0] = v31;
  v52[1] = v31;
  v52[2] = v32;
  v52[3] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v15;
  objc_msgSend(v33, "layerWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:", v30, v15, v21, 0, v28, v34, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "nodeWithLayer:source:", v36, v46);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)addConvLayerWithOutputChannels:(unint64_t)a3 source:(id)a4 graph:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v35 = a5;
  v34 = a4;
  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("conv_bias"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("conv_weight"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue") / a3;

  objc_msgSend(v10, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntegerValue");

  v19 = (void *)MEMORY[0x24BDDAAB8];
  v37[0] = &unk_24D95EB18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = &unk_24D95EB18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", v21, v14, a3, v23, 0, &unk_24D95F9E0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v10, v33, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "nodeWithLayer:source:", v25, v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDDAA98];
  LODWORD(v28) = 0;
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layerWithDescriptor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "nodeWithLayer:source:", v30, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)addDenseLayerWithIndex:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
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
  objc_msgSend(v10, "stringWithFormat:", CFSTR("dense%lu_bias"), a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dense%lu_weight"), a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
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

  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", &unk_24D95F9F8, v21, a4, &unk_24D95FA10, 1, &unk_24D95FA28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v17, v15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nodeWithLayer:source:", v23, v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)addBatchNormLayerWithSource:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;

  v6 = a4;
  v7 = a3;
  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bn_running_mean"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bn_running_var"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bn_beta"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeActivityClassifierDescriptor weights](self, "weights");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bn_gamma"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  LODWORD(v20) = 925353388;
  LODWORD(v21) = 1063675494;
  objc_msgSend(MEMORY[0x24BDDAAB0], "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", v19, v9, v11, v13, v15, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeWithLayer:source:", v22, v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x24BDDAA98];
  LODWORD(v25) = 0;
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layerWithDescriptor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nodeWithLayer:source:", v27, v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
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

- (NSDictionary)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
  objc_storeStrong((id *)&self->_weights, a3);
}

- (MLCTensor)outputTensor
{
  return self->_outputTensor;
}

- (void)setOutputTensor:(id)a3
{
  objc_storeStrong((id *)&self->_outputTensor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTensor, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_inputTensor, 0);
}

@end
