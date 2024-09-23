@implementation TCMLCHARDescriptor

+ (id)defineResidualDescriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5 stride:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v9, CFSTR("conv"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDDAAB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = &unk_24D95EB78;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", &unk_24D95FAB8, a4, a5, v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v12);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v9, CFSTR("batch_norm"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v17);

  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setConvDescs:", v10);
  objc_msgSend(v19, "setBatchNormDescs:", v11);

  return v19;
}

+ (id)defineTemporalConvolutionalNetworkDescriptor:(id)a3 channels:(unint64_t)a4 temporalKernelSize:(unint64_t)a5 stride:(unint64_t)a6 dropout:(float)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v32 = (void *)objc_opt_new();
  v31 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("batch_norm_0"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v12, v34);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("conv"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (a5 - 1) >> 1;
  v28 = (void *)MEMORY[0x24BDDAAB8];
  v30 = (void *)v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v15;
  v37[1] = &unk_24D95EB78;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v17;
  v36[1] = &unk_24D95EB78;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v19;
  v35[1] = &unk_24D95EB90;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", v16, a4, a4, v18, 2, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v29, v30);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("batch_norm_1"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v22, v21);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("dropout"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v24 = a7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v25, v23);

  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setConvDescs:", v32);
  objc_msgSend(v26, "setBatchNormDescs:", v31);
  objc_msgSend(v26, "setDropoutDescs:", v33);

  return v26;
}

