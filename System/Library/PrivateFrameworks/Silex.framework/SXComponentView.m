@implementation SXComponentView

- (SXComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SXComponentView *v19;
  SXComponentView *v20;
  uint64_t v21;
  SXComponentState *state;
  uint64_t v23;
  UIView *contentView;
  uint64_t v25;
  UIView *backgroundView;
  void *v27;
  void *v28;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)SXComponentView;
  v15 = *MEMORY[0x24BDBF090];
  v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v18 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v19 = -[SXComponentView initWithFrame:](&v30, sel_initWithFrame_, *MEMORY[0x24BDBF090], v16, v17, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v20->_viewport, a4);
    objc_storeWeak((id *)&v20->_presentationDelegate, v13);
    objc_storeStrong((id *)&v20->_componentStyleRendererFactory, a6);
    v21 = objc_opt_new();
    state = v20->_state;
    v20->_state = (SXComponentState *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v15, v16, v17, v18);
    contentView = v20->_contentView;
    v20->_contentView = (UIView *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v15, v16, v17, v18);
    backgroundView = v20->_backgroundView;
    v20->_backgroundView = (UIView *)v25;

    -[UIView addSubview:](v20->_backgroundView, "addSubview:", v20->_contentView);
    -[SXComponentView addSubview:](v20, "addSubview:", v20->_backgroundView);
    -[SXComponentView layer](v20, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAllowsGroupOpacity:", 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v20, sel_didReceiveMemoryWarning, *MEMORY[0x24BDF7538], 0);

  }
  return v20;
}

- (void)didReceiveMemoryWarning
{
  if (-[SXComponentView visibilityState](self, "visibilityState") != 1)
  {
    -[SXComponentView discardContents](self, "discardContents");
    if (!self->_hasBehaviors && !self->_hasAnimation)
      -[SXComponentView invalidateComponentStyle](self, "invalidateComponentStyle");
  }
}

- (void)loadComponent:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_component, a3);
  v5 = a3;
  self->_animationsAndBehaviorsEnabled = 1;
  objc_msgSend(v5, "behaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasBehaviors = objc_msgSend(v6, "count") != 0;

  objc_msgSend(v5, "animation");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  self->_hasAnimation = v7 != 0;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXComponentView;
  -[SXComponentView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[SXComponentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[SXComponentView setPresentationFrame:](self, "setPresentationFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behaviorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterComponentView:", self);

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterComponentView:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BDF7538], 0);

  v8.receiver = self;
  v8.super_class = (Class)SXComponentView;
  -[SXComponentView dealloc](&v8, sel_dealloc);
}

- (void)renderContents
{
  self->_hasRenderedContents = 1;
}

- (void)discardContents
{
  self->_hasRenderedContents = 0;
}

- (void)renderContentsIfNeeded
{
  if (!self->_hasRenderedContents)
    -[SXComponentView renderContents](self, "renderContents");
  if (self->_componentStyle)
  {
    if (self->_componentStyleRenderer
      || (-[SXComponentView setupComponentStyleRendererForStyle:](self, "setupComponentStyleRendererForStyle:"),
          -[SXComponentView prepareComponentStyleRendererForStyle:](self, "prepareComponentStyleRendererForStyle:", self->_componentStyle), self->_componentStyle))
    {
      if (!self->_hasRenderedComponentStyle)
        -[SXComponentView renderComponentStyle](self, "renderComponentStyle");
    }
  }
}

- (void)willPresentComponentWithChanges:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXComponentLayout *v9;
  SXComponentLayout *componentLayout;
  void *v11;
  id v12;

  if ((*(_WORD *)&a3.var0 & 0x101) != 0)
    self->_hasRenderedComponentStyle = 0;
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentStyleForComponent:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[SXComponentView setupComponentStyleRendererForStyle:](self, "setupComponentStyleRendererForStyle:", v12);
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentLayoutForIdentifier:", v8);
  v9 = (SXComponentLayout *)objc_claimAutoreleasedReturnValue();
  componentLayout = self->_componentLayout;
  self->_componentLayout = v9;

  -[SXComponentView component](self, "component");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView updateAllowHierarchyRemovalWithComponent:componentStyle:](self, "updateAllowHierarchyRemovalWithComponent:componentStyle:", v11, v12);

}

