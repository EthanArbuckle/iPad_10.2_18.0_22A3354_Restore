@implementation OADTableCellStyle

- (void)setBorderStyle:(id)a3
{
  objc_storeStrong((id *)&self->mBorderStyle, a3);
}

- (void)setFill:(id)a3
{
  OADFill *v5;
  OADFill **p_mFill;
  OADFill *mFill;
  OADFill *v8;

  v5 = (OADFill *)a3;
  mFill = self->mFill;
  p_mFill = &self->mFill;
  if (mFill != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mFill, a3);
    v5 = v8;
  }

}

- (id)borderStyle
{
  return self->mBorderStyle;
}

- (id)fill
{
  return self->mFill;
}

+ (id)defaultFill
{
  return +[OADNullFill nullFill](OADNullFill, "nullFill");
}

+ (id)defaultStyle
{
  void *v3;
  OADTableCellStyle *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)+[OADTableCellStyle defaultStyle]::defaultStyle;
  if (!+[OADTableCellStyle defaultStyle]::defaultStyle)
  {
    v4 = objc_alloc_init(OADTableCellStyle);
    v5 = (void *)+[OADTableCellStyle defaultStyle]::defaultStyle;
    +[OADTableCellStyle defaultStyle]::defaultStyle = (uint64_t)v4;

    v6 = (void *)+[OADTableCellStyle defaultStyle]::defaultStyle;
    +[OADTableCellBorderStyle defaultStyle](OADTableCellBorderStyle, "defaultStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderStyle:", v7);

    v8 = (void *)+[OADTableCellStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultFill");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFill:", v9);

    v3 = (void *)+[OADTableCellStyle defaultStyle]::defaultStyle;
  }
  return v3;
}

- (id)shallowCopy
{
  OADTableCellStyle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(OADTableCellStyle);
  -[OADTableCellStyle fill](self, "fill");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableCellStyle setFill:](v3, "setFill:", v4);

  -[OADTableCellStyle borderStyle](self, "borderStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "shallowCopy");

  -[OADTableCellStyle setBorderStyle:](v3, "setBorderStyle:", v6);
  return v3;
}

- (void)applyOverridesFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "fill");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v9, "fill");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellStyle setFill:](self, "setFill:", v6);

    }
    -[OADTableCellStyle borderStyle](self, "borderStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "borderStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyOverridesFrom:", v8);

    v4 = v9;
  }

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableCellStyle;
  -[OADTableCellStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFill, 0);
  objc_storeStrong((id *)&self->mBorderStyle, 0);
}

@end
