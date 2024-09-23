@implementation TCMLComputeObjectDetectorDescriptor

- (BOOL)isComplete
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TCMLComputeObjectDetectorDescriptor inputTensor](self, "inputTensor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || !-[TCMLComputeObjectDetectorDescriptor outputChannels](self, "outputChannels"))
    return 0;
  -[TCMLComputeObjectDetectorDescriptor weights](self, "weights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)convLayerForIndex:(unint64_t)a3 outputChannels:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("conv%lu_bias"), a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("conv%lu_weight"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeObjectDetectorDescriptor weights](self, "weights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorDescriptor weights](self, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue") / a4;

  objc_msgSend(v11, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v11, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  v24 = (void *)MEMORY[0x24BDDAAB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v25;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", v27, v15, a4, &unk_24D95FD40, 0, &unk_24D95FD58);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v11, v9, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)batchNormLayerForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
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
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("batchnorm%lu_gamma"), a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("batchnorm%lu_beta"), a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("batchnorm%lu_running_var"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("batchnorm%lu_running_mean"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeObjectDetectorDescriptor weights](self, "weights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorDescriptor weights](self, "weights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorDescriptor weights](self, "weights");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorDescriptor weights](self, "weights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntegerValue");

  LODWORD(v19) = 925353388;
  LODWORD(v20) = 1063675494;
  objc_msgSend(MEMORY[0x24BDDAAB0], "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", v18, v14, v12, v10, v8, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)addCommonLayersWithIndex:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;

  v10 = a6;
  v11 = a5;
  -[TCMLComputeObjectDetectorDescriptor convLayerForIndex:outputChannels:](self, "convLayerForIndex:outputChannels:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeWithLayer:source:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorDescriptor batchNormLayerForIndex:](self, "batchNormLayerForIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeWithLayer:source:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1036831949;
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAA98], "layerWithDescriptor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeWithLayer:source:", v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (a3 > 5)
  {
    v27 = v19;
  }
  else
  {
    if (a3 == 5)
      v21 = 1;
    else
      v21 = 2;
    objc_msgSend(MEMORY[0x24BDDAB30], "poolingDescriptorWithType:kernelSize:stride:", 1, 2, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDAB38], "layerWithDescriptor:", v22);
    v29 = v15;
    v23 = v14;
    v24 = v13;
    v25 = v12;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nodeWithLayer:source:", v26, v20);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v25;
    v13 = v24;
    v14 = v23;
    v15 = v29;

  }
  return v27;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_inputTensor, 0);
}

@end
