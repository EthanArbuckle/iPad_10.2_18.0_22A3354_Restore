@implementation UIKBTutorialModalDisplayStyling

- (UIColor)mainTextColor
{
  return self->_mainTextColor;
}

- (UIKBTutorialModalDisplayStyling)initWithKeyboardAppearance:(int64_t)a3
{
  UIKBTutorialModalDisplayStyling *v4;
  UIKBTutorialModalDisplayStyling *v5;
  uint64_t v6;
  NSArray *backgroundEffects;
  uint64_t v8;
  UIColor *backgroundColor;
  uint64_t v10;
  UIColor *mainTextColor;
  uint64_t v12;
  UIColor *buttonTextColor;
  UIKBTutorialModalDisplayStyling *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIKBTutorialModalDisplayStyling;
  v4 = -[UIKBTutorialModalDisplayStyling init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    -[UIKBTutorialModalDisplayStyling backgroundBlurEffects:](v4, "backgroundBlurEffects:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundEffects = v5->_backgroundEffects;
    v5->_backgroundEffects = (NSArray *)v6;

    +[UIColor lightGrayColor](UIColor, "lightGrayColor");
    v8 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v8;

    +[UIColor labelColor](UIColor, "labelColor");
    v10 = objc_claimAutoreleasedReturnValue();
    mainTextColor = v5->_mainTextColor;
    v5->_mainTextColor = (UIColor *)v10;

    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v12 = objc_claimAutoreleasedReturnValue();
    buttonTextColor = v5->_buttonTextColor;
    v5->_buttonTextColor = (UIColor *)v12;

    v14 = v5;
  }

  return v5;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (id)backgroundBlurEffects:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_mainTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
}

- (void)setBackgroundEffects:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundEffects, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setMainTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_mainTextColor, a3);
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (void)setButtonTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTextColor, a3);
}

@end
