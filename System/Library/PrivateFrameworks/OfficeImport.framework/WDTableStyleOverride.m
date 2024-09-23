@implementation WDTableStyleOverride

- (WDTableStyleOverride)initWithDocument:(id)a3
{
  id v4;
  WDTableStyleOverride *v5;
  WDTableStyleOverride *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WDTableStyleOverride;
  v5 = -[WDTableStyleOverride init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mDocument, v4);

  return v6;
}

- (void)setPart:(int)a3
{
  self->mPart = a3;
}

- (void)setStyle:(id)a3
{
  objc_storeWeak((id *)&self->mStyle, a3);
}

- (WDStyle)style
{
  return (WDStyle *)objc_loadWeakRetained((id *)&self->mStyle);
}

- (id)mutableParagraphProperties
{
  WDParagraphProperties *mParagraphProperties;
  WDParagraphProperties *v4;
  id WeakRetained;
  WDParagraphProperties *v6;
  WDParagraphProperties *v7;

  mParagraphProperties = self->mParagraphProperties;
  if (!mParagraphProperties)
  {
    v4 = [WDParagraphProperties alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    v6 = -[WDParagraphProperties initWithDocument:](v4, "initWithDocument:", WeakRetained);
    v7 = self->mParagraphProperties;
    self->mParagraphProperties = v6;

    *((_BYTE *)self + 56) |= 1u;
    mParagraphProperties = self->mParagraphProperties;
  }
  return mParagraphProperties;
}

- (id)mutableCharacterProperties
{
  WDCharacterProperties *mCharacterProperties;
  WDCharacterProperties *v4;
  id WeakRetained;
  WDCharacterProperties *v6;
  WDCharacterProperties *v7;

  mCharacterProperties = self->mCharacterProperties;
  if (!mCharacterProperties)
  {
    v4 = [WDCharacterProperties alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    v6 = -[WDCharacterProperties initWithDocument:](v4, "initWithDocument:", WeakRetained);
    v7 = self->mCharacterProperties;
    self->mCharacterProperties = v6;

    *((_BYTE *)self + 56) |= 2u;
    mCharacterProperties = self->mCharacterProperties;
  }
  return mCharacterProperties;
}

- (id)mutableTableCellStyleProperties
{
  WDTableCellProperties *mTableCellStyleProperties;
  WDTableCellProperties *v4;
  WDTableCellProperties *v5;

  mTableCellStyleProperties = self->mTableCellStyleProperties;
  if (!mTableCellStyleProperties)
  {
    v4 = objc_alloc_init(WDTableCellProperties);
    v5 = self->mTableCellStyleProperties;
    self->mTableCellStyleProperties = v4;

    *((_BYTE *)self + 56) |= 8u;
    mTableCellStyleProperties = self->mTableCellStyleProperties;
  }
  return mTableCellStyleProperties;
}

- (BOOL)isTableRowPropertiesOverridden
{
  return (*((unsigned __int8 *)self + 56) >> 2) & 1;
}

- (BOOL)isTableCellStylePropertiesOverridden
{
  return (*((unsigned __int8 *)self + 56) >> 3) & 1;
}

- (id)tableCellStyleProperties
{
  return self->mTableCellStyleProperties;
}

- (id)mutableTableRowProperties
{
  WDTableRowProperties *mTableRowProperties;
  WDTableRowProperties *v4;
  id WeakRetained;
  WDTableRowProperties *v6;
  WDTableRowProperties *v7;

  mTableRowProperties = self->mTableRowProperties;
  if (!mTableRowProperties)
  {
    v4 = [WDTableRowProperties alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    v6 = -[WDTableRowProperties initWithDocument:](v4, "initWithDocument:", WeakRetained);
    v7 = self->mTableRowProperties;
    self->mTableRowProperties = v6;

    *((_BYTE *)self + 56) |= 4u;
    mTableRowProperties = self->mTableRowProperties;
  }
  return mTableRowProperties;
}

- (int)part
{
  return self->mPart;
}

- (id)paragraphProperties
{
  return self->mParagraphProperties;
}

- (BOOL)isParagraphPropertiesOverridden
{
  return *((_BYTE *)self + 56) & 1;
}

- (void)setParagraphPropertiesOverridden:(BOOL)a3
{
  *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xFE | a3;
}

- (id)characterProperties
{
  return self->mCharacterProperties;
}

- (BOOL)isCharacterPropertiesOverridden
{
  return (*((unsigned __int8 *)self + 56) >> 1) & 1;
}

- (void)setCharacterPropertiesOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xFD | v3;
}

- (id)tableProperties
{
  return -[WDTableRowProperties tableProperties](self->mTableRowProperties, "tableProperties");
}

- (BOOL)isTablePropertiesOverridden
{
  return (*((unsigned __int8 *)self + 56) >> 2) & 1;
}

- (id)tableRowProperties
{
  return self->mTableRowProperties;
}

- (void)setTableRowPropertiesOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xFB | v3;
}

- (void)setTableCellStylePropertiesOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 56) = *((_BYTE *)self + 56) & 0xF7 | v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDTableStyleOverride *v4;
  id WeakRetained;
  uint64_t v6;
  WDParagraphProperties *mParagraphProperties;
  uint64_t v8;
  WDCharacterProperties *mCharacterProperties;
  uint64_t v10;
  WDTableRowProperties *mTableRowProperties;
  uint64_t v12;
  WDTableCellProperties *mTableCellStyleProperties;
  WDTableStyleOverride *v14;

  v4 = -[WDTableStyleOverride init](+[WDTableStyleOverride allocWithZone:](WDTableStyleOverride, "allocWithZone:", a3), "init");
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mStyle);
    objc_storeWeak((id *)&v4->mStyle, WeakRetained);

    v4->mPart = self->mPart;
    v6 = -[WDParagraphProperties copy](self->mParagraphProperties, "copy");
    mParagraphProperties = v4->mParagraphProperties;
    v4->mParagraphProperties = (WDParagraphProperties *)v6;

    *((_BYTE *)v4 + 56) = *((_BYTE *)v4 + 56) & 0xFE | *((_BYTE *)self + 56) & 1;
    v8 = -[WDCharacterProperties copy](self->mCharacterProperties, "copy");
    mCharacterProperties = v4->mCharacterProperties;
    v4->mCharacterProperties = (WDCharacterProperties *)v8;

    *((_BYTE *)v4 + 56) = *((_BYTE *)v4 + 56) & 0xFD | *((_BYTE *)self + 56) & 2;
    v10 = -[WDTableRowProperties copy](self->mTableRowProperties, "copy");
    mTableRowProperties = v4->mTableRowProperties;
    v4->mTableRowProperties = (WDTableRowProperties *)v10;

    *((_BYTE *)v4 + 56) = *((_BYTE *)v4 + 56) & 0xFB | *((_BYTE *)self + 56) & 4;
    v12 = -[WDTableCellProperties copy](self->mTableCellStyleProperties, "copy");
    mTableCellStyleProperties = v4->mTableCellStyleProperties;
    v4->mTableCellStyleProperties = (WDTableCellProperties *)v12;

    *((_BYTE *)v4 + 56) = *((_BYTE *)v4 + 56) & 0xF7 | *((_BYTE *)self + 56) & 8;
    v14 = v4;
  }

  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDTableStyleOverride;
  -[WDTableStyleOverride description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mStyle);
  objc_storeStrong((id *)&self->mTableCellStyleProperties, 0);
  objc_storeStrong((id *)&self->mTableRowProperties, 0);
  objc_storeStrong((id *)&self->mCharacterProperties, 0);
  objc_storeStrong((id *)&self->mParagraphProperties, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end
