@implementation _UIInputViewContent

- (void)set_unclippableCorners:(unint64_t)a3
{
  self->_unclippableCorners = a3;
}

- (_UIInputViewContent)initWithFrame:(CGRect)a3 inputView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _UIInputViewContent *v11;
  _UIInputViewContent *v12;
  _UIInputViewContent *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIInputViewContent;
  v11 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputView, a4);
    v13 = v12;
  }

  return v12;
}

- (void)_updateCornerClipping
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  CGPath *Mutable;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  id v17;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMask:", 0);

  LODWORD(v3) = -[UIView _clipCorners](self, "_clipCorners");
  -[UIInputView _additionalClipHeight](self->_inputView, "_additionalClipHeight");
  v5 = v3 & ~LODWORD(self->_unclippableCorners) & 3;
  if (v5)
  {
    v6 = v4;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferencesActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rivenSizeFactor:", 10.0);
    v10 = v9;

    Mutable = CGPathCreateMutable();
    -[UIView bounds](self, "bounds");
    v13 = v12;
    -[UIView bounds](self, "bounds");
    UIKBAddRoundedRectToPath(Mutable, v5, 0, 0.0, 0.0, v13, v6 + v14, v10);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPath:", Mutable);
    +[UIColor blackColor](UIColor, "blackColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v17, "setFillColor:", objc_msgSend(v15, "CGColor"));

    CGPathRelease(Mutable);
    -[UIView layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMask:", v17);

  }
}

- (void)_setToolbarBackgroundViewWithImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  UIImageView *v8;
  id v9;

  v9 = a3;
  if (-[_UIInputViewContent _isToolbar](self, "_isToolbar"))
  {
    -[UIView subviews](self, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "_backgroundView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v6, "image"), v7 = (id)objc_claimAutoreleasedReturnValue(), v7, v7 != v9))
      {
        v8 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v9);

        -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
        v6 = v8;
      }
      objc_msgSend(v5, "_setBackgroundView:", v6);
      if (v6)
      {
        objc_msgSend(v5, "bounds");
        objc_msgSend(v6, "setFrame:");

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(v5, "_setBackgroundView:", 0);
    }
    objc_msgSend(v5, "setNeedsLayout");
    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)_isToolbar
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;

  -[UIView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[UIView subviews](self, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_setToolbarBackgroundImage:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v10;
  double x;
  double y;
  double width;
  double height;
  void *v15;
  id v16;
  CGRect v17;

  v16 = a3;
  if (-[_UIInputViewContent _isToolbar](self, "_isToolbar"))
  {
    -[UIView subviews](self, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setBackgroundImage:forToolbarPosition:barMetrics:", v16, 0, 0);
    objc_msgSend(v5, "bounds");
    v10 = 1.0;
    if (!v16)
      v10 = 0.0;
    v17 = CGRectOffset(*(CGRect *)&v6, 0.0, v10);
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    objc_msgSend(v5, "_backgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", x, y, width, height);

  }
}

- (CGSize)_sizeFittingContentViews
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  CGSize result;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[UIView subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47___UIInputViewContent__sizeFittingContentViews__block_invoke;
  v7[3] = &unk_1E16CD658;
  v7[4] = &v12;
  v7[5] = &v8;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);

  v3 = v13[3];
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)addSubview:(id)a3
{
  double contentWidth;
  double contentHeight;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIInputViewContent;
  -[UIView addSubview:](&v9, sel_addSubview_, a3);
  contentWidth = self->_contentWidth;
  contentHeight = self->_contentHeight;
  -[_UIInputViewContent _sizeFittingContentViews](self, "_sizeFittingContentViews");
  if (v6 != contentWidth || v7 != contentHeight)
  {
    self->_contentWidth = v6;
    self->_contentHeight = v7;
    -[UIInputView _setNeedsContentSizeUpdate](self->_inputView, "_setNeedsContentSizeUpdate");
  }
}

- (CGSize)_contentSize
{
  double contentWidth;
  double contentHeight;
  CGSize result;

  contentWidth = self->_contentWidth;
  contentHeight = self->_contentHeight;
  result.height = contentHeight;
  result.width = contentWidth;
  return result;
}

- (unint64_t)_unclippableCorners
{
  return self->_unclippableCorners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputView, 0);
}

@end
