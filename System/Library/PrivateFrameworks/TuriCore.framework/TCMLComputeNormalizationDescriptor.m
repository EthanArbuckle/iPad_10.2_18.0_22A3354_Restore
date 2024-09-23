@implementation TCMLComputeNormalizationDescriptor

+ (id)normalizationDescriptorWithInputFeatureChannels:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", 1, 1, a3, 1);
}

@end
