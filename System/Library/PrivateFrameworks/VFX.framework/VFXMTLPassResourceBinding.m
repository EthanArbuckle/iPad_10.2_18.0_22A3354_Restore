@implementation VFXMTLPassResourceBinding

- (VFXMTLPassResourceBinding)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLPassResourceBinding;
  return -[VFXMTLResourceBinding init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_inputs);
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLPassResourceBinding;
  -[VFXMTLResourceBinding dealloc](&v3, sel_dealloc);
}

- (int64_t)inputsCount
{
  return self->inputsCount;
}

- (void)setInputsCount:(int64_t)a3
{
  self->inputsCount = a3;
}

- (int64_t)bufferSize
{
  return self->bufferSize;
}

- (void)setBufferSize:(int64_t)a3
{
  self->bufferSize = a3;
}

@end
