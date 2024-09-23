@implementation TCMPSVgg16Block2

- (TCMPSVgg16Block2)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v14;
  TCMPSVgg16Block2 *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  MPSCNNConvolutionNode *conv1;
  void *v26;
  void *v27;
  uint64_t v28;
  MPSCNNNeuronReLUNode *relu1;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  MPSCNNConvolutionNode *conv2;
  void *v39;
  void *v40;
  uint64_t v41;
  MPSCNNNeuronReLUNode *relu2;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  MPSCNNConvolutionNode *conv3;
  void *v52;
  void *v53;
  uint64_t v54;
  MPSCNNNeuronReLUNode *relu3;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  MPSCNNPoolingAverageNode *pooling;
  uint64_t v65;
  MPSNNImageNode *output;
  uint64_t v67;
  MPSNNImageNode *features;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
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
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  objc_super v134;

  v133 = a3;
  v129 = a4;
  v131 = a5;
  v130 = a6;
  v14 = a7;
  v132 = a8;
  v134.receiver = self;
  v134.super_class = (Class)TCMPSVgg16Block2;
  v15 = -[TCMPSVgg16Block2 init](&v134, sel_init);
  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDDE270];
    objc_msgSend(v14, "conv1");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v125, "kernelWidth");
    objc_msgSend(v14, "conv1");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v121, "kernelHeight");
    objc_msgSend(v14, "conv1");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v118, "inputFeatureChannels");
    objc_msgSend(v14, "conv1");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v115, "outputFeatureChannels");
    objc_msgSend(v14, "conv1");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v112, "strideWidth");
    objc_msgSend(v14, "conv1");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v109, "strideHeight");
    objc_msgSend(v14, "conv1");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v106, "paddingWidth");
    objc_msgSend(v14, "conv1");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v103, "paddingHeight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v133, CFSTR("conv_1_weight"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "objectForKeyedSubscript:", v91);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v133, CFSTR("conv_1_bias"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "objectForKeyedSubscript:", v82);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv1");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv1");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v70) = objc_msgSend(v23, "updateWeights");
    objc_msgSend(v16, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v129, v17, v18, v19, v100, v94, v88, v85, v79, v97, v20, v22, v70, v131, v130);
    v24 = objc_claimAutoreleasedReturnValue();
    conv1 = v15->_conv1;
    v15->_conv1 = (MPSCNNConvolutionNode *)v24;

    v26 = (void *)MEMORY[0x24BDDE2D8];
    -[MPSCNNConvolutionNode resultImage](v15->_conv1, "resultImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "nodeWithSource:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    relu1 = v15->_relu1;
    v15->_relu1 = (MPSCNNNeuronReLUNode *)v28;

    v30 = (void *)MEMORY[0x24BDDE270];
    -[MPSCNNNeuronReLUNode resultImage](v15->_relu1, "resultImage");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v122, "kernelWidth");
    objc_msgSend(v14, "conv2");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v119, "kernelHeight");
    objc_msgSend(v14, "conv2");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v116, "inputFeatureChannels");
    objc_msgSend(v14, "conv2");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v113, "outputFeatureChannels");
    objc_msgSend(v14, "conv2");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v110, "strideWidth");
    objc_msgSend(v14, "conv2");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v107, "strideHeight");
    objc_msgSend(v14, "conv2");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v104, "paddingWidth");
    objc_msgSend(v14, "conv2");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v98, "paddingHeight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v133, CFSTR("conv_2_weights"));
    v73 = v32;
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "objectForKeyedSubscript:", v86);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v133, CFSTR("conv_2_biases"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "objectForKeyedSubscript:", v77);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "label");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v71) = objc_msgSend(v36, "updateWeights");
    objc_msgSend(v30, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v126, v31, v73, v101, v95, v89, v83, v80, v75, v92, v33, v35, v71, v131, v130);
    v37 = objc_claimAutoreleasedReturnValue();
    conv2 = v15->_conv2;
    v15->_conv2 = (MPSCNNConvolutionNode *)v37;

    v39 = (void *)MEMORY[0x24BDDE2D8];
    -[MPSCNNConvolutionNode resultImage](v15->_conv2, "resultImage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "nodeWithSource:", v40);
    v41 = objc_claimAutoreleasedReturnValue();
    relu2 = v15->_relu2;
    v15->_relu2 = (MPSCNNNeuronReLUNode *)v41;

    v43 = (void *)MEMORY[0x24BDDE270];
    -[MPSCNNNeuronReLUNode resultImage](v15->_relu2, "resultImage");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v123, "kernelWidth");
    objc_msgSend(v14, "conv2");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v120, "kernelHeight");
    objc_msgSend(v14, "conv2");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v117, "inputFeatureChannels");
    objc_msgSend(v14, "conv2");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v114, "outputFeatureChannels");
    objc_msgSend(v14, "conv2");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v111, "strideWidth");
    objc_msgSend(v14, "conv2");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v108, "strideHeight");
    objc_msgSend(v14, "conv2");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v105, "paddingWidth");
    objc_msgSend(v14, "conv2");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v99, "paddingHeight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v133, CFSTR("conv_3_weights"));
    v74 = v45;
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "objectForKeyedSubscript:", v87);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v133, CFSTR("conv_3_biases"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "objectForKeyedSubscript:", v78);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "label");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v72) = objc_msgSend(v49, "updateWeights");
    objc_msgSend(v43, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v127, v44, v74, v102, v96, v90, v84, v81, v76, v93, v46, v48, v72, v131, v130);
    v50 = objc_claimAutoreleasedReturnValue();
    conv3 = v15->_conv3;
    v15->_conv3 = (MPSCNNConvolutionNode *)v50;

    v52 = (void *)MEMORY[0x24BDDE2D8];
    -[MPSCNNConvolutionNode resultImage](v15->_conv3, "resultImage");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "nodeWithSource:", v53);
    v54 = objc_claimAutoreleasedReturnValue();
    relu3 = v15->_relu3;
    v15->_relu3 = (MPSCNNNeuronReLUNode *)v54;

    v124 = objc_alloc(MEMORY[0x24BDDE2F8]);
    -[MPSCNNNeuronReLUNode resultImage](v15->_relu3, "resultImage");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pooling");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "kernelSize");
    objc_msgSend(v14, "pooling");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "kernelSize");
    objc_msgSend(v14, "pooling");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "strideSize");
    objc_msgSend(v14, "pooling");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v124, "initWithSource:kernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:", v128, v57, v59, v61, objc_msgSend(v62, "strideSize"));
    pooling = v15->_pooling;
    v15->_pooling = (MPSCNNPoolingAverageNode *)v63;

    -[MPSCNNPoolingAverageNode resultImage](v15->_pooling, "resultImage");
    v65 = objc_claimAutoreleasedReturnValue();
    output = v15->_output;
    v15->_output = (MPSNNImageNode *)v65;

    -[MPSCNNNeuronReLUNode resultImage](v15->_relu3, "resultImage");
    v67 = objc_claimAutoreleasedReturnValue();
    features = v15->_features;
    v15->_features = (MPSNNImageNode *)v67;

  }
  return v15;
}