- (void)presentComponentWithChanges:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[SXComponentView frame](self, "frame", *(_QWORD *)&a3.var0);
  -[SXComponentView setOriginalFrame:](self, "setOriginalFrame:");
  -[SXComponentView prepareComponentStyleRendererForStyle:](self, "prepareComponentStyleRendererForStyle:", self->_componentStyle);
  if (-[SXComponentView hasAnimation](self, "hasAnimation")
    && -[SXComponentView animationsAndBehaviorsEnabled](self, "animationsAndBehaviorsEnabled"))
  {
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerComponentView:animation:", self, v7);

  }
  else
  {
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterComponentView:", self);
  }

  if (-[SXComponentView hasBehaviors](self, "hasBehaviors")
    && -[SXComponentView animationsAndBehaviorsEnabled](self, "animationsAndBehaviorsEnabled"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SXComponentView component](self, "component");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "behaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
          -[SXComponentView presentationDelegate](self, "presentationDelegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "behaviorController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "registerComponentView:behavior:", self, v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

  }
  else
  {
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "behaviorController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unregisterComponentView:", self);

  }
}

- (void)setVisibilityState:(int64_t)a3
{
  int64_t visibilityState;

  visibilityState = self->_visibilityState;
  if (visibilityState != a3)
  {
    self->_visibilityState = a3;
    -[SXComponentView visibilityStateDidChangeFromState:](self, "visibilityStateDidChangeFromState:", visibilityState);
  }
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;

  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[SXComponentView visibilityState](self, "visibilityState") == 1
      && -[SXComponentView animationsAndBehaviorsEnabled](self, "animationsAndBehaviorsEnabled"))
    {
      -[SXComponentView presentationDelegate](self, "presentationDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "animationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startUpdatingAnimationForComponentView:", self);
LABEL_8:

      goto LABEL_9;
    }
    v9 = -[SXComponentView visibilityState](self, "visibilityState");
    if (a3 == 1 && v9 == 2)
    {
      -[SXComponentView presentationDelegate](self, "presentationDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "animationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopUpdatingAnimationForComponentView:", self);
      goto LABEL_8;
    }
  }
LABEL_9:
  -[SXComponentView componentStyleRenderer](self, "componentStyleRenderer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentVisiblityStateDidChange:", a3);

}

- (CGRect)originalFrameForContentView:(id)a3 behavior:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v5 = a3;
  -[SXComponentView fillView](self, "fillView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[SXComponentView contentFrame](self, "contentFrame");
  else
    -[SXComponentView originalFrame](self, "originalFrame");
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)restoreBehavior
{
  id v3;

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateBehaviorForComponentView:", self);

}

- (void)updateAllowHierarchyRemovalWithComponent:(id)a3 componentStyle:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;

  v6 = a4;
  v7 = a3;
  v8 = !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning();
  objc_msgSend(v7, "animation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "behaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  objc_msgSend(v6, "fill");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "attachment");
  if (v11)
    v14 = 1;
  else
    v14 = v13 == 1;
  v15 = !v14;
  if (v9)
    v15 = 0;
  if (!v8)
    v15 = 0;
  self->_allowViewHierarchyRemoval = v15;
}

- (void)setRequiresThoroughFrameCalculations:(BOOL)a3
{
  self->_requiresThoroughFrameCalculations = a3;
  if (!a3)
    -[SXComponentView setPresentationFrame:](self, "setPresentationFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *highlightView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v3 = a3;
  -[SXComponentView highlightView](self, "highlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      v7 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
      highlightView = self->_highlightView;
      self->_highlightView = v7;

      -[SXComponentView highlightView](self, "highlightView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorWithAlphaComponent:", 0.1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v11);

    }
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __34__SXComponentView_setHighlighted___block_invoke;
    v15[3] = &unk_24D6874A8;
    v15[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v15);
    -[SXComponentView contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView highlightView](self, "highlightView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[SXComponentView highlightView](self, "highlightView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 1.0);
  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 0.0);

    -[SXComponentView highlightView](self, "highlightView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");
  }

  self->_highlighted = v3;
}

