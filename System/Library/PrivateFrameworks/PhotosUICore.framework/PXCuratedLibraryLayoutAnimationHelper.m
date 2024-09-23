@implementation PXCuratedLibraryLayoutAnimationHelper

+ (id)createAnimationIfNeededForLayout:(id)a3 context:(int64_t)a4 userData:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v18;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "pendingAnimations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (PXCuratedLibraryAnimationGetContext(v12) >= a4)
  {
    v13 = 0;
  }
  else
  {
    switch(a4)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCuratedLibraryLayoutAnimationHelper.m"), 80, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        v14 = (objc_class *)objc_opt_class();
        break;
      default:
        v14 = 0;
        break;
    }
    v15 = (void *)objc_msgSend([v14 alloc], "initWithLayout:", v9);
    objc_msgSend(v15, "setUserData:", v10);
    if (v12)
    {
      v16 = v12;
    }
    else
    {
      objc_msgSend(v9, "createAnimation");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v16;
    objc_msgSend(v16, "setCurve:", objc_msgSend(v15, "animationCurve"));
    objc_msgSend(v15, "animationDuration");
    objc_msgSend(v13, "setDuration:");
    objc_msgSend(v13, "setDoubleSided:", objc_msgSend(v15, "wantsDoubleSidedAnimations"));
    objc_msgSend(v13, "setSupportsPresentationAdjustment:", objc_msgSend(v15, "wantsPresentationAdjustment"));
    objc_msgSend(v13, "setSupportsSpriteTransfer:", objc_msgSend(v15, "wantsAnimationWithSpriteTransfer"));
    objc_msgSend(v13, "setHighFrameRateReason:", objc_msgSend(v15, "highFrameRateReason"));
    objc_msgSend(v13, "setDelegate:", v15);
    objc_msgSend(v13, "setUserData:", v10);
    _PXCuratedLibraryAnimationSetContext(v13, a4);

  }
  return v13;
}

- (BOOL)wantsPresentationAdjustment
{
  return self->_wantsPresentationAdjustment;
}

- (BOOL)wantsDoubleSidedAnimations
{
  return 0;
}

- (BOOL)wantsAnimationWithSpriteTransfer
{
  return self->_wantsAnimationWithSpriteTransfer;
}

- (void)setUserData:(id)a3
{
  objc_storeStrong((id *)&self->_userData, a3);
}

- (PXCuratedLibraryLayoutAnimationHelper)initWithLayout:(id)a3
{
  id v4;
  PXCuratedLibraryLayoutAnimationHelper *v5;
  PXCuratedLibraryLayoutAnimationHelper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryLayoutAnimationHelper;
  v5 = -[PXCuratedLibraryLayoutAnimationHelper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_layout, v4);

  return v6;
}

- (unsigned)highFrameRateReason
{
  return 0;
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

- (int64_t)animationCurve
{
  return 2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (PXCuratedLibraryLayoutAnimationHelper)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayoutAnimationHelper.m"), 128, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryLayoutAnimationHelper init]");

  abort();
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

- (NSDictionary)userData
{
  return self->_userData;
}

- (PXCuratedLibraryLayout)layout
{
  return (PXCuratedLibraryLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

+ (id)createTransitionIfNeededForLayout:(id)a3 context:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "createAnimationIfNeededForLayout:context:userData:", v5, a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createTransitionWithAnimations:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
