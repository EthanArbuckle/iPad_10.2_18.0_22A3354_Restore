@implementation WGNewWidgetsButton

- (WGNewWidgetsButton)init
{
  WGNewWidgetsButton *v2;
  WGNewWidgetsButton *v3;
  void *v4;
  uint64_t v5;
  UIButton *vibrantButton;
  void *v7;
  uint64_t v8;
  UIButton *overlayButton;
  void *v10;
  NSCache *v11;
  NSCache *numberAttributedStringCache;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WGNewWidgetsButton;
  v2 = -[WGNewWidgetsButton init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WGNewWidgetsButton titleLabel](v2, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    vibrantButton = v3->_vibrantButton;
    v3->_vibrantButton = (UIButton *)v5;

    -[UIButton _setDrawsAsBackdropOverlayWithBlendMode:](v3->_vibrantButton, "_setDrawsAsBackdropOverlayWithBlendMode:", 3);
    -[UIButton titleLabel](v3->_vibrantButton, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    -[WGNewWidgetsButton addSubview:](v3, "addSubview:", v3->_vibrantButton);
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    overlayButton = v3->_overlayButton;
    v3->_overlayButton = (UIButton *)v8;

    -[UIButton titleLabel](v3->_overlayButton, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 0);

    -[WGNewWidgetsButton addSubview:](v3, "addSubview:", v3->_overlayButton);
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    numberAttributedStringCache = v3->_numberAttributedStringCache;
    v3->_numberAttributedStringCache = v11;

    -[UIButton addTarget:action:forControlEvents:](v3->_overlayButton, "addTarget:action:forControlEvents:", v3, sel__buttonStateChanged_, 0xFFFFFFFFLL);
    -[UIButton addTarget:action:forControlEvents:](v3->_overlayButton, "addTarget:action:forControlEvents:", v3, sel__buttonPushed_, 64);
    -[WGNewWidgetsButton setBadgeNumber:](v3, "setBadgeNumber:", 0);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIButton sizeThatFits:](self->_overlayButton, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setBadgeNumber:(unint64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  self->_badgeNumber = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%u"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton setNumberText:](self, "setNumberText:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = CFSTR("NEW_WIDGETS_AVAILABLE_LEGACY");
  else
    v9 = CFSTR("NEW_WIDGETS_AVAILABLE");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D733868, CFSTR("Widgets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v10, self->_badgeNumber);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton setText:](self, "setText:", v11);

  -[WGNewWidgetsButton _updateButtons](self, "_updateButtons");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIButton setHighlighted:](self->_vibrantButton, "setHighlighted:");
  -[UIButton setHighlighted:](self->_overlayButton, "setHighlighted:", v3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WGNewWidgetsButton;
  -[WGNewWidgetsButton layoutSubviews](&v11, sel_layoutSubviews);
  -[WGNewWidgetsButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButton setFrame:](self->_vibrantButton, "setFrame:");
  -[UIButton setFrame:](self->_overlayButton, "setFrame:", v4, v6, v8, v10);
}

- (void)_buttonPushed:(id)a3
{
  -[WGNewWidgetsButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (void)_buttonStateChanged:(id)a3
{
  -[UIButton setSelected:](self->_vibrantButton, "setSelected:", -[UIButton isSelected](self->_overlayButton, "isSelected", a3));
  -[UIButton setHighlighted:](self->_vibrantButton, "setHighlighted:", -[UIButton isHighlighted](self->_overlayButton, "isHighlighted"));
}

- (void)_updateButtons
{
  UIButton *vibrantButton;
  void *v4;
  UIButton *overlayButton;
  void *v6;

  vibrantButton = self->_vibrantButton;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton _setAttributeTitleForButton:withColor:](self, "_setAttributeTitleForButton:withColor:", vibrantButton, v4);

  overlayButton = self->_overlayButton;
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton _setAttributeTitleForButton:withColor:](self, "_setAttributeTitleForButton:withColor:", overlayButton, v6);

  -[WGNewWidgetsButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setAttributeTitleForButton:(id)a3 withColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WGNewWidgetsButton _attributedStringWithColor:](self, "_attributedStringWithColor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedTitle:forState:", v8, 0);

  -[WGNewWidgetsButton _attributedStringWithColor:](self, "_attributedStringWithColor:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttributedTitle:forState:", v9, 4);
  objc_msgSend(v7, "setAttributedTitle:forState:", v9, 1);

}

- (id)_textFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BF20], "preferredFontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x24BDF77C8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_textAttributesWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton _textFont](self, "_textFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BDF65F8]);
  if (v4)
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x24BDF6600]);
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setAlignment:", 1);
  objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x24BDF6628]);

  return v5;
}

