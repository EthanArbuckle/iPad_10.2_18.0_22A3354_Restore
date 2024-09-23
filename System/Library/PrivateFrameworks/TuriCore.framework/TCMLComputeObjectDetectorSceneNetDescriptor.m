@implementation TCMLComputeObjectDetectorSceneNetDescriptor

- (BOOL)isComplete
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[TCMLComputeObjectDetectorSceneNetDescriptor sceneNetInput1](self, "sceneNetInput1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TCMLComputeObjectDetectorSceneNetDescriptor sceneNetInput2](self, "sceneNetInput2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)addReluBatchNormWithWeightPrefix:(id)a3 source:(id)a4 graph:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_running_mean"), v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_running_var"), v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_beta"), v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_gamma"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v21) = 925353388;
  LODWORD(v22) = 1063675494;
  objc_msgSend(MEMORY[0x24BDDAAB0], "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", 128, v14, v16, v18, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nodeWithLayer:source:", v23, v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BDDAA98];
  LODWORD(v26) = 0;
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layerWithDescriptor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nodeWithLayer:source:", v28, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)addInitialConvLayerForScale:(unint64_t)a3 source:(id)a4 graph:(id)a5
{
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
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[4];

  v74[2] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v67 = a5;
  v65 = a4;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("scale%lu_conv0_bias"), a3);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scale%lu_conv0_weight"), a3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v69);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v68);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (unint64_t)objc_msgSend(v14, "unsignedIntegerValue") >> 7;

  objc_msgSend(v11, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntegerValue");

  objc_msgSend(v11, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shape");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedIntegerValue");

  if (a3 < 2)
    v23 = 1;
  else
    v23 = 2;
  v24 = (void *)MEMORY[0x24BDDAAB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v25;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", v27, v63, 128, v30, 0, &unk_24D95FBD8);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v11, v59, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "nodeWithLayer:source:", v62, v65);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scale%lu_bn0"), a3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeObjectDetectorSceneNetDescriptor addReluBatchNormWithWeightPrefix:source:graph:](self, "addReluBatchNormWithWeightPrefix:source:graph:", v66, v31, v67);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scale%lu_conv1_bias"), a3);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scale%lu_conv1_weight"), a3);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", v64);
  v33 = objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", v70);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "descriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "shape");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (unint64_t)objc_msgSend(v38, "unsignedIntegerValue") >> 7;

  objc_msgSend(v35, "descriptor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "shape");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectAtIndexedSubscript:", 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "unsignedIntegerValue");

  objc_msgSend(v35, "descriptor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "shape");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectAtIndexedSubscript:", 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "unsignedIntegerValue");

  v48 = (void *)MEMORY[0x24BDDAAB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v49;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v43);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v50;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", v51, v39, 128, &unk_24D95FBF0, 0, &unk_24D95FC08);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)v33;
  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v35, v33, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v67, "nodeWithLayer:source:", v54, v60);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scale%lu_bn1"), a3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor addReluBatchNormWithWeightPrefix:source:graph:](self, "addReluBatchNormWithWeightPrefix:source:graph:", v56, v55, v67);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (id)addCommonFPNLayersWithWeight:(id)a3 bias:(id)a4 headType:(id)a5 scale:(unint64_t)a6 source:(id)a7 graph:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v12 = a8;
  v13 = a7;
  v38 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (unint64_t)objc_msgSend(v18, "unsignedIntegerValue") >> 7;

  objc_msgSend(v15, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  objc_msgSend(v15, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "shape");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "unsignedIntegerValue");

  v28 = (void *)MEMORY[0x24BDDAAB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v29;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", v31, v19, 128, &unk_24D95FC20, 0, &unk_24D95FC38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v15, v14, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "nodeWithLayer:source:", v33, v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("shared_%@_scale%lu_bn"), v38, a6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor addReluBatchNormWithWeightPrefix:source:graph:](self, "addReluBatchNormWithWeightPrefix:source:graph:", v35, v34, v12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)addHeadWithWeight:(id)a3 bias:(id)a4 outputChannels:(unint64_t)a5 source:(id)a6 graph:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v34 = a7;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue") / a5;

  objc_msgSend(v13, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v13, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "shape");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntegerValue");

  v26 = (void *)MEMORY[0x24BDDAAB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v27;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:strides:paddingPolicy:paddingSizes:", v29, v17, a5, &unk_24D95FC50, 0, &unk_24D95FC68);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v13, v12, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "nodeWithLayer:source:", v31, v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (void)defineGraph:(id)a3 batchSize:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TCMLComputeObjectDetectorSceneNetDescriptor *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  void *v30;
  TCMLComputeObjectDetectorSceneNetDescriptor *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
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
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  TCMLComputeObjectDetectorSceneNetDescriptor *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id obj;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  id v122;
  uint64_t v123;
  uint64_t v124;
  TCMLComputeObjectDetectorSceneNetDescriptor *v125;
  void *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD v135[4];
  _QWORD v136[4];
  _BYTE v137[128];
  _QWORD v138[4];
  _QWORD v139[4];
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v107 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v122 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shared_cls_conv0_scale0_weight"));
  v7 = objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shared_cls_conv0_scale0_bias"));
  v104 = objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("shared_loc_conv0_scale0_weight"));
  v103 = objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor weights](self, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("shared_loc_conv0_scale0_bias"));
  v11 = objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor sceneNetInput1](self, "sceneNetInput1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeObjectDetectorSceneNetDescriptor addInitialConvLayerForScale:source:graph:](self, "addInitialConvLayerForScale:source:graph:", 0, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:](self, "addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:", v7, v104, CFSTR("cls"), 0, v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeObjectDetectorSceneNetDescriptor addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:](self, "addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:", v103, v11, CFSTR("loc"), 0, v13, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "addObject:", v14);
  objc_msgSend(v122, "addObject:", v15);
  -[TCMLComputeObjectDetectorSceneNetDescriptor sceneNetInput2](self, "sceneNetInput2");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeObjectDetectorSceneNetDescriptor addInitialConvLayerForScale:source:graph:](self, "addInitialConvLayerForScale:source:graph:", 1, v16, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v102 = (void *)v7;
  -[TCMLComputeObjectDetectorSceneNetDescriptor addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:](self, "addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:", v7, v104, CFSTR("cls"), 1, v17, v5);
  v18 = objc_claimAutoreleasedReturnValue();

  -[TCMLComputeObjectDetectorSceneNetDescriptor addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:](self, "addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:", v103, v11, CFSTR("loc"), 1, v17, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v107, "addObject:", v18);
  objc_msgSend(v122, "addObject:", v19);
  for (i = 2; i != 5; ++i)
  {
    v21 = v19;
    v22 = (void *)v18;
    v23 = v17;
    -[TCMLComputeObjectDetectorSceneNetDescriptor addInitialConvLayerForScale:source:graph:](self, "addInitialConvLayerForScale:source:graph:", i, v17, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[TCMLComputeObjectDetectorSceneNetDescriptor addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:](self, "addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:", v7, v104, CFSTR("cls"), i, v17, v5);
    v18 = objc_claimAutoreleasedReturnValue();

    -[TCMLComputeObjectDetectorSceneNetDescriptor addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:](self, "addCommonFPNLayersWithWeight:bias:headType:scale:source:graph:", v103, v11, CFSTR("loc"), i, v17, v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v107;
    objc_msgSend(v107, "addObject:", v18);
    objc_msgSend(v122, "addObject:", v19);
  }
  v93 = (void *)v18;
  v97 = (void *)v11;
  v125 = self;
  v98 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  obj = v122;
  v126 = v5;
  v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
  if (v105)
  {
    v123 = 0;
    v100 = *(_QWORD *)v132;
    v25 = self;
    v119 = v19;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v132 != v100)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * v26);
        v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v117 = v26;
        if (-[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v25, "numAnchorBoxes"))
        {
          v29 = 0;
          v30 = v17;
          v31 = v125;
          do
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("shared_loc_conv1_scale0_anchor%lu_weight"), v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("shared_loc_conv1_scale0_anchor%lu_bias"), v29);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[TCMLComputeObjectDetectorSceneNetDescriptor weights](v125, "weights");
            v34 = v27;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", v32);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            -[TCMLComputeObjectDetectorSceneNetDescriptor weights](v125, "weights");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", v33);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = v34;
            -[TCMLComputeObjectDetectorSceneNetDescriptor addHeadWithWeight:bias:outputChannels:source:graph:](v125, "addHeadWithWeight:bias:outputChannels:source:graph:", v36, v38, 4, v34, v126);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "addObject:", v17);
            ++v29;
            v30 = v17;
          }
          while (v29 < -[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v125, "numAnchorBoxes"));
        }
        else
        {
          v31 = v125;
        }
        v115 = v28;
        objc_msgSend(v126, "concatenateWithSources:dimension:", v28, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x24BDDAB40];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v139[0] = v41;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v31, "numAnchorBoxes"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v139[1] = v42;
        v139[2] = &unk_24D95EC98;
        objc_msgSend(&unk_24D95FC80, "objectAtIndexedSubscript:", v123);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v139[3] = v43;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 4);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "layerWithShape:", v44);
        v113 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v126, "nodeWithLayer:source:", v113, v39);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDDAB88], "layerWithDimensions:", &unk_24D95FC98);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "nodeWithLayer:source:", v46, v45);
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = (void *)MEMORY[0x24BDDAB40];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v138[0] = v48;
        v138[1] = &unk_24D95EC98;
        v49 = (void *)MEMORY[0x24BDD16E0];
        v50 = -[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v31, "numAnchorBoxes");
        objc_msgSend(&unk_24D95FC80, "objectAtIndexedSubscript:", v123);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "numberWithUnsignedInteger:", v50 * (int)objc_msgSend(v51, "intValue"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v138[2] = v52;
        v138[3] = &unk_24D95EC08;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v138, 4);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "layerWithShape:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v126, "nodeWithLayer:source:", v54, v110);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "addObject:", v55);

        ++v123;
        v26 = v117 + 1;
        v24 = v107;
        v5 = v126;
        v25 = v31;
        v19 = v119;
      }
      while (v117 + 1 != v105);
      v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
    }
    while (v105);
  }
  else
  {
    v25 = self;
  }

  v99 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v56 = -[TCMLComputeObjectDetectorSceneNetDescriptor numClasses](v25, "numClasses");
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v94 = v24;
  v101 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
  if (v101)
  {
    v118 = 0;
    v120 = v19;
    v124 = v56 + 1;
    v96 = *(_QWORD *)v128;
    do
    {
      v57 = 0;
      do
      {
        if (*(_QWORD *)v128 != v96)
        {
          v58 = v57;
          objc_enumerationMutation(v94);
          v57 = v58;
        }
        v116 = v57;
        v59 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * v57);
        v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (-[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v25, "numAnchorBoxes"))
        {
          v61 = 0;
          v62 = v17;
          do
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("shared_cls_conv1_scale0_anchor%lu_weight"), v61);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("shared_cls_conv1_scale0_anchor%lu_bias"), v61);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[TCMLComputeObjectDetectorSceneNetDescriptor weights](v25, "weights");
            v65 = v59;
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "objectForKeyedSubscript:", v63);
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            -[TCMLComputeObjectDetectorSceneNetDescriptor weights](v25, "weights");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "objectForKeyedSubscript:", v64);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            v59 = v65;
            -[TCMLComputeObjectDetectorSceneNetDescriptor addHeadWithWeight:bias:outputChannels:source:graph:](v125, "addHeadWithWeight:bias:outputChannels:source:graph:", v67, v69, v124, v65, v126);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v60, "addObject:", v17);
            v25 = v125;

            ++v61;
            v62 = v17;
          }
          while (v61 < -[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v125, "numAnchorBoxes"));
        }
        v114 = v60;
        objc_msgSend(v126, "concatenateWithSources:dimension:", v60, 1);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = (void *)MEMORY[0x24BDDAB40];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v136[0] = v70;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v25, "numAnchorBoxes"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v136[1] = v71;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v124);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v136[2] = v72;
        objc_msgSend(&unk_24D95FC80, "objectAtIndexedSubscript:", v118);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v136[3] = v73;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v136, 4);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "layerWithShape:", v74);
        v112 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v126, "nodeWithLayer:source:", v112, v108);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDDAB88], "layerWithDimensions:", &unk_24D95FCB0);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "nodeWithLayer:source:", v109, v75);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = (void *)MEMORY[0x24BDDAB40];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v135[0] = v77;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v124);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v135[1] = v78;
        v79 = (void *)MEMORY[0x24BDD16E0];
        v80 = -[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v25, "numAnchorBoxes");
        objc_msgSend(&unk_24D95FC80, "objectAtIndexedSubscript:", v118);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "numberWithUnsignedInteger:", v80 * (int)objc_msgSend(v81, "intValue"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v135[2] = v82;
        v135[3] = &unk_24D95EC08;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v135, 4);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "layerWithShape:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v126;
        objc_msgSend(v126, "nodeWithLayer:source:", v84, v106);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "addObject:", v85);

        ++v118;
        v57 = v116 + 1;
        v86 = v102;
        v88 = (void *)v103;
        v87 = (void *)v104;
        v89 = v97;
        v19 = v120;
      }
      while (v116 + 1 != v101);
      v101 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
    }
    while (v101);
  }
  else
  {
    v86 = v102;
    v88 = (void *)v103;
    v87 = (void *)v104;
    v89 = v97;
  }

  objc_msgSend(v5, "concatenateWithSources:dimension:", v99, 2);
  v90 = v25;
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeObjectDetectorSceneNetDescriptor setClassificationOutput:](v90, "setClassificationOutput:", v91);

  objc_msgSend(v5, "concatenateWithSources:dimension:", v98, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMLComputeObjectDetectorSceneNetDescriptor setLocalizationOutput:](v90, "setLocalizationOutput:", v92);

}

