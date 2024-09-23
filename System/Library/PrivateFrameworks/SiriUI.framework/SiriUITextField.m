@implementation SiriUITextField

- (SiriUITextField)initWithFrame:(CGRect)a3
{
  SiriUITextField *v3;
  SiriUITextField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUITextField;
  v3 = -[SiriUITextField initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SiriUITextField setRightViewMode:](v3, "setRightViewMode:", 0);
    -[SiriUITextField setClearButtonMode:](v4, "setClearButtonMode:", 1);
    -[SiriUITextField setClearButtonStyle:](v4, "setClearButtonStyle:", 1);
    -[SiriUITextField setLoadKeyboardsForSiriLanguage:](v4, "setLoadKeyboardsForSiriLanguage:", 1);
    -[SiriUITextField _configureClearButton](v4, "_configureClearButton");
  }
  return v4;
}

- (id)textInputContextIdentifier
{
  return CFSTR("Type2Siri");
}

- (void)_configureClearButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("clear"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageThatSuppressesAccessibilityHairlineThickening");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithImage:tintColor:", v12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUITextField _clearButton](self, "_clearButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:forState:", v9, 1);

  -[SiriUITextField _clearButton](self, "_clearButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:forState:", v9, 0);

}

- (BOOL)_shouldRepeatInsertText:(id)a3
{
  return 0;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  v5 = a3.origin.x + 10.0;
  v6 = a3.origin.y + 1.0;
  -[SiriUITextField clearButtonRect](self, "clearButtonRect");
  v8 = width - (v7 + 10.0);
  v9 = v5;
  v10 = v6;
  v11 = height;
  result.size.height = v11;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double Width;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  v20.receiver = self;
  v20.super_class = (Class)SiriUITextField;
  -[SiriUITextField clearButtonRectForBounds:](&v20, sel_clearButtonRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10 + -0.5;
  v12 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "languageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v12, "characterDirectionForLanguage:", v14) != 2;

  if (((v12 ^ SiriLanguageIsRTL()) & 1) == 0)
  {
    -[SiriUITextField bounds](self, "bounds");
    Width = CGRectGetWidth(v21);
    v22.origin.x = v5;
    v22.origin.y = v11;
    v22.size.width = v7;
    v22.size.height = v9;
    v5 = Width - CGRectGetMaxX(v22);
  }
  v16 = v5;
  v17 = v11;
  v18 = v7;
  v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  v4 = a3;
  if (-[SiriUITextField isFirstResponder](self, "isFirstResponder"))
  {
    v17.receiver = self;
    v17.super_class = (Class)SiriUITextField;
    -[SiriUITextField caretRectForPosition:](&v17, sel_caretRectForPosition_, v4);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x24BDBF090];
    v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (id)imageWithImage:(id)a3 tintColor:(id)a4
{
  id v5;
  id v6;
  CGContext *CurrentContext;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGSize v16;
  CGRect v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v8 = *MEMORY[0x24BDBEFB0];
  v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v6, "size");
  v11 = v10;
  v13 = v12;
  CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
  objc_msgSend(v6, "drawInRect:", v8, v9, v11, v13);

  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceIn);
  objc_msgSend(v5, "setFill");

  v17.origin.x = v8;
  v17.origin.y = v9;
  v17.size.width = v11;
  v17.size.height = v13;
  CGContextFillRect(CurrentContext, v17);
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

@end