+ (id)defineGraphConvDescriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5 numKeypoints:(unint64_t)a6 temporalKernelSize:(unint64_t)a7 stride:(unint64_t)a8 dropout:(float)a9
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v28;
  void *v30;
  void *v31;
  void *v34;
  void *v35;
  void *v36;

  v12 = a3;
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v28 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("conv_1"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", &unk_24D95FAD0, a4, 3 * a5, &unk_24D95FAE8, 1, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v35, v36);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("chunk_1"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_24D95FB00, v34);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("cat_1"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_24D95EBC0, v31);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("transpose_1"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24D95FB18, v30);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("conv_2"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", &unk_24D95FB30, 3 * a6, a6, &unk_24D95FB48, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v26);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("transpose_2"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24D95FB60, v17);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("tcn_"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v19 = a9;
  +[TCMLCHARDescriptor defineTemporalConvolutionalNetworkDescriptor:channels:temporalKernelSize:stride:dropout:](TCMLCHARDescriptor, "defineTemporalConvolutionalNetworkDescriptor:channels:temporalKernelSize:stride:dropout:", v18, a5, a7, a8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  objc_msgSend(v20, "dropoutDescs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDropoutDescs:", v22);

  objc_msgSend(v20, "batchNormDescs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBatchNormDescs:", v23);

  objc_msgSend(v21, "setChunkDescs:", v14);
  objc_msgSend(v21, "setCatDescs:", v28);
  objc_msgSend(v21, "setTransposeDescs:", v15);
  objc_msgSend(v20, "convDescs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addEntriesFromDictionary:", v24);

  objc_msgSend(v21, "setConvDescs:", v13);
  return v21;
}

+ (id)defineSTGCNDescriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5 numKeypoints:(unint64_t)a6 temporalKernelSize:(unint64_t)a7 stride:(unint64_t)a8 dropout:(float)a9 residual:(BOOL)a10
{
  id v16;
  void *v17;
  double v18;
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
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v16 = a3;
  v32 = (void *)objc_opt_new();
  v34 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("residual_"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCMLCHARDescriptor defineResidualDescriptor:inputChannels:outputChannels:stride:](TCMLCHARDescriptor, "defineResidualDescriptor:inputChannels:outputChannels:stride:", v36, a4, a5, a8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("graph_conv_"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = a9;
  +[TCMLCHARDescriptor defineGraphConvDescriptor:inputChannels:outputChannels:numKeypoints:temporalKernelSize:stride:dropout:](TCMLCHARDescriptor, "defineGraphConvDescriptor:inputChannels:outputChannels:numKeypoints:temporalKernelSize:stride:dropout:", v35, a4, a5, a6, a7, a8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("addition_key"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, v20);

  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setAdditionDescs:", v32);
  objc_msgSend(v19, "catDescs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCatDescs:", v23);

  objc_msgSend(v19, "chunkDescs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setChunkDescs:", v24);

  objc_msgSend(v19, "dropoutDescs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDropoutDescs:", v25);

  objc_msgSend(v19, "transposeDescs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTransposeDescs:", v26);

  objc_msgSend(v33, "batchNormDescs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addEntriesFromDictionary:", v27);

  objc_msgSend(v19, "batchNormDescs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addEntriesFromDictionary:", v28);

  objc_msgSend(v22, "setBatchNormDescs:", v34);
  objc_msgSend(v33, "convDescs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v29);

  objc_msgSend(v19, "convDescs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v30);

  objc_msgSend(v22, "setConvDescs:", v17);
  return v22;
}

+ (id)defineSTGCNActionDescriptor:(id)a3 inputChannels:(unint64_t)a4 batchSize:(unint64_t)a5 numFrames:(unint64_t)a6 numKeypoints:(unint64_t)a7 numClass:(unint64_t)a8 dropout:(float)a9
{
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t i;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
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
  uint64_t v57;
  void *v59;
  void *v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[4];
  _QWORD v80[4];
  unint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v81 = a4;
  v15 = a4;
  v61 = a4;
  v82 = xmmword_2186C4BE0;
  v83 = xmmword_2186C4BF0;
  v84 = xmmword_2186C4C00;
  v76 = (void *)objc_opt_new();
  v70 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  v74 = (void *)objc_opt_new();
  v73 = (void *)objc_opt_new();
  v72 = (void *)objc_opt_new();
  v71 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("reshape_1"));
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v19;
  v20 = a7 * v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v21;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v22;
  v80[3] = &unk_24D95EB78;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)v18;
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, v18);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("batch_norm_1"));
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v16;
  v63 = (void *)v24;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, v24);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("reshape_2"));
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v27;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v61);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v29;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v26;
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v31, v26);

  v32 = v14;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("transpose_1"));
  v33 = v17;
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_24D95FB78);
  for (i = 0; i != 7; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%lu"), v32, CFSTR("stgcn_"), i);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (i)
      *(float *)&v36 = a9;
    else
      *(float *)&v36 = 0.0;
    LOBYTE(v57) = i != 0;
    +[TCMLCHARDescriptor defineSTGCNDescriptor:inputChannels:outputChannels:numKeypoints:temporalKernelSize:stride:dropout:residual:](TCMLCHARDescriptor, "defineSTGCNDescriptor:inputChannels:outputChannels:numKeypoints:temporalKernelSize:stride:dropout:residual:", v35, *(&v81 + i), qword_2186C4C10[i], a7, 9, qword_2186C4C48[i], v36, v57);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "additionDescs");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addEntriesFromDictionary:", v38);

    objc_msgSend(v37, "batchNormDescs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "addEntriesFromDictionary:", v39);

    objc_msgSend(v37, "catDescs");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addEntriesFromDictionary:", v40);

    objc_msgSend(v37, "chunkDescs");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addEntriesFromDictionary:", v41);

    objc_msgSend(v37, "convDescs");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addEntriesFromDictionary:", v42);

    objc_msgSend(v37, "dropoutDescs");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addEntriesFromDictionary:", v43);

    objc_msgSend(v37, "transposeDescs");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addEntriesFromDictionary:", v44);

  }
  v45 = (a6 + 3) >> 2;
  v66 = v32;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v32, CFSTR("average_pool"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v46;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a7);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v47;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v45);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v48;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a7);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 4);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v50, v68);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v32, CFSTR("conv_1"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAB8], "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", &unk_24D95FB90, 256, a8, &unk_24D95FBA8, 1, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v51, v59);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v66, CFSTR("flatten"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v53;
  v77[1] = &unk_24D95EBF0;
  v77[2] = &unk_24D95EB78;
  v77[3] = &unk_24D95EB78;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v54, v52);

  v55 = (void *)objc_opt_new();
  objc_msgSend(v55, "setAdditionDescs:", v76);
  objc_msgSend(v55, "setAveragePoolDesc:", v70);
  objc_msgSend(v55, "setBatchNormDescs:", v75);
  objc_msgSend(v55, "setCatDescs:", v74);
  objc_msgSend(v55, "setChunkDescs:", v73);
  objc_msgSend(v55, "setConvDescs:", v72);
  objc_msgSend(v55, "setDropoutDescs:", v71);
  objc_msgSend(v55, "setTransposeDescs:", v33);

  return v55;
}

@end
