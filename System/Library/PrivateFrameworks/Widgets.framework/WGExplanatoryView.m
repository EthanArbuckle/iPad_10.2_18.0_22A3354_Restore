@implementation WGExplanatoryView

- (WGExplanatoryView)initWithGlyph:(id)a3 andExplanation:(id)a4
{
  id v6;
  id v7;
  WGExplanatoryView *v8;
  WGExplanatoryView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WGExplanatoryView;
  v8 = -[WGExplanatoryView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    if (v6)
      -[WGExplanatoryView _configureGlyphViewWithGlyph:](v8, "_configureGlyphViewWithGlyph:", v6);
    if (v7)
      -[WGExplanatoryView _configureExplanationLabelWithExplanation:](v9, "_configureExplanationLabelWithExplanation:", v7);
  }

  return v9;
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  UIImageView *glyphView;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  UILabel *label;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double Width;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double MinX;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  double MaxX;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat recta;
  CGFloat rect;
  objc_super v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v80.receiver = self;
  v80.super_class = (Class)WGExplanatoryView;
  -[WGExplanatoryView layoutSubviews](&v80, sel_layoutSubviews);
  -[WGExplanatoryView _updateVisualStylingIfNecessary](self, "_updateVisualStylingIfNecessary");
  -[WGExplanatoryView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  glyphView = self->_glyphView;
  if (glyphView)
  {
    v12 = CGRectGetWidth(*(CGRect *)&v3) + -16.0;
    v81.origin.x = v7;
    v81.origin.y = v8;
    v81.size.width = v9;
    v81.size.height = v10;
    -[UIImageView sizeThatFits:](glyphView, "sizeThatFits:", v12, CGRectGetHeight(v81));
    BSRectWithSize();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
  }
  else
  {
    v14 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  label = self->_label;
  if (label)
  {
    v82.origin.x = v7;
    v82.origin.y = v8;
    v82.size.width = v9;
    v82.size.height = v10;
    recta = v18;
    v22 = v16;
    v23 = v14;
    v24 = v20;
    Width = CGRectGetWidth(v82);
    v83.origin.x = v23;
    v83.origin.y = v22;
    v83.size.width = recta;
    v83.size.height = v24;
    v26 = Width - CGRectGetWidth(v83) + -8.0 + -16.0;
    v84.origin.x = v7;
    v84.origin.y = v8;
    v84.size.width = v9;
    v84.size.height = v10;
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v26, CGRectGetHeight(v84));
    v85.origin.x = v7;
    v85.origin.y = v8;
    v85.size.width = v9;
    v85.size.height = v10;
    CGRectGetHeight(v85);
    v20 = v24;
    v14 = v23;
    v16 = v22;
    v18 = recta;
    BSRectWithSize();
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
  }
  else
  {
    v28 = *MEMORY[0x24BDBF090];
    v30 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v32 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v34 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v86.origin.x = v14;
  v86.origin.y = v16;
  v86.size.width = v18;
  v86.size.height = v20;
  v76 = v30;
  v77 = v28;
  v74 = v34;
  v75 = v32;
  CGRectUnion(v86, *(CGRect *)&v28);
  v87.size.width = v18;
  v87.origin.x = v14;
  v87.origin.y = v16;
  v87.size.height = v20;
  CGRectGetWidth(v87);
  v88.origin.y = v76;
  v88.origin.x = v77;
  v88.size.height = v74;
  v88.size.width = v75;
  CGRectGetWidth(v88);
  v35 = _WGMainScreenScale();
  UIRectCenteredIntegralRectScale();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  if (self->_glyphView)
  {
    UIRectCenteredYInRectScale();
    rect = v44;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v51 = -[WGExplanatoryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", *(_QWORD *)&v35);
    v52 = v37;
    v53 = v39;
    v54 = v41;
    v55 = v43;
    if (v51)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v52);
      v89.origin.x = rect;
      v89.origin.y = v46;
      v89.size.width = v48;
      v89.size.height = v50;
      MinX = MaxX - CGRectGetWidth(v89);
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v52);
    }
    -[UIImageView setFrame:](self->_glyphView, "setFrame:", MinX, v46, v48, v50);
  }
  if (self->_label)
  {
    v72 = v35;
    UIRectCenteredYInRectScale();
    v58 = v57;
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v65 = -[WGExplanatoryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", *(_QWORD *)&v72);
    v66 = v37;
    v67 = v39;
    v68 = v41;
    v69 = v43;
    if (v65)
    {
      v70 = CGRectGetMinX(*(CGRect *)&v66);
    }
    else
    {
      v71 = CGRectGetMaxX(*(CGRect *)&v66);
      v90.origin.x = v58;
      v90.origin.y = v60;
      v90.size.width = v62;
      v90.size.height = v64;
      v70 = v71 - CGRectGetWidth(v90);
    }
    -[UILabel setFrame:](self->_label, "setFrame:", v70, v60, v62, v64);
  }
}

- (void)willMoveToSuperview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGExplanatoryView;
  -[WGExplanatoryView willMoveToSuperview:](&v4, sel_willMoveToSuperview_, a3);
  -[WGExplanatoryView _invalidateVisualStyling](self, "_invalidateVisualStyling");
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id WeakRetained;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tapGesture);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(MEMORY[0x24BDF6E80]);
    -[WGExplanatoryView addGestureRecognizer:](self, "addGestureRecognizer:", WeakRetained);
    objc_storeWeak((id *)&self->_tapGesture, WeakRetained);
  }
  objc_msgSend(WeakRetained, "addTarget:action:", v7, a4);

}

- (void)_configureGlyphViewWithGlyph:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  UIImageView *v8;
  UIImageView *glyphView;

  if (!self->_glyphView)
  {
    v4 = (objc_class *)MEMORY[0x24BDF6AE8];
    v5 = a3;
    v6 = [v4 alloc];
    objc_msgSend(v5, "imageWithRenderingMode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v7);
    glyphView = self->_glyphView;
    self->_glyphView = v8;

    -[WGExplanatoryView addSubview:](self, "addSubview:", self->_glyphView);
  }
}

- (void)_configureExplanationLabelWithExplanation:(id)a3
{
  objc_class *v4;
  id v5;
  UILabel *v6;
  UILabel *label;
  UILabel *v8;
  void *v9;

  if (!self->_label)
  {
    v4 = (objc_class *)MEMORY[0x24BDF6B68];
    v5 = a3;
    v6 = (UILabel *)objc_alloc_init(v4);
    label = self->_label;
    self->_label = v6;

    v8 = self->_label;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
    -[UILabel setText:](self->_label, "setText:", v5);

    -[WGExplanatoryView addSubview:](self, "addSubview:", self->_label);
  }
}

- (void)_updateVisualStylingIfNecessary
{
  MTVisualStylingProvider *v3;
  MTVisualStylingProvider *visualStylingProvider;

  if (!self->_visualStylingProvider)
  {
    -[WGExplanatoryView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v3 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    visualStylingProvider = self->_visualStylingProvider;
    self->_visualStylingProvider = v3;

    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self->_glyphView, 0);
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self->_label, 0);
  }
}

- (void)_invalidateVisualStyling
{
  MTVisualStylingProvider *visualStylingProvider;

  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_glyphView);
  -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_visualStylingProvider, "stopAutomaticallyUpdatingView:", self->_label);
  visualStylingProvider = self->_visualStylingProvider;
  self->_visualStylingProvider = 0;

  -[WGExplanatoryView setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapGesture);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end
