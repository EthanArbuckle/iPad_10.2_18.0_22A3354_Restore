@implementation TCVegaCGFontProperties

- (TCVegaCGFontProperties)initWithString:(id)a3
{
  id v4;
  TCVegaCGFontProperties *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TCVegaCGFontProperties;
  v5 = -[TCVegaCGFontProperties init](&v24, sel_init);
  -[TCVegaCGFontProperties setCssFontString:](v5, "setCssFontString:", v4);
  -[TCVegaCGFontProperties setFontFamily:](v5, "setFontFamily:", 0);
  -[TCVegaCGFontProperties setFontSize:](v5, "setFontSize:", 0);
  -[TCVegaCGFontProperties setFontVariant:](v5, "setFontVariant:", 0);
  -[TCVegaCGFontProperties setFontWeight:](v5, "setFontWeight:", 0);
  -[TCVegaCGFontProperties setFontStyle:](v5, "setFontStyle:", 0);
  -[TCVegaCGFontProperties setLineHeight:](v5, "setLineHeight:", 0);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "count"))
    goto LABEL_32;
  v8 = 1;
  while (1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v8 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("normal")) & 1) == 0)
      break;
LABEL_7:

    if (v8++ >= objc_msgSend(v7, "count"))
      goto LABEL_32;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("italic")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("oblique")))
  {
    -[TCVegaCGFontProperties setFontStyle:](v5, "setFontStyle:", v9);
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("small-caps")))
  {
    -[TCVegaCGFontProperties setFontVariant:](v5, "setFontVariant:", v9);
    goto LABEL_7;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("bold")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("bolder")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("lighter")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("100")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("200")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("300")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("400")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("500")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("600")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("700")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("800")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("900")))
  {
    -[TCVegaCGFontProperties setFontWeight:](v5, "setFontWeight:", v9);
    goto LABEL_7;
  }
  -[TCVegaCGFontProperties fontSize](v5, "fontSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("/"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCVegaCGFontProperties setFontSize:](v5, "setFontSize:", v11);

    v12 = v23;
    if ((unint64_t)objc_msgSend(v23, "count") >= 2)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TCVegaCGFontProperties setLineHeight:](v5, "setLineHeight:", v13);

      v12 = v23;
    }

    goto LABEL_7;
  }
  -[TCVegaCGFontProperties setFontFamily:](v5, "setFontFamily:", v9);
  if (v8 - 1 < objc_msgSend(v7, "count") - 1)
  {
    objc_msgSend(v7, "subarrayWithRange:", v8, objc_msgSend(v7, "count") - v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCVegaCGFontProperties fontFamily](v5, "fontFamily");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR(" "), "stringByAppendingString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCVegaCGFontProperties setFontFamily:](v5, "setFontFamily:", v18);

  }
LABEL_32:
  -[TCVegaCGFontProperties fontFamily](v5, "fontFamily");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("sans-serif"));

  if (v20)
    -[TCVegaCGFontProperties setFontFamily:](v5, "setFontFamily:", CFSTR("Helvetica"));

  return v5;
}

- (NSString)cssFontString
{
  return self->cssFontString;
}

- (void)setCssFontString:(id)a3
{
  objc_storeStrong((id *)&self->cssFontString, a3);
}

- (NSString)fontFamily
{
  return self->fontFamily;
}

- (void)setFontFamily:(id)a3
{
  objc_storeStrong((id *)&self->fontFamily, a3);
}

- (NSString)fontSize
{
  return self->fontSize;
}

- (void)setFontSize:(id)a3
{
  objc_storeStrong((id *)&self->fontSize, a3);
}

- (NSString)fontVariant
{
  return self->fontVariant;
}

- (void)setFontVariant:(id)a3
{
  objc_storeStrong((id *)&self->fontVariant, a3);
}

- (NSString)fontWeight
{
  return self->fontWeight;
}

- (void)setFontWeight:(id)a3
{
  objc_storeStrong((id *)&self->fontWeight, a3);
}

- (NSString)fontStyle
{
  return self->fontStyle;
}

- (void)setFontStyle:(id)a3
{
  objc_storeStrong((id *)&self->fontStyle, a3);
}

- (NSString)lineHeight
{
  return self->lineHeight;
}

- (void)setLineHeight:(id)a3
{
  objc_storeStrong((id *)&self->lineHeight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lineHeight, 0);
  objc_storeStrong((id *)&self->fontStyle, 0);
  objc_storeStrong((id *)&self->fontWeight, 0);
  objc_storeStrong((id *)&self->fontVariant, 0);
  objc_storeStrong((id *)&self->fontSize, 0);
  objc_storeStrong((id *)&self->fontFamily, 0);
  objc_storeStrong((id *)&self->cssFontString, 0);
}

@end
