@implementation SKUICommentPostBarView

- (SKUICommentPostBarView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUICommentPostBarView *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  SKUICommentPostBarTextField *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  SKUICommentPostBarTextField *postTextField;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  UIButton *postButton;
  void *v29;
  void *v30;
  UIButton *v31;
  void *v32;
  UIButton *v33;
  void *v34;
  objc_super v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICommentPostBarView initWithFrame:].cold.1();
  }
  v36.receiver = self;
  v36.super_class = (Class)SKUICommentPostBarView;
  v8 = -[SKUICommentPostBarView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICommentPostBarView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.835294118, 0.839215686, 0.850980392, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = 1.0 / v12;

    -[SKUICommentPostBarView bounds](v8, "bounds");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v14, v13);
    objc_msgSend(v15, "setAutoresizingMask:", 2);
    objc_msgSend(v15, "setBackgroundColor:", v10);
    -[SKUICommentPostBarView addSubview:](v8, "addSubview:", v15);
    v16 = [SKUICommentPostBarTextField alloc];
    v17 = *MEMORY[0x1E0C9D648];
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v21 = -[SKUICommentPostBarTextField initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], v18, v19, v20);
    postTextField = v8->_postTextField;
    v8->_postTextField = (SKUICommentPostBarTextField *)v21;

    -[SKUICommentPostBarTextField setDelegate:](v8->_postTextField, "setDelegate:", v8);
    -[SKUICommentPostBarTextField layer](v8->_postTextField, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderWidth:", 1.0);

    -[SKUICommentPostBarTextField layer](v8->_postTextField, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", 5.0);

    -[SKUICommentPostBarTextField layer](v8->_postTextField, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_retainAutorelease(v10);
    objc_msgSend(v25, "setBorderColor:", objc_msgSend(v26, "CGColor"));

    -[SKUICommentPostBarView addSubview:](v8, "addSubview:", v8->_postTextField);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", v17, v18, v19, v20);
    postButton = v8->_postButton;
    v8->_postButton = (UIButton *)v27;

    -[UIButton titleLabel](v8->_postButton, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 16.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFont:", v30);

    v31 = v8->_postButton;
    -[SKUICommentPostBarView tintColor](v8, "tintColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v31, "setTitleColor:forState:", v32, 0);

    v33 = v8->_postButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v33, "setTitleColor:forState:", v34, 2);

    -[UIButton addTarget:action:forControlEvents:](v8->_postButton, "addTarget:action:forControlEvents:", v8, sel__post_, 64);
    -[UIButton setEnabled:](v8->_postButton, "setEnabled:", 0);
    -[SKUICommentPostBarView addSubview:](v8, "addSubview:", v8->_postButton);

  }
  return v8;
}

- (void)_post:(id)a3
{
  -[SKUICommentPostBarView _postComment](self, "_postComment", a3);
  -[SKUICommentPostBarView resignFirstResponder](self, "resignFirstResponder");
}

- (void)_changeCommenter:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SKUICommentPostBarView delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[SKUICommentPostBarView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EF4A1610);

    if (v7)
    {
      -[SKUICommentPostBarView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "commentPostBarView:changeCommenter:", self, v9);

    }
  }

}

- (void)setAsText:(id)a3
{
  NSString *v5;
  NSString **p_asText;
  NSString *asText;
  NSString *v8;
  void *v9;
  NSString *v10;

  v5 = (NSString *)a3;
  p_asText = &self->_asText;
  asText = self->_asText;
  v8 = v5;
  v10 = v5;
  if (asText != v5)
  {
    if ((-[NSString isEqual:](asText, "isEqual:", v5) & 1) == 0)
      objc_storeStrong((id *)&self->_asText, a3);
    v8 = *p_asText;
    v5 = v10;
  }
  if (v8)
  {
    -[SKUICommentPostBarView _asLabel](self, "_asLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", *p_asText);

    v5 = v10;
  }

}

- (void)setPlaceholderText:(id)a3
{
  -[SKUICommentPostBarTextField setPlaceholder:](self->_postTextField, "setPlaceholder:", a3);
}

- (void)setPostButtonText:(id)a3
{
  -[UIButton setTitle:forState:](self->_postButton, "setTitle:forState:", a3, 0);
}

- (void)setText:(id)a3
{
  -[SKUICommentPostBarTextField setText:](self->_postTextField, "setText:", a3);
}

