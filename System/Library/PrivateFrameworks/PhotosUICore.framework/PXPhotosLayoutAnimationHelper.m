@implementation PXPhotosLayoutAnimationHelper

- (PXPhotosLayoutAnimationHelper)initWithContext:(id)a3
{
  id v4;
  PXPhotosLayoutAnimationHelper *v5;
  uint64_t v6;
  PXPhotosLayoutAnimationContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosLayoutAnimationHelper;
  v5 = -[PXPhotosLayoutAnimationHelper init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (PXPhotosLayoutAnimationContext *)v6;

  }
  return v5;
}

- (PXPhotosLayoutAnimationHelper)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayoutAnimationHelper.m"), 25, CFSTR("%s is not available as initializer"), "-[PXPhotosLayoutAnimationHelper init]");

  abort();
}

- (int64_t)animationCurve
{
  return 2;
}

- (double)animationDuration
{
  void *v2;
  double v3;
  double v4;

  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultAnimationDuration");
  v4 = v3;

  return v4;
}

- (BOOL)wantsPresentationAdjustment
{
  return 0;
}

- (BOOL)wantsAnimationWithSpriteTransfer
{
  return 0;
}

- (unsigned)highFrameRateReason
{
  return 0;
}

- (BOOL)wantsDoubleSidedAnimations
{
  return 0;
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;

  length = a7.length;
  if (a7.length)
  {
    do
    {
      a5->var0 = 0.0;
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      --length;
    }
    while (length);
  }
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;

  length = a7.length;
  if (a7.length)
  {
    do
    {
      a5->var0 = 0.0;
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      --length;
    }
    while (length);
  }
}

- (PXPhotosLayoutAnimationContext)context
{
  return self->_context;
}

- (BOOL)wantsFromSnapshot
{
  return self->_wantsFromSnapshot;
}

- (BOOL)wantsToSnapshot
{
  return self->_wantsToSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
