@implementation UIStatusBarServiceItemView

- (double)standardPadding
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarServiceItemView;
  -[UIStatusBarItemView standardPadding](&v4, sel_standardPadding);
  return v2 + -1.0;
}

- (double)resetContentOverlap
{
  double result;

  if (!-[UIStatusBarServiceItemView updateForContentType:serviceString:serviceCrossfadeString:maxWidth:actions:](self, "updateForContentType:serviceString:serviceCrossfadeString:maxWidth:actions:", self->_contentType, self->_serviceString, self->_crossfadeString, 0, 1.79769313e308))return 0.0;
  -[UIStatusBarServiceItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  return result;
}

- (double)addContentOverlap:(double)a3
{
  double v5;
  double v6;
  double result;

  -[UIView frame](self, "frame");
  v6 = v5 - a3;
  if (v5 - a3 < 20.0)
    v6 = 20.0;
  if (!-[UIStatusBarServiceItemView updateForContentType:serviceString:serviceCrossfadeString:maxWidth:actions:](self, "updateForContentType:serviceString:serviceCrossfadeString:maxWidth:actions:", self->_contentType, self->_serviceString, self->_crossfadeString, 0, v6))return 0.0;
  -[UIStatusBarServiceItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  return result;
}

- (BOOL)updateForContentType:(int)a3 serviceString:(id)a4 serviceCrossfadeString:(id)a5 maxWidth:(double)a6 actions:(int)a7
{
  char v7;
  id v12;
  id v13;
  int contentType;
  BOOL v15;
  BOOL v16;
  BOOL v18;
  NSString *v19;
  NSString *serviceString;
  int v21;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double letterSpacing;
  double v29;
  NSString *v30;
  NSString *crossfadeString;

  v7 = a7;
  v12 = a4;
  v13 = a5;
  contentType = self->_contentType;
  v15 = contentType != a3;
  if (contentType != a3)
    self->_contentType = a3;
  if (!objc_msgSend(v12, "isEqualToString:", self->_serviceString))
  {
    v19 = (NSString *)objc_msgSend(v12, "copy");
    serviceString = self->_serviceString;
    self->_serviceString = v19;

    goto LABEL_12;
  }
  if (self->_maxWidth != a6)
  {
LABEL_12:
    -[UIStatusBarItemView clearCachedTextImage](self, "clearCachedTextImage");
    self->_maxWidth = a6;
    self->_loopingNecessaryForString = 0;
    self->_letterSpacing = 0.0;
    v21 = self->_contentType;
    if (v21 != 1 && v21 != 6)
    {
      -[UIStatusBarServiceItemView _contentsImageFromString:withWidth:letterSpacing:](self, "_contentsImageFromString:withWidth:letterSpacing:", self->_serviceString, 1.79769313e308, 0.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "image");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24 || (objc_msgSend(v24, "size"), v25 > self->_maxWidth))
      {
        -[UIStatusBarItemView textFont](self, "textFont");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString _legacy_sizeWithFont:](self->_serviceString, "_legacy_sizeWithFont:", v26);
        if (v27 <= self->_maxWidth)
        {
LABEL_21:
          letterSpacing = self->_letterSpacing;
        }
        else
        {
          while (1)
          {
            letterSpacing = self->_letterSpacing;
            if (letterSpacing < -1.0)
              break;
            self->_letterSpacing = letterSpacing + -0.25;
            -[NSString sizeWithFont:forWidth:lineBreakMode:letterSpacing:](self->_serviceString, "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v26, 4, 1.79769313e308);
            if (v29 <= self->_maxWidth)
              goto LABEL_21;
          }
        }
        if (letterSpacing < -1.0)
        {
          self->_letterSpacing = 0.0;
          self->_loopingNecessaryForString = 1;
          if (self->_loopNowIfNecessary)
            -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
        }

      }
    }
    v16 = (v7 & 8) == 0;
    v15 = 1;
    goto LABEL_28;
  }
  v16 = (v7 & 8) == 0;
  if (contentType == a3 && (v7 & 8) == 0)
  {
    v18 = 0;
    goto LABEL_34;
  }
LABEL_28:
  if (self->_crossfadeStep)
    v18 = 1;
  else
    v18 = v15;
  self->_crossfadeStep = 0;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__crossfadeStepAnimation, 0);
  if (!v16)
  {
    v30 = (NSString *)objc_msgSend(v13, "copy");
    crossfadeString = self->_crossfadeString;
    self->_crossfadeString = v30;

    if (-[NSString length](self->_crossfadeString, "length"))
      self->_crossfadeStep = 1;
  }
LABEL_34:
  if (self->_crossfadeStep)
  {
    self->_loopNowIfNecessary = 0;
  }
  else if ((v7 & 1) != 0)
  {
    self->_loopNowIfNecessary = 1;
    if (self->_loopingNecessaryForString)
    {
      v18 = 1;
      -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
    }
  }

  return v18;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = *(_QWORD *)&a4;
  v6 = objc_msgSend(a3, "rawData");
  v7 = *(unsigned int *)(v6 + 2072);
  _UIKitPreferencesOnce();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("UIStatusBarShowBuildVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "BOOLValue") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportsShowingBuildVersion");

  if (!v11)
  {
LABEL_5:
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v6 + 448, 4);
    goto LABEL_6;
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "buildVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v6 + 648, 4);
  v15 = -[UIStatusBarServiceItemView updateForContentType:serviceString:serviceCrossfadeString:maxWidth:actions:](self, "updateForContentType:serviceString:serviceCrossfadeString:maxWidth:actions:", v7, v13, v14, v4, 1.79769313e308);

  return v15;
}

