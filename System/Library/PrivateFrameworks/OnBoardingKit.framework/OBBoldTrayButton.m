@implementation OBBoldTrayButton

+ (id)boldButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___OBBoldTrayButton;
  objc_msgSendSuper2(&v5, sel_buttonWithType_, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boldConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConfiguration:", v3);

  return v2;
}

- (id)boldConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonSize:", 3);
  objc_msgSend(v2, "background");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 14.0);

  return v2;
}

- (void)showsBusyIndicator
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  -[OBBoldTrayButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsActivityIndicator");

  if ((v4 & 1) == 0)
  {
    -[OBBoldTrayButton buttonStateRequiredHeight](self, "buttonStateRequiredHeight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      -[OBBoldTrayButton bounds](self, "bounds");
      *(float *)&v8 = v7;
      objc_msgSend(v6, "numberWithFloat:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBoldTrayButton setButtonStateRequiredHeight:](self, "setButtonStateRequiredHeight:", v9);

    }
    v10.receiver = self;
    v10.super_class = (Class)OBBoldTrayButton;
    -[OBTrayButton showsBusyIndicator](&v10, sel_showsBusyIndicator);
  }
}

- (void)hidesBusyIndicator
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  -[OBBoldTrayButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsActivityIndicator");

  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)OBBoldTrayButton;
    -[OBTrayButton hidesBusyIndicator](&v6, sel_hidesBusyIndicator);
    -[OBBoldTrayButton buttonStateRequiredHeight](self, "buttonStateRequiredHeight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[OBBoldTrayButton setButtonStateRequiredHeight:](self, "setButtonStateRequiredHeight:", 0);
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  NSObject *v7;
  objc_super v8;

  v3 = a3;
  -[OBBoldTrayButton configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsActivityIndicator");

  if (v6)
  {
    _OBLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[OBBoldTrayButton setEnabled:].cold.1(v7);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBBoldTrayButton;
    -[OBBoldTrayButton setEnabled:](&v8, sel_setEnabled_, v3);
  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  -[OBBoldTrayButton buttonStateRequiredHeight](self, "buttonStateRequiredHeight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBBoldTrayButton bounds](self, "bounds");
    v5 = v4;
    -[OBBoldTrayButton buttonStateRequiredHeight](self, "buttonStateRequiredHeight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)OBBoldTrayButton;
    -[OBBoldTrayButton intrinsicContentSize](&v13, sel_intrinsicContentSize);
    v5 = v9;
    v8 = v10;
  }
  v11 = v5;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)updateConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  objc_super v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)OBBoldTrayButton;
  -[OBBoldTrayButton updateConfiguration](&v19, sel_updateConfiguration);
  -[OBBoldTrayButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseBackgroundColor:", v4);

  -[OBBoldTrayButton configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsActivityIndicator");

  if (v6)
    objc_msgSend(v3, "setTitle:", 0);
  v18.receiver = self;
  v18.super_class = (Class)OBBoldTrayButton;
  -[OBTrayButton buttonFont](&v18, sel_buttonFont);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setAlignment:", 1);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __39__OBBoldTrayButton_updateConfiguration__block_invoke;
  v15 = &unk_1E37AA9A0;
  v16 = v7;
  v17 = v9;
  v10 = v9;
  v11 = v7;
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", &v12);
  -[OBBoldTrayButton setConfiguration:](self, "setConfiguration:", v3, v12, v13, v14, v15);

}

id __39__OBBoldTrayButton_updateConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0DC1178];
  v6[0] = *MEMORY[0x1E0DC1138];
  v6[1] = v1;
  v2 = *(_QWORD *)(a1 + 40);
  v7[0] = *(_QWORD *)(a1 + 32);
  v7[1] = v2;
  v6[2] = *MEMORY[0x1E0DC1248];
  v3 = UIAccessibilityButtonShapesEnabled();
  v4 = &unk_1E37BC640;
  if (v3)
    v4 = &unk_1E37BC628;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBBoldTrayButton;
  -[OBBoldTrayButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[OBBoldTrayButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (NSNumber)buttonStateRequiredHeight
{
  return self->_buttonStateRequiredHeight;
}

- (void)setButtonStateRequiredHeight:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStateRequiredHeight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStateRequiredHeight, 0);
}

- (void)setEnabled:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_199FE5000, log, OS_LOG_TYPE_ERROR, "OBBoldTrayButton does not support setting enabled when showing the busy indicator", v1, 2u);
}

@end
