@implementation TCMLCHARGraph

+ (id)defineResidual:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  void *v11;
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
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = a7;
  v36 = a6;
  v38 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("conv_1_weight"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("conv_1_bias"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("conv"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "convDescs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v43);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDDAAC0];
  objc_msgSend(v12, "objectForKeyedSubscript:", v42);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v41);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layerWithWeights:biases:descriptor:", v17, v18, v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "nodeWithLayer:source:", v39, v13);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("batch_norm"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("batch_norm_1_running_mean"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("batch_norm_1_running_var"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("batch_norm_1_beta"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("batch_norm_1_gamma"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "batchNormDescs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "objectForKeyedSubscript:", v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x24BDDAAB0];
  v24 = objc_msgSend(v22, "integerValue");
  objc_msgSend(v12, "objectForKeyedSubscript:", v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v29) = 925353388;
  objc_msgSend(v23, "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:", v24, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "nodeWithLayer:source:", v30, v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)defineTemporalConvolutionalNetwork:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  void *v42;
  void *v43;
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
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;

  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = a7;
  v69 = a6;
  v68 = a5;
  v59 = a4;
  v13 = a3;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_0"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_0_running_mean"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_0_running_var"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_0_beta"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_0_gamma"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "batchNormDescs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v67);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDDAAB0];
  v16 = objc_msgSend(v64, "integerValue");
  objc_msgSend(v12, "objectForKeyedSubscript:", v66);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v65);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v63);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v62);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 925353388;
  objc_msgSend(v15, "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:", v16, v17, v18, v19, v20, v21);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "nodeWithLayer:source:", v61, v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v22) = 0;
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v22);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAA98], "layerWithDescriptor:", v60);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "nodeWithLayer:source:", v57, v58);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("conv_1_weight"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("conv_1_bias"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("conv"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "convDescs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v56);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x24BDDAAC0];
  objc_msgSend(v12, "objectForKeyedSubscript:", v55);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v54);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layerWithWeights:biases:descriptor:", v25, v26, v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "nodeWithLayer:source:", v51, v53);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_1"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_1_running_mean"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_1_running_var"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_1_beta"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("batch_norm_1_gamma"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "batchNormDescs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v50);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x24BDDAAB0];
  v30 = objc_msgSend(v28, "integerValue");
  objc_msgSend(v12, "objectForKeyedSubscript:", v49);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v48);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v47);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v45);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v35) = 925353388;
  objc_msgSend(v29, "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:", v30, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "nodeWithLayer:source:", v36, v46);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("dropout"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "dropoutDescs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "objectForKeyedSubscript:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x24BDDAAD0];
  objc_msgSend(v40, "floatValue");
  objc_msgSend(v41, "layerWithRate:seed:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "nodeWithLayer:source:", v42, v37);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

+ (id)defineGraphConv:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
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
  id v40;
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
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("conv_1_weight"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("conv_1_bias"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("conv_1"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convDescs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v59);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDDAAC0];
  objc_msgSend(v12, "objectForKeyedSubscript:", v58);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v12;
  objc_msgSend(v12, "objectForKeyedSubscript:", v57);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layerWithWeights:biases:descriptor:", v19, v20, v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "nodeWithLayer:source:", v55, v15);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("chunk_1"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "chunkDescs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v54);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v22;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "integerValue");
  objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "splitWithSource:splitCount:dimension:", v52, v24, objc_msgSend(v25, "integerValue"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("cat_1"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "catDescs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v51);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "concatenateWithSources:dimension:", v50, objc_msgSend(v49, "integerValue"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("transpose_1"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transposeDescs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v48);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "transposeWithDimensions:source:", v46, v47);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("conv_2_weight"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("conv_2"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convDescs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", v45);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x24BDDAAC0];
  objc_msgSend(v12, "objectForKeyedSubscript:", v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layerWithWeights:biases:descriptor:", v30, 0, v42);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v60[0] = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nodeWithLayer:sources:disableUpdate:", v31, v32, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("transpose_2"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transposeDescs");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "transposeWithDimensions:source:", v36, v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("tcn_"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  +[TCMLCHARGraph defineTemporalConvolutionalNetwork:input:graph:descriptor:weights:](TCMLCHARGraph, "defineTemporalConvolutionalNetwork:input:graph:descriptor:weights:", v38, v37, v14, v13, v41);
  v40 = (id)objc_claimAutoreleasedReturnValue();

  return v40;
}

+ (id)defineSTGCN:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
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
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[2];
  _QWORD v51[3];

  v51[2] = *MEMORY[0x24BDAC8D0];
  v48 = a4;
  v11 = a5;
  v12 = a6;
  v49 = a7;
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = a3;
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("residual_"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("addition_key"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("graph_conv_"));
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "additionDescs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v20) = 0;
  objc_msgSend(MEMORY[0x24BDDAA90], "descriptorWithType:a:", 1, v20);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDAA98], "layerWithDescriptor:");
  v46 = objc_claimAutoreleasedReturnValue();
  v39 = v15;
  v21 = (void *)v15;
  v22 = v12;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v39, CFSTR("conv"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convDescs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "inputFeatureChannelCount");
  v45 = (void *)v17;
  if (v26 == objc_msgSend(v25, "outputFeatureChannelCount") && objc_msgSend(v19, "BOOLValue"))
  {
    +[TCMLCHARGraph defineGraphConv:input:graph:descriptor:weights:](TCMLCHARGraph, "defineGraphConv:input:graph:descriptor:weights:", v17, v48, v11, v12, v49);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 0);
    v43 = v23;
    v27 = v19;
    v28 = v16;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v48;
    v51[1] = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nodeWithLayer:sources:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)v46;
    objc_msgSend(v11, "nodeWithLayer:source:", v46, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v28;
    v19 = v27;
    v23 = v43;

  }
  else if (objc_msgSend(v19, "BOOLValue"))
  {
    v44 = v23;
    +[TCMLCHARGraph defineResidual:input:graph:descriptor:weights:](TCMLCHARGraph, "defineResidual:input:graph:descriptor:weights:", v21, v48, v11, v12, v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCMLCHARGraph defineGraphConv:input:graph:descriptor:weights:](TCMLCHARGraph, "defineGraphConv:input:graph:descriptor:weights:", v17, v48, v11, v12, v49);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDAAA8], "layerWithOperation:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v41;
    v50[1] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nodeWithLayer:sources:", v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)v46;
    objc_msgSend(v11, "nodeWithLayer:source:", v46, v36);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v44;
  }
  else
  {
    +[TCMLCHARGraph defineGraphConv:input:graph:descriptor:weights:](TCMLCHARGraph, "defineGraphConv:input:graph:descriptor:weights:", v17, v48, v11, v12, v49);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v46;
    objc_msgSend(v11, "nodeWithLayer:source:", v46, v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v33;
}

+ (id)defineSTGCNAction:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
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
  _QWORD v94[2];
  _QWORD v95[4];

  v95[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v90 = v12;
  objc_msgSend(v12, "transposeWithDimensions:source:", &unk_24D95FBC0, a4);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("reshape_1"));
  v16 = objc_claimAutoreleasedReturnValue();
  v91 = v13;
  objc_msgSend(v13, "transposeDescs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)v16;
  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
  v18 = objc_claimAutoreleasedReturnValue();

  v86 = (void *)v18;
  v88 = (void *)v15;
  objc_msgSend(v12, "reshapeWithShape:source:", v18, v15);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("batch_norm_1_running_mean"));
  v19 = objc_claimAutoreleasedReturnValue();
  v89 = v11;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("batch_norm_1_running_var"));
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("batch_norm_1_beta"));
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("batch_norm_1_gamma"));
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("batch_norm_1"));
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "batchNormDescs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)v23;
  objc_msgSend(v24, "objectForKeyedSubscript:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDDAAB0];
  v80 = v25;
  v27 = objc_msgSend(v25, "integerValue");
  v85 = (void *)v19;
  objc_msgSend(v14, "objectForKeyedSubscript:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)v20;
  objc_msgSend(v14, "objectForKeyedSubscript:", v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)v21;
  objc_msgSend(v14, "objectForKeyedSubscript:", v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v14;
  v82 = (void *)v22;
  objc_msgSend(v14, "objectForKeyedSubscript:", v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = 925353388;
  objc_msgSend(v26, "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:", v27, v28, v29, v30, v31, v32);
  v33 = objc_claimAutoreleasedReturnValue();

  v79 = (void *)v33;
  objc_msgSend(v90, "nodeWithLayer:source:", v33, v92);
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v89, CFSTR("reshape_2"));
  v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "transposeDescs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)v35;
  objc_msgSend(v36, "objectForKeyedSubscript:", v35);
  v37 = objc_claimAutoreleasedReturnValue();

  v76 = (void *)v37;
  v78 = (void *)v34;
  objc_msgSend(v90, "reshapeWithShape:source:", v37, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v89, CFSTR("transpose_1"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "transposeDescs");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "transposeWithDimensions:source:", v41, v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v42;
  v44 = 0;
  v75 = v43;
  do
  {
    v45 = v43;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%lu"), v89, CFSTR("stgcn_"), v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCMLCHARGraph defineSTGCN:input:graph:descriptor:weights:](TCMLCHARGraph, "defineSTGCN:input:graph:descriptor:weights:", v46, v43, v90, v91, v93);
    v43 = (id)objc_claimAutoreleasedReturnValue();

    ++v44;
  }
  while (v44 != 7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v89, CFSTR("average_pool"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "averagePoolDesc");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", v74);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = (void *)MEMORY[0x24BDDAB30];
  objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v49;
  objc_msgSend(v48, "objectAtIndexedSubscript:", 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v50;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectAtIndexedSubscript:", 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v52;
  objc_msgSend(v48, "objectAtIndexedSubscript:", 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "averagePoolingDescriptorWithKernelSizes:strides:paddingPolicy:paddingSizes:countIncludesPadding:", v51, v54, 1, 0, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDAB38], "layerWithDescriptor:", v73);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "nodeWithLayer:source:", v71, v43);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v89, CFSTR("conv_1_weight"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v89, CFSTR("conv_1_bias"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v89, CFSTR("conv_1"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "convDescs");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", v70);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x24BDDAAC0];
  objc_msgSend(v93, "objectForKeyedSubscript:", v69);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "objectForKeyedSubscript:", v68);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "layerWithWeights:biases:descriptor:", v57, v58, v66);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v90, "nodeWithLayer:source:", v59, v67);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v89, CFSTR("flatten"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "transposeDescs");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "objectForKeyedSubscript:", v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v90, "reshapeWithShape:source:", v63, v60);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

@end
