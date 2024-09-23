@implementation MLCGraph(TCMLComputeStyleTransferUtils)

- (id)activationLayer:()TCMLComputeStyleTransferUtils neuronType:descriptors:prefix:
{
  id v10;
  id v11;
  id v12;
  double v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4)
  {
    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:", 3);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 != 1)
      {
        v16 = 0;
        goto LABEL_9;
      }
      LODWORD(v13) = 0;
      objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v14;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDDAA98], "layerWithDescriptor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "nodeWithLayer:source:", v17, v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v15 = v10;
LABEL_10:

  return v15;
}

- (id)normalizationLayer:()TCMLComputeStyleTransferUtils normalizationType:weights:descriptors:prefix:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (a4)
  {
    v40 = a1;
    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = a6;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("_beta"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("_gamma"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("_normalization"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "inputFeatureChannelCount");
    objc_msgSend(v13, "objectForKeyedSubscript:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 2)
    {
      LODWORD(v24) = 925353388;
      LODWORD(v25) = 0;
      objc_msgSend(MEMORY[0x24BDDAAF8], "layerWithFeatureChannelCount:beta:gamma:varianceEpsilon:momentum:", v21, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "nodeWithLayer:source:", v26, v12);
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 != 1)
      {
        v34 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("_running_mean"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("_running_var"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v26);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v38);
      v39 = v18;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v27) = 925353388;
      LODWORD(v28) = 0;
      objc_msgSend(MEMORY[0x24BDDAAB0], "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:momentum:", v21, v37, v36, v22, v23, v27, v28);
      v29 = v23;
      v30 = v22;
      v31 = v19;
      v32 = v17;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "nodeWithLayer:source:", v33, v12);
      v34 = (id)objc_claimAutoreleasedReturnValue();

      v17 = v32;
      v19 = v31;
      v22 = v30;
      v23 = v29;

      v18 = v39;
    }

LABEL_9:
    goto LABEL_10;
  }
  v34 = v12;
LABEL_10:

  return v34;
}

- (id)upsampleLayer:()TCMLComputeStyleTransferUtils upsampleType:descriptors:prefix:kernel:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = v10;
  if (a4)
  {
    +[TCMLComputeUpsamplingDescriptor upsamplingDescriptorWithKernelWidth:kernelHeight:](TCMLComputeUpsamplingDescriptor, "upsamplingDescriptorWithKernelWidth:kernelHeight:", a7, a7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "kernelHeight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "kernelWidth"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x24BDDAB90], "layerWithShape:sampleMode:alignsCorners:", v15, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nodeWithLayer:source:", v16, v11);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = v10;
  }

  return v17;
}

- (id)paddingLayer:()TCMLComputeStyleTransferUtils paddingType:descriptors:prefix:
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = v10;
  if (a4)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = a5;
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@"), a6, CFSTR("_padding"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "paddingSizeInX"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "paddingSizeInY"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "paddingSizeInX"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "paddingSizeInY"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x24BDDAB28], "layerWithReflectionPadding:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 != 1)
      {
        v22 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BDDAB28], "layerWithZeroPadding:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v21;
    objc_msgSend(a1, "nodeWithLayer:source:", v21, v11);
    v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_10;
  }
  v22 = v10;
LABEL_10:

  return v22;
}

