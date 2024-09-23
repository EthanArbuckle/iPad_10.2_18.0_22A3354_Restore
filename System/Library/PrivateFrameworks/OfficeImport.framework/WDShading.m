@implementation WDShading

- (WDShading)init
{
  WDShading *v2;
  WDShading *v3;
  uint64_t v4;
  OITSUColor *mForegroundColor;
  uint64_t v6;
  OITSUColor *mBackgroundColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDShading;
  v2 = -[WDShading init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mStyle = 0;
    objc_msgSend((id)objc_opt_class(), "autoForegroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
    mForegroundColor = v3->mForegroundColor;
    v3->mForegroundColor = (OITSUColor *)v4;

    objc_msgSend((id)objc_opt_class(), "autoBackgroundColor");
    v6 = objc_claimAutoreleasedReturnValue();
    mBackgroundColor = v3->mBackgroundColor;
    v3->mBackgroundColor = (OITSUColor *)v6;

  }
  return v3;
}

+ (id)autoForegroundColor
{
  unsigned __int8 v2;

  {
    +[WDShading autoForegroundColor]::theColor = -[OITSUColor initWithWhite:alpha:]([OITSUColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  }
  return (id)+[WDShading autoForegroundColor]::theColor;
}

+ (id)autoBackgroundColor
{
  unsigned __int8 v2;

  {
    +[WDShading autoBackgroundColor]::theColor = -[OITSUColor initWithWhite:alpha:]([OITSUColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  }
  return (id)+[WDShading autoBackgroundColor]::theColor;
}

- (void)setStyle:(int)a3
{
  self->mStyle = a3;
}

- (void)setForeground:(id)a3
{
  objc_storeStrong((id *)&self->mForegroundColor, a3);
}

- (void)setBackground:(id)a3
{
  objc_storeStrong((id *)&self->mBackgroundColor, a3);
}

- (int)style
{
  return self->mStyle;
}

- (id)foreground
{
  return self->mForegroundColor;
}

- (id)background
{
  return self->mBackgroundColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDShading *v4;
  WDShading *v5;
  OITSUColor *mForegroundColor;
  OITSUColor *v7;
  OITSUColor *v8;
  OITSUColor *v9;
  OITSUColor *mBackgroundColor;
  OITSUColor *v11;
  OITSUColor *v12;
  OITSUColor *v13;

  v4 = -[WDShading init](+[WDShading allocWithZone:](WDShading, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4->mStyle = self->mStyle;
    mForegroundColor = self->mForegroundColor;
    objc_msgSend((id)objc_opt_class(), "autoForegroundColor");
    v7 = (OITSUColor *)objc_claimAutoreleasedReturnValue();
    if (mForegroundColor == v7)
    {
      objc_msgSend((id)objc_opt_class(), "autoForegroundColor");
      v8 = (OITSUColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = -[OITSUColor copy](self->mForegroundColor, "copy");
    }
    v9 = v5->mForegroundColor;
    v5->mForegroundColor = v8;

    mBackgroundColor = self->mBackgroundColor;
    objc_msgSend((id)objc_opt_class(), "autoBackgroundColor");
    v11 = (OITSUColor *)objc_claimAutoreleasedReturnValue();
    if (mBackgroundColor == v11)
    {
      objc_msgSend((id)objc_opt_class(), "autoBackgroundColor");
      v12 = (OITSUColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = -[OITSUColor copy](self->mBackgroundColor, "copy");
    }
    v13 = v5->mBackgroundColor;
    v5->mBackgroundColor = v12;

  }
  return v5;
}

+ (id)nilShading
{
  void *v2;
  WDShading *v3;
  void *v4;

  v2 = (void *)+[WDShading nilShading]::theShading;
  if (!+[WDShading nilShading]::theShading)
  {
    v3 = objc_alloc_init(WDShading);
    v4 = (void *)+[WDShading nilShading]::theShading;
    +[WDShading nilShading]::theShading = (uint64_t)v3;

    objc_msgSend((id)+[WDShading nilShading]::theShading, "setStyle:", 0xFFFFLL);
    v2 = (void *)+[WDShading nilShading]::theShading;
  }
  return v2;
}

- (BOOL)isEqualToShading:(id)a3
{
  OITSUColor **v4;
  OITSUColor *mForegroundColor;
  OITSUColor *mBackgroundColor;
  char v7;

  v4 = (OITSUColor **)a3;
  if (self->mStyle == *((_DWORD *)v4 + 2)
    && ((mForegroundColor = self->mForegroundColor, mForegroundColor == v4[2])
     || -[OITSUColor isEqual:](mForegroundColor, "isEqual:")))
  {
    mBackgroundColor = self->mBackgroundColor;
    if (mBackgroundColor == v4[3])
      v7 = 1;
    else
      v7 = -[OITSUColor isEqual:](mBackgroundColor, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WDShading *v4;
  WDShading *v5;
  BOOL v6;

  v4 = (WDShading *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[WDShading isEqualToShading:](self, "isEqualToShading:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t mStyle;
  objc_super v4;

  mStyle = self->mStyle;
  v4.receiver = self;
  v4.super_class = (Class)WDShading;
  return -[WDShading hash](&v4, sel_hash) ^ mStyle;
}

- (void)setShading:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WDShading setStyle:](self, "setStyle:", objc_msgSend(v6, "style"));
  objc_msgSend(v6, "foreground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDShading setForeground:](self, "setForeground:", v4);

  objc_msgSend(v6, "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDShading setBackground:](self, "setBackground:", v5);

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDShading;
  -[WDShading description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBackgroundColor, 0);
  objc_storeStrong((id *)&self->mForegroundColor, 0);
}

@end
