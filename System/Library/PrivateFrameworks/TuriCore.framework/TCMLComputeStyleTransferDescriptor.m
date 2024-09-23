@implementation TCMLComputeStyleTransferDescriptor

- (id)initTrain:(BOOL)a3 algorithmType:(int)a4
{
  uint64_t v4;
  _BOOL4 v5;
  TCMLComputeStyleTransferDescriptor *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  NSDictionary *descriptors;
  uint64_t v11;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[TCMLComputeStyleTransferDescriptor init](self, "init");
  if (v6)
  {
    if (v5)
    {
      v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      +[TCMLComputeStyleTransferDescriptor styleNetDescriptor:algorithmType:](TCMLComputeStyleTransferDescriptor, "styleNetDescriptor:algorithmType:", CFSTR("transformer_"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v8);
      +[TCMLComputeStyleTransferDescriptor defineVGG16Descriptor:](TCMLComputeStyleTransferDescriptor, "defineVGG16Descriptor:", CFSTR("vgg_"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v9);
      descriptors = v6->_descriptors;
      v6->_descriptors = v7;

    }
    else
    {
      +[TCMLComputeStyleTransferDescriptor styleNetDescriptor:algorithmType:](TCMLComputeStyleTransferDescriptor, "styleNetDescriptor:algorithmType:", CFSTR("transformer_"), v4);
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = v6->_descriptors;
      v6->_descriptors = (NSDictionary *)v11;
    }

  }
  return v6;
}

- (BOOL)isComplete
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[TCMLComputeStyleTransferDescriptor contentTensor](self, "contentTensor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TCMLComputeStyleTransferDescriptor descriptors](self, "descriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[TCMLComputeStyleTransferDescriptor weights](self, "weights");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)convolutionLayerDescriptor:(id)a3 normPrefix:(id)a4 descriptorDictionary:(id *)a5 kernelSize:(unint64_t)a6 strideSize:(unint64_t)a7 inputChannels:(unint64_t)a8 outputChannels:(unint64_t)a9 upsampleType:(int)a10
{
  id v14;
  id v15;
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
  id v26;
  void *v27;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  +[TCMLComputePaddingDescriptor paddingDescriptorWithPaddingSize:](TCMLComputePaddingDescriptor, "paddingDescriptorWithPaddingSize:", a6 >> 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", v18, a8, a9, v21, 1, &unk_24D95FCE0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCMLComputeNormalizationDescriptor normalizationDescriptorWithInputFeatureChannels:](TCMLComputeNormalizationDescriptor, "normalizationDescriptorWithInputFeatureChannels:", a9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("_padding"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x24BDD17C8];
  v26 = v14;
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("_normalization"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*a5, "setObject:forKey:", v29, v24);
  objc_msgSend(*a5, "setObject:forKey:", v22, v26);

  objc_msgSend(*a5, "setObject:forKey:", v23, v27);
}

+ (void)residualDescriptor:(id)a3 normPrefix:(id)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 descriptorDictionary:(id *)a7
{
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
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v11 = a4;
  v12 = a3;
  +[TCMLComputePaddingDescriptor paddingDescriptorWithPaddingSize:](TCMLComputePaddingDescriptor, "paddingDescriptorWithPaddingSize:", 1);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  +[TCMLComputePaddingDescriptor paddingDescriptorWithPaddingSize:](TCMLComputePaddingDescriptor, "paddingDescriptorWithPaddingSize:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", &unk_24D95FCF8, a5, a6, &unk_24D95FD10, 1, &unk_24D95FD28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", &unk_24D95FCF8, a5, a6, &unk_24D95FD10, 1, &unk_24D95FD28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCMLComputeNormalizationDescriptor normalizationDescriptorWithInputFeatureChannels:](TCMLComputeNormalizationDescriptor, "normalizationDescriptorWithInputFeatureChannels:", a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCMLComputeNormalizationDescriptor normalizationDescriptorWithInputFeatureChannels:](TCMLComputeNormalizationDescriptor, "normalizationDescriptorWithInputFeatureChannels:", a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("_conv_1_padding"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("_conv_2_padding"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("_conv_1"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("_conv_2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("_instancenorm0__fwd_normalize_normalization"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("_instancenorm1__fwd_normalize_normalization"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*a7, "setObject:forKey:", v24, v18);
  objc_msgSend(*a7, "setObject:forKey:", v23, v13);
  objc_msgSend(*a7, "setObject:forKey:", v22, v14);
  objc_msgSend(*a7, "setObject:forKey:", v19, v15);
  objc_msgSend(*a7, "setObject:forKey:", v21, v16);
  objc_msgSend(*a7, "setObject:forKey:", v20, v17);

}

+ (id)styleNetDescriptor:(id)a3 algorithmType:(int)a4
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67[2];

  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("encode_1_conv"));
  v8 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("instancenorm0__fwd_normalize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("encode_2_conv"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("instancenorm1__fwd_normalize"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("encode_3_conv"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("instancenorm2__fwd_normalize"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residual_1"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residualblock0"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residual_2"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residualblock1"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residual_3"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residualblock2"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residual_4"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residualblock3"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residual_5"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("residualblock4"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("decoding_1_conv"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("instancenorm3__fwd_normalize"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("decoding_2_conv"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("instancenorm4__fwd_normalize"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("conv5"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 32;
  v12 = 64;
  v13 = 128;
  v14 = 3;
  if (a4)
  {
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v11 = 0;
  }
  if (a4 == 1)
    v15 = 3;
  else
    v15 = v14;
  v37 = v15;
  if (a4 == 1)
    v16 = 32;
  else
    v16 = v13;
  if (a4 == 1)
    v17 = 32;
  else
    v17 = v12;
  v67[0] = v7;
  if (a4 == 1)
    v18 = 32;
  else
    v18 = v11;
  LODWORD(v31) = 0;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:](TCMLComputeStyleTransferDescriptor, "convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:", v8, v9, v67, 9, 1, v18, v31);
  v19 = v67[0];

  v66 = v19;
  LODWORD(v32) = 0;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:](TCMLComputeStyleTransferDescriptor, "convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:", v56, v55, &v66, 3, 2, v18, v17, v32);
  v20 = v66;

  v65 = v20;
  LODWORD(v33) = 0;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:](TCMLComputeStyleTransferDescriptor, "convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:", v54, v53, &v65, 3, 2, v17, v16, v33);
  v21 = v65;

  v64 = v21;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:](TCMLComputeStyleTransferDescriptor, "residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:", v52, v51, v16, v16, &v64);
  v22 = v64;

  v63 = v22;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:](TCMLComputeStyleTransferDescriptor, "residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:", v50, v49, v16, v16, &v63);
  v23 = v63;

  v62 = v23;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:](TCMLComputeStyleTransferDescriptor, "residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:", v48, v47, v16, v16, &v62);
  v24 = v62;

  v61 = v24;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:](TCMLComputeStyleTransferDescriptor, "residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:", v46, v45, v16, v16, &v61);
  v25 = v61;

  v60 = v25;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:](TCMLComputeStyleTransferDescriptor, "residualDescriptor:normPrefix:inputChannels:outputChannels:descriptorDictionary:", v10, v39, v16, v16, &v60);
  v26 = v60;

  v59 = v26;
  LODWORD(v34) = 1;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:](TCMLComputeStyleTransferDescriptor, "convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:", v41, v38, &v59, 3, 1, v16, v17, v34);
  v27 = v59;

  v58 = v27;
  LODWORD(v35) = 1;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:](TCMLComputeStyleTransferDescriptor, "convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:", v42, v40, &v58, 3, 1, v17, v18, v35);
  v28 = v58;

  v57 = v28;
  LODWORD(v36) = 0;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:](TCMLComputeStyleTransferDescriptor, "convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:", v43, 0, &v57, 9, 1, v18, v37, v36);
  v29 = v57;

  return v29;
}