void __34__SXComponentView_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)setupComponentStyleRendererForStyle:(id)a3
{
  SXComponentStyleRenderer *v5;
  SXComponentStyleRenderer *componentStyleRenderer;
  id v7;

  v7 = a3;
  if (!self->_componentStyleRenderer || !-[SXJSONObject isEqual:](self->_componentStyle, "isEqual:", v7))
  {
    objc_storeStrong((id *)&self->_componentStyle, a3);
    -[SXComponentStyleRendererFactory componentStyleRendererForComponentStyle:](self->_componentStyleRendererFactory, "componentStyleRendererForComponentStyle:", v7);
    v5 = (SXComponentStyleRenderer *)objc_claimAutoreleasedReturnValue();
    componentStyleRenderer = self->_componentStyleRenderer;
    self->_componentStyleRenderer = v5;

    self->_hasRenderedComponentStyle = 0;
  }

}

- (void)prepareComponentStyleRendererForStyle:(id)a3
{
  -[SXComponentStyleRenderer prepareForComponentView:](self->_componentStyleRenderer, "prepareForComponentView:", self);
}

- (void)renderComponentStyle
{
  if (!self->_hasRenderedComponentStyle)
  {
    -[SXComponentStyleRenderer applyComponentStyle](self->_componentStyleRenderer, "applyComponentStyle");
    self->_hasRenderedComponentStyle = 1;
  }
}

- (void)invalidateComponentStyle
{
  SXComponentStyleRenderer *componentStyleRenderer;

  componentStyleRenderer = self->_componentStyleRenderer;
  self->_componentStyleRenderer = 0;

  self->_hasRenderedComponentStyle = 0;
}

- (CGRect)transitionContentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)transitionViewIsVisible
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  CGRect v18;
  CGRect v19;

  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SXComponentView viewport](self, "viewport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dynamicBounds");
  v19.origin.x = v12;
  v19.origin.y = v13;
  v19.size.width = v14;
  v19.size.height = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v16 = CGRectIntersectsRect(v18, v19);

  return v16;
}

- (CGRect)transitionVisibleFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v4 = v3;
  v6 = v5;
  -[SXComponentView frame](self, "frame");
  v10 = v9 == v6 && v8 == v4;
  v11 = 0.0;
  if (!v10)
    v11 = v7;
  v12 = v6 - v11;
  v13 = 0.0;
  v14 = 0.0;
  v15 = v4;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)transitionContainerFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[SXComponentView viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView frame](self, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SXComponentView superview](self, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  return 0;
}

- (UIView)transitionContentView
{
  return 0;
}

- (BOOL)transitionViewShouldFadeInContent
{
  return 0;
}

- (void)prepareForTransitionType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  -[SXComponentView component](self, "component", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "animation");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[SXComponentView component](self, "component");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "transitionBehavior");

    if (v8 != 1)
      return;
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopUpdatingAnimationForComponentView:finishAnimation:", self, 1);

  }
}

- (BOOL)isTransitionable
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureShouldBegin:(id)a3
{
  return 1;
}

- (void)setAnimationsAndBehaviorsEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  self->_animationsAndBehaviorsEnabled = a3;
  if (!a3)
  {
    -[SXComponentView component](self, "component");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SXComponentView presentationDelegate](self, "presentationDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "animationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopUpdatingAnimationForComponentView:finishAnimation:", self, 1);

    }
    -[SXComponentView component](self, "component");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "behaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SXComponentView presentationDelegate](self, "presentationDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "behaviorController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unregisterComponentView:", self);

    }
  }
}

- (void)animationDidStart:(id)a3
{
  -[SXComponentView setRequiresThoroughFrameCalculations:](self, "setRequiresThoroughFrameCalculations:", 1);
}

- (void)animationDidFinish:(id)a3
{
  -[SXComponentView setRequiresThoroughFrameCalculations:](self, "setRequiresThoroughFrameCalculations:", 0);
}