- (MLCTensor)sceneNetInput1
{
  return self->_sceneNetInput1;
}

- (void)setSceneNetInput1:(id)a3
{
  objc_storeStrong((id *)&self->_sceneNetInput1, a3);
}

- (MLCTensor)sceneNetInput2
{
  return self->_sceneNetInput2;
}

- (void)setSceneNetInput2:(id)a3
{
  objc_storeStrong((id *)&self->_sceneNetInput2, a3);
}

- (MLCTensor)labelCoordinates
{
  return self->_labelCoordinates;
}

- (void)setLabelCoordinates:(id)a3
{
  objc_storeStrong((id *)&self->_labelCoordinates, a3);
}

- (MLCTensor)labelConfidence
{
  return self->_labelConfidence;
}

- (void)setLabelConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_labelConfidence, a3);
}

- (MLCTensor)labelClass
{
  return self->_labelClass;
}

- (void)setLabelClass:(id)a3
{
  objc_storeStrong((id *)&self->_labelClass, a3);
}

- (MLCTensor)weightsCoordinates
{
  return self->_weightsCoordinates;
}

- (void)setWeightsCoordinates:(id)a3
{
  objc_storeStrong((id *)&self->_weightsCoordinates, a3);
}

- (MLCTensor)weightsClass
{
  return self->_weightsClass;
}

