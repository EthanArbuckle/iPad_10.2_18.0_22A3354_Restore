@implementation WDStyle

- (WDStyle)initWithStyleSheet:(id)a3 id:(id)a4 type:(int)a5
{
  id v8;
  id v9;
  WDStyle *v10;
  WDParagraphProperties *v11;
  void *v12;
  uint64_t v13;
  WDParagraphProperties *mParagraphProperties;
  WDCharacterProperties *v15;
  void *v16;
  uint64_t v17;
  WDCharacterProperties *mCharacterProperties;
  void *v19;
  WDTableRowProperties *v20;
  WDTableRowProperties *mTableRowProperties;
  WDTableCellProperties *v22;
  WDTableCellProperties *mTableCellProperties;
  uint64_t v24;
  WDTableStyleOverride **mTableStyleOverrides;
  WDTableStyleOverride *v26;
  WDTableStyleOverride *v27;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WDStyle;
  v10 = -[WDStyle init](&v29, sel_init);
  if (v10)
  {
    v11 = [WDParagraphProperties alloc];
    objc_msgSend(v8, "document");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WDParagraphProperties initWithDocument:](v11, "initWithDocument:", v12);
    mParagraphProperties = v10->mParagraphProperties;
    v10->mParagraphProperties = (WDParagraphProperties *)v13;

    v15 = [WDCharacterProperties alloc];
    objc_msgSend(v8, "document");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WDCharacterProperties initWithDocument:](v15, "initWithDocument:", v16);
    mCharacterProperties = v10->mCharacterProperties;
    v10->mCharacterProperties = (WDCharacterProperties *)v17;

    v10->mStyleType = a5;
    if (a5 == 3)
    {
      objc_msgSend(v8, "document");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[WDTableRowProperties initWithDocument:]([WDTableRowProperties alloc], "initWithDocument:", v19);
      mTableRowProperties = v10->mTableRowProperties;
      v10->mTableRowProperties = v20;

      v22 = objc_alloc_init(WDTableCellProperties);
      mTableCellProperties = v10->mTableCellProperties;
      v10->mTableCellProperties = v22;

      v24 = 0;
      mTableStyleOverrides = v10->mTableStyleOverrides;
      do
      {
        v26 = -[WDTableStyleOverride initWithDocument:]([WDTableStyleOverride alloc], "initWithDocument:", v19);
        v27 = mTableStyleOverrides[v24];
        mTableStyleOverrides[v24] = v26;

        -[WDTableStyleOverride setPart:](mTableStyleOverrides[v24], "setPart:", v24);
        ++v24;
      }
      while (v24 != 12);

    }
    objc_storeStrong((id *)&v10->mId, a4);
    objc_storeWeak((id *)&v10->mStyleSheet, v8);
  }

  return v10;
}

- (void)setName:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->mName, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mStyleSheet);
  objc_msgSend(WeakRetained, "setName:forId:", v5, self->mId);

}

- (void)setHidden:(BOOL)a3
{
  self->mHidden = a3;
}

- (void)setBaseStyle:(id)a3
{
  WDStyle *v4;
  WDStyle *v5;
  uint64_t v6;
  WDStyle *v7;
  WDStyle *v8;
  WDStyle *v9;

  v4 = (WDStyle *)a3;
  v9 = v4;
  if (v4)
  {
    v5 = v4;
    while (v5 != self)
    {
      -[WDStyle baseStyle](v5, "baseStyle");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (WDStyle *)v6;
      if (!v6)
      {
        v7 = 0;
        v8 = v9;
        goto LABEL_8;
      }
    }
    v8 = 0;
    v7 = self;
LABEL_8:

  }
  else
  {
    v8 = 0;
  }
  objc_storeWeak((id *)&self->mBaseStyle, v8);

}

- (void)setNextStyle:(id)a3
{
  objc_storeWeak((id *)&self->mNextStyle, a3);
}

- (WDStyleSheet)styleSheet
{
  return (WDStyleSheet *)objc_loadWeakRetained((id *)&self->mStyleSheet);
}

- (id)paragraphProperties
{
  return self->mParagraphProperties;
}

- (id)characterProperties
{
  return self->mCharacterProperties;
}

