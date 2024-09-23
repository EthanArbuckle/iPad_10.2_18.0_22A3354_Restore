@implementation OBLinkTrayButton

+ (id)linkButton
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___OBLinkTrayButton;
  objc_msgSendSuper2(&v8, sel_buttonWithType_, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseBackgroundColor:", v4);

  objc_msgSend(v3, "setButtonSize:", 3);
  objc_msgSend(v3, "setTitleAlignment:", 2);
  objc_msgSend(v3, "contentInsets");
  v6 = v5;
  objc_msgSend(v3, "contentInsets");
  objc_msgSend(v3, "setContentInsets:", v6, 0.0);
  objc_msgSend(v2, "setConfiguration:", v3);

  return v2;
}

- (void)updateConfiguration
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)OBLinkTrayButton;
  -[OBLinkTrayButton updateConfiguration](&v18, sel_updateConfiguration);
  -[OBLinkTrayButton configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsActivityIndicator");

  if (v5)
    objc_msgSend(v3, "setTitle:", 0);
  -[OBTrayButton buttonFont](self, "buttonFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setAlignment:", 1);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __39__OBLinkTrayButton_updateConfiguration__block_invoke;
  v15 = &unk_1E37AA9A0;
  v16 = v6;
  v17 = v8;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", &v12);
  objc_msgSend(v3, "background", v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", 14.0);

  -[OBLinkTrayButton setConfiguration:](self, "setConfiguration:", v3);
}

id __39__OBLinkTrayButton_updateConfiguration__block_invoke(uint64_t a1)
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
  v4 = &unk_1E37BC5F8;
  if (v3)
    v4 = &unk_1E37BC5E0;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

@end
