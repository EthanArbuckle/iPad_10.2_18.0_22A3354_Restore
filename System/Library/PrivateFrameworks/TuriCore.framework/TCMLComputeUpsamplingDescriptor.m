@implementation TCMLComputeUpsamplingDescriptor

+ (id)upsamplingDescriptorWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", a3, a4, 1, 1);
}

@end
