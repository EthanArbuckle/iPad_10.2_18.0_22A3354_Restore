@implementation OADTableTextStyle

- (OADTableTextStyle)init
{
  OADTableTextStyle *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableTextStyle;
  result = -[OADTableTextStyle init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->mBold = 0x200000002;
  return result;
}

- (void)setFontReference:(id)a3
{
  objc_storeStrong((id *)&self->mFontReference, a3);
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
}

- (void)setBold:(int)a3
{
  self->mBold = a3;
}

- (id)color
{
  return self->mColor;
}

- (int)bold
{
  return self->mBold;
}

- (id)fontReference
{
  return self->mFontReference;
}

- (int)italic
{
  return self->mItalic;
}

- (void)setItalic:(int)a3
{
  self->mItalic = a3;
}

+ (id)defaultColor
{
  void *v2;
  OADSchemeColor *v3;
  void *v4;

  v2 = (void *)+[OADTableTextStyle defaultColor]::defaultColor;
  if (!+[OADTableTextStyle defaultColor]::defaultColor)
  {
    v3 = -[OADSchemeColor initWithSchemeColorIndex:]([OADSchemeColor alloc], "initWithSchemeColorIndex:", 1);
    v4 = (void *)+[OADTableTextStyle defaultColor]::defaultColor;
    +[OADTableTextStyle defaultColor]::defaultColor = (uint64_t)v3;

    v2 = (void *)+[OADTableTextStyle defaultColor]::defaultColor;
  }
  return v2;
}

+ (id)defaultFontReference
{
  void *v3;
  OADFontReference *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)+[OADTableTextStyle defaultFontReference]::defaultFontReference;
  if (!+[OADTableTextStyle defaultFontReference]::defaultFontReference)
  {
    v4 = objc_alloc_init(OADFontReference);
    v5 = (void *)+[OADTableTextStyle defaultFontReference]::defaultFontReference;
    +[OADTableTextStyle defaultFontReference]::defaultFontReference = (uint64_t)v4;

    objc_msgSend((id)+[OADTableTextStyle defaultFontReference]::defaultFontReference, "setIndex:", 1);
    v6 = (void *)+[OADTableTextStyle defaultFontReference]::defaultFontReference;
    objc_msgSend(a1, "defaultColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v7);

    v3 = (void *)+[OADTableTextStyle defaultFontReference]::defaultFontReference;
  }
  return v3;
}

+ (int)defaultBold
{
  return 2;
}

+ (int)defaultItalic
{
  return 2;
}

+ (id)defaultStyle
{
  void *v3;
  OADTableTextStyle *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
  if (!+[OADTableTextStyle defaultStyle]::defaultStyle)
  {
    v4 = objc_alloc_init(OADTableTextStyle);
    v5 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
    +[OADTableTextStyle defaultStyle]::defaultStyle = (uint64_t)v4;

    v6 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultFontReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFontReference:", v7);

    v8 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setColor:", v9);

    objc_msgSend((id)+[OADTableTextStyle defaultStyle]::defaultStyle, "setBold:", objc_msgSend(a1, "defaultBold"));
    objc_msgSend((id)+[OADTableTextStyle defaultStyle]::defaultStyle, "setItalic:", objc_msgSend(a1, "defaultItalic"));
    v3 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
  }
  return v3;
}

- (id)shallowCopy
{
  OADTableTextStyle *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(OADTableTextStyle);
  -[OADTableTextStyle fontReference](self, "fontReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableTextStyle setFontReference:](v3, "setFontReference:", v4);

  -[OADTableTextStyle color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableTextStyle setColor:](v3, "setColor:", v5);

  -[OADTableTextStyle setBold:](v3, "setBold:", -[OADTableTextStyle bold](self, "bold"));
  -[OADTableTextStyle setItalic:](v3, "setItalic:", -[OADTableTextStyle italic](self, "italic"));
  return v3;
}

- (void)applyOverridesFrom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    objc_msgSend(v8, "fontReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v8, "fontReference");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableTextStyle setFontReference:](self, "setFontReference:", v5);

    }
    objc_msgSend(v8, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v8, "color");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableTextStyle setColor:](self, "setColor:", v7);

    }
    if (objc_msgSend(v8, "bold") != 2)
      -[OADTableTextStyle setBold:](self, "setBold:", objc_msgSend(v8, "bold"));
    if (objc_msgSend(v8, "italic") != 2)
      -[OADTableTextStyle setItalic:](self, "setItalic:", objc_msgSend(v8, "italic"));
  }

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableTextStyle;
  -[OADTableTextStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
  objc_storeStrong((id *)&self->mFontReference, 0);
}

@end
