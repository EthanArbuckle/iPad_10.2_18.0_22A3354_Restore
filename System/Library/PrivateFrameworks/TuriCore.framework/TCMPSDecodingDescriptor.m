@implementation TCMPSDecodingDescriptor

- (TCMPSDecodingDescriptor)init
{
  TCMPSDecodingDescriptor *v2;
  TCMPSConvolutionDescriptor *v3;
  TCMPSConvolutionDescriptor *conv;
  TCMPSInstanceNormalizationDescriptor *v5;
  TCMPSInstanceNormalizationDescriptor *inst;
  TCMPSUpsamplingDescriptor *v7;
  TCMPSUpsamplingDescriptor *upsample;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TCMPSDecodingDescriptor;
  v2 = -[TCMPSDecodingDescriptor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv = v2->_conv;
    v2->_conv = v3;

    v5 = objc_alloc_init(TCMPSInstanceNormalizationDescriptor);
    inst = v2->_inst;
    v2->_inst = v5;

    v7 = objc_alloc_init(TCMPSUpsamplingDescriptor);
    upsample = v2->_upsample;
    v2->_upsample = v7;

  }
  return v2;
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

- (TCMPSUpsamplingDescriptor)upsample
{
  return self->_upsample;
}

- (void)setUpsample:(id)a3
{
  objc_storeStrong((id *)&self->_upsample, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upsample, 0);
  objc_storeStrong((id *)&self->_inst, 0);
  objc_storeStrong((id *)&self->_conv, 0);
}

@end
