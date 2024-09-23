@implementation TCMPSStyleTransferDecodingNode

- (TCMPSStyleTransferDecodingNode)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v14;
  TCMPSStyleTransferDecodingNode *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  MPSCNNUpsamplingNearestNode *upsample;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MPSCNNConvolutionNode *conv;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  MPSCNNInstanceNormalizationNode *instNorm;
  void *v43;
  void *v44;
  uint64_t v45;
  MPSCNNNeuronReLUNode *relu;
  uint64_t v47;
  MPSNNImageNode *output;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
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
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  objc_super v77;

  v76 = a3;
  v72 = a4;
  v74 = a5;
  v73 = a6;
  v14 = a7;
  v75 = a8;
  v77.receiver = self;
  v77.super_class = (Class)TCMPSStyleTransferDecodingNode;
  v15 = -[TCMPSStyleTransferDecodingNode init](&v77, sel_init);
  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDDE328];
    objc_msgSend(v14, "upsample");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "scale");
    objc_msgSend(v14, "upsample");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nodeWithSource:integerScaleFactorX:integerScaleFactorY:", v72, v18, objc_msgSend(v19, "scale"));
    v20 = objc_claimAutoreleasedReturnValue();
    upsample = v15->_upsample;
    v15->_upsample = (MPSCNNUpsamplingNearestNode *)v20;

    v22 = (void *)MEMORY[0x24BDBCEC8];
    objc_msgSend(v14, "conv");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dataWithLength:", 4 * objc_msgSend(v23, "outputFeatureChannels"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = (void *)MEMORY[0x24BDDE270];
    -[MPSCNNUpsamplingNearestNode resultImage](v15->_upsample, "resultImage");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v67, "kernelWidth");
    objc_msgSend(v14, "conv");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v65, "kernelHeight");
    objc_msgSend(v14, "conv");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v63, "inputFeatureChannels");
    objc_msgSend(v14, "conv");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v62, "outputFeatureChannels");
    objc_msgSend(v14, "conv");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v61, "strideWidth");
    objc_msgSend(v14, "conv");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v59, "strideHeight");
    objc_msgSend(v14, "conv");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v56, "paddingWidth");
    objc_msgSend(v14, "conv");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v53, "paddingHeight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v76, CFSTR("conv_weight"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "label");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conv");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v50) = objc_msgSend(v30, "updateWeights");
    objc_msgSend(v60, "createConvolutional:kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:", v69, v58, v57, v55, v54, v52, v51, v24, v25, v27, v71, v29, v50, v74, v73);
    v31 = objc_claimAutoreleasedReturnValue();
    conv = v15->_conv;
    v15->_conv = (MPSCNNConvolutionNode *)v31;

    v33 = (void *)MEMORY[0x24BDDE298];
    -[MPSCNNConvolutionNode resultImage](v15->_conv, "resultImage");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inst");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v68, "channels");
    objc_msgSend(v14, "inst");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v66, "styles");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v76, CFSTR("inst_gamma_weight"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectForKeyedSubscript:", v64);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v76, CFSTR("inst_beta_weight"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectForKeyedSubscript:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inst");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "label");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "createInstanceNormalization:channels:styles:gamma:beta:label:device:cmdQueue:", v70, v34, v35, v36, v38, v40, v74, v73);
    v41 = objc_claimAutoreleasedReturnValue();
    instNorm = v15->_instNorm;
    v15->_instNorm = (MPSCNNInstanceNormalizationNode *)v41;

    v43 = (void *)MEMORY[0x24BDDE2D8];
    -[MPSCNNInstanceNormalizationNode resultImage](v15->_instNorm, "resultImage");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "nodeWithSource:", v44);
    v45 = objc_claimAutoreleasedReturnValue();
    relu = v15->_relu;
    v15->_relu = (MPSCNNNeuronReLUNode *)v45;

    -[MPSCNNNeuronReLUNode resultImage](v15->_relu, "resultImage");
    v47 = objc_claimAutoreleasedReturnValue();
    output = v15->_output;
    v15->_output = (MPSNNImageNode *)v47;

  }
  return v15;
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

- (id)backwardPass:(id)a3
{
  void *v4;
  MPSCNNInstanceNormalizationNode *instNorm;
  void *v6;
  void *v7;
  MPSCNNConvolutionNode *conv;
  void *v9;
  void *v10;
  MPSCNNUpsamplingNearestNode *upsample;
  void *v12;
  void *v13;
  void *v14;

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

  upsample = self->_upsample;
  objc_msgSend(v10, "resultImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSCNNUpsamplingNearestNode gradientFilterWithSource:](upsample, "gradientFilterWithSource:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "resultImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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

- (MPSCNNUpsamplingNearestNode)upsample
{
  return self->_upsample;
}

- (void)setUpsample:(id)a3
{
  objc_storeStrong((id *)&self->_upsample, a3);
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
  objc_storeStrong((id *)&self->_upsample, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end
