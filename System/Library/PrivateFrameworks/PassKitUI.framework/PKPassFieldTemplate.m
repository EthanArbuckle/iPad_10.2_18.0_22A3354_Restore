@implementation PKPassFieldTemplate

- (void)setValueFont:(id)a3
{
  objc_storeStrong((id *)&self->_valueFont, a3);
}

+ (id)_templateByResolvingTemplate:(id)a3 withDefault:(id)a4
{
  id v5;
  id v6;
  PKPassFieldTemplate *v7;
  void *v8;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PKPassFieldTemplate);
  objc_msgSend(v5, "boxedTextAlignment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PKPassFieldTemplate setBoxedTextAlignment:](v7, "setBoxedTextAlignment:", v8);
  }
  else
  {
    objc_msgSend(v6, "boxedTextAlignment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setBoxedTextAlignment:](v7, "setBoxedTextAlignment:", v9);

  }
  objc_msgSend(v5, "boxedVerticalPadding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PKPassFieldTemplate setBoxedVerticalPadding:](v7, "setBoxedVerticalPadding:", v10);
  }
  else
  {
    objc_msgSend(v6, "boxedVerticalPadding");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setBoxedVerticalPadding:](v7, "setBoxedVerticalPadding:", v11);

  }
  objc_msgSend(v5, "boxedSuppressesLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PKPassFieldTemplate setBoxedSuppressesLabel:](v7, "setBoxedSuppressesLabel:", v12);
  }
  else
  {
    objc_msgSend(v6, "boxedSuppressesLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setBoxedSuppressesLabel:](v7, "setBoxedSuppressesLabel:", v13);

  }
  objc_msgSend(v5, "boxedSuppressesEmptyLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[PKPassFieldTemplate setBoxedSuppressesEmptyLabel:](v7, "setBoxedSuppressesEmptyLabel:", v14);
  }
  else
  {
    objc_msgSend(v6, "boxedSuppressesEmptyLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setBoxedSuppressesEmptyLabel:](v7, "setBoxedSuppressesEmptyLabel:", v15);

  }
  objc_msgSend(v5, "boxedLabelCaseStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[PKPassFieldTemplate setBoxedLabelCaseStyle:](v7, "setBoxedLabelCaseStyle:", v16);
  }
  else
  {
    objc_msgSend(v6, "boxedLabelCaseStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setBoxedLabelCaseStyle:](v7, "setBoxedLabelCaseStyle:", v17);

  }
  objc_msgSend(v5, "boxedValueSignificant");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[PKPassFieldTemplate setBoxedValueSignificant:](v7, "setBoxedValueSignificant:", v18);
  }
  else
  {
    objc_msgSend(v6, "boxedValueSignificant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setBoxedValueSignificant:](v7, "setBoxedValueSignificant:", v19);

  }
  objc_msgSend(v5, "boxedValueCanWrap");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[PKPassFieldTemplate setBoxedValueCanWrap:](v7, "setBoxedValueCanWrap:", v20);
  }
  else
  {
    objc_msgSend(v6, "boxedValueCanWrap");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setBoxedValueCanWrap:](v7, "setBoxedValueCanWrap:", v21);

  }
  objc_msgSend(v5, "labelFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[PKPassFieldTemplate setLabelFont:](v7, "setLabelFont:", v22);
  }
  else
  {
    objc_msgSend(v6, "labelFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setLabelFont:](v7, "setLabelFont:", v23);

  }
  objc_msgSend(v5, "valueFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[PKPassFieldTemplate setValueFont:](v7, "setValueFont:", v24);
  }
  else
  {
    objc_msgSend(v6, "valueFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setValueFont:](v7, "setValueFont:", v25);

  }
  v26 = objc_msgSend(v5, "viewSubclass");
  if (!v26)
    v26 = objc_msgSend(v6, "viewSubclass");
  -[PKPassFieldTemplate setViewSubclass:](v7, "setViewSubclass:", v26);
  objc_msgSend(v5, "boxedPreferredSingleStyle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[PKPassFieldTemplate setBoxedPreferredSingleStyle:](v7, "setBoxedPreferredSingleStyle:", v27);
  }
  else
  {
    objc_msgSend(v6, "boxedPreferredSingleStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setBoxedPreferredSingleStyle:](v7, "setBoxedPreferredSingleStyle:", v28);

  }
  objc_msgSend(v5, "automaticVibrantLabelBlendMode");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[PKPassFieldTemplate setAutomaticVibrantLabelBlendMode:](v7, "setAutomaticVibrantLabelBlendMode:", v29);
  }
  else
  {
    objc_msgSend(v6, "automaticVibrantLabelBlendMode");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setAutomaticVibrantLabelBlendMode:](v7, "setAutomaticVibrantLabelBlendMode:", v30);

  }
  objc_msgSend(v5, "automaticVibrantLabelColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[PKPassFieldTemplate setAutomaticVibrantLabelColor:](v7, "setAutomaticVibrantLabelColor:", v31);
  }
  else
  {
    objc_msgSend(v6, "automaticVibrantLabelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setAutomaticVibrantLabelColor:](v7, "setAutomaticVibrantLabelColor:", v32);

  }
  objc_msgSend(v5, "automaticVibrantValueBlendMode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[PKPassFieldTemplate setAutomaticVibrantValueBlendMode:](v7, "setAutomaticVibrantValueBlendMode:", v33);
  }
  else
  {
    objc_msgSend(v6, "automaticVibrantValueBlendMode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setAutomaticVibrantValueBlendMode:](v7, "setAutomaticVibrantValueBlendMode:", v34);

  }
  objc_msgSend(v5, "automaticVibrantValueColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    -[PKPassFieldTemplate setAutomaticVibrantValueColor:](v7, "setAutomaticVibrantValueColor:", v35);
  }
  else
  {
    objc_msgSend(v6, "automaticVibrantValueColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFieldTemplate setAutomaticVibrantValueColor:](v7, "setAutomaticVibrantValueColor:", v36);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxedPreferredSingleStyle, 0);
  objc_storeStrong((id *)&self->_boxedSuppressesEmptyLabel, 0);
  objc_storeStrong((id *)&self->_boxedValueCanWrap, 0);
  objc_storeStrong((id *)&self->_boxedValueSignificant, 0);
  objc_storeStrong((id *)&self->_boxedLabelCaseStyle, 0);
  objc_storeStrong((id *)&self->_boxedSuppressesLabel, 0);
  objc_storeStrong((id *)&self->_boxedVerticalPadding, 0);
  objc_storeStrong((id *)&self->_boxedTextAlignment, 0);
  objc_storeStrong((id *)&self->_automaticVibrantValueColor, 0);
  objc_storeStrong((id *)&self->_automaticVibrantValueBlendMode, 0);
  objc_storeStrong((id *)&self->_automaticVibrantLabelColor, 0);
  objc_storeStrong((id *)&self->_automaticVibrantLabelBlendMode, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelFont, a3);
}

- (NSNumber)boxedTextAlignment
{
  return self->_boxedTextAlignment;
}

- (BOOL)suppressesLabel
{
  void *v2;
  char v3;

  -[PKPassFieldTemplate boxedSuppressesLabel](self, "boxedSuppressesLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSNumber)boxedSuppressesLabel
{
  return self->_boxedSuppressesLabel;
}

- (BOOL)valueCanWrap
{
  void *v2;
  char v3;

  -[PKPassFieldTemplate boxedValueCanWrap](self, "boxedValueCanWrap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSNumber)boxedValueCanWrap
{
  return self->_boxedValueCanWrap;
}

- (NSNumber)boxedValueSignificant
{
  return self->_boxedValueSignificant;
}

- (NSNumber)boxedSuppressesEmptyLabel
{
  return self->_boxedSuppressesEmptyLabel;
}

- (void)setBoxedValueCanWrap:(id)a3
{
  objc_storeStrong((id *)&self->_boxedValueCanWrap, a3);
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldTemplate setBoxedTextAlignment:](self, "setBoxedTextAlignment:", v4);

}

- (void)setBoxedTextAlignment:(id)a3
{
  objc_storeStrong((id *)&self->_boxedTextAlignment, a3);
}

- (double)verticalPadding
{
  void *v2;
  float v3;
  double v4;

  -[PKPassFieldTemplate boxedVerticalPadding](self, "boxedVerticalPadding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (NSNumber)boxedVerticalPadding
{
  return self->_boxedVerticalPadding;
}

- (Class)viewSubclass
{
  return self->_viewSubclass;
}

- (NSNumber)boxedLabelCaseStyle
{
  return self->_boxedLabelCaseStyle;
}

- (void)setVerticalPadding:(double)a3
{
  id v4;

  *(float *)&a3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldTemplate setBoxedVerticalPadding:](self, "setBoxedVerticalPadding:", v4);

}

- (void)setBoxedVerticalPadding:(id)a3
{
  objc_storeStrong((id *)&self->_boxedVerticalPadding, a3);
}

- (void)setSuppressesLabel:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldTemplate setBoxedSuppressesLabel:](self, "setBoxedSuppressesLabel:", v4);

}

- (void)setBoxedSuppressesLabel:(id)a3
{
  objc_storeStrong((id *)&self->_boxedSuppressesLabel, a3);
}

- (void)setBoxedSuppressesEmptyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_boxedSuppressesEmptyLabel, a3);
}

- (void)setViewSubclass:(Class)a3
{
  self->_viewSubclass = a3;
}

- (void)setBoxedValueSignificant:(id)a3
{
  objc_storeStrong((id *)&self->_boxedValueSignificant, a3);
}

- (void)setBoxedLabelCaseStyle:(id)a3
{
  objc_storeStrong((id *)&self->_boxedLabelCaseStyle, a3);
}

- (void)setValueCanWrap:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldTemplate setBoxedValueCanWrap:](self, "setBoxedValueCanWrap:", v4);

}

- (void)setSuppressesEmptyLabel:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldTemplate setBoxedSuppressesEmptyLabel:](self, "setBoxedSuppressesEmptyLabel:", v4);

}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (int64_t)textAlignment
{
  void *v2;
  int64_t v3;

  -[PKPassFieldTemplate boxedTextAlignment](self, "boxedTextAlignment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)valueSignificant
{
  void *v2;
  char v3;

  -[PKPassFieldTemplate boxedValueSignificant](self, "boxedValueSignificant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)suppressesEmptyLabel
{
  void *v2;
  char v3;

  -[PKPassFieldTemplate boxedSuppressesEmptyLabel](self, "boxedSuppressesEmptyLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)labelCaseStyle
{
  int64_t result;

  result = (int64_t)self->_boxedLabelCaseStyle;
  if (result)
    return objc_msgSend((id)result, "integerValue");
  return result;
}

+ (PKPassFieldTemplate)fieldTemplateWithTextAlignment:(int64_t)a3
{
  PKPassFieldTemplate *v4;

  v4 = objc_alloc_init(PKPassFieldTemplate);
  -[PKPassFieldTemplate setTextAlignment:](v4, "setTextAlignment:", a3);
  return v4;
}

+ (PKPassFieldTemplate)fieldTemplateWithVerticalPadding:(double)a3
{
  PKPassFieldTemplate *v4;

  v4 = objc_alloc_init(PKPassFieldTemplate);
  -[PKPassFieldTemplate setVerticalPadding:](v4, "setVerticalPadding:", a3);
  return v4;
}

+ (PKPassFieldTemplate)fieldTemplateWithViewSubclass:(Class)a3
{
  PKPassFieldTemplate *v4;

  v4 = objc_alloc_init(PKPassFieldTemplate);
  -[PKPassFieldTemplate setViewSubclass:](v4, "setViewSubclass:", a3);
  return v4;
}

- (void)setLabelCaseStyle:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldTemplate setBoxedLabelCaseStyle:](self, "setBoxedLabelCaseStyle:", v4);

}

- (void)setValueSignificant:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldTemplate setBoxedValueSignificant:](self, "setBoxedValueSignificant:", v4);

}

- (int64_t)preferredSingleStyle
{
  int64_t result;

  result = (int64_t)self->_boxedPreferredSingleStyle;
  if (result)
    return objc_msgSend((id)result, "integerValue");
  return result;
}

- (void)setPreferredSingleStyle:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldTemplate setBoxedPreferredSingleStyle:](self, "setBoxedPreferredSingleStyle:", v4);

}

- (NSString)automaticVibrantLabelBlendMode
{
  return self->_automaticVibrantLabelBlendMode;
}

- (void)setAutomaticVibrantLabelBlendMode:(id)a3
{
  objc_storeStrong((id *)&self->_automaticVibrantLabelBlendMode, a3);
}

- (UIColor)automaticVibrantLabelColor
{
  return self->_automaticVibrantLabelColor;
}

- (void)setAutomaticVibrantLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_automaticVibrantLabelColor, a3);
}

- (NSString)automaticVibrantValueBlendMode
{
  return self->_automaticVibrantValueBlendMode;
}

- (void)setAutomaticVibrantValueBlendMode:(id)a3
{
  objc_storeStrong((id *)&self->_automaticVibrantValueBlendMode, a3);
}

- (UIColor)automaticVibrantValueColor
{
  return self->_automaticVibrantValueColor;
}

- (void)setAutomaticVibrantValueColor:(id)a3
{
  objc_storeStrong((id *)&self->_automaticVibrantValueColor, a3);
}

- (NSNumber)boxedPreferredSingleStyle
{
  return self->_boxedPreferredSingleStyle;
}

- (void)setBoxedPreferredSingleStyle:(id)a3
{
  objc_storeStrong((id *)&self->_boxedPreferredSingleStyle, a3);
}

@end
