@implementation PIAutoLoopAnalysisRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PIAutoLoopAnalysisRequest;
  result = -[NURenderRequest copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 19) = self->_flavor;
  return result;
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([PIAutoLoopAnalysisJob alloc], "initWithRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (int64_t)flavor
{
  return self->_flavor;
}

- (void)setFlavor:(int64_t)a3
{
  self->_flavor = a3;
}

@end
