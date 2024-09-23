@implementation SXParallaxFadeSceneAnimationHandler

- (void)prepareAnimation
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double Height;
  void *v26;
  void *v27;
  double v28;
  _OWORD v29[3];
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v30.receiver = self;
  v30.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  -[SXComponentAnimationHandler prepareAnimation](&v30, sel_prepareAnimation);
  -[SXComponentAnimationHandler component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v29[0] = *MEMORY[0x24BDBD8B8];
  v29[1] = v4;
  v29[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v29);

  -[SXParallaxFadeSceneAnimationHandler overlayView](self, "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SXComponentAnimationHandler animation](self, "animation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fadeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SXComponentAnimationHandler animation](self, "animation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fadeColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[SXComponentAnimationHandler component](self, "component");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentViewsForRole:recursive:", 12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnimationsAndBehaviorsEnabled:", 0);
    -[SXParallaxFadeSceneAnimationHandler setHeaderComponentView:](self, "setHeaderComponentView:", v12);
    -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fillView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fill");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXParallaxFadeSceneAnimationHandler setAttachmentType:](self, "setAttachmentType:", objc_msgSend(v15, "attachment"));

    v16 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend(v12, "bounds");
    v17 = (void *)objc_msgSend(v16, "initWithFrame:");
    -[SXParallaxFadeSceneAnimationHandler setOverlayView:](self, "setOverlayView:", v17);

    -[SXParallaxFadeSceneAnimationHandler overlayView](self, "overlayView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 18);

    -[SXParallaxFadeSceneAnimationHandler overlayView](self, "overlayView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v9);

    -[SXParallaxFadeSceneAnimationHandler overlayView](self, "overlayView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", 0.0);

    objc_msgSend(v12, "fillView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[SXParallaxFadeSceneAnimationHandler overlayView](self, "overlayView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fillView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSubview:aboveSubview:", v22, v23);

    }
    else
    {
      if (!v12)
      {
LABEL_10:

        goto LABEL_11;
      }
      -[SXParallaxFadeSceneAnimationHandler overlayView](self, "overlayView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSubview:atIndex:", v22, 0);
    }

    goto LABEL_10;
  }
LABEL_11:
  -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  Height = CGRectGetHeight(v31);

  -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "viewport");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v28 = CGRectGetHeight(v32);

  if (Height >= v28)
    Height = v28;
  -[SXParallaxFadeSceneAnimationHandler setScrollDistance:](self, "setScrollDistance:", Height);
  -[SXParallaxFadeSceneAnimationHandler setAlphaDistance:](self, "setAlphaDistance:", Height);
}

- (void)startAnimation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  -[SXComponentAnimationHandler startAnimation](&v2, sel_startAnimation);
}

- (void)updateAnimationWithFactor:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double MaxY;
  double v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  objc_super v44;
  CGRect v45;

  v44.receiver = self;
  v44.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v44, sel_updateAnimationWithFactor_);
  -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v41 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v43.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v43.c = v40;
  v39 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v43.tx = v39;
  objc_msgSend(v5, "setTransform:", &v43);

  -[SXComponentAnimationHandler component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRect:fromView:", v18, v10, v12, v14, v16);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[SXParallaxFadeSceneAnimationHandler scrollDistance](self, "scrollDistance");
  *(float *)&v27 = v27 * a3;
  v28 = roundf(*(float *)&v27);
  -[SXParallaxFadeSceneAnimationHandler alphaDistance](self, "alphaDistance");
  v30 = v29;
  -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "viewport");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "documentSize");
  v34 = v33;

  v45.origin.x = v20;
  v45.origin.y = v22;
  v45.size.width = v24;
  v45.size.height = v26;
  MaxY = CGRectGetMaxY(v45);
  if (!-[SXParallaxFadeSceneAnimationHandler attachmentType](self, "attachmentType"))
  {
    memset(&v43.c, 0, 32);
    if (v34 - MaxY <= v28)
      v36 = v34 - MaxY;
    else
      v36 = v28;
    *(_OWORD *)&v43.a = 0uLL;
    CGAffineTransformMakeTranslation(&v43, 0.0, v36);
    if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
    {
      *(_OWORD *)&v43.a = v41;
      *(_OWORD *)&v43.c = v40;
      *(_OWORD *)&v43.tx = v39;
    }
    -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v43;
    objc_msgSend(v37, "setTransform:", &v42);

  }
  -[SXParallaxFadeSceneAnimationHandler overlayView](self, "overlayView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAlpha:", v28 / v30);

}

- (void)finishAnimation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  -[SXComponentAnimationHandler finishAnimation](&v2, sel_finishAnimation);
}

- (double)factorForVisibileBounds:(CGRect)a3 andAbsoluteComponentRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double MaxY;
  double v34;
  double v35;
  double v36;
  double v37;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0.0;
  if (v9)
  {
    -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView", 0.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v40 = CGRectGetHeight(v43);

    v44.origin.x = x;
    v44.origin.y = y;
    v41 = width;
    v42 = height;
    v44.size.width = width;
    v44.size.height = height;
    v39 = CGRectGetHeight(v44);
    -[SXComponentAnimationHandler component](self, "component");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frameUsingCenterAndBounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRectToViewportCoordinateSpace:fromView:", v24, v16, v18, v20, v22);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v45.origin.x = v26;
    v45.origin.y = v28;
    v45.size.width = v30;
    v45.size.height = v32;
    MaxY = CGRectGetMaxY(v45);
    v46.origin.x = v26;
    v46.origin.y = v28;
    v46.size.width = v30;
    v46.size.height = v32;
    v34 = CGRectGetHeight(v46);
    if (MaxY < v34)
      v34 = MaxY;
    if (v34 >= 0.0)
      v35 = v34;
    else
      v35 = 0.0;
    if (v40 >= v39)
    {
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = v41;
      v49.size.height = v42;
      v37 = CGRectGetHeight(v49);
    }
    else
    {
      v47.origin.x = v26;
      v47.origin.y = v28;
      v47.size.width = v30;
      v47.size.height = v32;
      v36 = CGRectGetHeight(v47);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = v41;
      v48.size.height = v42;
      v37 = CGRectGetHeight(v48);
      if (v36 < v37)
        v37 = v36;
    }
    v10 = 1.0 - v35 / v37;
  }
  if (v10 < 0.0)
    v10 = 0.0;
  return fmin(v10, 1.0);
}

- (id)componentViewToAnimate
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXParallaxFadeSceneAnimationHandler;
  -[SXComponentAnimationHandler componentViewToAnimate](&v7, sel_componentViewToAnimate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXParallaxFadeSceneAnimationHandler headerComponentView](self, "headerComponentView");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (BOOL)shouldFinishAtEndOfScrollView
{
  return 0;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (SXComponentView)headerComponentView
{
  return self->_headerComponentView;
}

- (void)setHeaderComponentView:(id)a3
{
  objc_storeStrong((id *)&self->_headerComponentView, a3);
}

- (double)scrollDistance
{
  return self->_scrollDistance;
}

- (void)setScrollDistance:(double)a3
{
  self->_scrollDistance = a3;
}

- (double)alphaDistance
{
  return self->_alphaDistance;
}

- (void)setAlphaDistance:(double)a3
{
  self->_alphaDistance = a3;
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
  objc_storeStrong((id *)&self->_headerComponentView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end