- (id)_numberTextAttributes
{
  void *v3;
  void *v4;
  _UILegibilitySettings *legibilitySettings;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton _numberFont](self, "_numberFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BDF65F8]);
  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings)
    -[_UILegibilitySettings shadowColor](legibilitySettings, "shadowColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x24BDF6600]);

  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setAlignment:", 1);
  objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x24BDF6628]);

  return v3;
}

- (id)_attributedStringWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[WGNewWidgetsButton numberText](self, "numberText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton _numberTextAttributes](self, "_numberTextAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton _numberAttributedStringWithNumberText:attributes:](self, "_numberAttributedStringWithNumberText:attributes:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BDD1688]);
  -[WGNewWidgetsButton text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton _textAttributesWithColor:](self, "_textAttributesWithColor:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v10);
  objc_msgSend(v11, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGNewWidgetsButton numberText](self, "numberText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "rangeOfString:", v13);
  v16 = v15;

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v11, "replaceCharactersInRange:withAttributedString:", v14, v16, v7);

  return v11;
}

- (id)_numberAttributedStringWithNumberText:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _UILegibilitySettings *legibilitySettings;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v6);
  if (v7)
  {
    objc_msgSend(v7, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v9);

  }
  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings)
  {
    -[_UILegibilitySettings primaryColor](legibilitySettings, "primaryColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v12);

    -[_UILegibilitySettings shadowColor](self->_legibilitySettings, "shadowColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v14);

  }
  -[NSCache objectForKey:](self->_numberAttributedStringCache, "objectForKey:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[WGNewWidgetsButton _numberImageForNumberText:withAttributes:](self, "_numberImageForNumberText:withAttributes:", v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6768]), "initWithData:ofType:", 0, 0);
    objc_msgSend(v17, "setImage:", v16);
    -[WGNewWidgetsButton _numberFont](self, "_numberFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "descender");
    _WGMainScreenScale();
    BSFloatFloorForScale();
    v20 = v19;

    objc_msgSend(v16, "size");
    objc_msgSend(v17, "setBounds:", 0.0, v20, v21, v22);
    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](self->_numberAttributedStringCache, "setObject:forKey:", v15, v8);

  }
  return v15;
}

- (id)_numberImageForNumberText:(id)a3 withAttributes:(id)a4
{
  id v6;
  double width;
  double height;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  CGSize v20;
  CGRect v21;

  v6 = a4;
  -[WGNewWidgetsButton _numberLabelSizeForText:withAttributes:](self, "_numberLabelSizeForText:withAttributes:", a3, v6);
  width = v20.width;
  height = v20.height;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "set");

  v10 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x24BDBEFB0], v11, width, height, height * 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fill");
  if (self->_badgeNumber == 1)
  {
    v21.origin.x = v10;
    v21.origin.y = v11;
    v21.size.width = width;
    v21.size.height = height;
    CGRectOffset(v21, -0.5, 0.0);
    WGRectRoundForMainScreenScale();
    v10 = v13;
    v11 = v14;
    width = v15;
    height = v16;
  }
  -[WGNewWidgetsButton numberText](self, "numberText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "drawInRect:withAttributes:", v6, v10, v11, width, height);

  UIGraphicsGetImageFromCurrentImageContext();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v18;
}

- (CGSize)_numberLabelSizeForText:(id)a3 withAttributes:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a3;
  objc_msgSend(v6, "sizeWithAttributes:", a4);
  v7 = objc_msgSend(v6, "length");

  if (v7 == 1)
  {
    _WGMainScreenScale();
    BSFloatCeilForScale();
    v9 = v8;
  }
  else
  {
    -[WGNewWidgetsButton _numberFont](self, "_numberFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "capHeight");
    _WGMainScreenScale();
    BSFloatCeilForScale();
    v9 = v11;

  }
  _WGMainScreenScale();
  BSFloatCeilForScale();
  v13 = v12;
  v14 = v9;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  -[WGNewWidgetsButton _updateButtons](self, "_updateButtons");
}

- (unint64_t)badgeNumber
{
  return self->_badgeNumber;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)numberText
{
  return self->_numberText;
}

- (void)setNumberText:(id)a3
{
  objc_storeStrong((id *)&self->_numberText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_numberAttributedStringCache, 0);
  objc_storeStrong((id *)&self->_overlayButton, 0);
  objc_storeStrong((id *)&self->_vibrantButton, 0);
}

@end