- (void)setWeightsClass:(id)a3
{
  objc_storeStrong((id *)&self->_weightsClass, a3);
}

- (MLCTensor)localizationOutput
{
  return self->_localizationOutput;
}

- (void)setLocalizationOutput:(id)a3
{
  objc_storeStrong((id *)&self->_localizationOutput, a3);
}

- (MLCTensor)classificationOutput
{
  return self->_classificationOutput;
}

- (void)setClassificationOutput:(id)a3
{
  objc_storeStrong((id *)&self->_classificationOutput, a3);
}

- (MLCTensor)softmaxOutput
{
  return self->_softmaxOutput;
}

- (void)setSoftmaxOutput:(id)a3
{
  objc_storeStrong((id *)&self->_softmaxOutput, a3);
}

- (MLCTensor)lossResultTensor
{
  return self->_lossResultTensor;
}

- (void)setLossResultTensor:(id)a3
{
  objc_storeStrong((id *)&self->_lossResultTensor, a3);
}

- (NSDictionary)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
  objc_storeStrong((id *)&self->_weights, a3);
}

- (unint64_t)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(unint64_t)a3
{
  self->_numClasses = a3;
}

- (unint64_t)numAnchorBoxes
{
  return self->_numAnchorBoxes;
}

- (void)setNumAnchorBoxes:(unint64_t)a3
{
  self->_numAnchorBoxes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_lossResultTensor, 0);
  objc_storeStrong((id *)&self->_softmaxOutput, 0);
  objc_storeStrong((id *)&self->_classificationOutput, 0);
  objc_storeStrong((id *)&self->_localizationOutput, 0);
  objc_storeStrong((id *)&self->_weightsClass, 0);
  objc_storeStrong((id *)&self->_weightsCoordinates, 0);
  objc_storeStrong((id *)&self->_labelClass, 0);
  objc_storeStrong((id *)&self->_labelConfidence, 0);
  objc_storeStrong((id *)&self->_labelCoordinates, 0);
  objc_storeStrong((id *)&self->_sceneNetInput2, 0);
  objc_storeStrong((id *)&self->_sceneNetInput1, 0);
}

@end
