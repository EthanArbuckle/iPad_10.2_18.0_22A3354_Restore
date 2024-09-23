@implementation MTGenericSettingsFooterLabelView

- (MTGenericSettingsFooterLabelView)init
{
  MTGenericSettingsFooterLabelView *v2;
  MTGenericSettingsFooterLabelView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTGenericSettingsFooterLabelView;
  v2 = -[MTGenericSettingsFooterLabelView init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[MTGenericSettingsFooterLabelView _setupLabel](v2, "_setupLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTGenericSettingsFooterLabelView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](v3, "textView"));
    objc_msgSend(v5, "setDelegate:", v3);

  }
  return v3;
}

+ (double)labelInset
{
  return 12.0;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double x;
  double y;
  double width;
  double height;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxX;
  double v29;
  double v30;
  void *v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v32.receiver = self;
  v32.super_class = (Class)MTGenericSettingsFooterLabelView;
  -[MTGenericSettingsFooterLabelView layoutSubviews](&v32, "layoutSubviews");
  -[MTGenericSettingsFooterLabelView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend((id)objc_opt_class(self), "labelInset");
  v12 = v11;
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  v34 = CGRectInset(v33, v12, 0.0);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  objc_msgSend(v17, "setFrame:", x, y, width, height);

  if (-[MTGenericSettingsFooterLabelView topAlignLabel](self, "topAlignLabel"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
    objc_msgSend(v18, "sizeToFit");

  }
  if (-[MTGenericSettingsFooterLabelView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
    objc_msgSend(v19, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    -[MTGenericSettingsFooterLabelView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v35);
    v36.origin.x = v21;
    v36.origin.y = v23;
    v36.size.width = v25;
    v36.size.height = v27;
    v29 = MaxX - CGRectGetWidth(v36);
    v37.origin.x = v21;
    v37.origin.y = v23;
    v37.size.width = v25;
    v37.size.height = v27;
    v30 = v29 - CGRectGetMinX(v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
    objc_msgSend(v31, "setFrame:", v30, v23, v25, v27);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTGenericSettingsFooterLabelView;
  -[MTGenericSettingsFooterLabelView traitCollectionDidChange:](&v3, "traitCollectionDidChange:", a3);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSString *v6;
  void *v7;

  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "absoluteString", a3));

  if (v6 == UIApplicationOpenSettingsURLString)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v7, "openGlobalSettings");

  }
  return v6 != UIApplicationOpenSettingsURLString;
}

- (void)_setupLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init((Class)UITextView);
  -[MTGenericSettingsFooterLabelView setTextView:](self, "setTextView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  -[MTGenericSettingsFooterLabelView addSubview:](self, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  objc_msgSend(v5, "setTextAlignment:", 4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  objc_msgSend(v6, "setEditable:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  objc_msgSend(v7, "setScrollEnabled:", 0);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  objc_msgSend(v8, "setBackgroundColor:", v9);

}

- (void)_updateColors
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc((Class)NSMutableAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedText"));
  v10 = objc_msgSend(v3, "initWithAttributedString:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedFooterConfiguration](UIListContentConfiguration, "groupedFooterConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolvedColor"));
  objc_msgSend(v10, "addAttribute:value:range:", NSForegroundColorAttributeName, v8, 0, objc_msgSend(v10, "length"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  objc_msgSend(v9, "setAttributedText:", v10);

}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (BOOL)topAlignLabel
{
  return self->_topAlignLabel;
}

- (void)setTopAlignLabel:(BOOL)a3
{
  self->_topAlignLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
