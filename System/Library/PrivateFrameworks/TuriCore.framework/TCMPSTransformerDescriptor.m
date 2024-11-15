@implementation TCMPSTransformerDescriptor

- (TCMPSTransformerDescriptor)init
{
  TCMPSTransformerDescriptor *v2;
  TCMPSEncodingDescriptor *v3;
  TCMPSEncodingDescriptor *encode1;
  TCMPSEncodingDescriptor *v5;
  TCMPSEncodingDescriptor *encode2;
  TCMPSEncodingDescriptor *v7;
  TCMPSEncodingDescriptor *encode3;
  TCMPSResidualDescriptor *v9;
  TCMPSResidualDescriptor *residual1;
  TCMPSResidualDescriptor *v11;
  TCMPSResidualDescriptor *residual2;
  TCMPSResidualDescriptor *v13;
  TCMPSResidualDescriptor *residual3;
  TCMPSResidualDescriptor *v15;
  TCMPSResidualDescriptor *residual4;
  TCMPSResidualDescriptor *v17;
  TCMPSResidualDescriptor *residual5;
  TCMPSDecodingDescriptor *v19;
  TCMPSDecodingDescriptor *decode1;
  TCMPSDecodingDescriptor *v21;
  TCMPSDecodingDescriptor *decode2;
  TCMPSConvolutionDescriptor *v23;
  TCMPSConvolutionDescriptor *conv;
  TCMPSInstanceNormalizationDescriptor *v25;
  TCMPSInstanceNormalizationDescriptor *inst;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)TCMPSTransformerDescriptor;
  v2 = -[TCMPSTransformerDescriptor init](&v28, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TCMPSEncodingDescriptor);
    encode1 = v2->_encode1;
    v2->_encode1 = v3;

    v5 = objc_alloc_init(TCMPSEncodingDescriptor);
    encode2 = v2->_encode2;
    v2->_encode2 = v5;

    v7 = objc_alloc_init(TCMPSEncodingDescriptor);
    encode3 = v2->_encode3;
    v2->_encode3 = v7;

    v9 = objc_alloc_init(TCMPSResidualDescriptor);
    residual1 = v2->_residual1;
    v2->_residual1 = v9;

    v11 = objc_alloc_init(TCMPSResidualDescriptor);
    residual2 = v2->_residual2;
    v2->_residual2 = v11;

    v13 = objc_alloc_init(TCMPSResidualDescriptor);
    residual3 = v2->_residual3;
    v2->_residual3 = v13;

    v15 = objc_alloc_init(TCMPSResidualDescriptor);
    residual4 = v2->_residual4;
    v2->_residual4 = v15;

    v17 = objc_alloc_init(TCMPSResidualDescriptor);
    residual5 = v2->_residual5;
    v2->_residual5 = v17;

    v19 = objc_alloc_init(TCMPSDecodingDescriptor);
    decode1 = v2->_decode1;
    v2->_decode1 = v19;

    v21 = objc_alloc_init(TCMPSDecodingDescriptor);
    decode2 = v2->_decode2;
    v2->_decode2 = v21;

    v23 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv = v2->_conv;
    v2->_conv = v23;

    v25 = objc_alloc_init(TCMPSInstanceNormalizationDescriptor);
    inst = v2->_inst;
    v2->_inst = v25;

  }
  return v2;
}

- (TCMPSEncodingDescriptor)encode1
{
  return self->_encode1;
}

- (void)setEncode1:(id)a3
{
  objc_storeStrong((id *)&self->_encode1, a3);
}

- (TCMPSEncodingDescriptor)encode2
{
  return self->_encode2;
}

- (void)setEncode2:(id)a3
{
  objc_storeStrong((id *)&self->_encode2, a3);
}

- (TCMPSEncodingDescriptor)encode3
{
  return self->_encode3;
}

- (void)setEncode3:(id)a3
{
  objc_storeStrong((id *)&self->_encode3, a3);
}

- (TCMPSResidualDescriptor)residual1
{
  return self->_residual1;
}

- (void)setResidual1:(id)a3
{
  objc_storeStrong((id *)&self->_residual1, a3);
}

- (TCMPSResidualDescriptor)residual2
{
  return self->_residual2;
}

- (void)setResidual2:(id)a3
{
  objc_storeStrong((id *)&self->_residual2, a3);
}

- (TCMPSResidualDescriptor)residual3
{
  return self->_residual3;
}

- (void)setResidual3:(id)a3
{
  objc_storeStrong((id *)&self->_residual3, a3);
}

- (TCMPSResidualDescriptor)residual4
{
  return self->_residual4;
}

- (void)setResidual4:(id)a3
{
  objc_storeStrong((id *)&self->_residual4, a3);
}

- (TCMPSResidualDescriptor)residual5
{
  return self->_residual5;
}

- (void)setResidual5:(id)a3
{
  objc_storeStrong((id *)&self->_residual5, a3);
}

- (TCMPSDecodingDescriptor)decode1
{
  return self->_decode1;
}

- (void)setDecode1:(id)a3
{
  objc_storeStrong((id *)&self->_decode1, a3);
}

- (TCMPSDecodingDescriptor)decode2
{
  return self->_decode2;
}

- (void)setDecode2:(id)a3
{
  objc_storeStrong((id *)&self->_decode2, a3);
}

- (TCMPSConvolutionDescriptor)conv
{
  return self->_conv;
}

- (void)setConv:(id)a3
{
  objc_storeStrong((id *)&self->_conv, a3);
}

- (TCMPSInstanceNormalizationDescriptor)inst
{
  return self->_inst;
}

- (void)setInst:(id)a3
{
  objc_storeStrong((id *)&self->_inst, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inst, 0);
  objc_storeStrong((id *)&self->_conv, 0);
  objc_storeStrong((id *)&self->_decode2, 0);
  objc_storeStrong((id *)&self->_decode1, 0);
  objc_storeStrong((id *)&self->_residual5, 0);
  objc_storeStrong((id *)&self->_residual4, 0);
  objc_storeStrong((id *)&self->_residual3, 0);
  objc_storeStrong((id *)&self->_residual2, 0);
  objc_storeStrong((id *)&self->_residual1, 0);
  objc_storeStrong((id *)&self->_encode3, 0);
  objc_storeStrong((id *)&self->_encode2, 0);
  objc_storeStrong((id *)&self->_encode1, 0);
}

@end
