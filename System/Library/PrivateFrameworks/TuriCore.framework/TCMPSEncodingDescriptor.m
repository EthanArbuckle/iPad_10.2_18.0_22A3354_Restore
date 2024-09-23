@implementation TCMPSEncodingDescriptor

- (TCMPSEncodingDescriptor)init
{
  TCMPSEncodingDescriptor *v2;
  TCMPSConvolutionDescriptor *v3;
  TCMPSConvolutionDescriptor *conv;
  TCMPSInstanceNormalizationDescriptor *v5;
  TCMPSInstanceNormalizationDescriptor *inst;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TCMPSEncodingDescriptor;
  v2 = -[TCMPSEncodingDescriptor init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv = v2->_conv;
    v2->_conv = v3;

    v5 = objc_alloc_init(TCMPSInstanceNormalizationDescriptor);
    inst = v2->_inst;
    v2->_inst = v5;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inst, 0);
  objc_storeStrong((id *)&self->_conv, 0);
}

@end