+ (id)defineVGG16Block1Descriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDDAAB8];
  v8 = a3;
  objc_msgSend(v7, "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", 3, 3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", 3, 3, a5, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v8, CFSTR("conv_1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v8, CFSTR("conv_2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = v12;
  v16[0] = v9;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)defineVGG16Block2Descriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDDAAB8];
  v8 = a3;
  objc_msgSend(v7, "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", 3, 3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", 3, 3, a5, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", 3, 3, a5, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v8, CFSTR("conv_1"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v8, CFSTR("conv_2"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v8, CFSTR("conv_3"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v12;
  v17[1] = v13;
  v18[0] = v9;
  v18[1] = v10;
  v17[2] = v14;
  v18[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)defineVGG16Descriptor:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("block_1_"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCMLComputeStyleTransferDescriptor defineVGG16Block1Descriptor:inputChannels:outputChannels:](TCMLComputeStyleTransferDescriptor, "defineVGG16Block1Descriptor:inputChannels:outputChannels:", v14, 3, 64);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("block_2_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCMLComputeStyleTransferDescriptor defineVGG16Block1Descriptor:inputChannels:outputChannels:](TCMLComputeStyleTransferDescriptor, "defineVGG16Block1Descriptor:inputChannels:outputChannels:", v7, 64, 128);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("block_3_"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCMLComputeStyleTransferDescriptor defineVGG16Block2Descriptor:inputChannels:outputChannels:](TCMLComputeStyleTransferDescriptor, "defineVGG16Block2Descriptor:inputChannels:outputChannels:", v9, 128, 256);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v10);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("block_4_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[TCMLComputeStyleTransferDescriptor defineVGG16Block2Descriptor:inputChannels:outputChannels:](TCMLComputeStyleTransferDescriptor, "defineVGG16Block2Descriptor:inputChannels:outputChannels:", v11, 256, 512);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v12);

  return v5;
}

- (MLCTensor)contentTensor
{
  return self->_contentTensor;
}

- (void)setContentTensor:(id)a3
{
  objc_storeStrong((id *)&self->_contentTensor, a3);
}

- (MLCTensor)inferenceContentTensor
{
  return self->_inferenceContentTensor;
}

- (void)setInferenceContentTensor:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceContentTensor, a3);
}

- (MLCTensor)inferencePixelScaleTensor
{
  return self->_inferencePixelScaleTensor;
}

- (void)setInferencePixelScaleTensor:(id)a3
{
  objc_storeStrong((id *)&self->_inferencePixelScaleTensor, a3);
}

- (MLCTensor)styleTensor
{
  return self->_styleTensor;
}

- (void)setStyleTensor:(id)a3
{
  objc_storeStrong((id *)&self->_styleTensor, a3);
}

- (MLCTensor)pixelScaleTensor
{
  return self->_pixelScaleTensor;
}

- (void)setPixelScaleTensor:(id)a3
{
  objc_storeStrong((id *)&self->_pixelScaleTensor, a3);
}

- (MLCTensor)meanTensor
{
  return self->_meanTensor;
}

- (void)setMeanTensor:(id)a3
{
  objc_storeStrong((id *)&self->_meanTensor, a3);
}

- (MLCTensor)varianceTensor
{
  return self->_varianceTensor;
}

- (void)setVarianceTensor:(id)a3
{
  objc_storeStrong((id *)&self->_varianceTensor, a3);
}

- (MLCTensor)styleLossWeightTensor
{
  return self->_styleLossWeightTensor;
}

- (void)setStyleLossWeightTensor:(id)a3
{
  objc_storeStrong((id *)&self->_styleLossWeightTensor, a3);
}

- (NSArray)styleStrength
{
  return self->_styleStrength;
}

- (void)setStyleStrength:(id)a3
{
  objc_storeStrong((id *)&self->_styleStrength, a3);
}

- (NSArray)contentStrength
{
  return self->_contentStrength;
}

- (void)setContentStrength:(id)a3
{
  objc_storeStrong((id *)&self->_contentStrength, a3);
}

- (NSDictionary)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
  objc_storeStrong((id *)&self->_weights, a3);
}

- (NSDictionary)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_descriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_contentStrength, 0);
  objc_storeStrong((id *)&self->_styleStrength, 0);
  objc_storeStrong((id *)&self->_styleLossWeightTensor, 0);
  objc_storeStrong((id *)&self->_varianceTensor, 0);
  objc_storeStrong((id *)&self->_meanTensor, 0);
  objc_storeStrong((id *)&self->_pixelScaleTensor, 0);
  objc_storeStrong((id *)&self->_styleTensor, 0);
  objc_storeStrong((id *)&self->_inferencePixelScaleTensor, 0);
  objc_storeStrong((id *)&self->_inferenceContentTensor, 0);
  objc_storeStrong((id *)&self->_contentTensor, 0);
}

@end
