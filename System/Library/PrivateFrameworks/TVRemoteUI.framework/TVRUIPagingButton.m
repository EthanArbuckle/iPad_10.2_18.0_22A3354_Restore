@implementation TVRUIPagingButton

- (TVRUIPagingButton)initWithTitle:(id)a3 styleProvider:(id)a4
{
  id v6;
  id v7;
  TVRUIPagingButton *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  TVRUIButton *v13;
  TVRUIButton *topButton;
  TVRUIButton *v15;
  TVRUIButton *bottomButton;
  UILabel *v17;
  UILabel *titleLabel;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  objc_super v57;
  _QWORD v58[12];

  v58[10] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v57.receiver = self;
  v57.super_class = (Class)TVRUIPagingButton;
  v8 = -[TVRUIPagingButton initWithFrame:](&v57, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v8)
  {
    objc_msgSend(v7, "buttonBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPagingButton setBackgroundColor:](v8, "setBackgroundColor:", v9);

    objc_msgSend(v7, "secondaryButtonSize");
    v11 = v10 * 0.5;
    -[TVRUIPagingButton layer](v8, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v11);

    v13 = -[TVRUIButton initWithType:hasTapAction:]([TVRUIButton alloc], "initWithType:hasTapAction:", 26, 0);
    topButton = v8->_topButton;
    v8->_topButton = v13;

    -[TVRUIButton setTranslatesAutoresizingMaskIntoConstraints:](v8->_topButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TVRUIPagingButton addSubview:](v8, "addSubview:", v8->_topButton);
    v15 = -[TVRUIButton initWithType:hasTapAction:]([TVRUIButton alloc], "initWithType:hasTapAction:", 27, 0);
    bottomButton = v8->_bottomButton;
    v8->_bottomButton = v15;

    -[TVRUIButton setTranslatesAutoresizingMaskIntoConstraints:](v8->_bottomButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TVRUIPagingButton addSubview:](v8, "addSubview:", v8->_bottomButton);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v17;

    -[UILabel setText:](v8->_titleLabel, "setText:", v6);
    objc_msgSend(v7, "buttonTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8->_titleLabel, "setTextColor:", v19);

    objc_msgSend(v7, "pagingButtonFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_titleLabel, "setFont:", v20);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v8->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[TVRUIPagingButton addSubview:](v8, "addSubview:", v8->_titleLabel);
    v42 = (void *)MEMORY[0x24BDD1628];
    -[TVRUIButton topAnchor](v8->_topButton, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPagingButton topAnchor](v8, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v52;
    -[TVRUIButton centerXAnchor](v8->_topButton, "centerXAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPagingButton centerXAnchor](v8, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v49;
    -[TVRUIButton widthAnchor](v8->_topButton, "widthAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPagingButton widthAnchor](v8, "widthAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v46;
    -[TVRUIButton heightAnchor](v8->_topButton, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton widthAnchor](v8->_topButton, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v43;
    -[UILabel centerXAnchor](v8->_titleLabel, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPagingButton centerXAnchor](v8, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v39;
    -[UILabel centerYAnchor](v8->_titleLabel, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPagingButton centerYAnchor](v8, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v36;
    -[TVRUIButton bottomAnchor](v8->_bottomButton, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPagingButton bottomAnchor](v8, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v58[6] = v33;
    -[TVRUIButton centerXAnchor](v8->_bottomButton, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPagingButton centerXAnchor](v8, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v58[7] = v21;
    -[TVRUIButton heightAnchor](v8->_bottomButton, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton heightAnchor](v8->_topButton, "heightAnchor");
    v56 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v55 = v7;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v58[8] = v24;
    -[TVRUIButton widthAnchor](v8->_bottomButton, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton widthAnchor](v8->_topButton, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v58[9] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v28);

    v7 = v55;
    v6 = v56;

    -[TVRUIButton addTarget:action:forControlEvents:](v8->_topButton, "addTarget:action:forControlEvents:", v8, sel__buttonPressed_, 1);
    -[TVRUIButton addTarget:action:forControlEvents:](v8->_topButton, "addTarget:action:forControlEvents:", v8, sel__buttonReleased_, 448);
    -[TVRUIButton addTarget:action:forControlEvents:](v8->_bottomButton, "addTarget:action:forControlEvents:", v8, sel__buttonPressed_, 1);
    -[TVRUIButton addTarget:action:forControlEvents:](v8->_bottomButton, "addTarget:action:forControlEvents:", v8, sel__buttonReleased_, 448);
    -[TVRUIPagingButton setStyleProvider:](v8, "setStyleProvider:", v55);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v8, sel__darkenSystemColorsChanged_, *MEMORY[0x24BEBDDE8], 0);

  }
  return v8;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  self->_enabled = a3;
  -[TVRUIPagingButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  v5 = 1.0;
  if (!self->_enabled)
  {
    -[TVRUIPagingButton styleProvider](self, "styleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disabledButtonAlpha");
    v5 = v7;

  }
  -[TVRUIPagingButton topButton](self, "topButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  -[TVRUIPagingButton topButton](self, "topButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v5);

  -[TVRUIPagingButton bottomButton](self, "bottomButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v3);

  -[TVRUIPagingButton bottomButton](self, "bottomButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v5);

  -[TVRUIPagingButton styleProvider](self, "styleProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v3)
    objc_msgSend(v12, "buttonTextColor");
  else
    objc_msgSend(v12, "tintColorForButtonDisabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIPagingButton titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  -[TVRUIPagingButton setAlpha:](self, "setAlpha:", v5);
}

- (void)_darkenSystemColorsChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TVRUIPagingButton _darkenSystemColorsChanged:]";
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[TVRUIPagingButton styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIPagingButton setBackgroundColor:](self, "setBackgroundColor:", v6);

}

- (void)_buttonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, objc_msgSend(a3, "buttonType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIPagingButton buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIPagingButton buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIPagingButton buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_buttonReleased:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, objc_msgSend(a3, "buttonType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIPagingButton buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIPagingButton buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIPagingButton buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
}

- (void)setButtonEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonEventDelegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (TVRUIButton)topButton
{
  return self->_topButton;
}

- (void)setTopButton:(id)a3
{
  objc_storeStrong((id *)&self->_topButton, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (TVRUIButton)bottomButton
{
  return self->_bottomButton;
}

- (void)setBottomButton:(id)a3
{
  objc_storeStrong((id *)&self->_bottomButton, a3);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_bottomButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_topButton, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
}

@end
