@implementation TCMPSStyleTransferEncodingNode

- (TCMPSStyleTransferEncodingNode)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v14;
  TCMPSStyleTransferEncodingNode *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  MPSCNNConvolutionNode *conv;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  MPSCNNInstanceNormalizationNode *instNorm;
  void *v38;
  void *v39;
  uint64_t v40;
  MPSCNNNeuronReLUNode *relu;
  uint64_t v42;
  MPSNNImageNode *output;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
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
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  objc_super v70;

  v69 = a3;
  v65 = a4;
  v67 = a5;
  v66 = a6;
  v14 = a7;
  v68 = a8;
  v70.receiver = self;
  v70.super_class = (Class)TCMPSStyleTransferEncodingNode;
  v15 = -[TCMPSStyleTransferEncodingNode init](&v70, sel_init);
  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDBCEC8];
    objc_msgSend(v14, "conv");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataWithLength:", 4 * objc_msgSend(v17, "outputFeatureChannels"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = (void *)MEMORY[0x24BDDE270];
    objc_msgSend(v14, "conv");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v62, "kernelWidth");
    objc_msgSend(v14, "conv");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v60, "kernelHeight");
    objc_msgSend(v14, "conv");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v58, "inputFeatureChannels");
    objc_msgSend(v14, "conv");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v56, "outputFeatureChannels");
    objc_msgSend(v14, "conv");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v55, "strideWidth");
    objc_msgSend(v14, "conv");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v54, "strideHeight");
    objc_msgSend(v14, "conv");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v50, "paddingWidth");
    objc_msgSend(v14, "conv");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v47, "paddingHeight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v69, CFSTR("conv_weight"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v45) = objc_msgSend(v25, "updateWeights");
    objc_msgSend(v53, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v65, v52, v51, v49, v48, v46, v18, v19, v20, v22, v64, v24, v45, v67, v66);
    v26 = objc_claimAutoreleasedReturnValue();
    conv = v15->_conv;
    v15->_conv = (MPSCNNConvolutionNode *)v26;

    v28 = (void *)MEMORY[0x24BDDE298];
    -[MPSCNNConvolutionNode resultImage](v15->_conv, "resultImage");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inst");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v61, "channels");
    objc_msgSend(v14, "inst");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v59, "styles");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v69, CFSTR("inst_gamma_weight"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", v57);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v69, CFSTR("inst_beta_weight"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inst");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "label");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "createInstanceNormalization:channels:styles:gamma:beta:label:device:cmdQueue:", v63, v29, v30, v31, v33, v35, v67, v66);
    v36 = objc_claimAutoreleasedReturnValue();
    instNorm = v15->_instNorm;
    v15->_instNorm = (MPSCNNInstanceNormalizationNode *)v36;

    v38 = (void *)MEMORY[0x24BDDE2D8];
    -[MPSCNNInstanceNormalizationNode resultImage](v15->_instNorm, "resultImage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "nodeWithSource:", v39);
    v40 = objc_claimAutoreleasedReturnValue();
    relu = v15->_relu;
    v15->_relu = (MPSCNNNeuronReLUNode *)v40;

    -[MPSCNNNeuronReLUNode resultImage](v15->_relu, "resultImage");
    v42 = objc_claimAutoreleasedReturnValue();
    output = v15->_output;
    v15->_output = (MPSNNImageNode *)v42;

  }
  return v15;
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
  void *v11;

  -[MPSCNNNeuronReLUNode gradientFilterWithSource:](self->_relu, "gradientFilterWithSource:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  instNorm = self->_instNorm;
  objc_msgSend(v4, "resultImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNInstanceNormalizationNode gradientFilterWithSource:](instNorm, "gradientFilterWithSource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  conv = self->_conv;
  objc_msgSend(v7, "resultImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode gradientFilterWithSource:](conv, "gradientFilterWithSource:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "resultImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setStyleIndex:(unint64_t)a3
{
  id v5;
  id v6;

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
  id v7;
  id v8;

  -[MPSCNNConvolutionNode tc_weightsData](self->_conv, "tc_weightsData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v7, "setLearningRate:", v5);

  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v8, "setLearningRate:", v6);

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
  void *v36;
  void *v37;
  void *v39;
  TCMPSStyleTransferWeights *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  v44 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv, "tc_weightsData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 4 * objc_msgSend(v4, "weightSize");

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v5);
  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (void *)objc_msgSend(v43, "mutableBytes");
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv, "tc_weightsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memcpy(v6, (const void *)objc_msgSend(v7, "weights"), v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v45, CFSTR("conv_weight"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNConvolutionNode tc_weightsData](self->_conv, "tc_weightsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "weightShape");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_alloc_init(TCMPSStyleTransferWeights);
  -[TCMPSStyleTransferWeights setData:](v40, "setData:", v43);
  -[TCMPSStyleTransferWeights setShape:](v40, "setShape:", v42);
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v40, v41);
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "styles");
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 4 * v10 * objc_msgSend(v11, "numberOfFeatureChannels");

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease(v39);
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
  v47[0] = v22;
  v23 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfFeatureChannels"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "styles"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v29;
  v30 = (void *)MEMORY[0x24BDD16E0];
  -[MPSCNNInstanceNormalizationNode tc_weightsData](self->_instNorm, "tc_weightsData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "numberOfFeatureChannels"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc_init(TCMPSStyleTransferWeights);
  v35 = objc_alloc_init(TCMPSStyleTransferWeights);
  -[TCMPSStyleTransferWeights setData:](v34, "setData:", v14);
  -[TCMPSStyleTransferWeights setShape:](v34, "setShape:", v26);
  -[TCMPSStyleTransferWeights setData:](v35, "setData:", v17);
  -[TCMPSStyleTransferWeights setShape:](v35, "setShape:", v33);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v45, CFSTR("inst_gamma_weight"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v45, CFSTR("inst_beta_weight"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v34, v36);
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v35, v37);

  return v44;
}

- (MPSNNImageNode)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
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

- (MPSCNNNeuronReLUNode)relu
{
  return self->_relu;
}

- (void)setRelu:(id)a3
{
  objc_storeStrong((id *)&self->_relu, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relu, 0);
  objc_storeStrong((id *)&self->_instNorm, 0);
  objc_storeStrong((id *)&self->_conv, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end
