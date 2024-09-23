@implementation _UINavBarPrompt

- (_UINavBarPrompt)initWithNavBar:(id)a3
{
  id v4;
  _UINavBarPrompt *v5;
  _UINavBarPrompt *v6;
  UILabel *v7;
  UILabel *label;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UINavBarPrompt;
  v5 = -[UIView init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_navBar, v4);
    v7 = objc_alloc_init(UILabel);
    label = v6->_label;
    v6->_label = v7;

    -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    -[UIView setContentMode:](v6, "setContentMode:", 3);
    -[UIView setOpaque:](v6->_label, "setOpaque:", 0);
    v10 = v6->_label;
    +[UIColor clearColor](UIColor, "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = v6->_label;
    -[_UINavBarPrompt _labelFrame](v6, "_labelFrame");
    -[UILabel setFrame:](v12, "setFrame:");
  }

  return v6;
}

- (void)setPrompt:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_label, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UILabel setText:](self->_label, "setText:", v6);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (NSString)prompt
{
  return -[UILabel text](self->_label, "text");
}

- (CGRect)_labelFrame
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navBar);
  objc_msgSend(WeakRetained, "_currentVisualStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v12 = v11;
  v14 = v13;
  v15 = v6 + round((v10 - v11) * 0.5);
  if (v15 >= 0.0)
    v16 = v15;
  else
    v16 = 0.0;
  objc_msgSend(v4, "promptTextOffset");
  v18 = v8 + v17;

  v19 = v16;
  v20 = v18;
  v21 = v12;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)promptBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_label, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)_updateLabelTextColorAndFontReturningShadowOffset
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navBar);
  objc_msgSend(WeakRetained, "_appearanceStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_currentVisualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)off_1E1678D90);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "pointSize");
    if (v9 == 0.0)
    {
      objc_msgSend(v5, "promptFontSize");
    }
    else
    {
      objc_msgSend(v8, "pointSize");
      v13 = v12;
      objc_msgSend(v5, "promptFontSize");
      v15 = v13 * v14;
      objc_msgSend(v5, "headingFontSize");
      v10 = round(v15 / v16);
    }
    objc_msgSend(v8, "fontWithSize:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UINavigationBar defaultPromptFont](UINavigationBar, "defaultPromptFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((unint64_t)(objc_msgSend(WeakRetained, "barStyle") - 3) > 0xFFFFFFFFFFFFFFFDLL)
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)off_1E1678D98);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v17;
  v21 = v20;

  objc_msgSend(v6, "objectForKey:", *(_QWORD *)off_1E1679048);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "shadowColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shadowOffset");
    v26 = v25;
    v28 = v27;
  }
  else
  {
    v24 = 0;
    v26 = *MEMORY[0x1E0C9D820];
    v28 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[UILabel setTextColor:](self->_label, "setTextColor:", v21);
  if (v24)
    -[UILabel setShadowColor:](self->_label, "setShadowColor:", v24);
  -[UILabel setFont:](self->_label, "setFont:", v11);

  v29 = v26;
  v30 = v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  UILabel *label;
  _QWORD v9[5];

  -[_UINavBarPrompt _updateLabelTextColorAndFontReturningShadowOffset](self, "_updateLabelTextColorAndFontReturningShadowOffset");
  v4 = v3;
  v6 = v5;
  -[UIView superview](self->_label, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    label = self->_label;
    -[_UINavBarPrompt _labelFrame](self, "_labelFrame");
    -[UILabel setFrame:](label, "setFrame:");
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33___UINavBarPrompt_layoutSubviews__block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
  }
  -[UIView addSubview:](self, "addSubview:", self->_label);
  -[UILabel setShadowOffset:](self->_label, "setShadowOffset:", v4, v6);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navBar);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
