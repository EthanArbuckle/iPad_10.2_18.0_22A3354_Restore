@implementation PXPhotosLayoutDefaultAnimationProvider

- (id)createAnimationForLayout:(id)a3 presentedLayoutState:(id)a4 targetLayoutState:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PXPhotosLayoutAnimationContext *v20;
  PXPhotosLayoutAnimationContext *v21;
  id v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "pendingAnimations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v7, "superlayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v7, "superlayout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createDefaultAnimationForCurrentContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "createAnimation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v8, "bodyProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bodyProvider");

  v15 = (objc_class *)objc_opt_class();
  objc_msgSend(v11, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v17, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = objc_alloc_init(PXPhotosLayoutAnimationContext);
  v21 = v20;

  -[PXPhotosLayoutAnimationContext setFromState:](v21, "setFromState:", v8);
  -[PXPhotosLayoutAnimationContext setToState:](v21, "setToState:", v9);
  if (v15 == (objc_class *)objc_opt_class())
    v22 = v17;
  else
    v22 = (id)objc_msgSend([v15 alloc], "initWithContext:", v21);
  v23 = v22;
  objc_msgSend(v11, "setCurve:", objc_msgSend(v22, "animationCurve"));
  objc_msgSend(v23, "animationDuration");
  objc_msgSend(v11, "setDuration:");
  objc_msgSend(v11, "setDoubleSided:", objc_msgSend(v23, "wantsDoubleSidedAnimations"));
  objc_msgSend(v11, "setSupportsPresentationAdjustment:", objc_msgSend(v23, "wantsPresentationAdjustment"));
  objc_msgSend(v11, "setSupportsSpriteTransfer:", objc_msgSend(v23, "wantsAnimationWithSpriteTransfer"));
  objc_msgSend(v11, "setHighFrameRateReason:", objc_msgSend(v23, "highFrameRateReason"));
  objc_msgSend(v11, "setDelegate:", v23);

  return v11;
}

@end
