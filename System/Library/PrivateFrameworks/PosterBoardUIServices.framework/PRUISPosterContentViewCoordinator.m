@implementation PRUISPosterContentViewCoordinator

- (PRUISPosterContentViewCoordinator)initWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PRUISPosterContentViewCoordinator *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PRUISPosterContentViewCoordinator;
  result = -[PRUISPosterContentViewCoordinator init](&v8, sel_init);
  if (result)
  {
    result->_bounds.origin.x = x;
    result->_bounds.origin.y = y;
    result->_bounds.size.width = width;
    result->_bounds.size.height = height;
  }
  return result;
}

- (UIView)obscurableContentView
{
  UIView *obscurableContentContainerView;
  UIView *v4;
  UIView *v5;

  obscurableContentContainerView = self->_obscurableContentContainerView;
  if (!obscurableContentContainerView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
    v5 = self->_obscurableContentContainerView;
    self->_obscurableContentContainerView = v4;

    -[UIView setAutoresizingMask:](self->_obscurableContentContainerView, "setAutoresizingMask:", 18);
    obscurableContentContainerView = self->_obscurableContentContainerView;
  }
  return obscurableContentContainerView;
}

- (BSUIVibrancyEffectView)obscurableContentVibrancyView
{
  BSUIVibrancyEffectView *obscurableContentVibrancyView;
  BSUIVibrancyEffectView *v4;
  BSUIVibrancyEffectView *v5;
  void *v6;
  void *v7;

  obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
  if (!obscurableContentVibrancyView)
  {
    v4 = (BSUIVibrancyEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BF50]), "initWithFrame:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
    v5 = self->_obscurableContentVibrancyView;
    self->_obscurableContentVibrancyView = v4;

    -[BSUIVibrancyEffectView setAutoresizingMask:](self->_obscurableContentVibrancyView, "setAutoresizingMask:", 18);
    -[BSUIVibrancyEffectView contentView](self->_obscurableContentVibrancyView, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutoresizingMask:", 18);

    -[PRUISPosterContentViewCoordinator obscurableContentView](self, "obscurableContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_obscurableContentVibrancyView);

    obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
  }
  return obscurableContentVibrancyView;
}

- (UIView)vibrantObscurableContentView
{
  void *v2;
  void *v3;

  -[PRUISPosterContentViewCoordinator obscurableContentVibrancyView](self, "obscurableContentVibrancyView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)overlayContentView
{
  UIView *overlayContentView;
  UIView *v4;
  UIView *v5;

  overlayContentView = self->_overlayContentView;
  if (!overlayContentView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
    v5 = self->_overlayContentView;
    self->_overlayContentView = v4;

    -[UIView setAutoresizingMask:](self->_overlayContentView, "setAutoresizingMask:", 18);
    overlayContentView = self->_overlayContentView;
  }
  return overlayContentView;
}

- (UIView)obscurableOverlayView
{
  UIView *obscurableOverlayView;
  UIView *v4;
  UIView *v5;
  void *v6;

  obscurableOverlayView = self->_obscurableOverlayView;
  if (!obscurableOverlayView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
    v5 = self->_obscurableOverlayView;
    self->_obscurableOverlayView = v4;

    -[UIView setAutoresizingMask:](self->_obscurableOverlayView, "setAutoresizingMask:", 18);
    -[PRUISPosterContentViewCoordinator obscurableContentView](self, "obscurableContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_obscurableOverlayView);

    obscurableOverlayView = self->_obscurableOverlayView;
  }
  return obscurableOverlayView;
}

- (id)updateContentViewsWithContentStyle:(id)a3 initialAppearance:(id)a4
{
  id v7;
  id v8;
  BSUIVibrancyEffectView *obscurableContentVibrancyView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double y;
  double x;
  double height;
  double width;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  PRPosterContentStyleVibrantContentRenderer *vibrantContentStyleRenderer;
  id v29;
  BSUIVibrancyEffectView *v30;
  void *v31;
  PRPosterContentStyleVibrantContentRenderer *v32;
  PRPosterContentStyleVibrantContentRenderer *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
  v10 = v8;
  if (obscurableContentVibrancyView)
  {
    -[BSUIVibrancyEffectView contentView](obscurableContentVibrancyView, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

    -[BSUIVibrancyEffectView contentView](self->_obscurableContentVibrancyView, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutIfNeeded");

    -[PRPosterContentStyleVibrantContentRenderer clearAllStyles](self->_vibrantContentStyleRenderer, "clearAllStyles");
    -[BSUIVibrancyEffectView contentView](self->_obscurableContentVibrancyView, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subviews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    x = *MEMORY[0x24BDBF090];
    y = *(double *)(MEMORY[0x24BDBF090] + 8);
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    height = *(double *)(MEMORY[0x24BDBF090] + 24);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = v14;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v36 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "frame", (_QWORD)v35);
          v43.origin.x = v24;
          v43.origin.y = v25;
          v43.size.width = v26;
          v43.size.height = v27;
          v41.origin.x = x;
          v41.origin.y = y;
          v41.size.width = width;
          v41.size.height = height;
          v42 = CGRectUnion(v41, v43);
          x = v42.origin.x;
          y = v42.origin.y;
          width = v42.size.width;
          height = v42.size.height;
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v21);
    }

    if (CGRectIsEmpty(self->_primaryContentTightFrame))
    {
      self->_primaryContentTightFrame.origin.x = x;
      self->_primaryContentTightFrame.origin.y = y;
      self->_primaryContentTightFrame.size.width = width;
      self->_primaryContentTightFrame.size.height = height;
    }
    vibrantContentStyleRenderer = self->_vibrantContentStyleRenderer;
    if (vibrantContentStyleRenderer)
    {
      -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](vibrantContentStyleRenderer, "setContentBoundingRect:", x, y, width, height);
      -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantContentStyleRenderer, "setStyleBoundingRect:", self->_primaryContentTightFrame.origin.x, self->_primaryContentTightFrame.origin.y, self->_primaryContentTightFrame.size.width, self->_primaryContentTightFrame.size.height);
    }
    else
    {
      v29 = objc_alloc(MEMORY[0x24BE74DF0]);
      v30 = self->_obscurableContentVibrancyView;
      -[BSUIVibrancyEffectView contentView](v30, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (PRPosterContentStyleVibrantContentRenderer *)objc_msgSend(v29, "initWithVibrancyView:contentView:contentBoundingRect:styleBoundingRect:initialAppearance:", v30, v31, v8, x, y, width, height, self->_primaryContentTightFrame.origin.x, self->_primaryContentTightFrame.origin.y, self->_primaryContentTightFrame.size.width, self->_primaryContentTightFrame.size.height);
      v33 = self->_vibrantContentStyleRenderer;
      self->_vibrantContentStyleRenderer = v32;

    }
    objc_msgSend(v7, "applyStyleWithRenderer:", self->_vibrantContentStyleRenderer, (_QWORD)v35);
    objc_storeStrong((id *)&self->_currentStyle, a3);
    -[PRPosterContentStyleVibrantContentRenderer currentAppearance](self->_vibrantContentStyleRenderer, "currentAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)updateLayoutForChangedVibrantObscuredSubviewBounds
{
  id v2;

  if (self->_vibrantContentStyleRenderer)
    v2 = -[PRUISPosterContentViewCoordinator updateContentViewsWithContentStyle:initialAppearance:](self, "updateContentViewsWithContentStyle:initialAppearance:", self->_currentStyle, 0);
}

- (void)setPrimaryContentTightFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_primaryContentTightFrame, a3))
  {
    self->_primaryContentTightFrame.origin.x = x;
    self->_primaryContentTightFrame.origin.y = y;
    self->_primaryContentTightFrame.size.width = width;
    self->_primaryContentTightFrame.size.height = height;
    -[PRUISPosterContentViewCoordinator updateLayoutForChangedVibrantObscuredSubviewBounds](self, "updateLayoutForChangedVibrantObscuredSubviewBounds");
  }
}

- (void)setObscurableOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_obscurableOverlayView, a3);
}

- (CGRect)primaryContentTightFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_primaryContentTightFrame.origin.x;
  y = self->_primaryContentTightFrame.origin.y;
  width = self->_primaryContentTightFrame.size.width;
  height = self->_primaryContentTightFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantContentStyleRenderer, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);
  objc_storeStrong((id *)&self->_obscurableOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayContentView, 0);
  objc_storeStrong((id *)&self->_obscurableContentContainerView, 0);
  objc_storeStrong((id *)&self->_obscurableContentVibrancyView, 0);
}

@end