- (int64_t)legibilityStyle
{
  objc_super v4;

  if (-[UIView clipsToBounds](self, "clipsToBounds"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarServiceItemView;
  return -[UIStatusBarItemView legibilityStyle](&v4, sel_legibilityStyle);
}

- (double)updateContentsAndWidth
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double maxWidth;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;

  v3 = -[UIStatusBarServiceItemView _crossfaded](self, "_crossfaded");
  if (-[UIStatusBarServiceItemView _loopingNecessary](self, "_loopingNecessary"))
    v4 = self->_loopNowIfNecessary || self->_loopingNow;
  else
    v4 = 0;
  -[UIStatusBarServiceItemView contentsImage](self, "contentsImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  maxWidth = 0.0;
  if (v5)
  {
    objc_msgSend(v5, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "size");
      v8 = v12;

      if (!-[UIStatusBarServiceItemView _loopingNecessary](self, "_loopingNecessary") || v3)
        maxWidth = v8;
      else
        maxWidth = self->_maxWidth;
    }
  }
  -[UIView frame](self, "frame");
  if (v13 != maxWidth)
  {
    v7 = maxWidth - v13;
    -[UIView setFrame:](self, "setFrame:");
  }
  v14 = 9;
  if (v3)
    v14 = 10;
  *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UIStatusBarServiceItemView__contentType[v14]) = maxWidth;
  -[UIStatusBarItemView setLayerContentsImage:](self, "setLayerContentsImage:", v6);
  -[UIView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentsGravity:", *MEMORY[0x1E0CD2F80]);

  if (!self->_loopingNow)
  {
    if (v4 && !v3 && v8 > 0.0)
    {
      -[UIView layer](self, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = 1.0;
      v19 = maxWidth / v8;
    }
    else
    {
      -[UIView layer](self, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v19 = 1.0;
      v18 = 1.0;
    }
    objc_msgSend(v16, "setContentsRect:", 0.0, 0.0, v19, v18);

  }
  -[UIView layer](self, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 1.0;
  objc_msgSend(v20, "setOpacity:", v21);

  return v7;
}

- (id)_contentsImageFromString:(id)a3 withWidth:(double)a4 letterSpacing:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  double v14;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    if (-[NSString isEqual:](self->_serviceString, "isEqual:", v8))
    {
      -[UIStatusBarItemView cachedImageWithText:truncatedWithEllipsesAtMaxWidth:letterSpacing:](self, "cachedImageWithText:truncatedWithEllipsesAtMaxWidth:letterSpacing:", v8, a4, a5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UIStatusBarItemView textAlignment](self, "textAlignment");
      v12 = -[UIStatusBarItemView textStyle](self, "textStyle");
      v13 = -[UIStatusBarServiceItemView legibilityStyle](self, "legibilityStyle");
      -[UIStatusBarItemView legibilityStrength](self, "legibilityStrength");
      objc_msgSend(v10, "imageWithText:ofItemType:forWidth:lineBreakMode:letterSpacing:textAlignment:style:withLegibilityStyle:legibilityStrength:", v8, 6, 4, v11, v12, v13, a4, a5, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_serviceContentsImage
{
  double maxWidth;

  if (!self->_loopingNecessaryForString || self->_loopNowIfNecessary || self->_loopingNow)
    maxWidth = 1.79769313e308;
  else
    maxWidth = self->_maxWidth;
  return -[UIStatusBarServiceItemView _contentsImageFromString:withWidth:letterSpacing:](self, "_contentsImageFromString:withWidth:letterSpacing:", self->_serviceString, maxWidth, self->_letterSpacing);
}

- (id)_crossfadeContentsImage
{
  return -[UIStatusBarServiceItemView _contentsImageFromString:withWidth:letterSpacing:](self, "_contentsImageFromString:withWidth:letterSpacing:", self->_crossfadeString, 1.79769313e308, 0.0);
}

- (id)contentsImage
{
  if (-[UIStatusBarServiceItemView _crossfaded](self, "_crossfaded"))
    -[UIStatusBarServiceItemView _crossfadeContentsImage](self, "_crossfadeContentsImage");
  else
    -[UIStatusBarServiceItemView _serviceContentsImage](self, "_serviceContentsImage");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  objc_super v13;
  _QWORD v14[5];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  if (a5 > 0.0 && a3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__UIStatusBarServiceItemView_setVisible_frame_duration___block_invoke;
    v14[3] = &unk_1E16B1B28;
    v14[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);
  }
  v13.receiver = self;
  v13.super_class = (Class)UIStatusBarServiceItemView;
  -[UIStatusBarItemView setVisible:frame:duration:](&v13, sel_setVisible_frame_duration_, v10, x, y, width, height, a5);
}

uint64_t __56__UIStatusBarServiceItemView_setVisible_frame_duration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "frame");
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:");
}

- (BOOL)animatesDataChange
{
  return 1;
}

- (double)extraRightPadding
{
  double v3;
  double v4;
  double serviceWidth;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarServiceItemView;
  -[UIStatusBarItemView extraRightPadding](&v8, sel_extraRightPadding);
  v4 = v3;
  if (self->_crossfadeStep - 2 <= 4)
  {
    if (self->_serviceWidth >= self->_crossfadeWidth)
      serviceWidth = self->_serviceWidth;
    else
      serviceWidth = self->_crossfadeWidth;
    -[UIView frame](self, "frame");
    return v4 + serviceWidth - v6;
  }
  return v4;
}

- (void)performPendedActions
{
  _BOOL4 loopNowIfNecessary;
  _QWORD v4[5];
  _QWORD v5[5];

  if (-[UIStatusBarServiceItemView _loopingNecessary](self, "_loopingNecessary"))
  {
    loopNowIfNecessary = self->_loopNowIfNecessary;
    self->_loopNowIfNecessary = 0;
    if (loopNowIfNecessary)
    {
      self->_loopingNow = 1;
      -[UIStatusBarItemView beginDisablingRasterization](self, "beginDisablingRasterization");
      v4[4] = self;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __50__UIStatusBarServiceItemView_performPendedActions__block_invoke;
      v5[3] = &unk_1E16B1B28;
      v5[4] = self;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __50__UIStatusBarServiceItemView_performPendedActions__block_invoke_2;
      v4[3] = &unk_1E16B3FD8;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v5, v4, 1.2, 0.3);
    }
  }
  else
  {
    self->_loopNowIfNecessary = 0;
  }
  if (self->_crossfadeStep == 1)
    -[UIStatusBarServiceItemView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__crossfadeStepAnimation, 0, 2.0);
}

void __50__UIStatusBarServiceItemView_performPendedActions__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentsRect:", 1.0 - v6, v4, v6, v8);

}

uint64_t __50__UIStatusBarServiceItemView_performPendedActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loopAnimationDidStopInDirection:", 1);
}

- (void)_loopAnimationDidStopInDirection:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];

  if (a3)
  {
    v11[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke;
    v12[3] = &unk_1E16B1B28;
    v12[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_2;
    v11[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v12, v11, 1.2, 0.3);
  }
  else
  {
    self->_loopingNow = 0;
    -[UIView setClipsToBounds:](self, "setClipsToBounds:");
    v7 = 0;
    v8 = (double *)&v7;
    v9 = 0x2020000000;
    v10 = 0;
    v5[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_3;
    v6[3] = &unk_1E16BACE0;
    v6[4] = self;
    v6[5] = &v7;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_4;
    v5[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, v5, 0.25, 0.3);
    if (v8[3] != 0.0)
    {
      -[UIStatusBarItemView layoutManager](self, "layoutManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "itemView:sizeChangedBy:", self, v8[3]);

    }
    _Block_object_dispose(&v7, 8);
  }
}

void __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentsRect:", 0.0, v4, v6, v8);

}

uint64_t __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loopAnimationDidStopInDirection:", 0);
}

uint64_t __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "updateContentsAndWidth");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endDisablingRasterization");
}