- (void)didApplyBehavior:(id)a3
{
  -[SXComponentView setRequiresThoroughFrameCalculations:](self, "setRequiresThoroughFrameCalculations:", a3 != 0);
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v7;

  v7 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("unitConverter")))
    objc_storeStrong((id *)&self->_unitConverter, a3);

}

- (CGRect)absoluteFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  x = self->_absoluteFrame.origin.x;
  y = self->_absoluteFrame.origin.y;
  width = self->_absoluteFrame.size.width;
  height = self->_absoluteFrame.size.height;
  if (-[SXComponentView requiresThoroughFrameCalculations](self, "requiresThoroughFrameCalculations"))
  {
    -[SXComponentView presentationFrame](self, "presentationFrame");
    if (!CGRectEqualToRect(v15, *MEMORY[0x24BDBF090]))
    {
      -[SXComponentView presentationFrame](self, "presentationFrame");
      x = v7;
      y = v8;
      width = v9;
      height = v10;
    }
  }
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXComponentView setPresentationFrame:](self, "setPresentationFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  self->_absoluteFrame.origin.x = x;
  self->_absoluteFrame.origin.y = y;
  self->_absoluteFrame.size.width = width;
  self->_absoluteFrame.size.height = height;
}

- (id)classification
{
  void *v2;
  void *v3;

  -[SXComponentView component](self, "component");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "classification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGRect v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentFrame](self, "contentFrame");
  NSStringFromCGRect(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: '%@', contentFrame: %@>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)userInteractable
{
  return 1;
}

- (void)assistiveTechnologyStatusDidChange
{
  void *v3;
  id v4;

  -[SXComponentView component](self, "component");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentView componentStyle](self, "componentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView updateAllowHierarchyRemovalWithComponent:componentStyle:](self, "updateAllowHierarchyRemovalWithComponent:componentStyle:", v4, v3);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SXComponentView *v5;
  uint64_t v6;
  SXComponentView *v7;
  SXComponentView *v8;
  uint64_t v9;
  void *v10;
  SXComponentView *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SXComponentView;
  -[SXComponentView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SXComponentView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
    goto LABEL_8;
  -[SXComponentView contentView](self, "contentView");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5 == (SXComponentView *)v6)
    goto LABEL_7;
  v8 = (SXComponentView *)v6;
  -[SXComponentView backgroundView](self, "backgroundView");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v5 == (SXComponentView *)v9)
  {

    v7 = v8;
LABEL_7:

LABEL_8:
    v5 = 0;
    return v5;
  }
  v10 = (void *)v9;
  -[SXComponentView fillView](self, "fillView");
  v11 = (SXComponentView *)objc_claimAutoreleasedReturnValue();

  if (v5 == v11)
    goto LABEL_8;
  return v5;
}

- (SXComponentLayout)componentLayout
{
  return self->_componentLayout;
}

- (SXComponent)component
{
  return self->_component;
}

