@implementation SXButtonComponentView

- (SXButtonComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  SXButtonComponentView *v6;
  SXTextView *v7;
  SXTextView *textView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SXButtonComponentView;
  v6 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v11, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = objc_alloc_init(SXTextView);
    textView = v6->_textView;
    v6->_textView = v7;

    -[SXTextView setDelegate:](v6->_textView, "setDelegate:", v6);
    -[SXComponentView contentView](v6, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v6->_textView);

    -[SXButtonComponentView setIsAccessibilityElement:](v6, "setIsAccessibilityElement:", 1);
    -[SXButtonComponentView setAccessibilityTraits:](v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  }
  return v6;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[SXButtonComponentView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[SXButtonComponentView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v9.receiver = self;
  v9.super_class = (Class)SXButtonComponentView;
  -[SXButtonComponentView accessibilityUserInputLabels](&v9, sel_accessibilityUserInputLabels);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[SXButtonComponentView accessibilityLabel](self, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  -[SXButtonComponentView accessibilityValue](self, "accessibilityValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "addObject:", v7);

  return v5;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  objc_super v8;

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "accessibilityShouldHandleInteractionForView:", self);

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SXButtonComponentView;
    return -[SXButtonComponentView accessibilityActivate](&v8, sel_accessibilityActivate);
  }
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[SXButtonComponentView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)presentComponentWithChanges:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SXButtonComponentView;
  -[SXComponentView presentComponentWithChanges:](&v16, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXButtonComponentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentFrame](self, "contentFrame");
  v6 = v5;
  -[SXComponentView contentFrame](self, "contentFrame");
  v8 = v7;
  -[SXButtonComponentView typographicBounds](self, "typographicBounds");
  v10 = v8 - v9;
  -[SXComponentView contentFrame](self, "contentFrame");
  v12 = v11;
  -[SXComponentView contentFrame](self, "contentFrame");
  objc_msgSend(v4, "setFrame:", v6, v10, v12);

  -[SXButtonComponentView textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXButtonComponentView absoluteTextViewFrame](self, "absoluteTextViewFrame");
  objc_msgSend(v13, "setFrameInCanvas:");

  -[SXButtonComponentView textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  objc_msgSend(v14, "setParentFrame:");

  -[SXButtonComponentView textView](self, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");

}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXButtonComponentView;
  -[SXButtonComponentView didMoveToSuperview](&v7, sel_didMoveToSuperview);
  -[SXButtonComponentView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tangierController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXButtonComponentView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v5, "didStartPresentingTextView:", v6);
  else
    objc_msgSend(v5, "didStopPresentingTextView:", v6);

}

- (void)setAbsoluteFrame:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXButtonComponentView;
  -[SXComponentView setAbsoluteFrame:](&v5, sel_setAbsoluteFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SXButtonComponentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXButtonComponentView absoluteTextViewFrame](self, "absoluteTextViewFrame");
  objc_msgSend(v4, "setFrameInCanvas:");

}

- (void)setPresentationFrame:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXButtonComponentView;
  -[SXComponentView setPresentationFrame:](&v5, sel_setPresentationFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SXButtonComponentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXButtonComponentView absoluteTextViewFrame](self, "absoluteTextViewFrame");
  objc_msgSend(v4, "setFrameInCanvas:");

}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SXButtonComponentView;
  -[SXComponentView receivedInfo:fromLayoutingPhaseWithIdentifier:](&v9, sel_receivedInfo_fromLayoutingPhaseWithIdentifier_, v6, v7);
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("TextLayouter")))
  {
    -[SXButtonComponentView textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextLayouter:", v6);

  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("TypographicBounds")))
  {
    objc_msgSend(v6, "CGRectValue");
    -[SXButtonComponentView setTypographicBounds:](self, "setTypographicBounds:");
  }

}

- (void)provideInfosLayoutTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXButtonComponentView textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provideInfosLayoutTo:", v4);

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

- (SXTextView)textView
{
  return self->_textView;
}

- (CGRect)typographicBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_typographicBounds.origin.x;
  y = self->_typographicBounds.origin.y;
  width = self->_typographicBounds.size.width;
  height = self->_typographicBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTypographicBounds:(CGRect)a3
{
  self->_typographicBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
