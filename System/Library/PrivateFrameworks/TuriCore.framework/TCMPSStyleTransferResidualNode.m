@implementation TCMPSStyleTransferResidualNode

- (TCMPSStyleTransferResidualNode)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  MPSCNNConvolutionNode *conv1;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  MPSCNNInstanceNormalizationNode *instNorm1;
  void *v39;
  void *v40;
  uint64_t v41;
  MPSCNNNeuronReLUNode *relu1;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  MPSCNNConvolutionNode *conv2;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  MPSCNNInstanceNormalizationNode *instNorm2;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  MPSNNAdditionNode *add;
  uint64_t v72;
  MPSNNImageNode *output;
  uint64_t v75;
  uint64_t v76;
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
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  TCMPSStyleTransferResidualNode *v117;
  objc_super v118;
  _QWORD v119[4];

  v119[2] = *MEMORY[0x24BDAC8D0];
  v115 = a3;
  v112 = a4;
  v113 = a5;
  v114 = a6;
  v14 = a7;
  v116 = a8;
  v118.receiver = self;
  v118.super_class = (Class)TCMPSStyleTransferResidualNode;
  v117 = -[TCMPSStyleTransferResidualNode init](&v118, sel_init);
  if (v117)
  {
    v15 = (void *)MEMORY[0x24BDBCEC8];
    objc_msgSend(v14, "conv1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataWithLength:", 4 * objc_msgSend(v16, "outputFeatureChannels"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = (void *)MEMORY[0x24BDDE270];
    objc_msgSend(v14, "conv1");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v93, "kernelWidth");
    objc_msgSend(v14, "conv1");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v91, "kernelHeight");
    objc_msgSend(v14, "conv1");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v89, "inputFeatureChannels");
    objc_msgSend(v14, "conv1");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v87, "outputFeatureChannels");
    objc_msgSend(v14, "conv1");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v85, "strideWidth");
    objc_msgSend(v14, "conv1");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v83, "strideHeight");
    objc_msgSend(v14, "conv1");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v81, "paddingWidth");
    objc_msgSend(v14, "conv1");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v79, "paddingHeight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v115, CFSTR("conv_1_weight"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv1");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v75) = objc_msgSend(v25, "updateWeights");
    objc_msgSend(v108, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v112, v104, v100, v97, v95, v17, v18, v19, v20, v22, v107, v24, v75, v113, v114);
    v26 = objc_claimAutoreleasedReturnValue();
    conv1 = v117->_conv1;
    v117->_conv1 = (MPSCNNConvolutionNode *)v26;

    v28 = (void *)MEMORY[0x24BDDE298];
    -[MPSCNNConvolutionNode resultImage](v117->_conv1, "resultImage");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inst1");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v105, "channels");
    objc_msgSend(v14, "inst1");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v101, "styles");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v115, CFSTR("inst_1_gamma_weight"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v115, CFSTR("inst_1_beta_weight"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inst1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "label");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "createInstanceNormalization:channels:styles:gamma:beta:label:device:cmdQueue:", v109, v29, v30, v32, v34, v36, v113, v114);
    v37 = objc_claimAutoreleasedReturnValue();
    instNorm1 = v117->_instNorm1;
    v117->_instNorm1 = (MPSCNNInstanceNormalizationNode *)v37;

    v39 = (void *)MEMORY[0x24BDDE2D8];
    -[MPSCNNInstanceNormalizationNode resultImage](v117->_instNorm1, "resultImage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "nodeWithSource:", v40);
    v41 = objc_claimAutoreleasedReturnValue();
    relu1 = v117->_relu1;
    v117->_relu1 = (MPSCNNNeuronReLUNode *)v41;

    v43 = (void *)MEMORY[0x24BDBCEC8];
    objc_msgSend(v14, "conv2");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dataWithLength:", 4 * objc_msgSend(v44, "outputFeatureChannels"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = (void *)MEMORY[0x24BDDE270];
    -[MPSCNNNeuronReLUNode resultImage](v117->_relu1, "resultImage");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v90, "kernelWidth");
    objc_msgSend(v14, "conv2");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v88, "kernelHeight");
    objc_msgSend(v14, "conv2");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v86, "inputFeatureChannels");
    objc_msgSend(v14, "conv2");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v84, "outputFeatureChannels");
    objc_msgSend(v14, "conv2");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v82, "strideWidth");
    objc_msgSend(v14, "conv2");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v80, "strideHeight");
    objc_msgSend(v14, "conv2");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v78, "paddingWidth");
    objc_msgSend(v14, "conv2");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v77, "paddingHeight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v115, CFSTR("conv_2_weight"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "objectForKeyedSubscript:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "label");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v76) = objc_msgSend(v53, "updateWeights");
    objc_msgSend(v102, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v110, v98, v96, v94, v92, v45, v46, v47, v48, v50, v106, v52, v76, v113, v114);
    v54 = objc_claimAutoreleasedReturnValue();
    conv2 = v117->_conv2;
    v117->_conv2 = (MPSCNNConvolutionNode *)v54;

    v56 = (void *)MEMORY[0x24BDDE298];
    -[MPSCNNConvolutionNode resultImage](v117->_conv2, "resultImage");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inst2");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v103, "channels");
    objc_msgSend(v14, "inst2");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v99, "styles");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v115, CFSTR("inst_2_gamma_weight"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "objectForKeyedSubscript:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v115, CFSTR("inst_2_beta_weight"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "objectForKeyedSubscript:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inst2");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "label");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "createInstanceNormalization:channels:styles:gamma:beta:label:device:cmdQueue:", v111, v57, v58, v60, v62, v64, v113, v114);
    v65 = objc_claimAutoreleasedReturnValue();
    instNorm2 = v117->_instNorm2;
    v117->_instNorm2 = (MPSCNNInstanceNormalizationNode *)v65;

    v67 = (void *)MEMORY[0x24BDDE478];
    v119[0] = v112;
    -[MPSCNNInstanceNormalizationNode resultImage](v117->_instNorm2, "resultImage");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v68;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "nodeWithSources:", v69);
    v70 = objc_claimAutoreleasedReturnValue();
    add = v117->_add;
    v117->_add = (MPSNNAdditionNode *)v70;

    -[MPSNNAdditionNode resultImage](v117->_add, "resultImage");
    v72 = objc_claimAutoreleasedReturnValue();
    output = v117->_output;
    v117->_output = (MPSNNImageNode *)v72;

  }
  return v117;
}