- (SXComponentState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXPresentationDelegate)presentationDelegate
{
  return (SXPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (int64_t)visibilityState
{
  return self->_visibilityState;
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (SXFillView)fillView
{
  return (SXFillView *)objc_loadWeakRetained((id *)&self->_fillView);
}

- (void)setFillView:(id)a3
{
  objc_storeWeak((id *)&self->_fillView, a3);
}

- (BOOL)hasRenderedContents
{
  return self->_hasRenderedContents;
}

- (UIEdgeInsets)componentLayoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_componentLayoutMargins.top;
  left = self->_componentLayoutMargins.left;
  bottom = self->_componentLayoutMargins.bottom;
  right = self->_componentLayoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setComponentLayoutMargins:(UIEdgeInsets)a3
{
  self->_componentLayoutMargins = a3;
}

- (UIEdgeInsets)borderInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_borderInsets.top;
  left = self->_borderInsets.left;
  bottom = self->_borderInsets.bottom;
  right = self->_borderInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBorderInsets:(UIEdgeInsets)a3
{
  self->_borderInsets = a3;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (CGRect)backgroundViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backgroundViewFrame.origin.x;
  y = self->_backgroundViewFrame.origin.y;
  width = self->_backgroundViewFrame.size.width;
  height = self->_backgroundViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBackgroundViewFrame:(CGRect)a3
{
  self->_backgroundViewFrame = a3;
}

- (BOOL)requiresThoroughFrameCalculations
{
  return self->_requiresThoroughFrameCalculations;
}

- (BOOL)isDraggable
{
  return self->_isDraggable;
}

- (BOOL)animationsAndBehaviorsEnabled
{
  return self->_animationsAndBehaviorsEnabled;
}

- (SXColumnLayout)documentColumnLayout
{
  return self->_documentColumnLayout;
}

- (void)setDocumentColumnLayout:(id)a3
{
  objc_storeStrong((id *)&self->_documentColumnLayout, a3);
}

- (SXUnitConverter)unitConverter
{
  return self->_unitConverter;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (SXComponentStyleRendererFactory)componentStyleRendererFactory
{
  return self->_componentStyleRendererFactory;
}

- (SXComponentStyleRenderer)componentStyleRenderer
{
  return self->_componentStyleRenderer;
}

- (SXComponentStyle)componentStyle
{
  return self->_componentStyle;
}

- (void)setComponentStyle:(id)a3
{
  objc_storeStrong((id *)&self->_componentStyle, a3);
}

- (CGRect)originalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originalFrame.origin.x;
  y = self->_originalFrame.origin.y;
  width = self->_originalFrame.size.width;
  height = self->_originalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginalFrame:(CGRect)a3
{
  self->_originalFrame = a3;
}

- (BOOL)allowViewHierarchyRemoval
{
  return self->_allowViewHierarchyRemoval;
}

- (void)setAllowViewHierarchyRemoval:(BOOL)a3
{
  self->_allowViewHierarchyRemoval = a3;
}

- (BOOL)hasAnimation
{
  return self->_hasAnimation;
}

- (void)setHasAnimation:(BOOL)a3
{
  self->_hasAnimation = a3;
}

- (BOOL)hasBehaviors
{
  return self->_hasBehaviors;
}

- (void)setHasBehaviors:(BOOL)a3
{
  self->_hasBehaviors = a3;
}

- (BOOL)hasRenderedComponentStyle
{
  return self->_hasRenderedComponentStyle;
}

- (void)setHasRenderedComponentStyle:(BOOL)a3
{
  self->_hasRenderedComponentStyle = a3;
}

- (SXComponentHosting)componentHost
{
  return (SXComponentHosting *)objc_loadWeakRetained((id *)&self->_componentHost);
}

- (void)setComponentHost:(id)a3
{
  objc_storeWeak((id *)&self->_componentHost, a3);
}

- (unint64_t)componentIndex
{
  return self->_componentIndex;
}

- (void)setComponentIndex:(unint64_t)a3
{
  self->_componentIndex = a3;
}

- (CGRect)presentationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationFrame.origin.x;
  y = self->_presentationFrame.origin.y;
  width = self->_presentationFrame.size.width;
  height = self->_presentationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentationFrame:(CGRect)a3
{
  self->_presentationFrame = a3;
}

- ($EB925890EBEBD6850280D1FB85A9BD43)presentationChanges
{
  return ($EB925890EBEBD6850280D1FB85A9BD43)(*(unsigned __int16 *)&self->_presentationChanges.size | (self->_presentationChanges.state << 16));
}

- (void)setPresentationChanges:(id)a3
{
  self->_presentationChanges = ($F5F5F7F27064974DACF8CA0609184423)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_componentHost);
  objc_storeStrong((id *)&self->_componentStyle, 0);
  objc_storeStrong((id *)&self->_componentStyleRenderer, 0);
  objc_storeStrong((id *)&self->_componentStyleRendererFactory, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_unitConverter, 0);
  objc_storeStrong((id *)&self->_documentColumnLayout, 0);
  objc_destroyWeak((id *)&self->_fillView);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_componentLayout, 0);
}

@end
