@implementation OADTablePartStyle

- (void)setCellStyle:(id)a3
{
  objc_storeStrong((id *)&self->mCellStyle, a3);
}

- (void)setTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->mTextStyle, a3);
}

- (id)cellStyle
{
  return self->mCellStyle;
}

- (id)textStyle
{
  return self->mTextStyle;
}

+ (id)defaultStyle
{
  void *v2;
  OADTablePartStyle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
  if (!+[OADTablePartStyle defaultStyle]::defaultStyle)
  {
    v3 = objc_alloc_init(OADTablePartStyle);
    v4 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
    +[OADTablePartStyle defaultStyle]::defaultStyle = (uint64_t)v3;

    v5 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
    +[OADTableTextStyle defaultStyle](OADTableTextStyle, "defaultStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextStyle:", v6);

    v7 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
    +[OADTableCellStyle defaultStyle](OADTableCellStyle, "defaultStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCellStyle:", v8);

    v2 = (void *)+[OADTablePartStyle defaultStyle]::defaultStyle;
  }
  return v2;
}

- (id)shallowCopy
{
  OADTablePartStyle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(OADTablePartStyle);
  -[OADTablePartStyle cellStyle](self, "cellStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "shallowCopy");

  -[OADTablePartStyle setCellStyle:](v3, "setCellStyle:", v5);
  -[OADTablePartStyle textStyle](self, "textStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "shallowCopy");

  -[OADTablePartStyle setTextStyle:](v3, "setTextStyle:", v7);
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
    -[OADTablePartStyle cellStyle](self, "cellStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applyOverridesFrom:", v5);

    -[OADTablePartStyle textStyle](self, "textStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyOverridesFrom:", v7);

  }
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTablePartStyle;
  -[OADTablePartStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCellStyle, 0);
  objc_storeStrong((id *)&self->mTextStyle, 0);
}

@end
