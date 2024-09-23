@implementation TCMPSStyleTransferTransformerNetwork

- (TCMPSStyleTransferTransformerNetwork)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v13;
  TCMPSStyleTransferTransformerNetwork *v14;
  TCMPSStyleTransferEncodingNode *v15;
  void *v16;
  uint64_t v17;
  TCMPSStyleTransferEncodingNode *encoding1;
  TCMPSStyleTransferEncodingNode *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  TCMPSStyleTransferEncodingNode *encoding2;
  TCMPSStyleTransferEncodingNode *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  TCMPSStyleTransferEncodingNode *encoding3;
  TCMPSStyleTransferResidualNode *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  TCMPSStyleTransferResidualNode *residual1;
  TCMPSStyleTransferResidualNode *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  TCMPSStyleTransferResidualNode *residual2;
  TCMPSStyleTransferResidualNode *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  TCMPSStyleTransferResidualNode *residual3;
  TCMPSStyleTransferResidualNode *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  TCMPSStyleTransferResidualNode *residual4;
  TCMPSStyleTransferResidualNode *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  TCMPSStyleTransferResidualNode *residual5;
  TCMPSStyleTransferDecodingNode *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  TCMPSStyleTransferDecodingNode *decoding1;
  TCMPSStyleTransferDecodingNode *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  TCMPSStyleTransferDecodingNode *decoding2;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  MPSCNNConvolutionNode *conv;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  MPSCNNInstanceNormalizationNode *instNorm;
  void *v85;
  void *v86;
  uint64_t v87;
  MPSCNNNeuronSigmoidNode *sigmoid;
  uint64_t v89;
  MPSNNImageNode *forwardPass;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
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
  id v111;
  id v112;
  id v113;
  id v114;
  objc_super v115;

  v111 = a4;
  v113 = a5;
  v112 = a6;
  v13 = a7;
  v114 = a8;
  v115.receiver = self;
  v115.super_class = (Class)TCMPSStyleTransferTransformerNetwork;
  v14 = -[TCMPSStyleTransferTransformerNetwork init](&v115, sel_init);
  if (v14)
  {
    v15 = [TCMPSStyleTransferEncodingNode alloc];
    objc_msgSend(v13, "encode1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TCMPSStyleTransferEncodingNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v15, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_encode_1_"), v111, v113, v112, v16, v114);
    encoding1 = v14->_encoding1;
    v14->_encoding1 = (TCMPSStyleTransferEncodingNode *)v17;

    v19 = [TCMPSStyleTransferEncodingNode alloc];
    -[TCMPSStyleTransferEncodingNode output](v14->_encoding1, "output");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encode2");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TCMPSStyleTransferEncodingNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v19, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_encode_2_"), v20, v113, v112, v21, v114);
    encoding2 = v14->_encoding2;
    v14->_encoding2 = (TCMPSStyleTransferEncodingNode *)v22;

    v24 = [TCMPSStyleTransferEncodingNode alloc];
    -[TCMPSStyleTransferEncodingNode output](v14->_encoding2, "output");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encode3");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[TCMPSStyleTransferEncodingNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v24, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_encode_3_"), v25, v113, v112, v26, v114);
    encoding3 = v14->_encoding3;
    v14->_encoding3 = (TCMPSStyleTransferEncodingNode *)v27;

    v29 = [TCMPSStyleTransferResidualNode alloc];
    -[TCMPSStyleTransferEncodingNode output](v14->_encoding3, "output");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "residual1");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[TCMPSStyleTransferResidualNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v29, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_residual_1_"), v30, v113, v112, v31, v114);
    residual1 = v14->_residual1;
    v14->_residual1 = (TCMPSStyleTransferResidualNode *)v32;

    v34 = [TCMPSStyleTransferResidualNode alloc];
    -[TCMPSStyleTransferResidualNode output](v14->_residual1, "output");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "residual2");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[TCMPSStyleTransferResidualNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v34, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_residual_2_"), v35, v113, v112, v36, v114);
    residual2 = v14->_residual2;
    v14->_residual2 = (TCMPSStyleTransferResidualNode *)v37;

    v39 = [TCMPSStyleTransferResidualNode alloc];
    -[TCMPSStyleTransferResidualNode output](v14->_residual2, "output");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "residual3");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[TCMPSStyleTransferResidualNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v39, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_residual_3_"), v40, v113, v112, v41, v114);
    residual3 = v14->_residual3;
    v14->_residual3 = (TCMPSStyleTransferResidualNode *)v42;

    v44 = [TCMPSStyleTransferResidualNode alloc];
    -[TCMPSStyleTransferResidualNode output](v14->_residual3, "output");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "residual4");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[TCMPSStyleTransferResidualNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v44, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_residual_4_"), v45, v113, v112, v46, v114);
    residual4 = v14->_residual4;
    v14->_residual4 = (TCMPSStyleTransferResidualNode *)v47;

    v49 = [TCMPSStyleTransferResidualNode alloc];
    -[TCMPSStyleTransferResidualNode output](v14->_residual4, "output");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "residual5");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[TCMPSStyleTransferResidualNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v49, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_residual_5_"), v50, v113, v112, v51, v114);
    residual5 = v14->_residual5;
    v14->_residual5 = (TCMPSStyleTransferResidualNode *)v52;

    v54 = [TCMPSStyleTransferDecodingNode alloc];
    -[TCMPSStyleTransferResidualNode output](v14->_residual5, "output");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "decode1");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[TCMPSStyleTransferDecodingNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v54, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_decoding_1_"), v55, v113, v112, v56, v114);
    decoding1 = v14->_decoding1;
    v14->_decoding1 = (TCMPSStyleTransferDecodingNode *)v57;

    v59 = [TCMPSStyleTransferDecodingNode alloc];
    -[TCMPSStyleTransferDecodingNode output](v14->_decoding1, "output");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "decode2");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[TCMPSStyleTransferDecodingNode initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:](v59, "initWithParameters:inputNode:device:cmdQueue:descriptor:initWeights:", CFSTR("transformer_decoding_2_"), v60, v113, v112, v61, v114);
    decoding2 = v14->_decoding2;
    v14->_decoding2 = (TCMPSStyleTransferDecodingNode *)v62;

    v64 = (void *)MEMORY[0x24BDBCEC8];
    objc_msgSend(v13, "conv");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dataWithLength:", 4 * objc_msgSend(v65, "outputFeatureChannels"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    v101 = (void *)MEMORY[0x24BDDE270];
    -[TCMPSStyleTransferDecodingNode output](v14->_decoding2, "output");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "conv");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v106, "kernelWidth");
    objc_msgSend(v13, "conv");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v105, "kernelHeight");
    objc_msgSend(v13, "conv");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v104, "inputFeatureChannels");
    objc_msgSend(v13, "conv");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v103, "outputFeatureChannels");
    objc_msgSend(v13, "conv");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v102, "strideWidth");
    objc_msgSend(v13, "conv");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v100, "strideHeight");
    objc_msgSend(v13, "conv");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v97, "paddingWidth");
    objc_msgSend(v13, "conv");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "paddingHeight");
    objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("transformer_conv5_weight"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "conv");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "label");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "conv");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v92) = objc_msgSend(v72, "updateWeights");
    objc_msgSend(v101, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v108, v99, v98, v96, v95, v94, v93, v66, v68, v69, v110, v71, v92, v113, v112);
    v73 = objc_claimAutoreleasedReturnValue();
    conv = v14->_conv;
    v14->_conv = (MPSCNNConvolutionNode *)v73;

    v75 = (void *)MEMORY[0x24BDDE298];
    -[MPSCNNConvolutionNode resultImage](v14->_conv, "resultImage");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inst");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v107, "channels");
    objc_msgSend(v13, "inst");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "styles");
    objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("transformer_instancenorm5_gamma_weight"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("transformer_instancenorm5_beta_weight"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inst");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "label");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "createInstanceNormalization:channels:styles:gamma:beta:label:device:cmdQueue:", v109, v76, v78, v79, v80, v82, v113, v112);
    v83 = objc_claimAutoreleasedReturnValue();
    instNorm = v14->_instNorm;
    v14->_instNorm = (MPSCNNInstanceNormalizationNode *)v83;

    v85 = (void *)MEMORY[0x24BDDE2E0];
    -[MPSCNNInstanceNormalizationNode resultImage](v14->_instNorm, "resultImage");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "nodeWithSource:", v86);
    v87 = objc_claimAutoreleasedReturnValue();
    sigmoid = v14->_sigmoid;
    v14->_sigmoid = (MPSCNNNeuronSigmoidNode *)v87;

    -[MPSCNNNeuronSigmoidNode resultImage](v14->_sigmoid, "resultImage");
    v89 = objc_claimAutoreleasedReturnValue();
    forwardPass = v14->_forwardPass;
    v14->_forwardPass = (MPSNNImageNode *)v89;

  }
  return v14;
}

