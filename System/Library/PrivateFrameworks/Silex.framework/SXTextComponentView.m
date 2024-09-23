@implementation SXTextComponentView

- (SXTextComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 tangierController:(id)a7
{
  id v12;
  SXTextComponentView *v13;
  SXTextComponentView *v14;
  objc_super v16;

  v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)SXTextComponentView;
  v13 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v16, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, a3, a4, a5, a6);
  v14 = v13;
  if (v13)
    objc_storeWeak((id *)&v13->_tangierController, v12);

  return v14;
}

- (void)presentComponentWithChanges:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SXTextComponentView;
  -[SXComponentView presentComponentWithChanges:](&v12, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXTextComponentView setupTextView](self, "setupTextView");
  -[SXTextComponentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v4, "setFrame:");

  -[SXTextComponentView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextComponentView absoluteTextViewFrame](self, "absoluteTextViewFrame");
  objc_msgSend(v5, "setFrameInCanvas:");

  -[SXTextComponentView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextComponentView frame](self, "frame");
  objc_msgSend(v6, "setParentFrame:");

  -[SXTextComponentView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[SXTextComponentView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SXComponentView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextComponentView textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SXTextComponentView;
  -[SXComponentView didMoveToWindow](&v16, sel_didMoveToWindow);
  -[SXTextComponentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXTextComponentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {

    if (!v5)
      return;
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tangierController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextComponentView textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didStopPresentingTextView:", v15);
    goto LABEL_8;
  }
  objc_msgSend(v4, "rep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "updateFromVisualPosition");

  if (v7)
  {
    -[SXTextComponentView textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rep");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "icc");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateLayers");

  }
  -[SXTextComponentView textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SXTextComponentView textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextComponentView absoluteTextViewFrame](self, "absoluteTextViewFrame");
    objc_msgSend(v12, "setFrameInCanvas:");

    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tangierController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextComponentView textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didStartPresentingTextView:", v15);
LABEL_8:

  }
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  -[SXComponentView setAbsoluteFrame:](&v5, sel_setAbsoluteFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SXTextComponentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextComponentView absoluteTextViewFrame](self, "absoluteTextViewFrame");
  objc_msgSend(v4, "setFrameInCanvas:");

}

- (void)setPresentationFrame:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  -[SXComponentView setPresentationFrame:](&v5, sel_setPresentationFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SXTextComponentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextComponentView absoluteTextViewFrame](self, "absoluteTextViewFrame");
  objc_msgSend(v4, "setFrameInCanvas:");

}

- (void)setupTextView
{
  void *v3;
  SXTextView *v4;
  SXTextView *textView;
  SXTextView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SXTextComponentView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(SXTextView);
    textView = self->_textView;
    self->_textView = v4;

    v6 = self->_textView;
    -[SXTextComponentView absoluteTextViewFrame](self, "absoluteTextViewFrame");
    -[SXTextView setFrameInCanvas:](v6, "setFrameInCanvas:");
    -[SXTextView setDelegate:](self->_textView, "setDelegate:", self);
    -[SXComponentView component](self, "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textRules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextView setIsSelectable:](self->_textView, "setIsSelectable:", objc_msgSend(v9, "isSelectable"));

    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tangierController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextComponentView textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didStartPresentingTextView:", v11);

  }
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXTextComponentView;
  v7 = a4;
  -[SXComponentView receivedInfo:fromLayoutingPhaseWithIdentifier:](&v10, sel_receivedInfo_fromLayoutingPhaseWithIdentifier_, v6, v7);
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("TextLayouter"), v10.receiver, v10.super_class);

  if (v8)
  {
    -[SXTextComponentView setupTextView](self, "setupTextView");
    -[SXTextComponentView textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextLayouter:", v6);

  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat width;
  CGFloat height;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;
  CGPoint v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  y = a3.y;
  x = a3.x;
  v39 = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)SXTextComponentView;
  v7 = -[SXTextComponentView pointInside:withEvent:](&v37, sel_pointInside_withEvent_, a4);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[SXTextComponentView textView](self, "textView", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLayouter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exclusionPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = *(double **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[SXTextExclusionPath path](v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bounds");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v25 = -[SXTextExclusionPath actualPosition]((uint64_t)v15);
        -[SXTextExclusionPath actualPosition]((uint64_t)v15);
        v27 = v26;
        v41.origin.x = v18;
        v41.origin.y = v20;
        v41.size.width = v22;
        v41.size.height = v24;
        v42 = CGRectOffset(v41, v25, v27);
        v28 = v42.origin.x;
        v29 = v42.origin.y;
        width = v42.size.width;
        height = v42.size.height;

        v43.origin.x = v28;
        v43.origin.y = v29;
        v43.size.width = width;
        v43.size.height = height;
        v40.x = x;
        v40.y = y;
        if (CGRectContainsPoint(v43, v40))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (CGRect)absoluteTextViewFrame
{
  double MinX;
  void *v4;
  double v5;
  double v6;
  double MinY;
  void *v8;
  double v9;
  double v10;
  CGFloat Width;
  CGFloat Height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  MinX = CGRectGetMinX(v17);
  -[SXComponentView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = MinX + CGRectGetMinX(v18);
  -[SXComponentView contentFrame](self, "contentFrame");
  v6 = v5 + CGRectGetMinX(v19);
  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  MinY = CGRectGetMinY(v20);
  -[SXComponentView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v9 = MinY + CGRectGetMinY(v21);
  -[SXComponentView contentFrame](self, "contentFrame");
  v10 = v9 + CGRectGetMinY(v22);
  -[SXComponentView contentFrame](self, "contentFrame");
  Width = CGRectGetWidth(v23);
  -[SXComponentView contentFrame](self, "contentFrame");
  Height = CGRectGetHeight(v24);

  v13 = v6;
  v14 = v10;
  v15 = Width;
  v16 = Height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)textSource
{
  void *v2;
  void *v3;

  -[SXTextComponentView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)animationDidStart:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  -[SXComponentView animationDidStart:](&v5, sel_animationDidStart_, a3);
  -[SXTextComponentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMightBeVisuallyMisplaced:", 1);

}

- (void)animationDidFinish:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  -[SXComponentView animationDidFinish:](&v5, sel_animationDidFinish_, a3);
  -[SXTextComponentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMightBeVisuallyMisplaced:", 0);

}

- (void)didApplyBehavior:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXTextComponentView;
  -[SXComponentView didApplyBehavior:](&v6, sel_didApplyBehavior_);
  -[SXTextComponentView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMightBeVisuallyMisplaced:", a3 != 0);

}

- (BOOL)userInteractable
{
  return 0;
}

- (id)componentIdentifierForTextView:(id)a3
{
  void *v3;
  void *v4;

  -[SXComponentView component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)textRulesForTextView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentView component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityCustomRotorMembershipForTextView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentView component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityCustomRotorMembership");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityContextualLabelForTextView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentView component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityContextualLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)provideInfosLayoutTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXTextComponentView textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provideInfosLayoutTo:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  -[SXComponentView setHighlighted:](&v5, sel_setHighlighted_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__SXTextComponentView_setHighlighted___block_invoke;
  v4[3] = &unk_24D6874A8;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v4);
}

void __38__SXTextComponentView_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  CGRect v6;
  CGRect v7;

  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 5.0);

  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v7 = CGRectInset(v6, -10.0, -10.0);
  objc_msgSend(v5, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);

}

- (SXTangierController)tangierController
{
  return (SXTangierController *)objc_loadWeakRetained((id *)&self->_tangierController);
}

- (SXTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (CGSize)calculatedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_calculatedSize.width;
  height = self->_calculatedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCalculatedSize:(CGSize)a3
{
  self->_calculatedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak((id *)&self->_tangierController);
}

@end
