@implementation PXStoryPlayButton

- (PXStoryPlayButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PXStoryPlayButton *v7;
  uint64_t v8;
  NSString *axPlayLabel;
  uint64_t v10;
  NSString *axPauseLabel;
  uint64_t v12;
  NSString *axReplayLabel;
  uint64_t v14;
  PXUpdater *updater;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  PXStoryChromeButtonConfiguration *v20;
  PXStoryChromeButtonConfiguration *buttonConfiguration;
  PXStoryChromeButton *v22;
  PXStoryChromeButton *button;
  CAShapeLayer *v24;
  CAShapeLayer *progressIndicator;
  void *v26;
  void *v27;
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)PXStoryPlayButton;
  v7 = -[PXStoryPlayButton initWithFrame:](&v29, sel_initWithFrame_);
  if (v7)
  {
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryButtonAccessibilityLabelPlay"), CFSTR("PhotosUICore"));
    v8 = objc_claimAutoreleasedReturnValue();
    axPlayLabel = v7->_axPlayLabel;
    v7->_axPlayLabel = (NSString *)v8;

    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryButtonAccessibilityLabelPause"), CFSTR("PhotosUICore"));
    v10 = objc_claimAutoreleasedReturnValue();
    axPauseLabel = v7->_axPauseLabel;
    v7->_axPauseLabel = (NSString *)v10;

    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryButtonAccessibilityLabelReplay"), CFSTR("PhotosUICore"));
    v12 = objc_claimAutoreleasedReturnValue();
    axReplayLabel = v7->_axReplayLabel;
    v7->_axReplayLabel = (NSString *)v12;

    v14 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel__setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v14;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateButton);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateProgressIndicator);
    PXEdgeInsetsMake();
    v7->_hitTestEdgeOutsets.top = v16;
    v7->_hitTestEdgeOutsets.left = v17;
    v7->_hitTestEdgeOutsets.bottom = v18;
    v7->_hitTestEdgeOutsets.right = v19;
    v20 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    buttonConfiguration = v7->_buttonConfiguration;
    v7->_buttonConfiguration = v20;

    -[PXStoryChromeButtonConfiguration setBackgroundStyle:](v7->_buttonConfiguration, "setBackgroundStyle:", 1);
    -[PXStoryPlayButton hitTestEdgeOutsets](v7, "hitTestEdgeOutsets");
    -[PXStoryChromeButtonConfiguration setHitTestEdgeOutsets:](v7->_buttonConfiguration, "setHitTestEdgeOutsets:");
    v22 = -[PXStoryChromeButton initWithFrame:]([PXStoryChromeButton alloc], "initWithFrame:", x, y, width, height);
    button = v7->_button;
    v7->_button = v22;

    -[PXStoryChromeButton setAutoresizingMask:](v7->_button, "setAutoresizingMask:", 18);
    -[PXStoryPlayButton addSubview:](v7, "addSubview:", v7->_button);
    v24 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    progressIndicator = v7->_progressIndicator;
    v7->_progressIndicator = v24;

    -[CAShapeLayer setFillColor:](v7->_progressIndicator, "setFillColor:", 0);
    -[PXStoryChromeButton layer](v7->_button, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSublayer:", v7->_progressIndicator);

    -[PXStoryPlayButton layer](v7, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAllowsGroupOpacity:", 0);

  }
  return v7;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  unsigned __int8 v7;
  uint64_t v8;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryPlayButton;
  v7 = -[PXStoryPlayButton pointInside:withEvent:](&v13, sel_pointInside_withEvent_, a4);
  -[PXStoryPlayButton bounds](self, "bounds");
  if ((v7 & 1) != 0)
    return 1;
  if (CGRectIsEmpty(*(CGRect *)&v8))
    return 0;
  -[PXStoryPlayButton hitTestEdgeOutsets](self, "hitTestEdgeOutsets");
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (void)setViewModel:(id)a3
{
  PXStoryViewModel *v5;
  PXStoryViewModel *viewModel;
  PXStoryViewModel *v7;

  v5 = (PXStoryViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    -[PXStoryViewModel unregisterChangeObserver:context:](viewModel, "unregisterChangeObserver:context:", self, ViewModelObservationContext_180338);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PXStoryViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, ViewModelObservationContext_180338);
    -[PXStoryPlayButton _invalidateButton](self, "_invalidateButton");
    -[PXStoryPlayButton _invalidateProgressIndicator](self, "_invalidateProgressIndicator");
    v5 = v7;
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  -[PXStoryPlayButton updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  v10.receiver = self;
  v10.super_class = (Class)PXStoryPlayButton;
  -[PXStoryPlayButton layoutSubviews](&v10, sel_layoutSubviews);
  -[PXStoryPlayButton button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPlayButton progressIndicator](self, "progressIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPlayButton bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");
  -[PXStoryPlayButton layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zPosition");
  v8 = v7;

  objc_msgSend(v4, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setZPosition:", v8);

  objc_msgSend(v5, "setZPosition:", v8 + 0.1);
}

- (void)_invalidateButton
{
  id v2;

  -[PXStoryPlayButton updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateButton);

}

- (void)_updateButton
{
  NSString *axReplayLabel;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  NSString *axPlayLabel;
  NSString *axPauseLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[PXStoryPlayButton viewModel](self, "viewModel");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isAtPlaybackEnd"))
  {
    axReplayLabel = self->_axReplayLabel;
    -[PXStoryPlayButton buttonConfiguration](self, "buttonConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAxLabel:", axReplayLabel);

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playButtonRewindSymbolName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(v16, "desiredPlayState");
    if (v7 == 1)
    {
      axPauseLabel = self->_axPauseLabel;
      -[PXStoryPlayButton buttonConfiguration](self, "buttonConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAxLabel:", axPauseLabel);
      v6 = CFSTR("pause.fill");
    }
    else
    {
      if (v7)
      {
        v6 = 0;
        goto LABEL_8;
      }
      axPlayLabel = self->_axPlayLabel;
      -[PXStoryPlayButton buttonConfiguration](self, "buttonConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAxLabel:", axPlayLabel);
      v6 = CFSTR("play.fill");
    }
  }

LABEL_8:
  -[PXStoryPlayButton userData](self, "userData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playButtonProgressIndicatorLineWidth");
  -[PXStoryPlayButton buttonConfiguration](self, "buttonConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "target");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTarget:", v13);

  objc_msgSend(v12, "setAction:", objc_msgSend(v10, "action"));
  PXEdgeInsetsMake();
  objc_msgSend(v12, "setContentEdgeInsets:");
  objc_msgSend(v12, "setSystemImageName:", v6);
  objc_msgSend(v11, "chromeButtonSpec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSpec:", v14);

  -[PXStoryPlayButton button](self, "button");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserData:", v12);

}

- (void)_invalidateProgressIndicator
{
  id v2;

  -[PXStoryPlayButton updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateProgressIndicator);

}

- (void)_updateProgressIndicator
{
  double v3;
  double v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGPath *Mutable;
  const CGPath *v21;
  double v22;
  void *v23;
  id v24;
  double v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[PXStoryPlayButton viewModel](self, "viewModel");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "playbackFractionCompleted");
  if (v3 >= 0.0)
    v4 = v3;
  else
    v4 = 0.0;
  v5 = objc_msgSend(v26, "isAtPlaybackEnd");
  -[PXStoryPlayButton userData](self, "userData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playButtonProgressIndicatorLineWidth");
  v9 = v8;
  v25 = v8;

  -[PXStoryPlayButton bounds](self, "bounds");
  v28 = CGRectInset(v27, v9 * 0.5, v9 * 0.5);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  PXRectGetCenter();
  v15 = v14;
  v17 = v16;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v18 = CGRectGetWidth(v29) * 0.5;
  if (v4 >= 1.0)
    v19 = 4.71238898;
  else
    v19 = v4 * 6.28318531 + -1.57079633;
  Mutable = CGPathCreateMutable();
  v21 = Mutable;
  if (v5)
    v22 = -1.57079633;
  else
    v22 = v19;
  CGPathAddArc(Mutable, 0, v15, v17, v18, -1.57079633, v22, 0);
  -[PXStoryPlayButton progressIndicator](self, "progressIndicator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPath:", v21);
  objc_msgSend(v23, "setLineWidth:", v25);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v23, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

  CGPathRelease(v21);
}

- (void)setUserData:(id)a3
{
  PXStoryPlayButtonConfiguration *v4;
  BOOL v5;
  PXStoryPlayButtonConfiguration *v6;
  PXStoryPlayButtonConfiguration *userData;
  void *v8;
  PXStoryPlayButtonConfiguration *v9;

  v9 = (PXStoryPlayButtonConfiguration *)a3;
  v4 = self->_userData;
  if (v4 == v9)
  {

  }
  else
  {
    v5 = -[PXStoryPlayButtonConfiguration isEqual:](v9, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXStoryPlayButtonConfiguration *)-[PXStoryPlayButtonConfiguration copy](v9, "copy");
      userData = self->_userData;
      self->_userData = v6;

      -[PXStoryPlayButtonConfiguration viewModel](self->_userData, "viewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryPlayButton setViewModel:](self, "setViewModel:", v8);

      -[PXStoryPlayButton _invalidateButton](self, "_invalidateButton");
      -[PXStoryPlayButton _invalidateProgressIndicator](self, "_invalidateProgressIndicator");
    }
  }

}

- (void)prepareForReuse
{
  -[PXStoryPlayButton setUserData:](self, "setUserData:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if ((void *)ViewModelObservationContext_180338 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPlayButton.m"), 286, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((*(_QWORD *)&v6 & 0x200002) != 0)
    -[PXStoryPlayButton _invalidateButton](self, "_invalidateButton");
  if ((v6 & 4) != 0)
    -[PXStoryPlayButton _invalidateProgressIndicator](self, "_invalidateProgressIndicator");

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PXStoryPlayButton buttonConfiguration](self, "buttonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXStoryPlayButtonConfiguration)userData
{
  return self->_userData;
}

- (UIEdgeInsets)hitTestEdgeOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestEdgeOutsets.top;
  left = self->_hitTestEdgeOutsets.left;
  bottom = self->_hitTestEdgeOutsets.bottom;
  right = self->_hitTestEdgeOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryChromeButtonConfiguration)buttonConfiguration
{
  return self->_buttonConfiguration;
}

- (PXStoryChromeButton)button
{
  return self->_button;
}

- (PXStoryPlayButtonConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (CAShapeLayer)progressIndicator
{
  return self->_progressIndicator;
}

- (NSString)axPlayLabel
{
  return self->_axPlayLabel;
}

- (NSString)axPauseLabel
{
  return self->_axPauseLabel;
}

- (NSString)axReplayLabel
{
  return self->_axReplayLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axReplayLabel, 0);
  objc_storeStrong((id *)&self->_axPauseLabel, 0);
  objc_storeStrong((id *)&self->_axPlayLabel, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
