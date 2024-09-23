@implementation TCMPSPoolingDescriptor

- (unint64_t)kernelSize
{
  return self->_kernelSize;
}

- (void)setKernelSize:(unint64_t)a3
{
  self->_kernelSize = a3;
}

- (unint64_t)strideSize
{
  return self->_strideSize;
}

- (void)setStrideSize:(unint64_t)a3
{
  self->_strideSize = a3;
}

@end