- (id)backwardPass:(id)a3
{
  void *v4;
  MPSCNNInstanceNormalizationNode *instNorm;
  void *v6;
  void *v7;
  MPSCNNConvolutionNode *conv;
  void *v9;
  void *v10;
  TCMPSStyleTransferDecodingNode *decoding2;
  void *v12;
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
  void *v24;
  void *v25;
  void *v26;

  -[MPSCNNNeuronSigmoidNode gradientFilterWithSource:](self->_sigmoid, "gradientFilterWithSource:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  instNorm = self->_instNorm;
  v26 = v4;
  objc_msgSend(v4, "resultImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNInstanceNormalizationNode gradientFilterWithSource:](instNorm, "gradientFilterWithSource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  conv = self->_conv;
  v25 = v7;
  objc_msgSend(v7, "resultImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode gradientFilterWithSource:](conv, "gradientFilterWithSource:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  decoding2 = self->_decoding2;
  v24 = v10;
  objc_msgSend(v10, "resultImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferDecodingNode backwardPass:](decoding2, "backwardPass:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCMPSStyleTransferDecodingNode backwardPass:](self->_decoding1, "backwardPass:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode backwardPass:](self->_residual5, "backwardPass:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode backwardPass:](self->_residual4, "backwardPass:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode backwardPass:](self->_residual3, "backwardPass:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode backwardPass:](self->_residual2, "backwardPass:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode backwardPass:](self->_residual1, "backwardPass:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferEncodingNode backwardPass:](self->_encoding3, "backwardPass:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferEncodingNode backwardPass:](self->_encoding2, "backwardPass:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferEncodingNode backwardPass:](self->_encoding1, "backwardPass:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)setStyleIndex:(unint64_t)a3
{
  id v5;
  id v6;

  -[TCMPSStyleTransferEncodingNode setStyleIndex:](self->_encoding1, "setStyleIndex:");
  -[TCMPSStyleTransferEncodingNode setStyleIndex:](self->_encoding2, "setStyleIndex:", a3);
  -[TCMPSStyleTransferEncodingNode setStyleIndex:](self->_encoding3, "setStyleIndex:", a3);
  -[TCMPSStyleTransferResidualNode setStyleIndex:](self->_residual1, "setStyleIndex:", a3);
  -[TCMPSStyleTransferResidualNode setStyleIndex:](self->_residual2, "setStyleIndex:", a3);
  -[TCMPSStyleTransferResidualNode setStyleIndex:](self->_residual3, "setStyleIndex:", a3);
  -[TCMPSStyleTransferResidualNode setStyleIndex:](self->_residual4, "setStyleIndex:", a3);
  -[TCMPSStyleTransferResidualNode setStyleIndex:](self->_residual5, "setStyleIndex:", a3);
  -[TCMPSStyleTransferDecodingNode setStyleIndex:](self->_decoding1, "setStyleIndex:", a3);
  -[TCMPSStyleTransferDecodingNode setStyleIndex:](self->_decoding2, "setStyleIndex:", a3);
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyleIndex:", a3);

  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkpoint");

}

- (void)setLearningRate:(float)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;

  -[TCMPSStyleTransferEncodingNode setLearningRate:](self->_encoding1, "setLearningRate:");
  *(float *)&v5 = a3;
  -[TCMPSStyleTransferEncodingNode setLearningRate:](self->_encoding2, "setLearningRate:", v5);
  *(float *)&v6 = a3;
  -[TCMPSStyleTransferEncodingNode setLearningRate:](self->_encoding3, "setLearningRate:", v6);
  *(float *)&v7 = a3;
  -[TCMPSStyleTransferResidualNode setLearningRate:](self->_residual1, "setLearningRate:", v7);
  *(float *)&v8 = a3;
  -[TCMPSStyleTransferResidualNode setLearningRate:](self->_residual2, "setLearningRate:", v8);
  *(float *)&v9 = a3;
  -[TCMPSStyleTransferResidualNode setLearningRate:](self->_residual3, "setLearningRate:", v9);
  *(float *)&v10 = a3;
  -[TCMPSStyleTransferResidualNode setLearningRate:](self->_residual4, "setLearningRate:", v10);
  *(float *)&v11 = a3;
  -[TCMPSStyleTransferResidualNode setLearningRate:](self->_residual5, "setLearningRate:", v11);
  *(float *)&v12 = a3;
  -[TCMPSStyleTransferDecodingNode setLearningRate:](self->_decoding1, "setLearningRate:", v12);
  *(float *)&v13 = a3;
  -[TCMPSStyleTransferDecodingNode setLearningRate:](self->_decoding2, "setLearningRate:", v13);
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv, "tc_weightsData");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a3;
  objc_msgSend(v16, "setLearningRate:", v14);

  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a3;
  objc_msgSend(v17, "setLearningRate:", v15);

}

- (id)exportWeights:(id)a3
{
  void *v4;
  size_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  size_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
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
  TCMPSStyleTransferWeights *v34;
  TCMPSStyleTransferWeights *v35;
  void *v37;
  TCMPSStyleTransferWeights *v38;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[2];
  _QWORD v67[4];

  v67[2] = *MEMORY[0x24BDAC8D0];
  v64 = a3;
  v65 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("encode_1_"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferEncodingNode exportWeights:](self->_encoding1, "exportWeights:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("encode_2_"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferEncodingNode exportWeights:](self->_encoding2, "exportWeights:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("encode_3_"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferEncodingNode exportWeights:](self->_encoding3, "exportWeights:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("residual_1_"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual1, "exportWeights:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("residual_2_"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual2, "exportWeights:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("residual_3_"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual3, "exportWeights:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("residual_4_"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual4, "exportWeights:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("residual_5_"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual5, "exportWeights:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("decoding_1_"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferDecodingNode exportWeights:](self->_decoding1, "exportWeights:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("decoding_2_"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCMPSStyleTransferDecodingNode exportWeights:](self->_decoding2, "exportWeights:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addEntriesFromDictionary:");
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv, "tc_weightsData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 4 * objc_msgSend(v4, "weightSize");

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v5);
  v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (void *)objc_msgSend(v63, "mutableBytes");
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv, "tc_weightsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v6, (const void *)objc_msgSend(v7, "weights"), v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("conv5_weight"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv, "tc_weightsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "weightShape");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_alloc_init(TCMPSStyleTransferWeights);
  -[TCMPSStyleTransferWeights setData:](v38, "setData:", v63);
  -[TCMPSStyleTransferWeights setShape:](v38, "setShape:", v62);
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v38, v61);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("instancenorm5_gamma_weight"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v64, CFSTR("instancenorm5_beta_weight"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "styles");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 4 * v10 * objc_msgSend(v11, "numberOfFeatureChannels");

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease(v37);
  v15 = (void *)objc_msgSend(v14, "mutableBytes");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v15, (const void *)objc_msgSend(v16, "gammaWeights"), v12);

  v17 = objc_retainAutorelease(v13);
  v18 = (void *)objc_msgSend(v17, "mutableBytes");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v18, (const void *)objc_msgSend(v19, "betaWeights"), v12);

  v20 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "styles"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v22;
  v23 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfFeatureChannels"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "styles"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v29;
  v30 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "numberOfFeatureChannels"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc_init(TCMPSStyleTransferWeights);
  v35 = objc_alloc_init(TCMPSStyleTransferWeights);
  -[TCMPSStyleTransferWeights setData:](v34, "setData:", v14);
  -[TCMPSStyleTransferWeights setShape:](v34, "setShape:", v26);
  -[TCMPSStyleTransferWeights setData:](v35, "setData:", v17);
  -[TCMPSStyleTransferWeights setShape:](v35, "setShape:", v33);
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v34, v59);
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v35, v60);

  return v65;
}

- (MPSNNImageNode)forwardPass
{
  return self->_forwardPass;
}

- (void)setForwardPass:(id)a3
{
  objc_storeStrong((id *)&self->_forwardPass, a3);
}

- (TCMPSStyleTransferEncodingNode)encoding1
{
  return self->_encoding1;
}

- (void)setEncoding1:(id)a3
{
  objc_storeStrong((id *)&self->_encoding1, a3);
}

- (TCMPSStyleTransferEncodingNode)encoding2
{
  return self->_encoding2;
}

- (void)setEncoding2:(id)a3
{
  objc_storeStrong((id *)&self->_encoding2, a3);
}

- (TCMPSStyleTransferEncodingNode)encoding3
{
  return self->_encoding3;
}

- (void)setEncoding3:(id)a3
{
  objc_storeStrong((id *)&self->_encoding3, a3);
}

- (TCMPSStyleTransferResidualNode)residual1
{
  return self->_residual1;
}

- (void)setResidual1:(id)a3
{
  objc_storeStrong((id *)&self->_residual1, a3);
}

- (TCMPSStyleTransferResidualNode)residual2
{
  return self->_residual2;
}

- (void)setResidual2:(id)a3
{
  objc_storeStrong((id *)&self->_residual2, a3);
}

- (TCMPSStyleTransferResidualNode)residual3
{
  return self->_residual3;
}

- (void)setResidual3:(id)a3
{
  objc_storeStrong((id *)&self->_residual3, a3);
}

- (TCMPSStyleTransferResidualNode)residual4
{
  return self->_residual4;
}

- (void)setResidual4:(id)a3
{
  objc_storeStrong((id *)&self->_residual4, a3);
}

- (TCMPSStyleTransferResidualNode)residual5
{
  return self->_residual5;
}

- (void)setResidual5:(id)a3
{
  objc_storeStrong((id *)&self->_residual5, a3);
}

- (TCMPSStyleTransferDecodingNode)decoding1
{
  return self->_decoding1;
}

- (void)setDecoding1:(id)a3
{
  objc_storeStrong((id *)&self->_decoding1, a3);
}

- (TCMPSStyleTransferDecodingNode)decoding2
{
  return self->_decoding2;
}

- (void)setDecoding2:(id)a3
{
  objc_storeStrong((id *)&self->_decoding2, a3);
}

- (MPSCNNConvolutionNode)conv
{
  return self->_conv;
}

- (void)setConv:(id)a3
{
  objc_storeStrong((id *)&self->_conv, a3);
}

- (MPSCNNInstanceNormalizationNode)instNorm
{
  return self->_instNorm;
}

- (void)setInstNorm:(id)a3
{
  objc_storeStrong((id *)&self->_instNorm, a3);
}

- (MPSCNNNeuronSigmoidNode)sigmoid
{
  return self->_sigmoid;
}

- (void)setSigmoid:(id)a3
{
  objc_storeStrong((id *)&self->_sigmoid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigmoid, 0);
  objc_storeStrong((id *)&self->_instNorm, 0);
  objc_storeStrong((id *)&self->_conv, 0);
  objc_storeStrong((id *)&self->_decoding2, 0);
  objc_storeStrong((id *)&self->_decoding1, 0);
  objc_storeStrong((id *)&self->_residual5, 0);
  objc_storeStrong((id *)&self->_residual4, 0);
  objc_storeStrong((id *)&self->_residual3, 0);
  objc_storeStrong((id *)&self->_residual2, 0);
  objc_storeStrong((id *)&self->_residual1, 0);
  objc_storeStrong((id *)&self->_encoding3, 0);
  objc_storeStrong((id *)&self->_encoding2, 0);
  objc_storeStrong((id *)&self->_encoding1, 0);
  objc_storeStrong((id *)&self->_forwardPass, 0);
}

@end