- (id)convolutionLayer:()TCMLComputeStyleTransferUtils weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  void *v37;

  v15 = a10;
  v36 = a11;
  v16 = a9;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shape");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (int)(2 * objc_msgSend(v21, "intValue"));

  objc_msgSend(a1, "upsampleLayer:upsampleType:descriptors:prefix:kernel:", v18, a8, v16, v15, v22);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "paddingLayer:paddingType:descriptors:prefix:", v37, a6, v16, v15);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("_weight"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("_bias"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15;
  objc_msgSend(v17, "objectForKeyedSubscript:", v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v31, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodeWithLayer:source:", v26, v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "normalizationLayer:normalizationType:weights:descriptors:prefix:", v27, a5, v17, v16, v36);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "activationLayer:neuronType:descriptors:prefix:", v28, a7, v16, v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)residualLayer:()TCMLComputeStyleTransferUtils weights:normalizationType:paddingType:neuronType:descriptors:convPrefix:normPrefix:
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v29;
  void *v31;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = a10;
  v15 = a9;
  v16 = a8;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("_conv_1"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("_instancenorm0__fwd_normalize"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("_conv_2"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("_instancenorm1__fwd_normalize"));
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "convolutionLayer:weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:", v18, v17, a5, a6, a7, 0, v16, v29, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v20;
  objc_msgSend(a1, "convolutionLayer:weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:", v21, v17, a5, a6, 0, 0, v16, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v18;
  v34[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodeWithLayer:sources:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)styleNetwork:()TCMLComputeStyleTransferUtils pixelScale:weights:descriptors:prefix:algorithm:
{
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
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
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];

  v58[2] = *MEMORY[0x24BDAC8D0];
  v14 = (void *)MEMORY[0x24BDDAAA8];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v49 = a4;
  v50 = a3;
  objc_msgSend(v14, "layerWithOperation:", 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v50;
  v58[1] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodeWithLayer:sources:", v57, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v19;

  if (a8)
    v20 = a8 == 1;
  else
    v20 = 2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("encode_1_conv"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("instancenorm0__fwd_normalize"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convolutionLayer:weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:", v19, v17, v20, v20, 1, 0, v16, v56, v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("encode_2_conv"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("instancenorm1__fwd_normalize"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convolutionLayer:weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:", v53, v17, v20, v20, 1, 0, v16, v52, v51);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("encode_3_conv"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("instancenorm2__fwd_normalize"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convolutionLayer:weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:", v48, v17, v20, v20, 1, 0, v16, v47, v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residual_1"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residualblock0"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "residualLayer:weights:normalizationType:paddingType:neuronType:descriptors:convPrefix:normPrefix:", v45, v17, v20, v20, 1, v16, v44, v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residual_2"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residualblock1"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "residualLayer:weights:normalizationType:paddingType:neuronType:descriptors:convPrefix:normPrefix:", v42, v17, v20, v20, 1, v16, v41, v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residual_3"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residualblock2"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "residualLayer:weights:normalizationType:paddingType:neuronType:descriptors:convPrefix:normPrefix:", v39, v17, v20, v20, 1, v16, v38, v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residual_4"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residualblock3"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "residualLayer:weights:normalizationType:paddingType:neuronType:descriptors:convPrefix:normPrefix:", v36, v17, v20, v20, 1, v16, v35, v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residual_5"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("residualblock4"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "residualLayer:weights:normalizationType:paddingType:neuronType:descriptors:convPrefix:normPrefix:", v33, v17, v20, v20, 1, v16, v32, v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("decoding_1_conv"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("instancenorm3__fwd_normalize"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convolutionLayer:weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:", v30, v17, v20, v20, 1, 1, v16, v29, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("decoding_2_conv"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("instancenorm4__fwd_normalize"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convolutionLayer:weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:", v27, v17, v20, v20, 1, 1, v16, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("conv5"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "convolutionLayer:weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:", v23, v17, 0, v20, 2, 0, v16, v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)vggConvolutionWithRelu:()TCMLComputeStyleTransferUtils weights:descriptors:prefix:
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v10, CFSTR("_weight"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v10, CFSTR("_bias"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  objc_msgSend(v13, "objectForKeyedSubscript:", v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAC0], "layerWithWeights:biases:descriptor:", v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodeWithLayer:sources:disableUpdate:", v19, v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v22) = 0;
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAA98], "layerWithDescriptor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodeWithLayer:source:", v24, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)maxPoolingLayer:()TCMLComputeStyleTransferUtils kernelSize:stride:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x24BDDAB30];
  v9 = a3;
  objc_msgSend(v8, "poolingDescriptorWithType:kernelSize:stride:", 1, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAB38], "layerWithDescriptor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodeWithLayer:source:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)vggConvolutionalBlock:()TCMLComputeStyleTransferUtils numConvLayers:weights:descriptors:prefix:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = v12;
  v23 = v15;
  if ((unint64_t)(a4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = 0;
    v21 = v15;
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v18 = v15;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), a7, ++v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "vggConvolutionWithRelu:weights:descriptors:prefix:", v18, v13, v14, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v20;
      v21 = v17;
      v18 = v17;
    }
    while (a4 != v16);
  }

  return v21;
}

- (id)vgg16:()TCMLComputeStyleTransferUtils weights:descriptors:prefix:
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("block_1_conv_"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("block_2_conv_"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("block_3_conv_"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("block_4_conv_"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "vggConvolutionalBlock:numConvLayers:weights:descriptors:prefix:", v14, 2, v13, v12, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "maxPoolingLayer:kernelSize:stride:", v16, 2, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vggConvolutionalBlock:numConvLayers:weights:descriptors:prefix:", v25, 2, v13, v12, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "maxPoolingLayer:kernelSize:stride:", v17, 2, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vggConvolutionalBlock:numConvLayers:weights:descriptors:prefix:", v18, 3, v13, v12, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "maxPoolingLayer:kernelSize:stride:", v19, 2, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vggConvolutionalBlock:numConvLayers:weights:descriptors:prefix:", v20, 3, v13, v12, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v16;
  v28[1] = v17;
  v28[2] = v19;
  v28[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)vggPreprocessing:()TCMLComputeStyleTransferUtils variance:mean:
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
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDDAAA8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "layerWithOperation:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodeWithLayer:sources:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodeWithLayer:sources:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)defineTraining:()TCMLComputeStyleTransferUtils style:pixelScale:mean:variance:styleLossWeightTensor:weights:stopGradientList:descriptors:lossTensorDictionary:algorithm:
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  double v48;
  float v49;
  unint64_t v50;
  void *v51;
  float v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
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
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[2];
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  _BYTE v165[128];
  void *v166;
  _QWORD v167[3];

  v167[1] = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v146 = a8;
  v24 = a9;
  v147 = a10;
  v25 = a11;
  v127 = a12;
  objc_msgSend(a1, "vggPreprocessing:variance:mean:", v19, v23, v22);
  v26 = objc_claimAutoreleasedReturnValue();
  v133 = v20;
  objc_msgSend(a1, "vggPreprocessing:variance:mean:", v20, v23, v22);
  v27 = objc_claimAutoreleasedReturnValue();
  v126 = (void *)v26;
  objc_msgSend(a1, "vgg16:weights:descriptors:prefix:", v26, v24, v25, CFSTR("vgg_"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (void *)v27;
  objc_msgSend(a1, "vgg16:weights:descriptors:prefix:", v27, v24, v25, CFSTR("vgg_"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v19;
  v132 = v21;
  objc_msgSend(a1, "styleNetwork:pixelScale:weights:descriptors:prefix:algorithm:", v19, v21, v24, v25, CFSTR("transformer_"), a13);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v23;
  v131 = v22;
  objc_msgSend(a1, "vggPreprocessing:variance:mean:");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v25;
  v129 = v24;
  objc_msgSend(a1, "vgg16:weights:descriptors:prefix:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAB18], "meanSquaredErrorLossWithReductionType:weights:", 2, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v30;
  objc_msgSend(v30, "objectAtIndexedSubscript:", 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v167[0] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v167, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v166, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = a1;
  objc_msgSend(a1, "nodeWithLayer:sources:lossLabels:", v31, v33, v35);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addObject:", v36);

  objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addObject:", v37);

  objc_msgSend(v28, "objectAtIndexedSubscript:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addObject:", v38);

  v124 = v28;
  objc_msgSend(v28, "objectAtIndexedSubscript:", 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addObject:", v39);

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v29, "count"));
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v41 = v29;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v148, v165, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v149;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v149 != v44)
          objc_enumerationMutation(v41);
        objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * i), "descriptor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "shape");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = 1.0;
        if ((unint64_t)objc_msgSend(v47, "count") >= 2)
        {
          v50 = 1;
          do
          {
            objc_msgSend(v47, "objectAtIndexedSubscript:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "floatValue");
            v49 = v49 * v52;

            ++v50;
          }
          while (objc_msgSend(v47, "count") > v50);
        }
        *(float *)&v48 = 1.0 / v49;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v48);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v53);

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v148, v165, 16);
    }
    while (v43);
  }

  v54 = (void *)MEMORY[0x24BDDAAE0];
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "floatValue");
  objc_msgSend(v54, "layerWithScale:");
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x24BDDAAE0];
  objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "floatValue");
  objc_msgSend(v56, "layerWithScale:");
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x24BDDAAE0];
  objc_msgSend(v40, "objectAtIndexedSubscript:", 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "floatValue");
  objc_msgSend(v58, "layerWithScale:");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)MEMORY[0x24BDDAAE0];
  objc_msgSend(v40, "objectAtIndexedSubscript:", 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "floatValue");
  objc_msgSend(v60, "layerWithScale:");
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:source:", v119, v62);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:source:", v118, v63);
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:source:", v117, v64);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "objectAtIndexedSubscript:", 3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:source:", v116, v65);
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addObject:", v66);

  objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addObject:", v67);

  objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addObject:", v68);

  objc_msgSend(v41, "objectAtIndexedSubscript:", 3);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addObject:", v69);

  objc_msgSend(v147, "addObject:", v141);
  objc_msgSend(v147, "addObject:", v142);
  objc_msgSend(v147, "addObject:", v143);
  objc_msgSend(v147, "addObject:", v144);
  v70 = (void *)MEMORY[0x24BDDAAE0];
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "floatValue");
  objc_msgSend(v70, "layerWithScale:");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = (void *)MEMORY[0x24BDDAAE0];
  objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "floatValue");
  objc_msgSend(v72, "layerWithScale:");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = (void *)MEMORY[0x24BDDAAE0];
  objc_msgSend(v40, "objectAtIndexedSubscript:", 2);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "floatValue");
  objc_msgSend(v74, "layerWithScale:");
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = (void *)MEMORY[0x24BDDAAE0];
  objc_msgSend(v40, "objectAtIndexedSubscript:", 3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "floatValue");
  objc_msgSend(v76, "layerWithScale:");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v145, "objectAtIndexedSubscript:", 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:source:", v115, v78);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v145, "objectAtIndexedSubscript:", 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:source:", v114, v79);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v145, "objectAtIndexedSubscript:", 2);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:source:", v113, v80);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v145, "objectAtIndexedSubscript:", 3);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:source:", v112, v81);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAB18], "meanSquaredErrorLossWithReductionType:weights:", 2, 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAB18], "meanSquaredErrorLossWithReductionType:weights:", 2, 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAB18], "meanSquaredErrorLossWithReductionType:weights:", 2, 0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAB18], "meanSquaredErrorLossWithReductionType:weights:", 2, 0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v111;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v164, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = v141;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v163, 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:sources:lossLabels:", v110, v82, v83);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  v162 = v109;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v162, 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v142;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v161, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:sources:lossLabels:", v108, v84, v85);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v160 = v139;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v160, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v143;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v159, 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:sources:lossLabels:", v138, v86, v87);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  v158 = v140;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v158, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v144;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v157, 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:sources:lossLabels:", v137, v88, v89);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = v136;
  v156[1] = v135;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v156, 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:sources:", v107, v90);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  v155[0] = v106;
  v155[1] = v105;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v155, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:sources:", v104, v91);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v154[0] = v103;
  v154[1] = v102;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v154, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:sources:", v101, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 2);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v93;
  v153[1] = v146;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v153, 2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:sources:", v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v96;
  v152[1] = v120;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v152, 2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "nodeWithLayer:sources:", v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v127, "setObject:forKey:", v120, CFSTR("content_loss"));
  objc_msgSend(v127, "setObject:forKey:", v96, CFSTR("style_loss"));

  return v99;
}

@end