- (void)setStyleIndex:(unint64_t)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyleIndex:", a3);

  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkpoint");

  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStyleIndex:", a3);

  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "checkpoint");

}

- (id)backwardPass:(id)a3
{
  id v4;
  MPSNNAdditionNode *add;
  void *v6;
  void *v7;
  MPSCNNInstanceNormalizationNode *instNorm2;
  void *v9;
  void *v10;
  void *v11;
  MPSCNNConvolutionNode *conv2;
  void *v13;
  void *v14;
  MPSCNNNeuronReLUNode *relu1;
  void *v16;
  void *v17;
  MPSCNNInstanceNormalizationNode *instNorm1;
  void *v19;
  void *v20;
  MPSCNNConvolutionNode *conv1;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  add = self->_add;
  v26[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSNNAdditionNode gradientFiltersWithSources:](add, "gradientFiltersWithSources:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  instNorm2 = self->_instNorm2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resultImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNInstanceNormalizationNode gradientFilterWithSource:](instNorm2, "gradientFilterWithSource:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  conv2 = self->_conv2;
  objc_msgSend(v11, "resultImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode gradientFilterWithSource:](conv2, "gradientFilterWithSource:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  relu1 = self->_relu1;
  objc_msgSend(v14, "resultImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNNeuronReLUNode gradientFilterWithSource:](relu1, "gradientFilterWithSource:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  instNorm1 = self->_instNorm1;
  objc_msgSend(v17, "resultImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNInstanceNormalizationNode gradientFilterWithSource:](instNorm1, "gradientFilterWithSource:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  conv1 = self->_conv1;
  objc_msgSend(v20, "resultImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode gradientFilterWithSource:](conv1, "gradientFilterWithSource:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "resultImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)setLearningRate:(float)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv1, "tc_weightsData");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v9, "setLearningRate:", v5);

  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v10, "setLearningRate:", v6);

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv2, "tc_weightsData");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v11, "setLearningRate:", v7);

  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v12, "setLearningRate:", v8);

}

- (id)exportWeights:(id)a3
{
  void *v4;
  size_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  size_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  size_t v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  TCMPSStyleTransferWeights *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  size_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
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
  TCMPSStyleTransferWeights *v61;
  TCMPSStyleTransferWeights *v62;
  void *v64;
  void *v65;
  id v66;
  TCMPSStyleTransferWeights *v67;
  TCMPSStyleTransferWeights *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  TCMPSStyleTransferWeights *v83;
  id v84;
  id v85;
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[4];

  v89[2] = *MEMORY[0x24BDAC8D0];
  v84 = a3;
  v85 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v84, CFSTR("conv_1_weight"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv1, "tc_weightsData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 4 * objc_msgSend(v4, "weightSize");

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v5);
  v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (void *)objc_msgSend(v81, "mutableBytes");
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv1, "tc_weightsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v6, (const void *)objc_msgSend(v7, "weights"), v5);

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv1, "tc_weightsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "weightShape");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = objc_alloc_init(TCMPSStyleTransferWeights);
  -[TCMPSStyleTransferWeights setData:](v68, "setData:", v81);
  -[TCMPSStyleTransferWeights setShape:](v68, "setShape:", v80);
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v68, v82);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v84, CFSTR("conv_2_weight"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv2, "tc_weightsData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 4 * objc_msgSend(v9, "weightSize");

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v10);
  v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (void *)objc_msgSend(v78, "mutableBytes");
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv2, "tc_weightsData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v11, (const void *)objc_msgSend(v12, "weights"), v10);

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv2, "tc_weightsData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "weightShape");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = objc_alloc_init(TCMPSStyleTransferWeights);
  -[TCMPSStyleTransferWeights setData:](v67, "setData:", v78);
  -[TCMPSStyleTransferWeights setShape:](v67, "setShape:", v77);
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v67, v79);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v84, CFSTR("inst_1_gamma_weight"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v84, CFSTR("inst_1_beta_weight"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "styles");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 4 * v15 * objc_msgSend(v16, "numberOfFeatureChannels");

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v17);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_retainAutorelease(v65);
  v19 = (void *)objc_msgSend(v74, "mutableBytes");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v19, (const void *)objc_msgSend(v20, "gammaWeights"), v17);

  v73 = objc_retainAutorelease(v18);
  v21 = (void *)objc_msgSend(v73, "mutableBytes");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v21, (const void *)objc_msgSend(v22, "betaWeights"), v17);

  v23 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "styles"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v25;
  v26 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "numberOfFeatureChannels"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "styles"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v31;
  v32 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm1, "tc_weightsData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "numberOfFeatureChannels"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = objc_alloc_init(TCMPSStyleTransferWeights);
  v35 = objc_alloc_init(TCMPSStyleTransferWeights);
  -[TCMPSStyleTransferWeights setData:](v83, "setData:", v74);
  -[TCMPSStyleTransferWeights setShape:](v83, "setShape:", v72);
  -[TCMPSStyleTransferWeights setData:](v35, "setData:", v73);
  -[TCMPSStyleTransferWeights setShape:](v35, "setShape:", v71);
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v83, v75);
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v35, v76);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v84, CFSTR("inst_2_gamma_weight"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v84, CFSTR("inst_2_beta_weight"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "styles");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "numberOfFeatureChannels");

  v40 = 4 * v37 * v39;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v40);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v40);
  v66 = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_retainAutorelease(v64);
  v42 = (void *)objc_msgSend(v41, "mutableBytes");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v42, (const void *)objc_msgSend(v43, "gammaWeights"), v40);

  v44 = objc_retainAutorelease(v66);
  v45 = (void *)objc_msgSend(v44, "mutableBytes");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v45, (const void *)objc_msgSend(v46, "betaWeights"), v40);

  v47 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v48, "styles"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v49;
  v50 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "numberWithUnsignedInteger:", objc_msgSend(v51, "numberOfFeatureChannels"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v52;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "numberWithUnsignedInteger:", objc_msgSend(v55, "styles"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v56;
  v57 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm2, "tc_weightsData");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "numberWithUnsignedInteger:", objc_msgSend(v58, "numberOfFeatureChannels"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v59;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = objc_alloc_init(TCMPSStyleTransferWeights);
  v62 = objc_alloc_init(TCMPSStyleTransferWeights);
  -[TCMPSStyleTransferWeights setData:](v61, "setData:", v41);
  -[TCMPSStyleTransferWeights setShape:](v61, "setShape:", v53);
  -[TCMPSStyleTransferWeights setData:](v62, "setData:", v44);
  -[TCMPSStyleTransferWeights setShape:](v62, "setShape:", v60);
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v61, v69);
  objc_msgSend(v85, "setObject:forKeyedSubscript:", v62, v70);

  return v85;
}

