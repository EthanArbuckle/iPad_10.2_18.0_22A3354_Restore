@implementation TCMPSVgg16Block1Descriptor

- (TCMPSVgg16Block1Descriptor)init
{
  TCMPSVgg16Block1Descriptor *v2;
  TCMPSConvolutionDescriptor *v3;
  TCMPSConvolutionDescriptor *conv1;
  TCMPSConvolutionDescriptor *v5;
  TCMPSConvolutionDescriptor *conv2;
  TCMPSPoolingDescriptor *v7;
  TCMPSPoolingDescriptor *pooling;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TCMPSVgg16Block1Descriptor;
  v2 = -[TCMPSVgg16Block1Descriptor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv1 = v2->_conv1;
    v2->_conv1 = v3;

    v5 = objc_alloc_init(TCMPSConvolutionDescriptor);
    conv2 = v2->_conv2;
    v2->_conv2 = v5;

    v7 = objc_alloc_init(TCMPSPoolingDescriptor);
    pooling = v2->_pooling;
    v2->_pooling = v7;

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

- (TCMPSPoolingDescriptor)pooling
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
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
}

@end