- (int)type
{
  return self->mStyleType;
}

- (id)name
{
  return self->mName;
}

- (WDStyle)baseStyle
{
  return (WDStyle *)objc_loadWeakRetained((id *)&self->mBaseStyle);
}

- (id)tableRowProperties
{
  return self->mTableRowProperties;
}

- (id)tableCellProperties
{
  return self->mTableCellProperties;
}

- (id)tableStyleOverrideForPart:(int)a3
{
  return self->mTableStyleOverrides[a3];
}

- (id)id
{
  return self->mId;
}

- (id)tableProperties
{
  return -[WDTableRowProperties tableProperties](self->mTableRowProperties, "tableProperties");
}

- (BOOL)hidden
{
  return self->mHidden;
}

- (BOOL)isAnythingOverridden
{
  return self->mHidden
      || -[WDParagraphProperties isAnythingOverridden](self->mParagraphProperties, "isAnythingOverridden")
      || -[WDCharacterProperties isAnythingOverridden](self->mCharacterProperties, "isAnythingOverridden");
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDStyle *v4;
  uint64_t v5;
  WDParagraphProperties *mParagraphProperties;
  uint64_t v7;
  WDCharacterProperties *mCharacterProperties;
  uint64_t v9;
  WDTableRowProperties *mTableRowProperties;
  uint64_t v11;
  WDTableCellProperties *mTableCellProperties;
  id WeakRetained;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSString *mName;
  id v19;
  id v20;

  v4 = -[WDStyle init](+[WDStyle allocWithZone:](WDStyle, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[WDParagraphProperties copy](self->mParagraphProperties, "copy");
    mParagraphProperties = v4->mParagraphProperties;
    v4->mParagraphProperties = (WDParagraphProperties *)v5;

    v7 = -[WDCharacterProperties copy](self->mCharacterProperties, "copy");
    mCharacterProperties = v4->mCharacterProperties;
    v4->mCharacterProperties = (WDCharacterProperties *)v7;

    v9 = -[WDTableRowProperties copy](self->mTableRowProperties, "copy");
    mTableRowProperties = v4->mTableRowProperties;
    v4->mTableRowProperties = (WDTableRowProperties *)v9;

    v11 = -[WDTableCellProperties copy](self->mTableCellProperties, "copy");
    mTableCellProperties = v4->mTableCellProperties;
    v4->mTableCellProperties = (WDTableCellProperties *)v11;

    WeakRetained = objc_loadWeakRetained((id *)&self->mStyleSheet);
    objc_storeWeak((id *)&v4->mStyleSheet, WeakRetained);

    for (i = 40; i != 136; i += 8)
    {
      v15 = objc_msgSend(*(id *)((char *)&self->super.isa + i), "copy");
      v16 = *(Class *)((char *)&v4->super.isa + i);
      *(Class *)((char *)&v4->super.isa + i) = (Class)v15;

    }
    v17 = -[NSString copy](self->mName, "copy");
    mName = v4->mName;
    v4->mName = (NSString *)v17;

    v4->mStyleType = self->mStyleType;
    v19 = objc_loadWeakRetained((id *)&self->mBaseStyle);
    -[WDStyle setBaseStyle:](v4, "setBaseStyle:", v19);

    v20 = objc_loadWeakRetained((id *)&self->mNextStyle);
    -[WDStyle setNextStyle:](v4, "setNextStyle:", v20);

  }
  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDStyle;
  -[WDStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WDStyle)nextStyle
{
  return (WDStyle *)objc_loadWeakRetained((id *)&self->mNextStyle);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_destroyWeak((id *)&self->mNextStyle);
  objc_destroyWeak((id *)&self->mBaseStyle);
  objc_destroyWeak((id *)&self->mStyleSheet);
  objc_storeStrong((id *)&self->mId, 0);
  objc_storeStrong((id *)&self->mName, 0);
  for (i = 128; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->mTableCellProperties, 0);
  objc_storeStrong((id *)&self->mTableRowProperties, 0);
  objc_storeStrong((id *)&self->mCharacterProperties, 0);
  objc_storeStrong((id *)&self->mParagraphProperties, 0);
}

@end
