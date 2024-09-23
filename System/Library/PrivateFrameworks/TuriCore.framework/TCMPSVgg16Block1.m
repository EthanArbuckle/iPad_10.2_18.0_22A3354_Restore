@implementation TCMPSVgg16Block1

- (TCMPSVgg16Block1)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v14;
  TCMPSVgg16Block1 *v15;
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
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  MPSCNNPoolingAverageNode *pooling;
  uint64_t v52;
  MPSNNImageNode *output;
  uint64_t v54;
  MPSNNImageNode *features;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
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
  id v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  objc_super v102;

  v101 = a3;
  v97 = a4;
  v99 = a5;
  v98 = a6;
  v14 = a7;
  v100 = a8;
  v102.receiver = self;
  v102.super_class = (Class)TCMPSVgg16Block1;
  v15 = -[TCMPSVgg16Block1 init](&v102, sel_init);
  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDDE270];
    objc_msgSend(v14, "conv1");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v94, "kernelWidth");
    objc_msgSend(v14, "conv1");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v91, "kernelHeight");
    objc_msgSend(v14, "conv1");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v89, "inputFeatureChannels");
    objc_msgSend(v14, "conv1");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v87, "outputFeatureChannels");
    objc_msgSend(v14, "conv1");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v85, "strideWidth");
    objc_msgSend(v14, "conv1");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v83, "strideHeight");
    objc_msgSend(v14, "conv1");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v81, "paddingWidth");
    objc_msgSend(v14, "conv1");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v79, "paddingHeight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v101, CFSTR("conv_1_weight"));
    v61 = v19;
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "objectForKeyedSubscript:", v71);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v101, CFSTR("conv_1_bias"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "objectForKeyedSubscript:", v65);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv1");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv1");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v57) = objc_msgSend(v23, "updateWeights");
    objc_msgSend(v16, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v97, v17, v18, v61, v77, v73, v69, v67, v63, v75, v20, v22, v57, v99, v98);
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
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v92, "kernelWidth");
    objc_msgSend(v14, "conv2");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v90, "kernelHeight");
    objc_msgSend(v14, "conv2");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v88, "inputFeatureChannels");
    objc_msgSend(v14, "conv2");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v86, "outputFeatureChannels");
    objc_msgSend(v14, "conv2");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v84, "strideWidth");
    objc_msgSend(v14, "conv2");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v82, "strideHeight");
    objc_msgSend(v14, "conv2");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v80, "paddingWidth");
    objc_msgSend(v14, "conv2");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v76, "paddingHeight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v101, CFSTR("conv_2_weight"));
    v59 = v32;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "objectForKeyedSubscript:", v68);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v101, CFSTR("conv_2_bias"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "objectForKeyedSubscript:", v62);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "label");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv2");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v58) = objc_msgSend(v36, "updateWeights");
    objc_msgSend(v30, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v95, v31, v59, v78, v74, v70, v66, v64, v60, v72, v33, v35, v58, v99, v98);
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

    v93 = objc_alloc(MEMORY[0x24BDDE2F8]);
    -[MPSCNNNeuronReLUNode resultImage](v15->_relu2, "resultImage");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pooling");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "kernelSize");
    objc_msgSend(v14, "pooling");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "kernelSize");
    objc_msgSend(v14, "pooling");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "strideSize");
    objc_msgSend(v14, "pooling");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v93, "initWithSource:kernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:", v96, v44, v46, v48, objc_msgSend(v49, "strideSize"));
    pooling = v15->_pooling;
    v15->_pooling = (MPSCNNPoolingAverageNode *)v50;

    -[MPSCNNPoolingAverageNode resultImage](v15->_pooling, "resultImage");
    v52 = objc_claimAutoreleasedReturnValue();
    output = v15->_output;
    v15->_output = (MPSNNImageNode *)v52;

    -[MPSCNNNeuronReLUNode resultImage](v15->_relu2, "resultImage");
    v54 = objc_claimAutoreleasedReturnValue();
    features = v15->_features;
    v15->_features = (MPSNNImageNode *)v54;

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
  id v7;
  id v8;

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv1, "tc_weightsData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v7, "setLearningRate:", v5);

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv2, "tc_weightsData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v8, "setLearningRate:", v6);

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
  objc_storeStrong((id *)&self->_relu2, 0);
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_relu1, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

@end
