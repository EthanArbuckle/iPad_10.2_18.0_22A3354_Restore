@implementation TCMPSResidualDescriptor

- (TCMPSResidualDescriptor)init
{
  TCMPSResidualDescriptor *v2;
  TCMPSConvolutionDescriptor *v3;
  TCMPSConvolutionDescriptor *conv1;
  TCMPSInstanceNormalizationDescriptor *v5;
  TCMPSInstanceNormalizationDescriptor *inst1;
  TCMPSConvolutionDescriptor *v7;
  TCMPSConvolutionDescriptor *conv2;
  TCMPSInstanceNormalizationDescriptor *v9;
  TCMPSInstanceNormalizationDescriptor *inst2;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TCMPSResidualDescriptor;
  v2 = -[TCMPSResidualDescriptor init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv1 = v2->_conv1;
    v2->_conv1 = v3;

    v5 = objc_alloc_init(TCMPSInstanceNormalizationDescriptor);
    inst1 = v2->_inst1;
    v2->_inst1 = v5;

    v7 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv2 = v2->_conv2;
    v2->_conv2 = v7;

    v9 = objc_alloc_init(TCMPSInstanceNormalizationDescriptor);
    inst2 = v2->_inst2;
    v2->_inst2 = v9;

  }
  return v2;
}

- (TCMPSConvolutionDescriptor)conv1
{
  return self->_conv1;
}

- (void)setConv1:(id)a3
{
  objc_storeStrong((id *)&self->_conv1, a3);
}

- (TCMPSConvolutionDescriptor)conv2
{
  return self->_conv2;
}

- (void)setConv2:(id)a3
{
  objc_storeStrong((id *)&self->_conv2, a3);
}

- (TCMPSInstanceNormalizationDescriptor)inst1
{
  return self->_inst1;
}

- (void)setInst1:(id)a3
{
  objc_storeStrong((id *)&self->_inst1, a3);
}

- (TCMPSInstanceNormalizationDescriptor)inst2
{
  return self->_inst2;
}

- (void)setInst2:(id)a3
{
  objc_storeStrong((id *)&self->_inst2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inst2, 0);
  objc_storeStrong((id *)&self->_inst1, 0);
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
}

@end