- (BOOL)_crossfaded
{
  unint64_t crossfadeStep;

  crossfadeStep = self->_crossfadeStep;
  return (crossfadeStep & 1) == 0 && crossfadeStep > 1;
}

- (void)_crossfadeStepAnimation
{
  unint64_t crossfadeStep;
  _QWORD v5[5];
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  crossfadeStep = self->_crossfadeStep;
  if (crossfadeStep - 1 > 5)
  {
    if (crossfadeStep)
      self->_crossfadeStep = 0;
  }
  else
  {
    self->_crossfadeStep = crossfadeStep + 1;
    v5[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke_2;
    v5[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.25);
    -[UIStatusBarServiceItemView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", a2, 0, 2.0);
  }
}

void __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 0;
  objc_msgSend(v2, "setOpacity:", v1);

}

uint64_t __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "updateContentsAndWidth");
  objc_msgSend(v2, "itemView:sizeChangedBy:", v3);

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setOpacity:", v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke_3;
  v7[3] = &unk_1E16B1B28;
  v7[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.25);
}

void __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke_3(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 1.0;
  objc_msgSend(v2, "setOpacity:", v1);

}

- (BOOL)_loopingNecessary
{
  return self->_loopingNecessaryForString;
}

- (id)accessibilityHUDRepresentation
{
  return -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_serviceString, 0, 0.0, 0.0, 0.0, 0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeString, 0);
  objc_storeStrong((id *)&self->_serviceString, 0);
}

@end
