@implementation TCMPSConvolutionDescriptor

- (TCMPSConvolutionDescriptor)init
{
  TCMPSConvolutionDescriptor *v2;
  NSString *v3;
  NSString *label;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TCMPSConvolutionDescriptor;
  v2 = -[TCMPSConvolutionDescriptor init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSString *)objc_alloc_init(MEMORY[0x24BDD17C8]);
    label = v2->_label;
    v2->_label = v3;

  }
  return v2;
}

- (unint64_t)kernelWidth
{
  return self->_kernelWidth;
}

- (void)setKernelWidth:(unint64_t)a3
{
  self->_kernelWidth = a3;
}

- (unint64_t)kernelHeight
{
  return self->_kernelHeight;
}

- (void)setKernelHeight:(unint64_t)a3
{
  self->_kernelHeight = a3;
}

- (unint64_t)inputFeatureChannels
{
  return self->_inputFeatureChannels;
}

- (void)setInputFeatureChannels:(unint64_t)a3
{
  self->_inputFeatureChannels = a3;
}

- (unint64_t)outputFeatureChannels
{
  return self->_outputFeatureChannels;
}

- (void)setOutputFeatureChannels:(unint64_t)a3
{
  self->_outputFeatureChannels = a3;
}

- (unint64_t)strideWidth
{
  return self->_strideWidth;
}

- (void)setStrideWidth:(unint64_t)a3
{
  self->_strideWidth = a3;
}

- (unint64_t)strideHeight
{
  return self->_strideHeight;
}

- (void)setStrideHeight:(unint64_t)a3
{
  self->_strideHeight = a3;
}

- (unint64_t)paddingWidth
{
  return self->_paddingWidth;
}

- (void)setPaddingWidth:(unint64_t)a3
{
  self->_paddingWidth = a3;
}

- (unint64_t)paddingHeight
{
  return self->_paddingHeight;
}

- (void)setPaddingHeight:(unint64_t)a3
{
  self->_paddingHeight = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)updateWeights
{
  return self->_updateWeights;
}

- (void)setUpdateWeights:(BOOL)a3
{
  self->_updateWeights = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
