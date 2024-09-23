@implementation NCNotificationManagementBlueButton

+ (NCNotificationManagementBlueButton)buttonWithTitle:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[NCNotificationManagementBlueButton buttonWithType:](NCNotificationManagementBlueButton, "buttonWithType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v3, 0);

  return (NCNotificationManagementBlueButton *)v4;
}

- (NCNotificationManagementBlueButton)initWithFrame:(CGRect)a3
{
  NCNotificationManagementBlueButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NCNotificationManagementBlueButton;
  v3 = -[NCNotificationManagementBlueButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationManagementBlueButton setTitleColor:forState:](v3, "setTitleColor:forState:", v4, 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationManagementBlueButton setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 1);

    -[NCNotificationManagementBlueButton titleLabel](v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 1);
    objc_msgSend(v6, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationManagementBlueButton setBackgroundColor:](v3, "setBackgroundColor:", v9);

    -[NCNotificationManagementBlueButton layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 8.0);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 1)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
      -[NCNotificationManagementBlueButton addInteraction:](v3, "addInteraction:", v13);

    }
  }
  return v3;
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *backgroundColor;
  objc_super v7;

  v4 = a3;
  if ((-[NCNotificationManagementBlueButton isHighlighted](self, "isHighlighted") & 1) == 0)
  {
    v5 = (UIColor *)objc_msgSend(v4, "copy");
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v5;

  }
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationManagementBlueButton;
  -[NCNotificationManagementBlueButton setBackgroundColor:](&v7, sel_setBackgroundColor_, v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  UIColor *v5;
  UIColor *v6;
  void *v7;
  UIColor *v8;
  _QWORD v9[5];
  UIColor *v10;
  objc_super v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = a3;
  if (a3)
  {
    v14 = 0.0;
    v15 = 0.0;
    v13 = 0.0;
    v12 = 0.0;
    -[UIColor getRed:green:blue:alpha:](self->_backgroundColor, "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v15, v14, v13, v12 * 0.5);
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_backgroundColor;
  }
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationManagementBlueButton;
  -[NCNotificationManagementBlueButton setHighlighted:](&v11, sel_setHighlighted_, v3);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__NCNotificationManagementBlueButton_setHighlighted___block_invoke;
  v9[3] = &unk_1E8D1B3A0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v9, 0, 0.2);

}

uint64_t __53__NCNotificationManagementBlueButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
