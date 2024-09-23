@implementation PISliderNetLiftRequest

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([PISliderNetLiftJob alloc], "initWithRequest:", self);
}

@end
