@implementation _UIDocumentUnavailablePageBackgroundAccessoryView

- (_UIDocumentUnavailablePageBackgroundAccessoryView)initWithFrame:(CGRect)a3
{
  _UIDocumentUnavailablePageBackgroundAccessoryView *v3;
  _UIDocumentUnavailablePageView *v4;
  _UIDocumentUnavailablePageView *leftView;
  _UIDocumentUnavailablePageView *v6;
  _UIDocumentUnavailablePageView *rightView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentUnavailablePageBackgroundAccessoryView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_UIDocumentUnavailablePageView);
    leftView = v3->_leftView;
    v3->_leftView = v4;

    v6 = objc_alloc_init(_UIDocumentUnavailablePageView);
    rightView = v3->_rightView;
    v3->_rightView = v6;

    -[UIView addSubview:](v3, "addSubview:", v3->_leftView);
    -[UIView addSubview:](v3, "addSubview:", v3->_rightView);
  }
  return v3;
}

- (unsigned)_layoutPageViews
{
  unsigned __int8 *v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double Width;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGRect v43;
  CGRect v44;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "bounds");
    v3 = v2;
    v5 = v4;
    v41 = v7;
    v42 = v6;
    v8 = *((double *)v1 + 55);
    v40 = *((double *)v1 + 56);
    objc_msgSend(v1, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "horizontalSizeClass");

    objc_msgSend(v1, "safeAreaInsets");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v1, "layoutMargins");
    v17 = v16;
    v19 = v18;
    v20 = v1[432];
    if (v10 == 1)
      v21 = 12.0;
    else
      v21 = 24.0;
    v38 = v3;
    v39 = v5;
    if (v10 == 1)
    {
      v43.origin.x = v3;
      v43.origin.y = v5;
      v22 = v15;
      v43.size.height = v41;
      v43.size.width = v42;
      v37 = v12;
      v23 = v17;
      Width = CGRectGetWidth(v43);
      v17 = v23;
      v15 = v22;
      v26 = v1[432];
      v25 = 30.0;
    }
    else
    {
      Width = 100.0;
      v25 = 56.0;
      v26 = v1[432];
    }
    v27 = v19 - v21 - v12;
    if (v27 >= Width)
      v27 = Width;
    v28 = v15;
    v29 = v15 - v21 - v14;
    if (v29 < Width)
      Width = v29;
    if (v20)
    {
      v30 = Width;
    }
    else
    {
      v27 = 0.0;
      v30 = 0.0;
    }
    v31 = 0.4;
    if (v26)
      v31 = 1.0;
    v32 = v25 * v31;
    v33 = v8 * 0.5 + v19 - v27;
    v34 = v40 * 0.5 + v17 + v32;
    objc_msgSend(*((id *)v1 + 52), "setCenter:", v33, v34, *(_QWORD *)&v37);
    v35 = *MEMORY[0x1E0C9D538];
    v36 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(*((id *)v1 + 52), "setBounds:", *MEMORY[0x1E0C9D538], v36, v8, v40);
    v44.origin.x = v38;
    v44.origin.y = v39;
    v44.size.height = v41;
    v44.size.width = v42;
    objc_msgSend(*((id *)v1 + 53), "setCenter:", v8 * 0.5 + v30 + CGRectGetWidth(v44) - v28 - v8, v34);
    return (unsigned __int8 *)objc_msgSend(*((id *)v1 + 53), "setBounds:", v35, v36, v8, v40);
  }
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentUnavailablePageBackgroundAccessoryView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIDocumentUnavailablePageBackgroundAccessoryView _layoutPageViews]((unsigned __int8 *)self);
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentUnavailablePageBackgroundAccessoryView;
  -[UIView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentUnavailablePageBackgroundAccessoryView;
  -[UIView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
}

@end
