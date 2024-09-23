@implementation _UIKeyboardPopover

- (_UIKeyboardPopover)initWithPopoverView:(id)a3
{
  id v5;
  _UIKeyboardPopover *v6;
  _UIKeyboardPopover *v7;
  id *p_popoverView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_UIKeyboardPopover;
  v6 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_popoverView = (id *)&v6->_popoverView;
    objc_storeStrong((id *)&v6->_popoverView, a3);
    -[UIView addSubview:](v7, "addSubview:", *p_popoverView);
    objc_msgSend(*p_popoverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*p_popoverView, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v7, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    objc_msgSend(*p_popoverView, "leftAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](v7, "leftAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    objc_msgSend(*p_popoverView, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v7, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    objc_msgSend(*p_popoverView, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v7, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

  }
  return v7;
}

- (int)textEffectsVisibilityLevel
{
  return 7;
}

- (int)textEffectsVisibilityLevelInKeyboardWindow
{
  return 7;
}

- (void)_setRenderConfig:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[UIKeyboardPopoverContainer borderColor](UIKeyboardPopoverContainer, "borderColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[_UIPopoverView contentView](self->_popoverView, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderColor:", v6);

  -[_UIPopoverView contentView](self->_popoverView, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setRenderConfig:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverView, 0);
}

@end
