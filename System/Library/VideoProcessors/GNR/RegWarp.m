@implementation RegWarp

- (void)dealloc
{
  objc_super v3;

  ImageRegistrationDestroyContext((uint64_t)self->_imageRegCtx);
  v3.receiver = self;
  v3.super_class = (Class)RegWarp;
  -[RegWarp dealloc](&v3, sel_dealloc);
}

- (RegWarp)init
{
  RegWarp *v2;
  uint64_t Context;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RegWarp;
  v2 = -[RegWarp init](&v5, sel_init);
  if (!v2)
    return v2;
  Context = ImageRegistrationCreateContext(0, 3);
  v2->_imageRegCtx = (ImageRegistrationCtx_s *)Context;
  if (Context)
    return v2;
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (int)runWithRefImage:(__CVBuffer *)a3 nonRefImages:(__CVBuffer *)a4 numNonReferenceImages:(unsigned __int8)a5 outputTransforms:(Mat3x3f *)a6 regionOfInterest:(CGRect)a7
{
  unsigned int v8;
  int result;

  v8 = a5;
  if (ImageRegistrationSetROI((double *)self->_imageRegCtx, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height)|| (result = ImageRegister((uint64_t)self->_imageRegCtx, a3, a4, v8, 0, (uint64_t)a6, 0, 0)) != 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (int)runIterativeWithRefImage:(__CVBuffer *)a3 regionOfInterest:(CGRect)a4
{
  int result;

  if (ImageRegistrationSetROI((double *)self->_imageRegCtx, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height)|| (result = ImageRegisterIterative_Reference((uint64_t)self->_imageRegCtx, a3)) != 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (int)runIterativeWithNonRefImage:(__CVBuffer *)a3 outputTransform:(Mat3x3f *)a4
{
  int result;

  result = ImageRegisterIterative_NonReference((uint64_t)self->_imageRegCtx, a3, (uint64_t)a4);
  if (result)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

@end
