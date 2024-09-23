@implementation PRXTextStyleDefinition

- (PRXTextStyleDefinition)initWithStyle:(int64_t)a3
{
  PRXTextStyleDefinition *v4;
  PRXTextStyleDefinition *v5;
  uint64_t v6;
  UIColor *textColor;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIFont *font;
  unint64_t v13;
  uint64_t v14;
  UIColor *v15;
  uint64_t v16;
  UIFont *v17;
  uint64_t v18;
  UIColor *v19;
  uint64_t v20;
  uint64_t v21;
  UIColor *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIFont *v26;
  uint64_t v27;
  uint64_t v28;
  UIColor *v29;
  uint64_t v30;
  UIFont *v31;
  unint64_t v32;
  uint64_t v33;
  UIColor *v34;
  UIFont *v35;
  PRXTextStyleDefinition *v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PRXTextStyleDefinition;
  v4 = -[PRXTextStyleDefinition init](&v38, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    switch(a3)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v6 = objc_claimAutoreleasedReturnValue();
        textColor = v5->_textColor;
        v5->_textColor = (UIColor *)v6;

        objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7848]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v8, "symbolicTraits") | 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)MEMORY[0x24BDF6A70];
        objc_msgSend(v9, "pointSize");
        objc_msgSend(v10, "fontWithDescriptor:size:", v9);
        v11 = objc_claimAutoreleasedReturnValue();
        font = v5->_font;
        v5->_font = (UIFont *)v11;

        v13 = *MEMORY[0x24BDF73C0];
        v5->_textAlignment = 1;
        v5->_accessibilityTraits = v13;
        v5->_numberOfLines = 0;

        break;
      case 1:
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v5->_textColor;
        v5->_textColor = (UIColor *)v14;

        objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BDF7810], 256);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v5->_font;
        v5->_font = (UIFont *)v16;

        goto LABEL_7;
      case 2:
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v5->_textColor;
        v5->_textColor = (UIColor *)v18;

        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v5->_textColor;
        v5->_textColor = (UIColor *)v21;

        objc_msgSend(MEMORY[0x24BDF6A80], "defaultMetrics");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "scaledFontForFont:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v5->_font;
        v5->_font = (UIFont *)v25;

LABEL_7:
        v27 = 1;
        goto LABEL_11;
      case 4:
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v5->_textColor;
        v5->_textColor = (UIColor *)v28;

        objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BDF7858], 1280);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v5->_font;
        v5->_font = (UIFont *)v30;

        v32 = *MEMORY[0x24BDF73C0];
        v5->_textAlignment = 4;
        v5->_accessibilityTraits = v32;
        goto LABEL_12;
      case 5:
        objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v5->_textColor;
        v5->_textColor = (UIColor *)v33;

        objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BDF77B0], 256);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v35 = v5->_font;
        v5->_font = (UIFont *)v20;

        v27 = 4;
LABEL_11:
        v5->_textAlignment = v27;
LABEL_12:
        v5->_numberOfLines = 0;
        break;
      default:
        break;
    }
    v36 = v5;
  }

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (unint64_t)accessibilityTraits
{
  return self->_accessibilityTraits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
