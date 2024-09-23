@implementation SXParallaxScaleSceneAnimationHandler

- (void)prepareAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXParallaxScaleSceneAnimationHandler;
  -[SXComponentAnimationHandler prepareAnimation](&v8, sel_prepareAnimation);
  -[SXComponentAnimationHandler component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentViewsForRole:recursive:", 12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationsAndBehaviorsEnabled:", 0);
  -[SXParallaxScaleSceneAnimationHandler setHeaderComponent:](self, "setHeaderComponent:", v5);
  objc_msgSend(v5, "fillView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fill");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXParallaxScaleSceneAnimationHandler setAttachmentType:](self, "setAttachmentType:", objc_msgSend(v7, "attachment"));

  -[SXParallaxScaleSceneAnimationHandler ensureScalabilityOfHeaderComponentFill](self, "ensureScalabilityOfHeaderComponentFill");
}

- (void)ensureScalabilityOfHeaderComponentFill
{
  void *v3;
  id v4;

  -[SXParallaxScaleSceneAnimationHandler headerComponent](self, "headerComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fillView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsReduceMotionEnabled())
  {
    -[SXParallaxScaleSceneAnimationHandler fillContentFrameForScale:andTranslation:](self, "fillContentFrameForScale:andTranslation:", 1.25, 0.0);
    objc_msgSend(v4, "setContentFrame:");
  }

}

- (void)updateAnimationWithFactor:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)SXParallaxScaleSceneAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v9, sel_updateAnimationWithFactor_);
  -[SXParallaxScaleSceneAnimationHandler headerComponent](self, "headerComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fillView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    objc_msgSend(v6, "originalFrame");
  }
  else
  {
    v7 = 0.0;
    if (!-[SXParallaxScaleSceneAnimationHandler attachmentType](self, "attachmentType"))
    {
      -[SXParallaxScaleSceneAnimationHandler headerComponent](self, "headerComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v7 = CGRectGetHeight(v10) * 0.45 * a3;

    }
    -[SXParallaxScaleSceneAnimationHandler fillContentFrameForScale:andTranslation:](self, "fillContentFrameForScale:andTranslation:", (1.0 - a3) * 0.25 + 1.0, v7);
  }
  objc_msgSend(v6, "setContentFrame:");

}

- (CGRect)fillContentFrameForScale:(double)a3 andTranslation:(double)a4
{
  void *v6;
  void *v7;
  double x;
  double y;
  CGFloat height;
  CGFloat width;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  -[SXParallaxScaleSceneAnimationHandler headerComponent](self, "headerComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fillView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "originalFrame");
  x = v22.origin.x;
  y = v22.origin.y;
  v22.size.width = v12 * a3;
  width = v22.size.width;
  v22.size.height = v13 * a3;
  height = v22.size.height;
  v14 = CGRectGetWidth(v22);
  objc_msgSend(v7, "originalFrame");
  v15 = x - (v14 - CGRectGetWidth(v23)) * 0.5;
  v24.origin.x = v15;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v16 = CGRectGetHeight(v24);
  objc_msgSend(v7, "originalFrame");
  v17 = y - (v16 - CGRectGetHeight(v25)) * 0.5 + a4 * a3;

  v18 = v15;
  v19 = v17;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)factorForVisibileBounds:(CGRect)a3 andAbsoluteComponentRect:(CGRect)a4
{
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MaxY;
  double Height;
  double v17;
  double v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[SXComponentAnimationHandler component](self, "component", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXParallaxScaleSceneAnimationHandler headerComponent](self, "headerComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v5, "convertRect:toView:", 0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  MaxY = CGRectGetMaxY(v20);
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  Height = CGRectGetHeight(v21);
  if (MaxY < Height)
    Height = MaxY;
  if (Height >= 0.0)
    v17 = Height;
  else
    v17 = 0.0;
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  v18 = 1.0 - v17 / CGRectGetHeight(v22);
  if (v18 < 0.0)
    v18 = 0.0;
  return fmin(v18, 1.0);
}

- (BOOL)shouldFinishAtEndOfScrollView
{
  return 0;
}

- (SXContainerComponentView)headerComponent
{
  return (SXContainerComponentView *)objc_loadWeakRetained((id *)&self->_headerComponent);
}

- (void)setHeaderComponent:(id)a3
{
  objc_storeWeak((id *)&self->_headerComponent, a3);
}

- (unint64_t)attachmentType
{
  return self->_attachmentType;
}

- (void)setAttachmentType:(unint64_t)a3
{
  self->_attachmentType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerComponent);
}

@end