- (void)setCommenter:(id)a3
{
  NSString *v5;
  NSString *commenter;
  char v7;
  void *v8;
  NSString *v9;

  v5 = (NSString *)a3;
  commenter = self->_commenter;
  if (commenter != v5)
  {
    v9 = v5;
    v7 = -[NSString isEqual:](commenter, "isEqual:", v5);
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_commenter, a3);
      -[SKUICommentPostBarView _asNameButton](self, "_asNameButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:forState:", self->_commenter, 0);

      -[SKUICommentPostBarView setNeedsLayout](self, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (void)setPostButtonVisible:(BOOL)a3
{
  -[UIButton setHidden:](self->_postButton, "setHidden:", !a3);
  -[SKUICommentPostBarView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("\n"));
  if (v11)
  {
    -[SKUICommentPostBarView _postComment](self, "_postComment");
  }
  else
  {
    objc_msgSend(v9, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setEnabled:](self->_postButton, "setEnabled:", objc_msgSend(v13, "length") != 0);
  }

  return v11 ^ 1;
}

- (BOOL)becomeFirstResponder
{
  return -[SKUICommentPostBarTextField becomeFirstResponder](self->_postTextField, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return -[SKUICommentPostBarTextField canBecomeFirstResponder](self->_postTextField, "canBecomeFirstResponder");
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double Width;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  float v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MinX;
  double v43;
  double v44;
  double v45;
  float v46;
  double v47;
  double v48;
  CGFloat v49;
  UIButton *postButton;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  float v60;
  double v61;
  objc_super v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v62.receiver = self;
  v62.super_class = (Class)SKUICommentPostBarView;
  -[SKUICommentPostBarView layoutSubviews](&v62, sel_layoutSubviews);
  if (self->_commenter)
  {
    v3 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SKUICommentPostBarView semanticContentAttribute](self, "semanticContentAttribute"));
    -[SKUICommentPostBarView _asLabel](self, "_asLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    -[SKUICommentPostBarView _asNameButton](self, "_asNameButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[SKUICommentPostBarView _asLabel](self, "_asLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;

    -[SKUICommentPostBarView _asLabel](self, "_asLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICommentPostBarView bounds](self, "bounds");
    objc_msgSend(v11, "sizeThatFits:", v12, v13);
    v15 = v14;
    v17 = v16;

    if (v3)
    {
      -[SKUICommentPostBarView bounds](self, "bounds");
      Width = CGRectGetWidth(v63);
      v64.origin.x = v8;
      v64.origin.y = v10;
      v64.size.width = v15;
      v64.size.height = v17;
      v19 = Width - CGRectGetWidth(v64) + -16.0;
    }
    else
    {
      v19 = 16.0;
    }
    v24 = (30.0 - v17) * 0.5;
    v25 = ceilf(v24) + 2.0;
    -[SKUICommentPostBarView _asLabel](self, "_asLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v19, v25, v15, v17);

    -[SKUICommentPostBarView _asNameButton](self, "_asNameButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v29 = v28;
    v31 = v30;

    if (v3)
    {
      v65.origin.x = v19;
      v65.origin.y = v25;
      v65.size.width = v15;
      v65.size.height = v17;
      v32 = CGRectGetMinX(v65) + -5.0;
    }
    else
    {
      -[SKUICommentPostBarView bounds](self, "bounds");
      v33 = CGRectGetWidth(v66);
      v67.origin.x = v19;
      v67.origin.y = v25;
      v67.size.width = v15;
      v67.size.height = v17;
      v32 = v33 - (CGRectGetMaxX(v67) + 5.0);
    }
    -[UIButton sizeThatFits:](self->_asNameButton, "sizeThatFits:", v32, 30.0);
    v35 = v34;
    v37 = v36;
    v38 = v19;
    v39 = v25;
    v40 = v15;
    v41 = v17;
    if (v3)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v38);
      v68.origin.x = v29;
      v68.origin.y = v31;
      v68.size.width = v35;
      v68.size.height = v37;
      v43 = MinX - CGRectGetWidth(v68);
      v44 = -6.0;
    }
    else
    {
      v43 = CGRectGetMaxX(*(CGRect *)&v38) + 5.0;
      v44 = 1.0;
    }
    v45 = v43 + v44;
    v22 = 30.0;
    v46 = (30.0 - v37) * 0.5;
    v47 = ceilf(v46) + 2.0;
    -[SKUICommentPostBarView _asNameButton](self, "_asNameButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v45, v47, v35, v37);
    v23 = 40.0;
  }
  else
  {
    -[SKUICommentPostBarView _asLabel](self, "_asLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 1);

    -[SKUICommentPostBarView _asNameButton](self, "_asNameButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 1);
    v22 = 1.0;
    v23 = 45.0;
  }

  v48 = 30.0;
  if ((-[UIButton isHidden](self->_postButton, "isHidden") & 1) == 0)
  {
    v49 = *MEMORY[0x1E0C9D648];
    postButton = self->_postButton;
    -[SKUICommentPostBarView bounds](self, "bounds");
    -[UIButton sizeThatFits:](postButton, "sizeThatFits:", v51, v52);
    v54 = v53;
    v56 = v55;
    *(float *)&v53 = (v23 - v55) * 0.5;
    v57 = v22 + floorf(*(float *)&v53);
    -[SKUICommentPostBarView bounds](self, "bounds");
    v58 = CGRectGetWidth(v69);
    v70.origin.x = v49;
    v70.origin.y = v57;
    v70.size.width = v54;
    v70.size.height = v56;
    v59 = v58 - (CGRectGetWidth(v70) + 15.0);
    -[UIButton setFrame:](self->_postButton, "setFrame:", v59, v57, v54, v56);
    v71.origin.x = v59;
    v71.origin.y = v57;
    v71.size.width = v54;
    v71.size.height = v56;
    v48 = CGRectGetWidth(v71) + 15.0 + 30.0;
  }
  v60 = (v23 + -28.0) * 0.5;
  v61 = v22 + floorf(v60);
  -[SKUICommentPostBarView bounds](self, "bounds");
  -[SKUICommentPostBarTextField setFrame:](self->_postTextField, "setFrame:", 15.0, v61, CGRectGetWidth(v72) - v48, 28.0);
}

- (BOOL)resignFirstResponder
{
  SKUICommentPostBarTextField *postTextField;
  objc_super v5;

  postTextField = self->_postTextField;
  if (postTextField)
    -[SKUICommentPostBarTextField resignFirstResponder](postTextField, "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)SKUICommentPostBarView;
  return -[SKUICommentPostBarView resignFirstResponder](&v5, sel_resignFirstResponder);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = dbl_1BBED21B0[self->_commenter == 0];
  result.height = v3;
  return result;
}

- (void)tintColorDidChange
{
  UIButton *asNameButton;
  void *v4;
  UIButton *postButton;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUICommentPostBarView;
  -[SKUICommentPostBarView tintColorDidChange](&v7, sel_tintColorDidChange);
  asNameButton = self->_asNameButton;
  if (asNameButton)
  {
    -[SKUICommentPostBarView tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](asNameButton, "setTintColor:", v4);

  }
  postButton = self->_postButton;
  if (postButton)
  {
    -[SKUICommentPostBarView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](postButton, "setTitleColor:forState:", v6, 0);

  }
}

- (id)_asNameButton
{
  UIButton *asNameButton;
  id v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;

  asNameButton = self->_asNameButton;
  if (!asNameButton)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3518]);
    v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_asNameButton;
    self->_asNameButton = v5;

    -[UIButton titleLabel](self->_asNameButton, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    v9 = self->_asNameButton;
    -[SKUICommentPostBarView tintColor](self, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v9, "setTitleColor:forState:", v10, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_asNameButton, "addTarget:action:forControlEvents:", self, sel__changeCommenter_, 64);
    -[SKUICommentPostBarView addSubview:](self, "addSubview:", self->_asNameButton);
    -[SKUICommentPostBarView setNeedsLayout](self, "setNeedsLayout");
    asNameButton = self->_asNameButton;
  }
  return asNameButton;
}

- (id)_asLabel
{
  UILabel *asLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;

  asLabel = self->_asLabel;
  if (!asLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_asLabel;
    self->_asLabel = v5;

    v7 = self->_asLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_asLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[SKUICommentPostBarView addSubview:](self, "addSubview:", self->_asLabel);
    asLabel = self->_asLabel;
  }
  return asLabel;
}

- (void)_postComment
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[SKUICommentPostBarTextField text](self->_postTextField, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    -[SKUICommentPostBarView delegate](self, "delegate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[SKUICommentPostBarView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EF4A1610);

      if (v6)
      {
        -[SKUICommentPostBarView delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "commentPostBarView:text:as:", self, v8, self->_commenter);

      }
    }
  }

}

- (NSString)commenter
{
  return self->_commenter;
}

- (SKUICommentDelegate)delegate
{
  return (SKUICommentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asText, 0);
  objc_storeStrong((id *)&self->_asNameButton, 0);
  objc_storeStrong((id *)&self->_asLabel, 0);
  objc_storeStrong((id *)&self->_commenter, 0);
  objc_storeStrong((id *)&self->_postTextField, 0);
  objc_storeStrong((id *)&self->_postButton, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICommentPostBarView initWithFrame:]";
}

@end