- (id)backwardPass:(id)a3
{
  void *v4;
  MPSCNNNeuronReLUNode *relu2;
  void *v6;
  void *v7;
  MPSCNNConvolutionNode *conv2;
  void *v9;
  void *v10;
  MPSCNNNeuronReLUNode *relu1;
  void *v12;
  void *v13;
  MPSCNNConvolutionNode *conv1;
  void *v15;
  void *v16;
  void *v17;

  -[MPSCNNPoolingAverageNode gradientFilterWithSource:](self->_pooling, "gradientFilterWithSource:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  relu2 = self->_relu2;
  objc_msgSend(v4, "resultImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNNeuronReLUNode gradientFilterWithSource:](relu2, "gradientFilterWithSource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  conv2 = self->_conv2;
  objc_msgSend(v7, "resultImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode gradientFilterWithSource:](conv2, "gradientFilterWithSource:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  relu1 = self->_relu1;
  objc_msgSend(v10, "resultImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNNeuronReLUNode gradientFilterWithSource:](relu1, "gradientFilterWithSource:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  conv1 = self->_conv1;
  objc_msgSend(v13, "resultImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode gradientFilterWithSource:](conv1, "gradientFilterWithSource:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "resultImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setLearningRate:(float)a3
{
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  id v10;

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv1, "tc_weightsData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v8, "setLearningRate:", v5);

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv2, "tc_weightsData");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v9, "setLearningRate:", v6);

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv3, "tc_weightsData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v10, "setLearningRate:", v7);

}

- (MPSNNImageNode)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
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

- (MPSCNNNeuronReLUNode)relu2
{
  return self->_relu2;
}

- (void)setRelu2:(id)a3
{
  objc_storeStrong((id *)&self->_relu2, a3);
}

- (MPSCNNConvolutionNode)conv3
{
  return self->_conv3;
}

- (void)setConv3:(id)a3
{
  objc_storeStrong((id *)&self->_conv3, a3);
}

- (MPSCNNNeuronReLUNode)relu3
{
  return self->_relu3;
}

- (void)setRelu3:(id)a3
{
  objc_storeStrong((id *)&self->_relu3, a3);
}

- (MPSCNNPoolingAverageNode)pooling
{
  return self->_pooling;
}

- (void)setPooling:(id)a3
{
  objc_storeStrong((id *)&self->_pooling, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pooling, 0);
  objc_storeStrong((id *)&self->_relu3, 0);
  objc_storeStrong((id *)&self->_conv3, 0);
  objc_storeStrong((id *)&self->_relu2, 0);
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_relu1, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

@end