- (MPSNNImageNode)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (MPSCNNConvolutionNode)conv1
{
  return self->_conv1;
}

- (void)setConv1:(id)a3
{
  objc_storeStrong((id *)&self->_conv1, a3);
}

- (MPSCNNInstanceNormalizationNode)instNorm1
{
  return self->_instNorm1;
}

- (void)setInstNorm1:(id)a3
{
  objc_storeStrong((id *)&self->_instNorm1, a3);
}

- (MPSCNNNeuronReLUNode)relu1
{
  return self->_relu1;
}

- (void)setRelu1:(id)a3
{
  objc_storeStrong((id *)&self->_relu1, a3);
}

- (MPSCNNConvolutionNode)conv2
{
  return self->_conv2;
}

- (void)setConv2:(id)a3
{
  objc_storeStrong((id *)&self->_conv2, a3);
}

- (MPSCNNInstanceNormalizationNode)instNorm2
{
  return self->_instNorm2;
}

- (void)setInstNorm2:(id)a3
{
  objc_storeStrong((id *)&self->_instNorm2, a3);
}

- (MPSNNAdditionNode)add
{
  return self->_add;
}

- (void)setAdd:(id)a3
{
  objc_storeStrong((id *)&self->_add, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_add, 0);
  objc_storeStrong((id *)&self->_instNorm2, 0);
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_relu1, 0);
  objc_storeStrong((id *)&self->_instNorm1, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end
