@implementation WDParagraphProperties

- (WDParagraphProperties)initWithDocument:(id)a3
{
  id v4;
  WDParagraphProperties *v5;
  WDParagraphProperties *v6;
  WDCharacterProperties *mCharacterProperties;
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *mTrackedProperties;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDParagraphProperties;
  v5 = -[WDParagraphProperties init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    *((_BYTE *)v6 + 17) = *((_BYTE *)v6 + 17) & 0xF8 | 1;
    mCharacterProperties = v6->mCharacterProperties;
    v6->mCharacterProperties = 0;

    mOriginalProperties = v6->mOriginalProperties;
    v6->mOriginalProperties = 0;

    mTrackedProperties = v6->mTrackedProperties;
    v6->mTrackedProperties = 0;

  }
  return v6;
}

- (void)setResolveMode:(int)a3
{
  *((_BYTE *)self + 17) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((_BYTE *)self + 17) & 0xF8;
  -[WDCharacterProperties setResolveMode:](self->mCharacterProperties, "setResolveMode:");
}

- (void)setPageBreakBefore:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setPageBreakBefore:](mOriginalProperties, "setPageBreakBefore:", v3);
  objc_msgSend(*p_mOriginalProperties, "setPageBreakBeforeOverridden:", 1);
}

- (void)setListLevel:(unsigned __int8)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setListLevel:](mOriginalProperties, "setListLevel:", v3);
  objc_msgSend(*p_mOriginalProperties, "setListLevelOverridden:", 1);
}

- (void)setListIndex:(unint64_t)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setListIndex:](mOriginalProperties, "setListIndex:", a3);
  objc_msgSend(*p_mOriginalProperties, "setListIndexOverridden:", 1);
}

- (void)setDropCap:(id)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setDropCap:](mOriginalProperties, "setDropCap:", *(unsigned __int16 *)&a3);
  objc_msgSend(*p_mOriginalProperties, "setDropCapOverridden:", 1);
}

- (void)setWidth:(int64_t)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setWidth:](mOriginalProperties, "setWidth:", a3);
  objc_msgSend(*p_mOriginalProperties, "setWidthOverridden:", 1);
}

- (void)setHeight:(int64_t)a3
{
  unsigned __int16 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setHeight:](mOriginalProperties, "setHeight:", v3);
  objc_msgSend(*p_mOriginalProperties, "setHeightOverridden:", 1);
}

- (void)setHeightRule:(int)a3
{
  unsigned __int8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setHeightRule:](mOriginalProperties, "setHeightRule:", v3);
  objc_msgSend(*p_mOriginalProperties, "setHeightRuleOverridden:", 1);
}

- (void)setVerticalSpace:(int64_t)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setVerticalSpace:](mOriginalProperties, "setVerticalSpace:", a3);
  objc_msgSend(*p_mOriginalProperties, "setVerticalSpaceOverridden:", 1);
}

- (void)setHorizontalSpace:(int64_t)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setHorizontalSpace:](mOriginalProperties, "setHorizontalSpace:", a3);
  objc_msgSend(*p_mOriginalProperties, "setHorizontalSpaceOverridden:", 1);
}

- (void)setWrap:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setWrap:](mOriginalProperties, "setWrap:", v3);
  objc_msgSend(*p_mOriginalProperties, "setWrapOverridden:", 1);
}

- (void)setHorizontalAnchor:(int)a3
{
  unsigned __int8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setHorizontalAnchor:](mOriginalProperties, "setHorizontalAnchor:", v3);
  objc_msgSend(*p_mOriginalProperties, "setHorizontalAnchorOverridden:", 1);
}

- (void)setVerticalAnchor:(int)a3
{
  unsigned __int8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setVerticalAnchor:](mOriginalProperties, "setVerticalAnchor:", v3);
  objc_msgSend(*p_mOriginalProperties, "setVerticalAnchorOverridden:", 1);
}

- (void)setHorizontalPosition:(int64_t)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setHorizontalPosition:](mOriginalProperties, "setHorizontalPosition:", a3);
  objc_msgSend(*p_mOriginalProperties, "setHorizontalPositionOverridden:", 1);
}

- (void)setVerticalPosition:(int64_t)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setVerticalPosition:](mOriginalProperties, "setVerticalPosition:", a3);
  objc_msgSend(*p_mOriginalProperties, "setVerticalPositionOverridden:", 1);
}

- (void)setAnchorLock:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setAnchorLock:](mOriginalProperties, "setAnchorLock:", v3);
  objc_msgSend(*p_mOriginalProperties, "setAnchorLockOverridden:", 1);
}

- (id)mutableTopBorder
{
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *v4;
  WDParagraphPropertiesValues *v5;
  id v6;
  id v7;
  _BOOL4 v8;
  WDParagraphPropertiesValues *v9;
  WDParagraphPropertiesValues *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v12;
  WDParagraphPropertiesValues *v13;
  id v14;
  id v15;
  _BOOL4 v16;
  WDBorder *v17;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties)
        goto LABEL_13;
      v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mTrackedProperties, "setTabStopAddedTable:", v14);

      v15 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mTrackedProperties, "setTabStopDeletedTable:", v15);

      mTrackedProperties = self->mTrackedProperties;
    }
    v16 = -[WDParagraphPropertiesValues topBorderOverridden](mTrackedProperties, "topBorderOverridden");
    v9 = self->mTrackedProperties;
    if (!v16)
    {
      -[WDParagraphPropertiesValues setTopBorderOverridden:](v9, "setTopBorderOverridden:", 1);
      v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((*((_BYTE *)self + 17) & 1) == 0)
    goto LABEL_13;
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties)
    goto LABEL_6;
  v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    return v17;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mOriginalProperties, "setTabStopAddedTable:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mOriginalProperties, "setTabStopDeletedTable:", v7);

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  v8 = -[WDParagraphPropertiesValues topBorderOverridden](mOriginalProperties, "topBorderOverridden");
  v9 = self->mOriginalProperties;
  if (!v8)
  {
    -[WDParagraphPropertiesValues setTopBorderOverridden:](v9, "setTopBorderOverridden:", 1);
    v10 = self->mOriginalProperties;
LABEL_15:
    v17 = objc_alloc_init(WDBorder);
    -[WDParagraphPropertiesValues setTopBorder:](v10, "setTopBorder:", v17);
    return v17;
  }
LABEL_12:
  -[WDParagraphPropertiesValues topBorder](v9, "topBorder");
  v17 = (WDBorder *)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (id)mutableLeftBorder
{
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *v4;
  WDParagraphPropertiesValues *v5;
  id v6;
  id v7;
  _BOOL4 v8;
  WDParagraphPropertiesValues *v9;
  WDParagraphPropertiesValues *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v12;
  WDParagraphPropertiesValues *v13;
  id v14;
  id v15;
  _BOOL4 v16;
  WDBorder *v17;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties)
        goto LABEL_13;
      v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mTrackedProperties, "setTabStopAddedTable:", v14);

      v15 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mTrackedProperties, "setTabStopDeletedTable:", v15);

      mTrackedProperties = self->mTrackedProperties;
    }
    v16 = -[WDParagraphPropertiesValues leftBorderOverridden](mTrackedProperties, "leftBorderOverridden");
    v9 = self->mTrackedProperties;
    if (!v16)
    {
      -[WDParagraphPropertiesValues setLeftBorderOverridden:](v9, "setLeftBorderOverridden:", 1);
      v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((*((_BYTE *)self + 17) & 1) == 0)
    goto LABEL_13;
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties)
    goto LABEL_6;
  v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    return v17;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mOriginalProperties, "setTabStopAddedTable:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mOriginalProperties, "setTabStopDeletedTable:", v7);

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  v8 = -[WDParagraphPropertiesValues leftBorderOverridden](mOriginalProperties, "leftBorderOverridden");
  v9 = self->mOriginalProperties;
  if (!v8)
  {
    -[WDParagraphPropertiesValues setLeftBorderOverridden:](v9, "setLeftBorderOverridden:", 1);
    v10 = self->mOriginalProperties;
LABEL_15:
    v17 = objc_alloc_init(WDBorder);
    -[WDParagraphPropertiesValues setLeftBorder:](v10, "setLeftBorder:", v17);
    return v17;
  }
LABEL_12:
  -[WDParagraphPropertiesValues leftBorder](v9, "leftBorder");
  v17 = (WDBorder *)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (id)mutableBottomBorder
{
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *v4;
  WDParagraphPropertiesValues *v5;
  id v6;
  id v7;
  _BOOL4 v8;
  WDParagraphPropertiesValues *v9;
  WDParagraphPropertiesValues *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v12;
  WDParagraphPropertiesValues *v13;
  id v14;
  id v15;
  _BOOL4 v16;
  WDBorder *v17;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties)
        goto LABEL_13;
      v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mTrackedProperties, "setTabStopAddedTable:", v14);

      v15 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mTrackedProperties, "setTabStopDeletedTable:", v15);

      mTrackedProperties = self->mTrackedProperties;
    }
    v16 = -[WDParagraphPropertiesValues bottomBorderOverridden](mTrackedProperties, "bottomBorderOverridden");
    v9 = self->mTrackedProperties;
    if (!v16)
    {
      -[WDParagraphPropertiesValues setBottomBorderOverridden:](v9, "setBottomBorderOverridden:", 1);
      v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((*((_BYTE *)self + 17) & 1) == 0)
    goto LABEL_13;
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties)
    goto LABEL_6;
  v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    return v17;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mOriginalProperties, "setTabStopAddedTable:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mOriginalProperties, "setTabStopDeletedTable:", v7);

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  v8 = -[WDParagraphPropertiesValues bottomBorderOverridden](mOriginalProperties, "bottomBorderOverridden");
  v9 = self->mOriginalProperties;
  if (!v8)
  {
    -[WDParagraphPropertiesValues setBottomBorderOverridden:](v9, "setBottomBorderOverridden:", 1);
    v10 = self->mOriginalProperties;
LABEL_15:
    v17 = objc_alloc_init(WDBorder);
    -[WDParagraphPropertiesValues setBottomBorder:](v10, "setBottomBorder:", v17);
    return v17;
  }
LABEL_12:
  -[WDParagraphPropertiesValues bottomBorder](v9, "bottomBorder");
  v17 = (WDBorder *)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (id)mutableRightBorder
{
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *v4;
  WDParagraphPropertiesValues *v5;
  id v6;
  id v7;
  void *v8;
  WDParagraphPropertiesValues *v9;
  WDParagraphPropertiesValues *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v12;
  WDParagraphPropertiesValues *v13;
  id v14;
  id v15;
  void *v16;
  WDBorder *v17;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties)
        goto LABEL_13;
      v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mTrackedProperties, "setTabStopAddedTable:", v14);

      v15 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mTrackedProperties, "setTabStopDeletedTable:", v15);

      mTrackedProperties = self->mTrackedProperties;
    }
    -[WDParagraphPropertiesValues rightBorder](mTrackedProperties, "rightBorder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = self->mTrackedProperties;
    if (!v16)
    {
      -[WDParagraphPropertiesValues setRightBorderOverridden:](v9, "setRightBorderOverridden:", 1);
      v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((*((_BYTE *)self + 17) & 1) == 0)
    goto LABEL_13;
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties)
    goto LABEL_6;
  v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    return v17;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mOriginalProperties, "setTabStopAddedTable:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mOriginalProperties, "setTabStopDeletedTable:", v7);

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  -[WDParagraphPropertiesValues rightBorder](mOriginalProperties, "rightBorder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self->mOriginalProperties;
  if (!v8)
  {
    -[WDParagraphPropertiesValues setRightBorderOverridden:](v9, "setRightBorderOverridden:", 1);
    v10 = self->mOriginalProperties;
LABEL_15:
    v17 = objc_alloc_init(WDBorder);
    -[WDParagraphPropertiesValues setRightBorder:](v10, "setRightBorder:", v17);
    return v17;
  }
LABEL_12:
  -[WDParagraphPropertiesValues rightBorder](v9, "rightBorder");
  v17 = (WDBorder *)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (id)mutableBetweenBorder
{
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *v4;
  WDParagraphPropertiesValues *v5;
  id v6;
  id v7;
  void *v8;
  WDParagraphPropertiesValues *v9;
  WDParagraphPropertiesValues *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v12;
  WDParagraphPropertiesValues *v13;
  id v14;
  id v15;
  void *v16;
  WDBorder *v17;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties)
        goto LABEL_13;
      v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mTrackedProperties, "setTabStopAddedTable:", v14);

      v15 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mTrackedProperties, "setTabStopDeletedTable:", v15);

      mTrackedProperties = self->mTrackedProperties;
    }
    -[WDParagraphPropertiesValues betweenBorder](mTrackedProperties, "betweenBorder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = self->mTrackedProperties;
    if (!v16)
    {
      -[WDParagraphPropertiesValues setBetweenBorderOverridden:](v9, "setBetweenBorderOverridden:", 1);
      v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((*((_BYTE *)self + 17) & 1) == 0)
    goto LABEL_13;
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties)
    goto LABEL_6;
  v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    return v17;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mOriginalProperties, "setTabStopAddedTable:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mOriginalProperties, "setTabStopDeletedTable:", v7);

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  -[WDParagraphPropertiesValues betweenBorder](mOriginalProperties, "betweenBorder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self->mOriginalProperties;
  if (!v8)
  {
    -[WDParagraphPropertiesValues setBetweenBorderOverridden:](v9, "setBetweenBorderOverridden:", 1);
    v10 = self->mOriginalProperties;
LABEL_15:
    v17 = objc_alloc_init(WDBorder);
    -[WDParagraphPropertiesValues setBetweenBorder:](v10, "setBetweenBorder:", v17);
    return v17;
  }
LABEL_12:
  -[WDParagraphPropertiesValues betweenBorder](v9, "betweenBorder");
  v17 = (WDBorder *)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (id)mutableBarBorder
{
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *v4;
  WDParagraphPropertiesValues *v5;
  id v6;
  id v7;
  _BOOL4 v8;
  WDParagraphPropertiesValues *v9;
  WDParagraphPropertiesValues *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v12;
  WDParagraphPropertiesValues *v13;
  id v14;
  id v15;
  _BOOL4 v16;
  WDBorder *v17;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties)
        goto LABEL_13;
      v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mTrackedProperties, "setTabStopAddedTable:", v14);

      v15 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mTrackedProperties, "setTabStopDeletedTable:", v15);

      mTrackedProperties = self->mTrackedProperties;
    }
    v16 = -[WDParagraphPropertiesValues barBorderOverridden](mTrackedProperties, "barBorderOverridden");
    v9 = self->mTrackedProperties;
    if (!v16)
    {
      -[WDParagraphPropertiesValues setBarBorderOverridden:](v9, "setBarBorderOverridden:", 1);
      v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((*((_BYTE *)self + 17) & 1) == 0)
    goto LABEL_13;
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties)
    goto LABEL_6;
  v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    return v17;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mOriginalProperties, "setTabStopAddedTable:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mOriginalProperties, "setTabStopDeletedTable:", v7);

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  v8 = -[WDParagraphPropertiesValues barBorderOverridden](mOriginalProperties, "barBorderOverridden");
  v9 = self->mOriginalProperties;
  if (!v8)
  {
    -[WDParagraphPropertiesValues setBarBorderOverridden:](v9, "setBarBorderOverridden:", 1);
    v10 = self->mOriginalProperties;
LABEL_15:
    v17 = objc_alloc_init(WDBorder);
    -[WDParagraphPropertiesValues setBarBorder:](v10, "setBarBorder:", v17);
    return v17;
  }
LABEL_12:
  -[WDParagraphPropertiesValues barBorder](v9, "barBorder");
  v17 = (WDBorder *)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (id)mutableShading
{
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *v4;
  WDParagraphPropertiesValues *v5;
  id v6;
  id v7;
  void *v8;
  WDParagraphPropertiesValues *v9;
  WDParagraphPropertiesValues *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v12;
  WDParagraphPropertiesValues *v13;
  id v14;
  id v15;
  void *v16;
  WDShading *v17;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = self->mTrackedProperties;
      self->mTrackedProperties = v12;

      if (!self->mTrackedProperties)
        goto LABEL_13;
      v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mTrackedProperties, "setTabStopAddedTable:", v14);

      v15 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mTrackedProperties, "setTabStopDeletedTable:", v15);

      mTrackedProperties = self->mTrackedProperties;
    }
    -[WDParagraphPropertiesValues shading](mTrackedProperties, "shading");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = self->mTrackedProperties;
    if (!v16)
    {
      -[WDParagraphPropertiesValues setShadingOverridden:](v9, "setShadingOverridden:", 1);
      v10 = self->mTrackedProperties;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((*((_BYTE *)self + 17) & 1) == 0)
    goto LABEL_13;
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties)
    goto LABEL_6;
  v4 = objc_alloc_init(WDParagraphPropertiesValues);
  v5 = self->mOriginalProperties;
  self->mOriginalProperties = v4;

  if (!self->mOriginalProperties)
  {
LABEL_13:
    v17 = 0;
    return v17;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopAddedTable:](self->mOriginalProperties, "setTabStopAddedTable:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[WDParagraphPropertiesValues setTabStopDeletedTable:](self->mOriginalProperties, "setTabStopDeletedTable:", v7);

  mOriginalProperties = self->mOriginalProperties;
LABEL_6:
  -[WDParagraphPropertiesValues shading](mOriginalProperties, "shading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self->mOriginalProperties;
  if (!v8)
  {
    -[WDParagraphPropertiesValues setShadingOverridden:](v9, "setShadingOverridden:", 1);
    v10 = self->mOriginalProperties;
LABEL_15:
    v17 = objc_alloc_init(WDShading);
    -[WDParagraphPropertiesValues setShading:](v10, "setShading:", v17);
    return v17;
  }
LABEL_12:
  -[WDParagraphPropertiesValues shading](v9, "shading");
  v17 = (WDShading *)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (void)setSpaceBefore:(unsigned __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setSpaceBefore:](mOriginalProperties, "setSpaceBefore:", v3);
  objc_msgSend(*p_mOriginalProperties, "setSpaceBeforeOverridden:", 1);
}

- (void)setSpaceBeforeAuto:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setSpaceBeforeAuto:](mOriginalProperties, "setSpaceBeforeAuto:", v3);
  objc_msgSend(*p_mOriginalProperties, "setSpaceBeforeAutoOverridden:", 1);
}

- (void)setSpaceAfter:(unsigned __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setSpaceAfter:](mOriginalProperties, "setSpaceAfter:", v3);
  objc_msgSend(*p_mOriginalProperties, "setSpaceAfterOverridden:", 1);
}

- (void)setSpaceAfterAuto:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setSpaceAfterAuto:](mOriginalProperties, "setSpaceAfterAuto:", v3);
  objc_msgSend(*p_mOriginalProperties, "setSpaceAfterAutoOverridden:", 1);
}

- (void)setLineSpacing:(signed __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setLineSpacing:](mOriginalProperties, "setLineSpacing:", v3);
  objc_msgSend(*p_mOriginalProperties, "setLineSpacingOverridden:", 1);
}

- (void)setLineSpacingRule:(int)a3
{
  unsigned __int8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setLineSpacingRule:](mOriginalProperties, "setLineSpacingRule:", v3);
  objc_msgSend(*p_mOriginalProperties, "setLineSpacingRuleOverridden:", 1);
}

- (void)setLeftIndent:(signed __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setLeftIndent:](mOriginalProperties, "setLeftIndent:", v3);
  objc_msgSend(*p_mOriginalProperties, "setLeftIndentOverridden:", 1);
}

- (void)setRightIndent:(signed __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setRightIndent:](mOriginalProperties, "setRightIndent:", v3);
  objc_msgSend(*p_mOriginalProperties, "setRightIndentOverridden:", 1);
}

- (void)setFirstLineIndent:(signed __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setFirstLineIndent:](mOriginalProperties, "setFirstLineIndent:", v3);
  objc_msgSend(*p_mOriginalProperties, "setFirstLineIndentOverridden:", 1);
}

- (void)setJustification:(int)a3
{
  unsigned __int8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setJustification:](mOriginalProperties, "setJustification:", v3);
  objc_msgSend(*p_mOriginalProperties, "setJustificationOverridden:", 1);
}

- (void)setSuppressLineNumbers:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setSuppressLineNumbers:](mOriginalProperties, "setSuppressLineNumbers:", v3);
  objc_msgSend(*p_mOriginalProperties, "setSuppressLineNumbersOverridden:", 1);
}

- (void)setSuppressAutoHyphens:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setSuppressAutoHyphens:](mOriginalProperties, "setSuppressAutoHyphens:", v3);
  objc_msgSend(*p_mOriginalProperties, "setSuppressAutoHyphensOverridden:", 1);
}

- (void)setWidowControl:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setWidowControl:](mOriginalProperties, "setWidowControl:", v3);
  objc_msgSend(*p_mOriginalProperties, "setWidowControlOverridden:", 1);
}

- (void)setBaseStyle:(id)a3
{
  id v4;
  id *p_mTrackedProperties;
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *v7;
  id v8;
  id v9;
  id v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    v4 = mTrackedProperties;
    if (!mTrackedProperties)
    {
      v12 = objc_alloc_init(WDParagraphPropertiesValues);
      v13 = *p_mTrackedProperties;
      *p_mTrackedProperties = v12;

      if (!*p_mTrackedProperties)
        goto LABEL_11;
      v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopAddedTable:", v14);

      v15 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopDeletedTable:", v15);

      v4 = *p_mTrackedProperties;
    }
    goto LABEL_10;
  }
  if ((*((_BYTE *)self + 17) & 1) == 0)
    goto LABEL_11;
  mOriginalProperties = self->mOriginalProperties;
  p_mTrackedProperties = (id *)&self->mOriginalProperties;
  v4 = mOriginalProperties;
  if (mOriginalProperties)
  {
LABEL_10:
    objc_msgSend(v4, "setBaseStyle:", v16);
    objc_msgSend(*p_mTrackedProperties, "setBaseStyleOverridden:", 1);
    goto LABEL_11;
  }
  v7 = objc_alloc_init(WDParagraphPropertiesValues);
  v8 = *p_mTrackedProperties;
  *p_mTrackedProperties = v7;

  if (*p_mTrackedProperties)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mTrackedProperties, "setTabStopAddedTable:", v9);

    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mTrackedProperties, "setTabStopDeletedTable:", v10);

    v4 = *p_mTrackedProperties;
    goto LABEL_10;
  }
LABEL_11:

}

- (void)clearBaseStyle
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  uint64_t v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) != 0)
    goto LABEL_5;
  if ((*((_BYTE *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues baseStyleOverridden](mTrackedProperties, "baseStyleOverridden"))
      {
LABEL_5:
        v5 = 32;
LABEL_12:
        objc_msgSend(*(id *)((char *)&self->super.isa + v5), "setBaseStyleOverridden:", 0);
        objc_msgSend(*(id *)((char *)&self->super.isa + v5), "setBaseStyle:", 0);
        return;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && (mOriginalProperties = self->mOriginalProperties) != 0
    && -[WDParagraphPropertiesValues baseStyleOverridden](mOriginalProperties, "baseStyleOverridden"))
  {
    v5 = 24;
    goto LABEL_12;
  }
}

- (void)setOutlineLevel:(unsigned __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setOutlineLevel:](mOriginalProperties, "setOutlineLevel:", v3);
  objc_msgSend(*p_mOriginalProperties, "setOutlineLevelOverridden:", 1);
}

- (void)setKeepNextParagraphTogether:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setKeepNextParagraphTogether:](mOriginalProperties, "setKeepNextParagraphTogether:", v3);
  objc_msgSend(*p_mOriginalProperties, "setKeepNextParagraphTogetherOverridden:", 1);
}

- (void)addTabStopAdded:(id *)a3
{
  WDParagraphPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  id v8;
  id v9;
  WDParagraphPropertiesValues *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      v10 = objc_alloc_init(WDParagraphPropertiesValues);
      v11 = *p_mTrackedProperties;
      *p_mTrackedProperties = v10;

      if (!*p_mTrackedProperties)
        return;
      v12 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopAddedTable:", v12);

      v13 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopDeletedTable:", v13);

      mTrackedProperties = (WDParagraphPropertiesValues *)*p_mTrackedProperties;
    }
  }
  else
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
      v6 = objc_alloc_init(WDParagraphPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      if (!*p_mTrackedProperties)
        return;
      v8 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopAddedTable:", v8);

      v9 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopDeletedTable:", v9);

      mTrackedProperties = (WDParagraphPropertiesValues *)*p_mTrackedProperties;
    }
  }
  -[WDParagraphPropertiesValues tabStopAddedTable](mTrackedProperties, "tabStopAddedTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendBytes:length:", a3, 4);

  objc_msgSend(*p_mTrackedProperties, "setTabStopAddedCount:", objc_msgSend(*p_mTrackedProperties, "tabStopAddedCount") + 1);
  objc_msgSend(*p_mTrackedProperties, "setTabStopAddedCountOverridden:", 1);
}

- (void)setTabStopAddedCount:(unint64_t)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setTabStopAddedCount:](mOriginalProperties, "setTabStopAddedCount:", a3);
  objc_msgSend(*p_mOriginalProperties, "setTabStopAddedCountOverridden:", 1);
}

- (void)setTabStopDeletedPositionCount:(unint64_t)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setTabStopDeletedCount:](mOriginalProperties, "setTabStopDeletedCount:", a3);
  objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedCountOverridden:", 1);
}

- (void)setCharacterProperties:(id)a3
{
  objc_storeStrong((id *)&self->mCharacterProperties, a3);
  self->mCharacterPropertiesOverridden = 1;
}

- (void)addTabStopDeletedPosition:(signed __int16)a3
{
  WDParagraphPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  id v6;
  id v7;
  id v8;
  WDParagraphPropertiesValues *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  signed __int16 v14;

  v14 = a3;
  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
    {
      v9 = objc_alloc_init(WDParagraphPropertiesValues);
      v10 = *p_mTrackedProperties;
      *p_mTrackedProperties = v9;

      if (!*p_mTrackedProperties)
        return;
      v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopAddedTable:", v11);

      v12 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopDeletedTable:", v12);

      mTrackedProperties = (WDParagraphPropertiesValues *)*p_mTrackedProperties;
    }
  }
  else
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
      v5 = objc_alloc_init(WDParagraphPropertiesValues);
      v6 = *p_mTrackedProperties;
      *p_mTrackedProperties = v5;

      if (!*p_mTrackedProperties)
        return;
      v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopAddedTable:", v7);

      v8 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(*p_mTrackedProperties, "setTabStopDeletedTable:", v8);

      mTrackedProperties = (WDParagraphPropertiesValues *)*p_mTrackedProperties;
    }
  }
  -[WDParagraphPropertiesValues tabStopDeletedTable](mTrackedProperties, "tabStopDeletedTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendBytes:length:", &v14, 2);

  objc_msgSend(*p_mTrackedProperties, "setTabStopDeletedCount:", objc_msgSend(*p_mTrackedProperties, "tabStopDeletedCount") + 1);
  objc_msgSend(*p_mTrackedProperties, "setTabStopDeletedCountOverridden:", 1);
}

- (BOOL)isHorizontalAnchorOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues horizontalAnchorOverridden](mTrackedProperties, "horizontalAnchorOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues horizontalAnchorOverridden](mOriginalProperties, "horizontalAnchorOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues horizontalAnchorOverridden](v5, "horizontalAnchorOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues horizontalAnchorOverridden](v5, "horizontalAnchorOverridden");
  return 0;
}

- (BOOL)isVerticalAnchorOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues verticalAnchorOverridden](mTrackedProperties, "verticalAnchorOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues verticalAnchorOverridden](mOriginalProperties, "verticalAnchorOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues verticalAnchorOverridden](v5, "verticalAnchorOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues verticalAnchorOverridden](v5, "verticalAnchorOverridden");
  return 0;
}

- (BOOL)isHorizontalPositionOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues horizontalPositionOverridden](mTrackedProperties, "horizontalPositionOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues horizontalPositionOverridden](mOriginalProperties, "horizontalPositionOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues horizontalPositionOverridden](v5, "horizontalPositionOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues horizontalPositionOverridden](v5, "horizontalPositionOverridden");
  return 0;
}

- (BOOL)isVerticalPositionOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues verticalPositionOverridden](mTrackedProperties, "verticalPositionOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues verticalPositionOverridden](mOriginalProperties, "verticalPositionOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues verticalPositionOverridden](v5, "verticalPositionOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues verticalPositionOverridden](v5, "verticalPositionOverridden");
  return 0;
}

- (BOOL)isBaseStyleOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues baseStyleOverridden](mTrackedProperties, "baseStyleOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues baseStyleOverridden](mOriginalProperties, "baseStyleOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues baseStyleOverridden](v5, "baseStyleOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues baseStyleOverridden](v5, "baseStyleOverridden");
  return 0;
}

- (id)baseStyle
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  void *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues baseStyleOverridden](mTrackedProperties, "baseStyleOverridden"))
      {
LABEL_8:
        -[WDParagraphPropertiesValues baseStyle](*p_mTrackedProperties, "baseStyle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
LABEL_9:
    v6 = 0;
    return v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v6, "baseStyleOverridden"))
      goto LABEL_8;
    goto LABEL_9;
  }
  return v6;
}

- (id)characterProperties
{
  return self->mCharacterProperties;
}

- (BOOL)isSpaceAfterOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues spaceAfterOverridden](mTrackedProperties, "spaceAfterOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues spaceAfterOverridden](mOriginalProperties, "spaceAfterOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues spaceAfterOverridden](v5, "spaceAfterOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues spaceAfterOverridden](v5, "spaceAfterOverridden");
  return 0;
}

- (BOOL)isSpaceBeforeOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues spaceBeforeOverridden](mTrackedProperties, "spaceBeforeOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues spaceBeforeOverridden](mOriginalProperties, "spaceBeforeOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues spaceBeforeOverridden](v5, "spaceBeforeOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues spaceBeforeOverridden](v5, "spaceBeforeOverridden");
  return 0;
}

- (BOOL)isLineSpacingOverridden
{
  char v3;
  WDParagraphPropertiesValues *v4;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) != 0)
  {
LABEL_5:
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties
      && -[WDParagraphPropertiesValues lineSpacingOverridden](mTrackedProperties, "lineSpacingOverridden")
      && -[WDParagraphPropertiesValues lineSpacing](self->mTrackedProperties, "lineSpacing"))
    {
      LOBYTE(v6) = 1;
      return (char)v6;
    }
LABEL_16:
    LOBYTE(v6) = 0;
    return (char)v6;
  }
  if ((*((_BYTE *)self + 17) & 4) != 0)
  {
    v4 = self->mTrackedProperties;
    if (v4)
    {
      if (-[WDParagraphPropertiesValues lineSpacingOverridden](v4, "lineSpacingOverridden"))
        goto LABEL_5;
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 1) == 0)
  {
    if ((v3 & 4) == 0)
      goto LABEL_16;
    mOriginalProperties = self->mOriginalProperties;
    if (!mOriginalProperties
      || !-[WDParagraphPropertiesValues lineSpacingOverridden](mOriginalProperties, "lineSpacingOverridden"))
    {
      goto LABEL_16;
    }
  }
  v6 = self->mOriginalProperties;
  if (v6)
    LOBYTE(v6) = -[WDParagraphPropertiesValues lineSpacingOverridden](v6, "lineSpacingOverridden");
  return (char)v6;
}

- (BOOL)isJustificationOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues justificationOverridden](mTrackedProperties, "justificationOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues justificationOverridden](mOriginalProperties, "justificationOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues justificationOverridden](v5, "justificationOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues justificationOverridden](v5, "justificationOverridden");
  return 0;
}

- (BOOL)isLeftIndentOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues leftIndentOverridden](mTrackedProperties, "leftIndentOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues leftIndentOverridden](mOriginalProperties, "leftIndentOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues leftIndentOverridden](v5, "leftIndentOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues leftIndentOverridden](v5, "leftIndentOverridden");
  return 0;
}

- (BOOL)isRightIndentOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues rightIndentOverridden](mTrackedProperties, "rightIndentOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues rightIndentOverridden](mOriginalProperties, "rightIndentOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues rightIndentOverridden](v5, "rightIndentOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues rightIndentOverridden](v5, "rightIndentOverridden");
  return 0;
}

- (BOOL)isFirstLineIndentOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues firstLineIndentOverridden](mTrackedProperties, "firstLineIndentOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues firstLineIndentOverridden](mOriginalProperties, "firstLineIndentOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues firstLineIndentOverridden](v5, "firstLineIndentOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues firstLineIndentOverridden](v5, "firstLineIndentOverridden");
  return 0;
}

- (BOOL)isListIndexOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues listIndexOverridden](mTrackedProperties, "listIndexOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues listIndexOverridden](mOriginalProperties, "listIndexOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues listIndexOverridden](v5, "listIndexOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues listIndexOverridden](v5, "listIndexOverridden");
  return 0;
}

- (BOOL)isListLevelOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues listLevelOverridden](mTrackedProperties, "listLevelOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues listLevelOverridden](mOriginalProperties, "listLevelOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues listLevelOverridden](v5, "listLevelOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues listLevelOverridden](v5, "listLevelOverridden");
  return 0;
}

- (BOOL)isBottomBorderOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues bottomBorderOverridden](mTrackedProperties, "bottomBorderOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues bottomBorderOverridden](mOriginalProperties, "bottomBorderOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues bottomBorderOverridden](v5, "bottomBorderOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues bottomBorderOverridden](v5, "bottomBorderOverridden");
  return 0;
}

- (BOOL)isShadingOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues shadingOverridden](mTrackedProperties, "shadingOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues shadingOverridden](mOriginalProperties, "shadingOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues shadingOverridden](v5, "shadingOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues shadingOverridden](v5, "shadingOverridden");
  return 0;
}

- (int)justification
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues justificationOverridden](mTrackedProperties, "justificationOverridden"))
      {
LABEL_8:
        LODWORD(v6) = -[WDParagraphPropertiesValues justification](*p_mTrackedProperties, "justification");
        return (int)v6;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
    LODWORD(v6) = 0;
    return (int)v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    LODWORD(v6) = -[WDParagraphPropertiesValues justificationOverridden](v6, "justificationOverridden");
    p_mTrackedProperties = p_mOriginalProperties;
    if ((_DWORD)v6)
      goto LABEL_8;
  }
  return (int)v6;
}

- (signed)leftIndent
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues leftIndentOverridden](mTrackedProperties, "leftIndentOverridden"))
        return -[WDParagraphPropertiesValues leftIndent](*p_mTrackedProperties, "leftIndent");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues leftIndentOverridden](v6, "leftIndentOverridden"))
        return -[WDParagraphPropertiesValues leftIndent](*p_mTrackedProperties, "leftIndent");
    }
  }
  return 0;
}

- (signed)firstLineIndent
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues firstLineIndentOverridden](mTrackedProperties, "firstLineIndentOverridden"))
        return -[WDParagraphPropertiesValues firstLineIndent](*p_mTrackedProperties, "firstLineIndent");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues firstLineIndentOverridden](v6, "firstLineIndentOverridden"))
        return -[WDParagraphPropertiesValues firstLineIndent](*p_mTrackedProperties, "firstLineIndent");
    }
  }
  return 0;
}

- (unint64_t)listIndex
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues listIndexOverridden](mTrackedProperties, "listIndexOverridden"))
        return -[WDParagraphPropertiesValues listIndex](*p_mTrackedProperties, "listIndex");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues listIndexOverridden](v6, "listIndexOverridden"))
        return -[WDParagraphPropertiesValues listIndex](*p_mTrackedProperties, "listIndex");
    }
  }
  return 0;
}

- (unsigned)listLevel
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues listLevelOverridden](mTrackedProperties, "listLevelOverridden"))
        return -[WDParagraphPropertiesValues listLevel](*p_mTrackedProperties, "listLevel");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues listLevelOverridden](v6, "listLevelOverridden"))
        return -[WDParagraphPropertiesValues listLevel](*p_mTrackedProperties, "listLevel");
    }
  }
  return 0;
}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (BOOL)isCharacterPropertiesOverridden
{
  return self->mCharacterPropertiesOverridden;
}

- (unsigned)spaceBefore
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues spaceBeforeOverridden](mTrackedProperties, "spaceBeforeOverridden"))
        return -[WDParagraphPropertiesValues spaceBefore](*p_mTrackedProperties, "spaceBefore");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues spaceBeforeOverridden](v6, "spaceBeforeOverridden"))
        return -[WDParagraphPropertiesValues spaceBefore](*p_mTrackedProperties, "spaceBefore");
    }
  }
  return 0;
}

- (signed)lineSpacing
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues lineSpacingOverridden](mTrackedProperties, "lineSpacingOverridden"))
        return -[WDParagraphPropertiesValues lineSpacing](*p_mTrackedProperties, "lineSpacing");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues lineSpacingOverridden](v6, "lineSpacingOverridden"))
        return -[WDParagraphPropertiesValues lineSpacing](*p_mTrackedProperties, "lineSpacing");
    }
  }
  return 0;
}

- (unsigned)spaceAfter
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues spaceAfterOverridden](mTrackedProperties, "spaceAfterOverridden"))
        return -[WDParagraphPropertiesValues spaceAfter](*p_mTrackedProperties, "spaceAfter");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues spaceAfterOverridden](v6, "spaceAfterOverridden"))
        return -[WDParagraphPropertiesValues spaceAfter](*p_mTrackedProperties, "spaceAfter");
    }
  }
  return 0;
}

- (void)setWrapCode:(char)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setWrapCode:](mOriginalProperties, "setWrapCode:", v3);
  objc_msgSend(*p_mOriginalProperties, "setWrapCodeOverridden:", 1);
}

- (int)horizontalAnchor
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues horizontalAnchorOverridden](mTrackedProperties, "horizontalAnchorOverridden"))
        return -[WDParagraphPropertiesValues horizontalAnchor](*p_mTrackedProperties, "horizontalAnchor");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues horizontalAnchorOverridden](v6, "horizontalAnchorOverridden"))
        return -[WDParagraphPropertiesValues horizontalAnchor](*p_mTrackedProperties, "horizontalAnchor");
    }
  }
  return 2;
}

- (BOOL)isWidthOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues widthOverridden](mTrackedProperties, "widthOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues widthOverridden](mOriginalProperties, "widthOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues widthOverridden](v5, "widthOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues widthOverridden](v5, "widthOverridden");
  return 0;
}

- (id)bottomBorder
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *mOriginalProperties;
  char v5;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  void *v8;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *v10;

  if ((*((_BYTE *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (!-[WDParagraphPropertiesValues bottomBorderOverridden](mTrackedProperties, "bottomBorderOverridden"))
      {
        mOriginalProperties = self->mOriginalProperties;
        if (mOriginalProperties)
        {
          if (-[WDParagraphPropertiesValues bottomBorderOverridden](mOriginalProperties, "bottomBorderOverridden"))
            goto LABEL_14;
        }
      }
    }
  }
  v5 = *((_BYTE *)self + 17);
  if ((v5 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    v6 = self->mTrackedProperties;
    if (v6)
    {
      if (-[WDParagraphPropertiesValues bottomBorderOverridden](v6, "bottomBorderOverridden"))
      {
LABEL_13:
        -[WDParagraphPropertiesValues bottomBorder](*p_mTrackedProperties, "bottomBorder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        return v8;
      }
      v5 = *((_BYTE *)self + 17);
    }
  }
  if ((v5 & 5) == 0)
  {
LABEL_14:
    v8 = 0;
    return v8;
  }
  v10 = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v8 = v10;
  if (v10)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v8, "bottomBorderOverridden"))
      goto LABEL_13;
    goto LABEL_14;
  }
  return v8;
}

- (id)shading
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  void *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues shadingOverridden](mTrackedProperties, "shadingOverridden"))
      {
LABEL_8:
        -[WDParagraphPropertiesValues shading](*p_mTrackedProperties, "shading");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
LABEL_9:
    v6 = 0;
    return v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v6, "shadingOverridden"))
      goto LABEL_8;
    goto LABEL_9;
  }
  return v6;
}

- (signed)rightIndent
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues rightIndentOverridden](mTrackedProperties, "rightIndentOverridden"))
        return -[WDParagraphPropertiesValues rightIndent](*p_mTrackedProperties, "rightIndent");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues rightIndentOverridden](v6, "rightIndentOverridden"))
        return -[WDParagraphPropertiesValues rightIndent](*p_mTrackedProperties, "rightIndent");
    }
  }
  return 0;
}

- (void)setKeepLinesTogether:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setKeepLinesTogether:](mOriginalProperties, "setKeepLinesTogether:", v3);
  objc_msgSend(*p_mOriginalProperties, "setKeepLinesTogetherOverridden:", 1);
}

- (BOOL)isLineSpacingRuleOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues lineSpacingRuleOverridden](mTrackedProperties, "lineSpacingRuleOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues lineSpacingRuleOverridden](mOriginalProperties, "lineSpacingRuleOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues lineSpacingRuleOverridden](v5, "lineSpacingRuleOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues lineSpacingRuleOverridden](v5, "lineSpacingRuleOverridden");
  return 0;
}

- (int)lineSpacingRule
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues lineSpacingRuleOverridden](mTrackedProperties, "lineSpacingRuleOverridden"))
      {
LABEL_8:
        LODWORD(v6) = -[WDParagraphPropertiesValues lineSpacingRule](*p_mTrackedProperties, "lineSpacingRule");
        return (int)v6;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
    LODWORD(v6) = 0;
    return (int)v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    LODWORD(v6) = -[WDParagraphPropertiesValues lineSpacingRuleOverridden](v6, "lineSpacingRuleOverridden");
    p_mTrackedProperties = p_mOriginalProperties;
    if ((_DWORD)v6)
      goto LABEL_8;
  }
  return (int)v6;
}

- (int)resolveMode
{
  unsigned int v2;
  int v3;

  v2 = *((unsigned __int8 *)self + 17);
  if ((v2 & 2) != 0)
    v3 = 1;
  else
    v3 = (v2 >> 1) & 2;
  if ((v2 & 1) != 0)
    return 0;
  else
    return v3;
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

    self->mCharacterPropertiesOverridden = 1;
    mCharacterProperties = self->mCharacterProperties;
  }
  return mCharacterProperties;
}

- (int)verticalAnchor
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues verticalAnchorOverridden](mTrackedProperties, "verticalAnchorOverridden"))
        return -[WDParagraphPropertiesValues verticalAnchor](*p_mTrackedProperties, "verticalAnchor");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues verticalAnchorOverridden](v6, "verticalAnchorOverridden"))
        return -[WDParagraphPropertiesValues verticalAnchor](*p_mTrackedProperties, "verticalAnchor");
    }
  }
  return 1;
}

- (int64_t)horizontalPosition
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues horizontalPositionOverridden](mTrackedProperties, "horizontalPositionOverridden"))
      {
        return -[WDParagraphPropertiesValues horizontalPosition](*p_mTrackedProperties, "horizontalPosition");
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues horizontalPositionOverridden](v6, "horizontalPositionOverridden"))
        return -[WDParagraphPropertiesValues horizontalPosition](*p_mTrackedProperties, "horizontalPosition");
    }
  }
  return 0;
}

- (int64_t)width
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues widthOverridden](mTrackedProperties, "widthOverridden"))
        return -[WDParagraphPropertiesValues width](*p_mTrackedProperties, "width");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues widthOverridden](v6, "widthOverridden"))
        return -[WDParagraphPropertiesValues width](*p_mTrackedProperties, "width");
    }
  }
  return 0;
}

- (int64_t)verticalPosition
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues verticalPositionOverridden](mTrackedProperties, "verticalPositionOverridden"))
        return -[WDParagraphPropertiesValues verticalPosition](*p_mTrackedProperties, "verticalPosition");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues verticalPositionOverridden](v6, "verticalPositionOverridden"))
        return -[WDParagraphPropertiesValues verticalPosition](*p_mTrackedProperties, "verticalPosition");
    }
  }
  return 0;
}

- (void)setFormattingChanged:(int)a3
{
  unsigned __int8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setFormattingChanged:](mOriginalProperties, "setFormattingChanged:", v3);
  objc_msgSend(*p_mOriginalProperties, "setFormattingChangedOverridden:", 1);
}

- (void)clearChararacterProperties
{
  WDCharacterProperties *mCharacterProperties;

  mCharacterProperties = self->mCharacterProperties;
  self->mCharacterProperties = 0;

  self->mCharacterPropertiesOverridden = 0;
}

- (BOOL)isAnythingOverridden
{
  char v3;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 5) != 0)
  {
    if (-[WDParagraphProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", self->mOriginalProperties)
      || -[WDCharacterProperties isAnythingOverridden](self->mCharacterProperties, "isAnythingOverridden"))
    {
      return 1;
    }
    v3 = *((_BYTE *)self + 17);
  }
  return (v3 & 6) != 0
      && (-[WDParagraphProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", self->mTrackedProperties)
       || -[WDCharacterProperties isAnythingOverridden](self->mCharacterProperties, "isAnythingOverridden"));
}

- (void)negateFormattingChangesWithDefaults:(id)a3
{
  uint64_t v4;
  WDParagraphPropertiesValues *mOriginalProperties;
  WDParagraphPropertiesValues *mTrackedProperties;
  uint64_t v7;
  WDParagraphPropertiesValues *v8;
  WDParagraphPropertiesValues *v9;
  uint64_t v10;
  WDParagraphPropertiesValues *v11;
  WDParagraphPropertiesValues *v12;
  uint64_t v13;
  WDParagraphPropertiesValues *v14;
  WDParagraphPropertiesValues *v15;
  uint64_t v16;
  WDParagraphPropertiesValues *v17;
  WDParagraphPropertiesValues *v18;
  uint64_t v19;
  WDParagraphPropertiesValues *v20;
  WDParagraphPropertiesValues *v21;
  uint64_t v22;
  WDParagraphPropertiesValues *v23;
  WDParagraphPropertiesValues *v24;
  uint64_t v25;
  WDParagraphPropertiesValues *v26;
  WDParagraphPropertiesValues *v27;
  uint64_t v28;
  WDParagraphPropertiesValues *v29;
  WDParagraphPropertiesValues *v30;
  uint64_t v31;
  WDParagraphPropertiesValues *v32;
  WDParagraphPropertiesValues *v33;
  uint64_t v34;
  WDParagraphPropertiesValues *v35;
  WDParagraphPropertiesValues *v36;
  uint64_t v37;
  WDParagraphPropertiesValues *v38;
  WDParagraphPropertiesValues *v39;
  uint64_t v40;
  WDParagraphPropertiesValues *v41;
  WDParagraphPropertiesValues *v42;
  uint64_t v43;
  WDParagraphPropertiesValues *v44;
  WDParagraphPropertiesValues *v45;
  uint64_t v46;
  WDParagraphPropertiesValues *v47;
  WDParagraphPropertiesValues *v48;
  uint64_t v49;
  WDParagraphPropertiesValues *v50;
  WDParagraphPropertiesValues *v51;
  uint64_t v52;
  WDParagraphPropertiesValues *v53;
  WDParagraphPropertiesValues *v54;
  uint64_t v55;
  WDParagraphPropertiesValues *v56;
  WDParagraphPropertiesValues *v57;
  uint64_t v58;
  WDParagraphPropertiesValues *v59;
  WDParagraphPropertiesValues *v60;
  uint64_t v61;
  WDParagraphPropertiesValues *v62;
  WDParagraphPropertiesValues *v63;
  uint64_t v64;
  WDParagraphPropertiesValues *v65;
  WDParagraphPropertiesValues *v66;
  uint64_t v67;
  WDParagraphPropertiesValues *v68;
  WDParagraphPropertiesValues *v69;
  uint64_t v70;
  WDParagraphPropertiesValues *v71;
  WDParagraphPropertiesValues *v72;
  uint64_t v73;
  WDParagraphPropertiesValues *v74;
  WDParagraphPropertiesValues *v75;
  uint64_t v76;
  WDParagraphPropertiesValues *v77;
  WDParagraphPropertiesValues *v78;
  uint64_t v79;
  WDParagraphPropertiesValues *v80;
  WDParagraphPropertiesValues *v81;
  uint64_t v82;
  WDParagraphPropertiesValues *v83;
  WDParagraphPropertiesValues *v84;
  uint64_t v85;
  WDParagraphPropertiesValues *v86;
  WDParagraphPropertiesValues *v87;
  uint64_t v88;
  WDParagraphPropertiesValues *v89;
  WDParagraphPropertiesValues *v90;
  WDParagraphPropertiesValues *v91;
  WDParagraphPropertiesValues *v92;
  uint64_t v93;
  WDParagraphPropertiesValues *v94;
  WDParagraphPropertiesValues *v95;
  uint64_t v96;
  WDParagraphPropertiesValues *v97;
  WDParagraphPropertiesValues *v98;
  uint64_t v99;
  WDParagraphPropertiesValues *v100;
  WDParagraphPropertiesValues *v101;
  uint64_t v102;
  WDParagraphPropertiesValues *v103;
  WDParagraphPropertiesValues *v104;
  uint64_t v105;
  WDParagraphPropertiesValues *v106;
  WDParagraphPropertiesValues *v107;
  uint64_t v108;
  WDParagraphPropertiesValues *v109;
  WDParagraphPropertiesValues *v110;
  uint64_t v111;
  WDParagraphPropertiesValues *v112;
  WDParagraphPropertiesValues *v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  WDParagraphPropertiesValues *v118;
  WDParagraphPropertiesValues *v119;
  void *v120;
  void *v121;
  int v122;
  void *v123;
  WDParagraphPropertiesValues *v124;
  WDParagraphPropertiesValues *v125;
  void *v126;
  void *v127;
  int v128;
  void *v129;
  WDParagraphPropertiesValues *v130;
  WDParagraphPropertiesValues *v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  WDParagraphPropertiesValues *v136;
  WDParagraphPropertiesValues *v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  WDParagraphPropertiesValues *v142;
  WDParagraphPropertiesValues *v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  WDParagraphPropertiesValues *v148;
  WDParagraphPropertiesValues *v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  void *v154;
  void *v155;
  WDParagraphPropertiesValues *v156;
  WDParagraphPropertiesValues *v157;
  WDParagraphPropertiesValues *v158;
  WDParagraphPropertiesValues *v159;
  uint64_t v160;
  uint64_t i;
  WDParagraphPropertiesValues *v162;
  WDParagraphPropertiesValues *v163;
  uint64_t v164;
  uint64_t j;
  id v166;

  v166 = a3;
  v4 = -[WDParagraphProperties resolveMode](self, "resolveMode");
  -[WDParagraphProperties setResolveMode:](self, "setResolveMode:", 2);
  if (-[WDParagraphProperties isFormattingChangedOverridden](self, "isFormattingChangedOverridden")
    && -[WDParagraphProperties formattingChanged](self, "formattingChanged"))
  {
    -[WDParagraphProperties setResolveMode:](self, "setResolveMode:", 1);
    objc_msgSend(v166, "setResolveMode:", 2);
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      if (-[WDParagraphPropertiesValues pageBreakBeforeOverridden](mOriginalProperties, "pageBreakBeforeOverridden"))
      {
        mTrackedProperties = self->mTrackedProperties;
        if (!mTrackedProperties
          || !-[WDParagraphPropertiesValues pageBreakBeforeOverridden](mTrackedProperties, "pageBreakBeforeOverridden"))
        {
          if (objc_msgSend(v166, "isPageBreakBeforeOverridden"))
            v7 = objc_msgSend(v166, "isPageBreakBefore");
          else
            v7 = 0;
          -[WDParagraphProperties setPageBreakBefore:](self, "setPageBreakBefore:", v7);
        }
      }
      v8 = self->mOriginalProperties;
      if (v8)
      {
        if (-[WDParagraphPropertiesValues listLevelOverridden](v8, "listLevelOverridden"))
        {
          v9 = self->mTrackedProperties;
          if (!v9 || !-[WDParagraphPropertiesValues listLevelOverridden](v9, "listLevelOverridden"))
          {
            if (objc_msgSend(v166, "isListLevelOverridden"))
              v10 = objc_msgSend(v166, "listLevel");
            else
              v10 = 0;
            -[WDParagraphProperties setListLevel:](self, "setListLevel:", v10);
          }
        }
        v11 = self->mOriginalProperties;
        if (v11)
        {
          if (-[WDParagraphPropertiesValues listIndexOverridden](v11, "listIndexOverridden"))
          {
            v12 = self->mTrackedProperties;
            if (!v12 || !-[WDParagraphPropertiesValues listIndexOverridden](v12, "listIndexOverridden"))
            {
              if (objc_msgSend(v166, "isListIndexOverridden"))
                v13 = objc_msgSend(v166, "listIndex");
              else
                v13 = -1;
              -[WDParagraphProperties setListIndex:](self, "setListIndex:", v13);
            }
          }
          v14 = self->mOriginalProperties;
          if (v14)
          {
            if (-[WDParagraphPropertiesValues widthOverridden](v14, "widthOverridden"))
            {
              v15 = self->mTrackedProperties;
              if (!v15 || !-[WDParagraphPropertiesValues widthOverridden](v15, "widthOverridden"))
              {
                if (objc_msgSend(v166, "isWidthOverridden"))
                  v16 = objc_msgSend(v166, "width");
                else
                  v16 = 0;
                -[WDParagraphProperties setWidth:](self, "setWidth:", v16);
              }
            }
            v17 = self->mOriginalProperties;
            if (v17)
            {
              if (-[WDParagraphPropertiesValues heightOverridden](v17, "heightOverridden"))
              {
                v18 = self->mTrackedProperties;
                if (!v18 || !-[WDParagraphPropertiesValues heightOverridden](v18, "heightOverridden"))
                {
                  if (objc_msgSend(v166, "isHeightOverridden"))
                    v19 = objc_msgSend(v166, "height");
                  else
                    v19 = 0;
                  -[WDParagraphProperties setHeight:](self, "setHeight:", v19);
                }
              }
              v20 = self->mOriginalProperties;
              if (v20)
              {
                if (-[WDParagraphPropertiesValues heightRuleOverridden](v20, "heightRuleOverridden"))
                {
                  v21 = self->mTrackedProperties;
                  if (!v21 || !-[WDParagraphPropertiesValues heightRuleOverridden](v21, "heightRuleOverridden"))
                  {
                    if (objc_msgSend(v166, "isHeightRuleOverridden"))
                      v22 = objc_msgSend(v166, "heightRule");
                    else
                      v22 = 1;
                    -[WDParagraphProperties setHeightRule:](self, "setHeightRule:", v22);
                  }
                }
                v23 = self->mOriginalProperties;
                if (v23)
                {
                  if (-[WDParagraphPropertiesValues verticalSpaceOverridden](v23, "verticalSpaceOverridden"))
                  {
                    v24 = self->mTrackedProperties;
                    if (!v24 || !-[WDParagraphPropertiesValues verticalSpaceOverridden](v24, "verticalSpaceOverridden"))
                    {
                      if (objc_msgSend(v166, "isVerticalSpaceOverridden"))
                        v25 = objc_msgSend(v166, "verticalSpace");
                      else
                        v25 = 0;
                      -[WDParagraphProperties setVerticalSpace:](self, "setVerticalSpace:", v25);
                    }
                  }
                  v26 = self->mOriginalProperties;
                  if (v26)
                  {
                    if (-[WDParagraphPropertiesValues horizontalSpaceOverridden](v26, "horizontalSpaceOverridden"))
                    {
                      v27 = self->mTrackedProperties;
                      if (!v27
                        || !-[WDParagraphPropertiesValues horizontalSpaceOverridden](v27, "horizontalSpaceOverridden"))
                      {
                        if (objc_msgSend(v166, "isHorizontalSpaceOverridden"))
                          v28 = objc_msgSend(v166, "horizontalSpace");
                        else
                          v28 = 0;
                        -[WDParagraphProperties setHorizontalSpace:](self, "setHorizontalSpace:", v28);
                      }
                    }
                    v29 = self->mOriginalProperties;
                    if (v29)
                    {
                      if (-[WDParagraphPropertiesValues wrapOverridden](v29, "wrapOverridden"))
                      {
                        v30 = self->mTrackedProperties;
                        if (!v30 || !-[WDParagraphPropertiesValues wrapOverridden](v30, "wrapOverridden"))
                        {
                          if (objc_msgSend(v166, "isWrapOverridden"))
                            v31 = objc_msgSend(v166, "wrap");
                          else
                            v31 = 0;
                          -[WDParagraphProperties setWrap:](self, "setWrap:", v31);
                        }
                      }
                      v32 = self->mOriginalProperties;
                      if (v32)
                      {
                        if (-[WDParagraphPropertiesValues horizontalAnchorOverridden](v32, "horizontalAnchorOverridden"))
                        {
                          v33 = self->mTrackedProperties;
                          if (!v33
                            || !-[WDParagraphPropertiesValues horizontalAnchorOverridden](v33, "horizontalAnchorOverridden"))
                          {
                            if (objc_msgSend(v166, "isHorizontalAnchorOverridden"))
                              v34 = objc_msgSend(v166, "horizontalAnchor");
                            else
                              v34 = 2;
                            -[WDParagraphProperties setHorizontalAnchor:](self, "setHorizontalAnchor:", v34);
                          }
                        }
                        v35 = self->mOriginalProperties;
                        if (v35)
                        {
                          if (-[WDParagraphPropertiesValues verticalAnchorOverridden](v35, "verticalAnchorOverridden"))
                          {
                            v36 = self->mTrackedProperties;
                            if (!v36
                              || !-[WDParagraphPropertiesValues verticalAnchorOverridden](v36, "verticalAnchorOverridden"))
                            {
                              if (objc_msgSend(v166, "isVerticalAnchorOverridden"))
                                v37 = objc_msgSend(v166, "verticalAnchor");
                              else
                                v37 = 1;
                              -[WDParagraphProperties setVerticalAnchor:](self, "setVerticalAnchor:", v37);
                            }
                          }
                          v38 = self->mOriginalProperties;
                          if (v38)
                          {
                            if (-[WDParagraphPropertiesValues horizontalPositionOverridden](v38, "horizontalPositionOverridden"))
                            {
                              v39 = self->mTrackedProperties;
                              if (!v39
                                || !-[WDParagraphPropertiesValues horizontalPositionOverridden](v39, "horizontalPositionOverridden"))
                              {
                                if (objc_msgSend(v166, "isHorizontalPositionOverridden"))
                                  v40 = objc_msgSend(v166, "horizontalPosition");
                                else
                                  v40 = 0;
                                -[WDParagraphProperties setHorizontalPosition:](self, "setHorizontalPosition:", v40);
                              }
                            }
                            v41 = self->mOriginalProperties;
                            if (v41)
                            {
                              if (-[WDParagraphPropertiesValues verticalPositionOverridden](v41, "verticalPositionOverridden"))
                              {
                                v42 = self->mTrackedProperties;
                                if (!v42
                                  || !-[WDParagraphPropertiesValues verticalPositionOverridden](v42, "verticalPositionOverridden"))
                                {
                                  if (objc_msgSend(v166, "isVerticalPositionOverridden"))
                                    v43 = objc_msgSend(v166, "verticalPosition");
                                  else
                                    v43 = 0;
                                  -[WDParagraphProperties setVerticalPosition:](self, "setVerticalPosition:", v43);
                                }
                              }
                              v44 = self->mOriginalProperties;
                              if (v44)
                              {
                                if (-[WDParagraphPropertiesValues wrapCodeOverridden](v44, "wrapCodeOverridden"))
                                {
                                  v45 = self->mTrackedProperties;
                                  if (!v45
                                    || !-[WDParagraphPropertiesValues wrapCodeOverridden](v45, "wrapCodeOverridden"))
                                  {
                                    if (objc_msgSend(v166, "isWrapCodeOverridden"))
                                      v46 = objc_msgSend(v166, "wrapCode");
                                    else
                                      v46 = 0;
                                    -[WDParagraphProperties setWrapCode:](self, "setWrapCode:", v46);
                                  }
                                }
                                v47 = self->mOriginalProperties;
                                if (v47)
                                {
                                  if (-[WDParagraphPropertiesValues anchorLockOverridden](v47, "anchorLockOverridden"))
                                  {
                                    v48 = self->mTrackedProperties;
                                    if (!v48
                                      || !-[WDParagraphPropertiesValues anchorLockOverridden](v48, "anchorLockOverridden"))
                                    {
                                      if (objc_msgSend(v166, "isAnchorLockOverridden"))
                                        v49 = objc_msgSend(v166, "anchorLock");
                                      else
                                        v49 = 0;
                                      -[WDParagraphProperties setAnchorLock:](self, "setAnchorLock:", v49);
                                    }
                                  }
                                  v50 = self->mOriginalProperties;
                                  if (v50)
                                  {
                                    if (-[WDParagraphPropertiesValues spaceBeforeOverridden](v50, "spaceBeforeOverridden"))
                                    {
                                      v51 = self->mTrackedProperties;
                                      if (!v51
                                        || !-[WDParagraphPropertiesValues spaceBeforeOverridden](v51, "spaceBeforeOverridden"))
                                      {
                                        if (objc_msgSend(v166, "isSpaceBeforeOverridden"))
                                          v52 = objc_msgSend(v166, "spaceBefore");
                                        else
                                          v52 = 0;
                                        -[WDParagraphProperties setSpaceBefore:](self, "setSpaceBefore:", v52);
                                      }
                                    }
                                    v53 = self->mOriginalProperties;
                                    if (v53)
                                    {
                                      if (-[WDParagraphPropertiesValues spaceBeforeAutoOverridden](v53, "spaceBeforeAutoOverridden"))
                                      {
                                        v54 = self->mTrackedProperties;
                                        if (!v54
                                          || !-[WDParagraphPropertiesValues spaceBeforeAutoOverridden](v54, "spaceBeforeAutoOverridden"))
                                        {
                                          if (objc_msgSend(v166, "isSpaceBeforeAutoOverridden"))
                                            v55 = objc_msgSend(v166, "spaceBeforeAuto");
                                          else
                                            v55 = 0;
                                          -[WDParagraphProperties setSpaceBeforeAuto:](self, "setSpaceBeforeAuto:", v55);
                                        }
                                      }
                                      v56 = self->mOriginalProperties;
                                      if (v56)
                                      {
                                        if (-[WDParagraphPropertiesValues spaceAfterOverridden](v56, "spaceAfterOverridden"))
                                        {
                                          v57 = self->mTrackedProperties;
                                          if (!v57
                                            || !-[WDParagraphPropertiesValues spaceAfterOverridden](v57, "spaceAfterOverridden"))
                                          {
                                            if (objc_msgSend(v166, "isSpaceAfterOverridden"))
                                              v58 = objc_msgSend(v166, "spaceAfter");
                                            else
                                              v58 = 0;
                                            -[WDParagraphProperties setSpaceAfter:](self, "setSpaceAfter:", v58);
                                          }
                                        }
                                        v59 = self->mOriginalProperties;
                                        if (v59)
                                        {
                                          if (-[WDParagraphPropertiesValues spaceAfterAutoOverridden](v59, "spaceAfterAutoOverridden"))
                                          {
                                            v60 = self->mTrackedProperties;
                                            if (!v60
                                              || !-[WDParagraphPropertiesValues spaceAfterAutoOverridden](v60, "spaceAfterAutoOverridden"))
                                            {
                                              if (objc_msgSend(v166, "isSpaceAfterAutoOverridden"))
                                                v61 = objc_msgSend(v166, "spaceAfterAuto");
                                              else
                                                v61 = 0;
                                              -[WDParagraphProperties setSpaceAfterAuto:](self, "setSpaceAfterAuto:", v61);
                                            }
                                          }
                                          v62 = self->mOriginalProperties;
                                          if (v62)
                                          {
                                            if (-[WDParagraphPropertiesValues lineSpacingOverridden](v62, "lineSpacingOverridden"))
                                            {
                                              v63 = self->mTrackedProperties;
                                              if (!v63
                                                || !-[WDParagraphPropertiesValues lineSpacingOverridden](v63, "lineSpacingOverridden"))
                                              {
                                                if (objc_msgSend(v166, "isLineSpacingOverridden"))
                                                  v64 = objc_msgSend(v166, "lineSpacing");
                                                else
                                                  v64 = 0;
                                                -[WDParagraphProperties setLineSpacing:](self, "setLineSpacing:", v64);
                                              }
                                            }
                                            v65 = self->mOriginalProperties;
                                            if (v65)
                                            {
                                              if (-[WDParagraphPropertiesValues lineSpacingRuleOverridden](v65, "lineSpacingRuleOverridden"))
                                              {
                                                v66 = self->mTrackedProperties;
                                                if (!v66
                                                  || !-[WDParagraphPropertiesValues lineSpacingRuleOverridden](v66, "lineSpacingRuleOverridden"))
                                                {
                                                  if (objc_msgSend(v166, "isLineSpacingRuleOverridden"))
                                                    v67 = objc_msgSend(v166, "lineSpacingRule");
                                                  else
                                                    v67 = 0;
                                                  -[WDParagraphProperties setLineSpacingRule:](self, "setLineSpacingRule:", v67);
                                                }
                                              }
                                              v68 = self->mOriginalProperties;
                                              if (v68)
                                              {
                                                if (-[WDParagraphPropertiesValues leftIndentOverridden](v68, "leftIndentOverridden"))
                                                {
                                                  v69 = self->mTrackedProperties;
                                                  if (!v69
                                                    || !-[WDParagraphPropertiesValues leftIndentOverridden](v69, "leftIndentOverridden"))
                                                  {
                                                    if (objc_msgSend(v166, "isLeftIndentOverridden"))
                                                      v70 = objc_msgSend(v166, "leftIndent");
                                                    else
                                                      v70 = 0;
                                                    -[WDParagraphProperties setLeftIndent:](self, "setLeftIndent:", v70);
                                                  }
                                                }
                                                v71 = self->mOriginalProperties;
                                                if (v71)
                                                {
                                                  if (-[WDParagraphPropertiesValues leadingIndentOverridden](v71, "leadingIndentOverridden"))
                                                  {
                                                    v72 = self->mTrackedProperties;
                                                    if (!v72
                                                      || !-[WDParagraphPropertiesValues leadingIndentOverridden](v72, "leadingIndentOverridden"))
                                                    {
                                                      if (objc_msgSend(v166, "isLeadingIndentOverridden"))
                                                        v73 = objc_msgSend(v166, "leadingIndent");
                                                      else
                                                        v73 = 0;
                                                      -[WDParagraphProperties setLeadingIndent:](self, "setLeadingIndent:", v73);
                                                    }
                                                  }
                                                  v74 = self->mOriginalProperties;
                                                  if (v74)
                                                  {
                                                    if (-[WDParagraphPropertiesValues followingIndentOverridden](v74, "followingIndentOverridden"))
                                                    {
                                                      v75 = self->mTrackedProperties;
                                                      if (!v75
                                                        || !-[WDParagraphPropertiesValues followingIndentOverridden](v75, "followingIndentOverridden"))
                                                      {
                                                        if (objc_msgSend(v166, "isFollowingIndentOverridden"))v76 = objc_msgSend(v166, "followingIndent");
                                                        else
                                                          v76 = 0;
                                                        -[WDParagraphProperties setFollowingIndent:](self, "setFollowingIndent:", v76);
                                                      }
                                                    }
                                                    v77 = self->mOriginalProperties;
                                                    if (v77)
                                                    {
                                                      if (-[WDParagraphPropertiesValues rightIndentOverridden](v77, "rightIndentOverridden"))
                                                      {
                                                        v78 = self->mTrackedProperties;
                                                        if (!v78
                                                          || !-[WDParagraphPropertiesValues rightIndentOverridden](v78, "rightIndentOverridden"))
                                                        {
                                                          if (objc_msgSend(v166, "isRightIndentOverridden"))v79 = objc_msgSend(v166, "rightIndent");
                                                          else
                                                            v79 = 0;
                                                          -[WDParagraphProperties setRightIndent:](self, "setRightIndent:", v79);
                                                        }
                                                      }
                                                      v80 = self->mOriginalProperties;
                                                      if (v80)
                                                      {
                                                        if (-[WDParagraphPropertiesValues firstLineIndentOverridden](v80, "firstLineIndentOverridden"))
                                                        {
                                                          v81 = self->mTrackedProperties;
                                                          if (!v81
                                                            || !-[WDParagraphPropertiesValues firstLineIndentOverridden](v81, "firstLineIndentOverridden"))
                                                          {
                                                            if (objc_msgSend(v166, "isFirstLineIndentOverridden"))v82 = objc_msgSend(v166, "firstLineIndent");
                                                            else
                                                              v82 = 0;
                                                            -[WDParagraphProperties setFirstLineIndent:](self, "setFirstLineIndent:", v82);
                                                          }
                                                        }
                                                        v83 = self->mOriginalProperties;
                                                        if (v83)
                                                        {
                                                          if (-[WDParagraphPropertiesValues justificationOverridden](v83, "justificationOverridden"))
                                                          {
                                                            v84 = self->mTrackedProperties;
                                                            if (!v84
                                                              || !-[WDParagraphPropertiesValues justificationOverridden](v84, "justificationOverridden"))
                                                            {
                                                              if (objc_msgSend(v166, "isJustificationOverridden"))v85 = objc_msgSend(v166, "justification");
                                                              else
                                                                v85 = 0;
                                                              -[WDParagraphProperties setJustification:](self, "setJustification:", v85);
                                                            }
                                                          }
                                                          v86 = self->mOriginalProperties;
                                                          if (v86)
                                                          {
                                                            if (-[WDParagraphPropertiesValues physicalJustificationOverridden](v86, "physicalJustificationOverridden"))
                                                            {
                                                              v87 = self->mTrackedProperties;
                                                              if (!v87
                                                                || !-[WDParagraphPropertiesValues physicalJustificationOverridden](v87, "physicalJustificationOverridden"))
                                                              {
                                                                if (objc_msgSend(v166, "isPhysicalJustificationOverridden"))v88 = objc_msgSend(v166, "physicalJustification");
                                                                else
                                                                  v88 = 0;
                                                                -[WDParagraphProperties setPhysicalJustification:](self, "setPhysicalJustification:", v88);
                                                              }
                                                            }
                                                            v89 = self->mOriginalProperties;
                                                            if (v89)
                                                            {
                                                              if (-[WDParagraphPropertiesValues outlineLevelOverridden](v89, "outlineLevelOverridden"))
                                                              {
                                                                v90 = self->mTrackedProperties;
                                                                if (!v90
                                                                  || !-[WDParagraphPropertiesValues outlineLevelOverridden](v90, "outlineLevelOverridden"))
                                                                {
                                                                  if (objc_msgSend(v166, "isOutlineLevelOverridden"))-[WDParagraphProperties setOutlineLevel:](self, "setOutlineLevel:", objc_msgSend(v166, "outlineLevel"));
                                                                }
                                                              }
                                                              v91 = self->mOriginalProperties;
                                                              if (v91)
                                                              {
                                                                if (-[WDParagraphPropertiesValues keepNextParagraphTogetherOverridden](v91, "keepNextParagraphTogetherOverridden"))
                                                                {
                                                                  v92 = self->mTrackedProperties;
                                                                  if (!v92
                                                                    || !-[WDParagraphPropertiesValues keepNextParagraphTogetherOverridden](v92, "keepNextParagraphTogetherOverridden"))
                                                                  {
                                                                    if (objc_msgSend(v166, "isKeepNextParagraphTogetherOverridden"))v93 = objc_msgSend(v166, "keepNextParagraphTogether");
                                                                    else
                                                                      v93 = 0;
                                                                    -[WDParagraphProperties setKeepNextParagraphTogether:](self, "setKeepNextParagraphTogether:", v93);
                                                                  }
                                                                }
                                                                v94 = self->mOriginalProperties;
                                                                if (v94)
                                                                {
                                                                  if (-[WDParagraphPropertiesValues keepLinesTogetherOverridden](v94, "keepLinesTogetherOverridden"))
                                                                  {
                                                                    v95 = self->mTrackedProperties;
                                                                    if (!v95
                                                                      || !-[WDParagraphPropertiesValues keepLinesTogetherOverridden](v95, "keepLinesTogetherOverridden"))
                                                                    {
                                                                      if (objc_msgSend(v166, "isKeepLinesTogetherOverridden"))v96 = objc_msgSend(v166, "keepLinesTogether");
                                                                      else
                                                                        v96 = 0;
                                                                      -[WDParagraphProperties setKeepLinesTogether:](self, "setKeepLinesTogether:", v96);
                                                                    }
                                                                  }
                                                                  v97 = self->mOriginalProperties;
                                                                  if (v97)
                                                                  {
                                                                    if (-[WDParagraphPropertiesValues suppressAutoHyphensOverridden](v97, "suppressAutoHyphensOverridden"))
                                                                    {
                                                                      v98 = self->mTrackedProperties;
                                                                      if (!v98
                                                                        || !-[WDParagraphPropertiesValues suppressAutoHyphensOverridden](v98, "suppressAutoHyphensOverridden"))
                                                                      {
                                                                        if (objc_msgSend(v166, "isSuppressAutoHyphensOverridden"))v99 = objc_msgSend(v166, "suppressAutoHyphens");
                                                                        else
                                                                          v99 = 0;
                                                                        -[WDParagraphProperties setSuppressAutoHyphens:](self, "setSuppressAutoHyphens:", v99);
                                                                      }
                                                                    }
                                                                    v100 = self->mOriginalProperties;
                                                                    if (v100)
                                                                    {
                                                                      if (-[WDParagraphPropertiesValues suppressLineNumbersOverridden](v100, "suppressLineNumbersOverridden"))
                                                                      {
                                                                        v101 = self->mTrackedProperties;
                                                                        if (!v101
                                                                          || !-[WDParagraphPropertiesValues suppressLineNumbersOverridden](v101, "suppressLineNumbersOverridden"))
                                                                        {
                                                                          if (objc_msgSend(v166, "isSuppressLineNumbersOverridden"))v102 = objc_msgSend(v166, "suppressLineNumbers");
                                                                          else
                                                                            v102 = 0;
                                                                          -[WDParagraphProperties setSuppressLineNumbers:](self, "setSuppressLineNumbers:", v102);
                                                                        }
                                                                      }
                                                                      v103 = self->mOriginalProperties;
                                                                      if (v103)
                                                                      {
                                                                        if (-[WDParagraphPropertiesValues widowControlOverridden](v103, "widowControlOverridden"))
                                                                        {
                                                                          v104 = self->mTrackedProperties;
                                                                          if (!v104
                                                                            || !-[WDParagraphPropertiesValues widowControlOverridden](v104, "widowControlOverridden"))
                                                                          {
                                                                            if (objc_msgSend(v166, "isWidowControlOverridden"))v105 = objc_msgSend(v166, "widowControl");
                                                                            else
                                                                              v105 = 0;
                                                                            -[WDParagraphProperties setWidowControl:](self, "setWidowControl:", v105);
                                                                          }
                                                                        }
                                                                        v106 = self->mOriginalProperties;
                                                                        if (v106)
                                                                        {
                                                                          if (-[WDParagraphPropertiesValues biDiOverridden](v106, "biDiOverridden"))
                                                                          {
                                                                            v107 = self->mTrackedProperties;
                                                                            if (!v107
                                                                              || !-[WDParagraphPropertiesValues biDiOverridden](v107, "biDiOverridden"))
                                                                            {
                                                                              if (objc_msgSend(v166, "isBiDiOverridden"))v108 = objc_msgSend(v166, "biDi");
                                                                              else
                                                                                v108 = 0;
                                                                              -[WDParagraphProperties setBiDi:](self, "setBiDi:", v108);
                                                                            }
                                                                          }
                                                                          v109 = self->mOriginalProperties;
                                                                          if (v109)
                                                                          {
                                                                            if (-[WDParagraphPropertiesValues kinsokuOffOverridden](v109, "kinsokuOffOverridden"))
                                                                            {
                                                                              v110 = self->mTrackedProperties;
                                                                              if (!v110
                                                                                || !-[WDParagraphPropertiesValues kinsokuOffOverridden](v110, "kinsokuOffOverridden"))
                                                                              {
                                                                                if (objc_msgSend(v166, "isKinsokuOffOverridden"))v111 = objc_msgSend(v166, "kinsokuOff");
                                                                                else
                                                                                  v111 = 0;
                                                                                -[WDParagraphProperties setKinsokuOff:](self, "setKinsokuOff:", v111);
                                                                              }
                                                                            }
                                                                            v112 = self->mOriginalProperties;
                                                                            if (v112)
                                                                            {
                                                                              if (-[WDParagraphPropertiesValues topBorderOverridden](v112, "topBorderOverridden"))
                                                                              {
                                                                                v113 = self->mTrackedProperties;
                                                                                if (!v113
                                                                                  || !-[WDParagraphPropertiesValues topBorderOverridden](v113, "topBorderOverridden"))
                                                                                {
                                                                                  -[WDParagraphProperties mutableTopBorder](self, "mutableTopBorder");
                                                                                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  -[WDParagraphPropertiesValues topBorder](self->mOriginalProperties, "topBorder");
                                                                                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v116 = objc_msgSend(v115, "style");

                                                                                  if (v116)
                                                                                  {
                                                                                    objc_msgSend(v114, "setNullBorder");
                                                                                  }
                                                                                  else if (objc_msgSend(v166, "isTopBorderOverridden"))
                                                                                  {
                                                                                    objc_msgSend(v166, "topBorder");
                                                                                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    objc_msgSend(v114, "setBorder:", v117);

                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_msgSend(v114, "setSingleBlackBorder");
                                                                                  }

                                                                                }
                                                                              }
                                                                              v118 = self->mOriginalProperties;
                                                                              if (v118)
                                                                              {
                                                                                if (-[WDParagraphPropertiesValues leftBorderOverridden](v118, "leftBorderOverridden"))
                                                                                {
                                                                                  v119 = self->mTrackedProperties;
                                                                                  if (!v119
                                                                                    || !-[WDParagraphPropertiesValues leftBorderOverridden](v119, "leftBorderOverridden"))
                                                                                  {
                                                                                    -[WDParagraphProperties mutableLeftBorder](self, "mutableLeftBorder");
                                                                                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    -[WDParagraphPropertiesValues leftBorder](self->mOriginalProperties, "leftBorder");
                                                                                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v122 = objc_msgSend(v121, "style");

                                                                                    if (v122)
                                                                                    {
                                                                                      objc_msgSend(v120, "setNullBorder");
                                                                                    }
                                                                                    else if (objc_msgSend(v166, "isLeftBorderOverridden"))
                                                                                    {
                                                                                      objc_msgSend(v166, "leftBorder");
                                                                                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      objc_msgSend(v120, "setBorder:", v123);

                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      objc_msgSend(v120, "setSingleBlackBorder");
                                                                                    }

                                                                                  }
                                                                                }
                                                                                v124 = self->mOriginalProperties;
                                                                                if (v124)
                                                                                {
                                                                                  if (-[WDParagraphPropertiesValues bottomBorderOverridden](v124, "bottomBorderOverridden"))
                                                                                  {
                                                                                    v125 = self->mTrackedProperties;
                                                                                    if (!v125
                                                                                      || !-[WDParagraphPropertiesValues bottomBorderOverridden](v125, "bottomBorderOverridden"))
                                                                                    {
                                                                                      -[WDParagraphProperties mutableBottomBorder](self, "mutableBottomBorder");
                                                                                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      -[WDParagraphPropertiesValues bottomBorder](self->mOriginalProperties, "bottomBorder");
                                                                                      v127 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v128 = objc_msgSend(v127, "style");

                                                                                      if (v128)
                                                                                      {
                                                                                        objc_msgSend(v126, "setNullBorder");
                                                                                      }
                                                                                      else if (objc_msgSend(v166, "isBottomBorderOverridden"))
                                                                                      {
                                                                                        objc_msgSend(v166, "bottomBorder");
                                                                                        v129 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        objc_msgSend(v126, "setBorder:", v129);

                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_msgSend(v126, "setSingleBlackBorder");
                                                                                      }

                                                                                    }
                                                                                  }
                                                                                  v130 = self->mOriginalProperties;
                                                                                  if (v130)
                                                                                  {
                                                                                    if (-[WDParagraphPropertiesValues rightBorderOverridden](v130, "rightBorderOverridden"))
                                                                                    {
                                                                                      v131 = self->mTrackedProperties;
                                                                                      if (!v131
                                                                                        || !-[WDParagraphPropertiesValues rightBorderOverridden](v131, "rightBorderOverridden"))
                                                                                      {
                                                                                        -[WDParagraphProperties mutableRightBorder](self, "mutableRightBorder");
                                                                                        v132 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        -[WDParagraphPropertiesValues rightBorder](self->mOriginalProperties, "rightBorder");
                                                                                        v133 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        v134 = objc_msgSend(v133, "style");

                                                                                        if (v134)
                                                                                        {
                                                                                          objc_msgSend(v132, "setNullBorder");
                                                                                        }
                                                                                        else if (objc_msgSend(v166, "isRightBorderOverridden"))
                                                                                        {
                                                                                          objc_msgSend(v166, "rightBorder");
                                                                                          v135 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          objc_msgSend(v132, "setBorder:", v135);

                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_msgSend(v132, "setSingleBlackBorder");
                                                                                        }

                                                                                      }
                                                                                    }
                                                                                    v136 = self->mOriginalProperties;
                                                                                    if (v136)
                                                                                    {
                                                                                      if (-[WDParagraphPropertiesValues betweenBorderOverridden](v136, "betweenBorderOverridden"))
                                                                                      {
                                                                                        v137 = self->mTrackedProperties;
                                                                                        if (!v137
                                                                                          || !-[WDParagraphPropertiesValues betweenBorderOverridden](v137, "betweenBorderOverridden"))
                                                                                        {
                                                                                          -[WDParagraphProperties mutableBetweenBorder](self, "mutableBetweenBorder");
                                                                                          v138 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          -[WDParagraphPropertiesValues betweenBorder](self->mOriginalProperties, "betweenBorder");
                                                                                          v139 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          v140 = objc_msgSend(v139, "style");

                                                                                          if (v140)
                                                                                          {
                                                                                            objc_msgSend(v138, "setNullBorder");
                                                                                          }
                                                                                          else if (objc_msgSend(v166, "isBetweenBorderOverridden"))
                                                                                          {
                                                                                            objc_msgSend(v166, "betweenBorder");
                                                                                            v141 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            objc_msgSend(v138, "setBorder:", v141);

                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            objc_msgSend(v138, "setSingleBlackBorder");
                                                                                          }

                                                                                        }
                                                                                      }
                                                                                      v142 = self->mOriginalProperties;
                                                                                      if (v142)
                                                                                      {
                                                                                        if (-[WDParagraphPropertiesValues barBorderOverridden](v142, "barBorderOverridden"))
                                                                                        {
                                                                                          v143 = self->mTrackedProperties;
                                                                                          if (!v143
                                                                                            || !-[WDParagraphPropertiesValues barBorderOverridden](v143, "barBorderOverridden"))
                                                                                          {
                                                                                            -[WDParagraphProperties mutableBarBorder](self, "mutableBarBorder");
                                                                                            v144 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            -[WDParagraphPropertiesValues barBorder](self->mOriginalProperties, "barBorder");
                                                                                            v145 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            v146 = objc_msgSend(v145, "style");

                                                                                            if (v146)
                                                                                            {
                                                                                              objc_msgSend(v144, "setNullBorder");
                                                                                            }
                                                                                            else if (objc_msgSend(v166, "isBarBorderOverridden"))
                                                                                            {
                                                                                              objc_msgSend(v166, "barBorder");
                                                                                              v147 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              objc_msgSend(v144, "setBorder:", v147);

                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              objc_msgSend(v144, "setSingleBlackBorder");
                                                                                            }

                                                                                          }
                                                                                        }
                                                                                        v148 = self->mOriginalProperties;
                                                                                        if (v148)
                                                                                        {
                                                                                          if (-[WDParagraphPropertiesValues shadingOverridden](v148, "shadingOverridden"))
                                                                                          {
                                                                                            v149 = self->mTrackedProperties;
                                                                                            if (!v149
                                                                                              || !-[WDParagraphPropertiesValues shadingOverridden](v149, "shadingOverridden"))
                                                                                            {
                                                                                              -[WDParagraphProperties mutableShading](self, "mutableShading");
                                                                                              v150 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              -[WDParagraphPropertiesValues shading](self->mOriginalProperties, "shading");
                                                                                              v151 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              v152 = objc_msgSend(v151, "style");

                                                                                              if (v152)
                                                                                              {
                                                                                                objc_msgSend(v150, "setStyle:", 0);
                                                                                                +[WDShading autoForegroundColor](WDShading, "autoForegroundColor");
                                                                                                v153 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                objc_msgSend(v150, "setForeground:", v153);

                                                                                                +[WDShading autoBackgroundColor](WDShading, "autoBackgroundColor");
                                                                                                v154 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                objc_msgSend(v150, "setBackground:", v154);
                                                                                              }
                                                                                              else if (objc_msgSend(v166, "isShadingOverridden"))
                                                                                              {
                                                                                                objc_msgSend(v166, "shading");
                                                                                                v154 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                objc_msgSend(v150, "setShading:", v154);
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                objc_msgSend(v150, "setStyle:", 1);
                                                                                                +[OITSUColor blackColor](OITSUColor, "blackColor");
                                                                                                v155 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                objc_msgSend(v150, "setForeground:", v155);

                                                                                                +[OITSUColor whiteColor](OITSUColor, "whiteColor");
                                                                                                v154 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                objc_msgSend(v150, "setBackground:", v154);
                                                                                              }

                                                                                            }
                                                                                          }
                                                                                          v156 = self->mOriginalProperties;
                                                                                          if (v156)
                                                                                          {
                                                                                            if (-[WDParagraphPropertiesValues dropCapOverridden](v156, "dropCapOverridden"))
                                                                                            {
                                                                                              v157 = self->mTrackedProperties;
                                                                                              if (!v157
                                                                                                || !-[WDParagraphPropertiesValues dropCapOverridden](v157, "dropCapOverridden"))
                                                                                              {
                                                                                                if (objc_msgSend(v166, "isDropCapOverridden"))
                                                                                                  -[WDParagraphProperties setDropCap:](self, "setDropCap:", (unsigned __int16)objc_msgSend(v166, "dropCap"));
                                                                                                else
                                                                                                  -[WDParagraphProperties setDropCap:](self, "setDropCap:", 256);
                                                                                              }
                                                                                            }
                                                                                            v158 = self->mOriginalProperties;
                                                                                            if (v158)
                                                                                            {
                                                                                              if (-[WDParagraphPropertiesValues tabStopAddedCountOverridden](v158, "tabStopAddedCountOverridden"))
                                                                                              {
                                                                                                v159 = self->mTrackedProperties;
                                                                                                if (!v159 || !-[WDParagraphPropertiesValues tabStopAddedCountOverridden](v159, "tabStopAddedCountOverridden"))
                                                                                                {
                                                                                                  v160 = objc_msgSend(v166, "tabStopAddedCount");
                                                                                                  if (v160)
                                                                                                  {
                                                                                                    -[WDParagraphProperties setTabStopAddedCount:](self, "setTabStopAddedCount:", v160);
                                                                                                    for (i = 0;
                                                                                                          i != v160;
                                                                                                          ++i)
                                                                                                    {
                                                                                                      -[WDParagraphProperties addTabStopAdded:](self, "addTabStopAdded:", objc_msgSend(v166, "tabStopAddedAt:", i));
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    -[WDParagraphProperties setTabStopAddedCount:](self, "setTabStopAddedCount:", 0);
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                              v162 = self->mOriginalProperties;
                                                                                              if (v162)
                                                                                              {
                                                                                                if (-[WDParagraphPropertiesValues tabStopDeletedCountOverridden](v162, "tabStopDeletedCountOverridden"))
                                                                                                {
                                                                                                  v163 = self->mTrackedProperties;
                                                                                                  if (!v163 || !-[WDParagraphPropertiesValues tabStopDeletedCountOverridden](v163, "tabStopDeletedCountOverridden"))
                                                                                                  {
                                                                                                    v164 = objc_msgSend(v166, "tabStopDeletedPositionCount");
                                                                                                    if (v164)
                                                                                                    {
                                                                                                      -[WDParagraphProperties setTabStopDeletedPositionCount:](self, "setTabStopDeletedPositionCount:", v164);
                                                                                                      for (j = 0;
                                                                                                            j != v164;
                                                                                                            ++j)
                                                                                                      {
                                                                                                        -[WDParagraphProperties addTabStopDeletedPosition:](self, "addTabStopDeletedPosition:", objc_msgSend(v166, "tabStopDeletedPositionAt:", j));
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      -[WDParagraphProperties setTabStopDeletedPositionCount:](self, "setTabStopDeletedPositionCount:", 0);
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    -[WDParagraphProperties setResolveMode:](self, "setResolveMode:", v4);
  }

}

- (BOOL)isPageBreakBefore
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues pageBreakBeforeOverridden](mTrackedProperties, "pageBreakBeforeOverridden"))
        return -[WDParagraphPropertiesValues pageBreakBefore](*p_mTrackedProperties, "pageBreakBefore");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues pageBreakBeforeOverridden](v6, "pageBreakBeforeOverridden"))
        return -[WDParagraphPropertiesValues pageBreakBefore](*p_mTrackedProperties, "pageBreakBefore");
    }
  }
  return 0;
}

- (BOOL)isPageBreakBeforeOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues pageBreakBeforeOverridden](mTrackedProperties, "pageBreakBeforeOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues pageBreakBeforeOverridden](mOriginalProperties, "pageBreakBeforeOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues pageBreakBeforeOverridden](v5, "pageBreakBeforeOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues pageBreakBeforeOverridden](v5, "pageBreakBeforeOverridden");
  return 0;
}

- ($06D0163FE0D7AFE752A9F21F38483579)dropCap
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *mOriginalProperties;
  char v5;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues *v7;
  WDParagraphPropertiesValues *v8;
  __int16 v9;

  if ((*((_BYTE *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (!-[WDParagraphPropertiesValues dropCapOverridden](mTrackedProperties, "dropCapOverridden"))
      {
        mOriginalProperties = self->mOriginalProperties;
        if (mOriginalProperties)
        {
          if (-[WDParagraphPropertiesValues dropCapOverridden](mOriginalProperties, "dropCapOverridden"))
            goto LABEL_16;
        }
      }
    }
  }
  v5 = *((_BYTE *)self + 17);
  if ((v5 & 6) == 0 || (v6 = self->mTrackedProperties) == 0)
  {
LABEL_11:
    if ((v5 & 5) != 0)
    {
      v8 = self->mOriginalProperties;
      if (v8)
      {
        LODWORD(v8) = -[WDParagraphPropertiesValues dropCapOverridden](v8, "dropCapOverridden");
        if ((_DWORD)v8)
        {
          v7 = self->mOriginalProperties;
          goto LABEL_15;
        }
      }
LABEL_17:
      v9 = 0;
      return ($06D0163FE0D7AFE752A9F21F38483579)(v8 | (unsigned __int16)(v9 << 8));
    }
LABEL_16:
    LOBYTE(v8) = 0;
    goto LABEL_17;
  }
  if (!-[WDParagraphPropertiesValues dropCapOverridden](v6, "dropCapOverridden"))
  {
    v5 = *((_BYTE *)self + 17);
    goto LABEL_11;
  }
  v7 = self->mTrackedProperties;
LABEL_15:
  LOWORD(v8) = -[WDParagraphPropertiesValues dropCap](v7, "dropCap");
  v9 = BYTE1(v8);
  return ($06D0163FE0D7AFE752A9F21F38483579)(v8 | (unsigned __int16)(v9 << 8));
}

- (BOOL)isDropCapOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues dropCapOverridden](mTrackedProperties, "dropCapOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues dropCapOverridden](mOriginalProperties, "dropCapOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues dropCapOverridden](v5, "dropCapOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues dropCapOverridden](v5, "dropCapOverridden");
  return 0;
}

- (int64_t)height
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  int64_t result;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues heightOverridden](mTrackedProperties, "heightOverridden"))
        return -[WDParagraphPropertiesValues height](*p_mTrackedProperties, "height");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    result = (int64_t)mOriginalProperties;
    if (!mOriginalProperties)
      return result;
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend((id)result, "heightOverridden"))
      return -[WDParagraphPropertiesValues height](*p_mTrackedProperties, "height");
  }
  return 0;
}

- (BOOL)isHeightOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues heightOverridden](mTrackedProperties, "heightOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues heightOverridden](mOriginalProperties, "heightOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues heightOverridden](v5, "heightOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues heightOverridden](v5, "heightOverridden");
  return 0;
}

- (int)heightRule
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues heightRuleOverridden](mTrackedProperties, "heightRuleOverridden"))
        return -[WDParagraphPropertiesValues heightRule](*p_mTrackedProperties, "heightRule");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues heightRuleOverridden](v6, "heightRuleOverridden"))
        return -[WDParagraphPropertiesValues heightRule](*p_mTrackedProperties, "heightRule");
    }
  }
  return 1;
}

- (BOOL)isHeightRuleOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues heightRuleOverridden](mTrackedProperties, "heightRuleOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues heightRuleOverridden](mOriginalProperties, "heightRuleOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues heightRuleOverridden](v5, "heightRuleOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues heightRuleOverridden](v5, "heightRuleOverridden");
  return 0;
}

- (int64_t)verticalSpace
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues verticalSpaceOverridden](mTrackedProperties, "verticalSpaceOverridden"))
        return -[WDParagraphPropertiesValues verticalSpace](*p_mTrackedProperties, "verticalSpace");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues verticalSpaceOverridden](v6, "verticalSpaceOverridden"))
        return -[WDParagraphPropertiesValues verticalSpace](*p_mTrackedProperties, "verticalSpace");
    }
  }
  return 0;
}

- (BOOL)isVerticalSpaceOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues verticalSpaceOverridden](mTrackedProperties, "verticalSpaceOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues verticalSpaceOverridden](mOriginalProperties, "verticalSpaceOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues verticalSpaceOverridden](v5, "verticalSpaceOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues verticalSpaceOverridden](v5, "verticalSpaceOverridden");
  return 0;
}

- (int64_t)horizontalSpace
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues horizontalSpaceOverridden](mTrackedProperties, "horizontalSpaceOverridden"))
        return -[WDParagraphPropertiesValues horizontalSpace](*p_mTrackedProperties, "horizontalSpace");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues horizontalSpaceOverridden](v6, "horizontalSpaceOverridden"))
        return -[WDParagraphPropertiesValues horizontalSpace](*p_mTrackedProperties, "horizontalSpace");
    }
  }
  return 0;
}

- (BOOL)isHorizontalSpaceOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues horizontalSpaceOverridden](mTrackedProperties, "horizontalSpaceOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues horizontalSpaceOverridden](mOriginalProperties, "horizontalSpaceOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues horizontalSpaceOverridden](v5, "horizontalSpaceOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues horizontalSpaceOverridden](v5, "horizontalSpaceOverridden");
  return 0;
}

- (BOOL)wrap
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues wrapOverridden](mTrackedProperties, "wrapOverridden"))
        return -[WDParagraphPropertiesValues wrap](*p_mTrackedProperties, "wrap");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues wrapOverridden](v6, "wrapOverridden"))
        return -[WDParagraphPropertiesValues wrap](*p_mTrackedProperties, "wrap");
    }
  }
  return 0;
}

- (BOOL)isWrapOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues wrapOverridden](mTrackedProperties, "wrapOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties || !-[WDParagraphPropertiesValues wrapOverridden](mOriginalProperties, "wrapOverridden"))
        return 0;
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues wrapOverridden](v5, "wrapOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues wrapOverridden](v5, "wrapOverridden");
  return 0;
}

- (char)wrapCode
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues wrapCodeOverridden](mTrackedProperties, "wrapCodeOverridden"))
        return -[WDParagraphPropertiesValues wrapCode](*p_mTrackedProperties, "wrapCode");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues wrapCodeOverridden](v6, "wrapCodeOverridden"))
        return -[WDParagraphPropertiesValues wrapCode](*p_mTrackedProperties, "wrapCode");
    }
  }
  return 0;
}

- (BOOL)isWrapCodeOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues wrapCodeOverridden](mTrackedProperties, "wrapCodeOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues wrapCodeOverridden](mOriginalProperties, "wrapCodeOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues wrapCodeOverridden](v5, "wrapCodeOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues wrapCodeOverridden](v5, "wrapCodeOverridden");
  return 0;
}

- (BOOL)anchorLock
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues anchorLockOverridden](mTrackedProperties, "anchorLockOverridden"))
        return -[WDParagraphPropertiesValues anchorLock](*p_mTrackedProperties, "anchorLock");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues anchorLockOverridden](v6, "anchorLockOverridden"))
        return -[WDParagraphPropertiesValues anchorLock](*p_mTrackedProperties, "anchorLock");
    }
  }
  return 0;
}

- (BOOL)isAnchorLockOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues anchorLockOverridden](mTrackedProperties, "anchorLockOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues anchorLockOverridden](mOriginalProperties, "anchorLockOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues anchorLockOverridden](v5, "anchorLockOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues anchorLockOverridden](v5, "anchorLockOverridden");
  return 0;
}

- (id)topBorder
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *mOriginalProperties;
  char v5;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  void *v8;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *v10;

  if ((*((_BYTE *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (!-[WDParagraphPropertiesValues topBorderOverridden](mTrackedProperties, "topBorderOverridden"))
      {
        mOriginalProperties = self->mOriginalProperties;
        if (mOriginalProperties)
        {
          if (-[WDParagraphPropertiesValues topBorderOverridden](mOriginalProperties, "topBorderOverridden"))
            goto LABEL_14;
        }
      }
    }
  }
  v5 = *((_BYTE *)self + 17);
  if ((v5 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    v6 = self->mTrackedProperties;
    if (v6)
    {
      if (-[WDParagraphPropertiesValues topBorderOverridden](v6, "topBorderOverridden"))
      {
LABEL_13:
        -[WDParagraphPropertiesValues topBorder](*p_mTrackedProperties, "topBorder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        return v8;
      }
      v5 = *((_BYTE *)self + 17);
    }
  }
  if ((v5 & 5) == 0)
  {
LABEL_14:
    v8 = 0;
    return v8;
  }
  v10 = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v8 = v10;
  if (v10)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v8, "topBorderOverridden"))
      goto LABEL_13;
    goto LABEL_14;
  }
  return v8;
}

- (BOOL)isTopBorderOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues topBorderOverridden](mTrackedProperties, "topBorderOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues topBorderOverridden](mOriginalProperties, "topBorderOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues topBorderOverridden](v5, "topBorderOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues topBorderOverridden](v5, "topBorderOverridden");
  return 0;
}

- (id)leftBorder
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *mOriginalProperties;
  char v5;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  void *v8;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *v10;

  if ((*((_BYTE *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (!-[WDParagraphPropertiesValues leftBorderOverridden](mTrackedProperties, "leftBorderOverridden"))
      {
        mOriginalProperties = self->mOriginalProperties;
        if (mOriginalProperties)
        {
          if (-[WDParagraphPropertiesValues leftBorderOverridden](mOriginalProperties, "leftBorderOverridden"))
            goto LABEL_14;
        }
      }
    }
  }
  v5 = *((_BYTE *)self + 17);
  if ((v5 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    v6 = self->mTrackedProperties;
    if (v6)
    {
      if (-[WDParagraphPropertiesValues leftBorderOverridden](v6, "leftBorderOverridden"))
      {
LABEL_13:
        -[WDParagraphPropertiesValues leftBorder](*p_mTrackedProperties, "leftBorder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        return v8;
      }
      v5 = *((_BYTE *)self + 17);
    }
  }
  if ((v5 & 5) == 0)
  {
LABEL_14:
    v8 = 0;
    return v8;
  }
  v10 = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v8 = v10;
  if (v10)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v8, "leftBorderOverridden"))
      goto LABEL_13;
    goto LABEL_14;
  }
  return v8;
}

- (BOOL)isLeftBorderOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues leftBorderOverridden](mTrackedProperties, "leftBorderOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues leftBorderOverridden](mOriginalProperties, "leftBorderOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues leftBorderOverridden](v5, "leftBorderOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues leftBorderOverridden](v5, "leftBorderOverridden");
  return 0;
}

- (id)rightBorder
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *mOriginalProperties;
  char v5;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  void *v8;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *v10;

  if ((*((_BYTE *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (!-[WDParagraphPropertiesValues rightBorderOverridden](mTrackedProperties, "rightBorderOverridden"))
      {
        mOriginalProperties = self->mOriginalProperties;
        if (mOriginalProperties)
        {
          if (-[WDParagraphPropertiesValues rightBorderOverridden](mOriginalProperties, "rightBorderOverridden"))
            goto LABEL_14;
        }
      }
    }
  }
  v5 = *((_BYTE *)self + 17);
  if ((v5 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    v6 = self->mTrackedProperties;
    if (v6)
    {
      if (-[WDParagraphPropertiesValues rightBorderOverridden](v6, "rightBorderOverridden"))
      {
LABEL_13:
        -[WDParagraphPropertiesValues rightBorder](*p_mTrackedProperties, "rightBorder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        return v8;
      }
      v5 = *((_BYTE *)self + 17);
    }
  }
  if ((v5 & 5) == 0)
  {
LABEL_14:
    v8 = 0;
    return v8;
  }
  v10 = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v8 = v10;
  if (v10)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v8, "rightBorderOverridden"))
      goto LABEL_13;
    goto LABEL_14;
  }
  return v8;
}

- (BOOL)isRightBorderOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues rightBorderOverridden](mTrackedProperties, "rightBorderOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues rightBorderOverridden](mOriginalProperties, "rightBorderOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues rightBorderOverridden](v5, "rightBorderOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues rightBorderOverridden](v5, "rightBorderOverridden");
  return 0;
}

- (id)betweenBorder
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  void *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues betweenBorderOverridden](mTrackedProperties, "betweenBorderOverridden"))
      {
LABEL_8:
        -[WDParagraphPropertiesValues betweenBorder](*p_mTrackedProperties, "betweenBorder");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
LABEL_9:
    v6 = 0;
    return v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v6, "betweenBorderOverridden"))
      goto LABEL_8;
    goto LABEL_9;
  }
  return v6;
}

- (BOOL)isBetweenBorderOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues betweenBorderOverridden](mTrackedProperties, "betweenBorderOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues betweenBorderOverridden](mOriginalProperties, "betweenBorderOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues betweenBorderOverridden](v5, "betweenBorderOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues betweenBorderOverridden](v5, "betweenBorderOverridden");
  return 0;
}

- (id)barBorder
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  void *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues barBorderOverridden](mTrackedProperties, "barBorderOverridden"))
      {
LABEL_8:
        -[WDParagraphPropertiesValues barBorder](*p_mTrackedProperties, "barBorder");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
LABEL_9:
    v6 = 0;
    return v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v6, "barBorderOverridden"))
      goto LABEL_8;
    goto LABEL_9;
  }
  return v6;
}

- (BOOL)isBarBorderOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues barBorderOverridden](mTrackedProperties, "barBorderOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues barBorderOverridden](mOriginalProperties, "barBorderOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues barBorderOverridden](v5, "barBorderOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues barBorderOverridden](v5, "barBorderOverridden");
  return 0;
}

- (BOOL)spaceBeforeAuto
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues spaceBeforeAutoOverridden](mTrackedProperties, "spaceBeforeAutoOverridden"))
        return -[WDParagraphPropertiesValues spaceBeforeAuto](*p_mTrackedProperties, "spaceBeforeAuto");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues spaceBeforeAutoOverridden](v6, "spaceBeforeAutoOverridden"))
        return -[WDParagraphPropertiesValues spaceBeforeAuto](*p_mTrackedProperties, "spaceBeforeAuto");
    }
  }
  return 0;
}

- (BOOL)isSpaceBeforeAutoOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues spaceBeforeAutoOverridden](mTrackedProperties, "spaceBeforeAutoOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues spaceBeforeAutoOverridden](mOriginalProperties, "spaceBeforeAutoOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues spaceBeforeAutoOverridden](v5, "spaceBeforeAutoOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues spaceBeforeAutoOverridden](v5, "spaceBeforeAutoOverridden");
  return 0;
}

- (BOOL)spaceAfterAuto
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues spaceAfterAutoOverridden](mTrackedProperties, "spaceAfterAutoOverridden"))
        return -[WDParagraphPropertiesValues spaceAfterAuto](*p_mTrackedProperties, "spaceAfterAuto");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues spaceAfterAutoOverridden](v6, "spaceAfterAutoOverridden"))
        return -[WDParagraphPropertiesValues spaceAfterAuto](*p_mTrackedProperties, "spaceAfterAuto");
    }
  }
  return 0;
}

- (BOOL)isSpaceAfterAutoOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues spaceAfterAutoOverridden](mTrackedProperties, "spaceAfterAutoOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues spaceAfterAutoOverridden](mOriginalProperties, "spaceAfterAutoOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues spaceAfterAutoOverridden](v5, "spaceAfterAutoOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues spaceAfterAutoOverridden](v5, "spaceAfterAutoOverridden");
  return 0;
}

- (void)clearLeftIndent
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      return;
LABEL_6:
    -[WDParagraphPropertiesValues setLeftIndent:](mTrackedProperties, "setLeftIndent:", 0);
    -[WDParagraphPropertiesValues setLeftIndentOverridden:](*p_mTrackedProperties, "setLeftIndentOverridden:", 0);
    return;
  }
  if ((*((_BYTE *)self + 17) & 1) != 0)
  {
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      goto LABEL_6;
  }
}

- (signed)leadingIndent
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues leadingIndentOverridden](mTrackedProperties, "leadingIndentOverridden"))
        return -[WDParagraphPropertiesValues leadingIndent](*p_mTrackedProperties, "leadingIndent");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues leadingIndentOverridden](v6, "leadingIndentOverridden"))
        return -[WDParagraphPropertiesValues leadingIndent](*p_mTrackedProperties, "leadingIndent");
    }
  }
  return 0;
}

- (void)setLeadingIndent:(signed __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setLeadingIndent:](mOriginalProperties, "setLeadingIndent:", v3);
  objc_msgSend(*p_mOriginalProperties, "setLeadingIndentOverridden:", 1);
}

- (BOOL)isLeadingIndentOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues leadingIndentOverridden](mTrackedProperties, "leadingIndentOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues leadingIndentOverridden](mOriginalProperties, "leadingIndentOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues leadingIndentOverridden](v5, "leadingIndentOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues leadingIndentOverridden](v5, "leadingIndentOverridden");
  return 0;
}

- (void)clearLeadingIndent
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      return;
LABEL_6:
    -[WDParagraphPropertiesValues setLeadingIndent:](mTrackedProperties, "setLeadingIndent:", 0);
    -[WDParagraphPropertiesValues setLeadingIndentOverridden:](*p_mTrackedProperties, "setLeadingIndentOverridden:", 0);
    return;
  }
  if ((*((_BYTE *)self + 17) & 1) != 0)
  {
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      goto LABEL_6;
  }
}

- (signed)followingIndent
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues followingIndentOverridden](mTrackedProperties, "followingIndentOverridden"))
        return -[WDParagraphPropertiesValues followingIndent](*p_mTrackedProperties, "followingIndent");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues followingIndentOverridden](v6, "followingIndentOverridden"))
        return -[WDParagraphPropertiesValues followingIndent](*p_mTrackedProperties, "followingIndent");
    }
  }
  return 0;
}

- (void)setFollowingIndent:(signed __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setFollowingIndent:](mOriginalProperties, "setFollowingIndent:", v3);
  objc_msgSend(*p_mOriginalProperties, "setFollowingIndentOverridden:", 1);
}

- (BOOL)isFollowingIndentOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues followingIndentOverridden](mTrackedProperties, "followingIndentOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues followingIndentOverridden](mOriginalProperties, "followingIndentOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues followingIndentOverridden](v5, "followingIndentOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues followingIndentOverridden](v5, "followingIndentOverridden");
  return 0;
}

- (void)clearFollowingIndent
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      return;
LABEL_6:
    -[WDParagraphPropertiesValues setFollowingIndent:](mTrackedProperties, "setFollowingIndent:", 0);
    -[WDParagraphPropertiesValues setFollowingIndentOverridden:](*p_mTrackedProperties, "setFollowingIndentOverridden:", 0);
    return;
  }
  if ((*((_BYTE *)self + 17) & 1) != 0)
  {
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      goto LABEL_6;
  }
}

- (void)clearRightIndent
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      return;
LABEL_6:
    -[WDParagraphPropertiesValues setRightIndent:](mTrackedProperties, "setRightIndent:", 0);
    -[WDParagraphPropertiesValues setRightIndentOverridden:](*p_mTrackedProperties, "setRightIndentOverridden:", 0);
    return;
  }
  if ((*((_BYTE *)self + 17) & 1) != 0)
  {
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      goto LABEL_6;
  }
}

- (void)clearFirstLineIndent
{
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;

  if ((*((_BYTE *)self + 17) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      return;
LABEL_6:
    -[WDParagraphPropertiesValues setFirstLineIndent:](mTrackedProperties, "setFirstLineIndent:", 0);
    -[WDParagraphPropertiesValues setFirstLineIndentOverridden:](*p_mTrackedProperties, "setFirstLineIndentOverridden:", 0);
    return;
  }
  if ((*((_BYTE *)self + 17) & 1) != 0)
  {
    p_mTrackedProperties = &self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      goto LABEL_6;
  }
}

- (signed)leftIndentChars
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues leftIndentCharsOverridden](mTrackedProperties, "leftIndentCharsOverridden"))
        return -[WDParagraphPropertiesValues leftIndentChars](*p_mTrackedProperties, "leftIndentChars");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues leftIndentCharsOverridden](v6, "leftIndentCharsOverridden"))
        return -[WDParagraphPropertiesValues leftIndentChars](*p_mTrackedProperties, "leftIndentChars");
    }
  }
  return 0;
}

- (void)setLeftIndentChars:(signed __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setLeftIndentChars:](mOriginalProperties, "setLeftIndentChars:", v3);
  objc_msgSend(*p_mOriginalProperties, "setLeftIndentCharsOverridden:", 1);
}

- (BOOL)isLeftIndentCharsOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues leftIndentCharsOverridden](mTrackedProperties, "leftIndentCharsOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues leftIndentCharsOverridden](mOriginalProperties, "leftIndentCharsOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues leftIndentCharsOverridden](v5, "leftIndentCharsOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues leftIndentCharsOverridden](v5, "leftIndentCharsOverridden");
  return 0;
}

- (signed)rightIndentChars
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues rightIndentCharsOverridden](mTrackedProperties, "rightIndentCharsOverridden"))
        return -[WDParagraphPropertiesValues rightIndentChars](*p_mTrackedProperties, "rightIndentChars");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues rightIndentCharsOverridden](v6, "rightIndentCharsOverridden"))
        return -[WDParagraphPropertiesValues rightIndentChars](*p_mTrackedProperties, "rightIndentChars");
    }
  }
  return 0;
}

- (void)setRightIndentChars:(signed __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setRightIndentChars:](mOriginalProperties, "setRightIndentChars:", v3);
  objc_msgSend(*p_mOriginalProperties, "setRightIndentCharsOverridden:", 1);
}

- (BOOL)isRightIndentCharsOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues rightIndentCharsOverridden](mTrackedProperties, "rightIndentCharsOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues rightIndentCharsOverridden](mOriginalProperties, "rightIndentCharsOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues rightIndentCharsOverridden](v5, "rightIndentCharsOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues rightIndentCharsOverridden](v5, "rightIndentCharsOverridden");
  return 0;
}

- (signed)firstLineIndentChars
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues firstLineIndentCharsOverridden](mTrackedProperties, "firstLineIndentCharsOverridden"))
      {
        return -[WDParagraphPropertiesValues firstLineIndentChars](*p_mTrackedProperties, "firstLineIndentChars");
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues firstLineIndentCharsOverridden](v6, "firstLineIndentCharsOverridden"))
        return -[WDParagraphPropertiesValues firstLineIndentChars](*p_mTrackedProperties, "firstLineIndentChars");
    }
  }
  return 0;
}

- (void)setFirstLineIndentChars:(signed __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setFirstLineIndentChars:](mOriginalProperties, "setFirstLineIndentChars:", v3);
  objc_msgSend(*p_mOriginalProperties, "setFirstLineIndentCharsOverridden:", 1);
}

- (BOOL)isFirstLineIndentCharsOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues firstLineIndentCharsOverridden](mTrackedProperties, "firstLineIndentCharsOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues firstLineIndentCharsOverridden](mOriginalProperties, "firstLineIndentCharsOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues firstLineIndentCharsOverridden](v5, "firstLineIndentCharsOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues firstLineIndentCharsOverridden](v5, "firstLineIndentCharsOverridden");
  return 0;
}

- (int)physicalJustification
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues physicalJustificationOverridden](mTrackedProperties, "physicalJustificationOverridden"))
      {
LABEL_8:
        LODWORD(v6) = -[WDParagraphPropertiesValues physicalJustification](*p_mTrackedProperties, "physicalJustification");
        return (int)v6;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
    LODWORD(v6) = 0;
    return (int)v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    LODWORD(v6) = -[WDParagraphPropertiesValues physicalJustificationOverridden](v6, "physicalJustificationOverridden");
    p_mTrackedProperties = p_mOriginalProperties;
    if ((_DWORD)v6)
      goto LABEL_8;
  }
  return (int)v6;
}

- (void)setPhysicalJustification:(int)a3
{
  unsigned __int8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setPhysicalJustification:](mOriginalProperties, "setPhysicalJustification:", v3);
  objc_msgSend(*p_mOriginalProperties, "setPhysicalJustificationOverridden:", 1);
}

- (BOOL)isPhysicalJustificationOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues physicalJustificationOverridden](mTrackedProperties, "physicalJustificationOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues physicalJustificationOverridden](mOriginalProperties, "physicalJustificationOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues physicalJustificationOverridden](v5, "physicalJustificationOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues physicalJustificationOverridden](v5, "physicalJustificationOverridden");
  return 0;
}

- (unsigned)outlineLevel
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues outlineLevelOverridden](mTrackedProperties, "outlineLevelOverridden"))
        return -[WDParagraphPropertiesValues outlineLevel](*p_mTrackedProperties, "outlineLevel");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues outlineLevelOverridden](v6, "outlineLevelOverridden"))
        return -[WDParagraphPropertiesValues outlineLevel](*p_mTrackedProperties, "outlineLevel");
    }
  }
  return 0;
}

- (BOOL)isOutlineLevelOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues outlineLevelOverridden](mTrackedProperties, "outlineLevelOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues outlineLevelOverridden](mOriginalProperties, "outlineLevelOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues outlineLevelOverridden](v5, "outlineLevelOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues outlineLevelOverridden](v5, "outlineLevelOverridden");
  return 0;
}

- (BOOL)keepNextParagraphTogether
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues keepNextParagraphTogetherOverridden](mTrackedProperties, "keepNextParagraphTogetherOverridden"))
      {
        return -[WDParagraphPropertiesValues keepNextParagraphTogether](*p_mTrackedProperties, "keepNextParagraphTogether");
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues keepNextParagraphTogetherOverridden](v6, "keepNextParagraphTogetherOverridden"))
        return -[WDParagraphPropertiesValues keepNextParagraphTogether](*p_mTrackedProperties, "keepNextParagraphTogether");
    }
  }
  return 0;
}

- (BOOL)isKeepNextParagraphTogetherOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues keepNextParagraphTogetherOverridden](mTrackedProperties, "keepNextParagraphTogetherOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues keepNextParagraphTogetherOverridden](mOriginalProperties, "keepNextParagraphTogetherOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues keepNextParagraphTogetherOverridden](v5, "keepNextParagraphTogetherOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues keepNextParagraphTogetherOverridden](v5, "keepNextParagraphTogetherOverridden");
  return 0;
}

- (BOOL)keepLinesTogether
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues keepLinesTogetherOverridden](mTrackedProperties, "keepLinesTogetherOverridden"))
        return -[WDParagraphPropertiesValues keepLinesTogether](*p_mTrackedProperties, "keepLinesTogether");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues keepLinesTogetherOverridden](v6, "keepLinesTogetherOverridden"))
        return -[WDParagraphPropertiesValues keepLinesTogether](*p_mTrackedProperties, "keepLinesTogether");
    }
  }
  return 0;
}

- (BOOL)isKeepLinesTogetherOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues keepLinesTogetherOverridden](mTrackedProperties, "keepLinesTogetherOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues keepLinesTogetherOverridden](mOriginalProperties, "keepLinesTogetherOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues keepLinesTogetherOverridden](v5, "keepLinesTogetherOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues keepLinesTogetherOverridden](v5, "keepLinesTogetherOverridden");
  return 0;
}

- (BOOL)suppressAutoHyphens
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues suppressAutoHyphensOverridden](mTrackedProperties, "suppressAutoHyphensOverridden"))
      {
        return -[WDParagraphPropertiesValues suppressAutoHyphens](*p_mTrackedProperties, "suppressAutoHyphens");
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues suppressAutoHyphensOverridden](v6, "suppressAutoHyphensOverridden"))
        return -[WDParagraphPropertiesValues suppressAutoHyphens](*p_mTrackedProperties, "suppressAutoHyphens");
    }
  }
  return 0;
}

- (BOOL)isSuppressAutoHyphensOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues suppressAutoHyphensOverridden](mTrackedProperties, "suppressAutoHyphensOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues suppressAutoHyphensOverridden](mOriginalProperties, "suppressAutoHyphensOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues suppressAutoHyphensOverridden](v5, "suppressAutoHyphensOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues suppressAutoHyphensOverridden](v5, "suppressAutoHyphensOverridden");
  return 0;
}

- (BOOL)suppressLineNumbers
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues suppressLineNumbersOverridden](mTrackedProperties, "suppressLineNumbersOverridden"))
      {
        return -[WDParagraphPropertiesValues suppressLineNumbers](*p_mTrackedProperties, "suppressLineNumbers");
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues suppressLineNumbersOverridden](v6, "suppressLineNumbersOverridden"))
        return -[WDParagraphPropertiesValues suppressLineNumbers](*p_mTrackedProperties, "suppressLineNumbers");
    }
  }
  return 0;
}

- (BOOL)isSuppressLineNumbersOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues suppressLineNumbersOverridden](mTrackedProperties, "suppressLineNumbersOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues suppressLineNumbersOverridden](mOriginalProperties, "suppressLineNumbersOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues suppressLineNumbersOverridden](v5, "suppressLineNumbersOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues suppressLineNumbersOverridden](v5, "suppressLineNumbersOverridden");
  return 0;
}

- (BOOL)widowControl
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues widowControlOverridden](mTrackedProperties, "widowControlOverridden"))
        return -[WDParagraphPropertiesValues widowControl](*p_mTrackedProperties, "widowControl");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues widowControlOverridden](v6, "widowControlOverridden"))
        return -[WDParagraphPropertiesValues widowControl](*p_mTrackedProperties, "widowControl");
    }
  }
  return 0;
}

- (BOOL)isWidowControlOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues widowControlOverridden](mTrackedProperties, "widowControlOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues widowControlOverridden](mOriginalProperties, "widowControlOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues widowControlOverridden](v5, "widowControlOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues widowControlOverridden](v5, "widowControlOverridden");
  return 0;
}

- (BOOL)biDi
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues biDiOverridden](mTrackedProperties, "biDiOverridden"))
        return -[WDParagraphPropertiesValues biDi](*p_mTrackedProperties, "biDi");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues biDiOverridden](v6, "biDiOverridden"))
        return -[WDParagraphPropertiesValues biDi](*p_mTrackedProperties, "biDi");
    }
  }
  return 0;
}

- (void)setBiDi:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setBiDi:](mOriginalProperties, "setBiDi:", v3);
  objc_msgSend(*p_mOriginalProperties, "setBiDiOverridden:", 1);
}

- (BOOL)isBiDiOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues biDiOverridden](mTrackedProperties, "biDiOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties || !-[WDParagraphPropertiesValues biDiOverridden](mOriginalProperties, "biDiOverridden"))
        return 0;
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues biDiOverridden](v5, "biDiOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues biDiOverridden](v5, "biDiOverridden");
  return 0;
}

- (BOOL)kinsokuOff
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues kinsokuOffOverridden](mTrackedProperties, "kinsokuOffOverridden"))
        return -[WDParagraphPropertiesValues kinsokuOff](*p_mTrackedProperties, "kinsokuOff");
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues kinsokuOffOverridden](v6, "kinsokuOffOverridden"))
        return -[WDParagraphPropertiesValues kinsokuOff](*p_mTrackedProperties, "kinsokuOff");
    }
  }
  return 0;
}

- (void)setKinsokuOff:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setKinsokuOff:](mOriginalProperties, "setKinsokuOff:", v3);
  objc_msgSend(*p_mOriginalProperties, "setKinsokuOffOverridden:", 1);
}

- (BOOL)isKinsokuOffOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues kinsokuOffOverridden](mTrackedProperties, "kinsokuOffOverridden"))
          goto LABEL_5;
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues kinsokuOffOverridden](mOriginalProperties, "kinsokuOffOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues kinsokuOffOverridden](v5, "kinsokuOffOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues kinsokuOffOverridden](v5, "kinsokuOffOverridden");
  return 0;
}

- (unint64_t)tabStopAddedCount
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  void *v5;
  unint64_t v6;
  WDParagraphPropertiesValues *mOriginalProperties;
  unint64_t v8;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues tabStopAddedCountOverridden](mTrackedProperties, "tabStopAddedCountOverridden"))
      {
        -[WDParagraphPropertiesValues tabStopAddedTable](self->mTrackedProperties, "tabStopAddedTable");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "length");
        goto LABEL_10;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
    return 0;
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties
    || !-[WDParagraphPropertiesValues tabStopAddedCountOverridden](mOriginalProperties, "tabStopAddedCountOverridden"))
  {
    return 0;
  }
  -[WDParagraphPropertiesValues tabStopAddedTable](self->mOriginalProperties, "tabStopAddedTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
LABEL_10:
  v8 = v6 >> 2;

  return v8;
}

- (BOOL)hasTabStopAddedAtPosition:(signed __int16)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  $373952EDE9DECE7FE473A72CF4B2C093 *v11;

  v5 = -[WDParagraphProperties tabStopAddedCount](self, "tabStopAddedCount");
  if (v5 < 1)
    return 0;
  v6 = v5;
  v7 = (unsigned __int16)a3;
  if (*(unsigned __int16 *)-[WDParagraphProperties tabStopAddedAt:](self, "tabStopAddedAt:", 0) == (unsigned __int16)a3)
    return 1;
  v9 = 1;
  do
  {
    v10 = v9;
    if (v6 == v9)
      break;
    v11 = -[WDParagraphProperties tabStopAddedAt:](self, "tabStopAddedAt:", v9);
    v9 = v10 + 1;
  }
  while ((unsigned __int16)v11->var0 != v7);
  return v10 < v6;
}

- (BOOL)hasTabStopDeletedAtPosition:(signed __int16)a3
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v3 = a3;
  v5 = -[WDParagraphProperties tabStopDeletedPositionCount](self, "tabStopDeletedPositionCount");
  if (v5 < 1)
    return 0;
  v6 = v5;
  if (-[WDParagraphProperties tabStopDeletedPositionAt:](self, "tabStopDeletedPositionAt:", 0) == v3)
    return 1;
  v8 = 1;
  do
  {
    v9 = v8;
    if (v6 == v8)
      break;
    v10 = -[WDParagraphProperties tabStopDeletedPositionAt:](self, "tabStopDeletedPositionAt:", v8);
    v8 = v9 + 1;
  }
  while (v10 != v3);
  return v9 < v6;
}

- ($373952EDE9DECE7FE473A72CF4B2C093)tabStopAddedAt:(unint64_t)a3
{
  unint64_t v4;
  char v5;
  WDParagraphPropertiesValues *mTrackedProperties;
  void *v7;
  uint64_t v8;
  WDParagraphPropertiesValues *mOriginalProperties;
  void *v10;
  id v11;
  $373952EDE9DECE7FE473A72CF4B2C093 *v12;

  v4 = 4 * a3;
  v5 = *((_BYTE *)self + 17);
  if ((v5 & 6) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues tabStopAddedCountOverridden](mTrackedProperties, "tabStopAddedCountOverridden"))
      {
        -[WDParagraphPropertiesValues tabStopAddedTable](self->mTrackedProperties, "tabStopAddedTable");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "subdataWithRange:", v4, 4);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v5 = *((_BYTE *)self + 17);
    }
  }
  if ((v5 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties) == 0
    || !-[WDParagraphPropertiesValues tabStopAddedCountOverridden](mOriginalProperties, "tabStopAddedCountOverridden"))
  {
    v10 = 0;
    goto LABEL_12;
  }
  -[WDParagraphPropertiesValues tabStopAddedTable](self->mOriginalProperties, "tabStopAddedTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subdataWithRange:", v4, 4);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v10 = (void *)v8;

LABEL_12:
  v11 = objc_retainAutorelease(v10);
  v12 = ($373952EDE9DECE7FE473A72CF4B2C093 *)objc_msgSend(v11, "bytes");

  return v12;
}

- (void)removeTabStopAddedWithPosition:(signed __int16)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  unint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  unsigned __int16 *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  uint64_t v12;
  id v13;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
    {
      v13 = 0;
      goto LABEL_19;
    }
    mOriginalProperties = self->mOriginalProperties;
    if (!mOriginalProperties)
      goto LABEL_7;
LABEL_5:
    -[WDParagraphPropertiesValues tabStopAddedTable](mOriginalProperties, "tabStopAddedTable");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (mOriginalProperties)
    goto LABEL_5;
LABEL_7:
  v13 = 0;
LABEL_8:
  v6 = -[WDParagraphProperties tabStopAddedCount](self, "tabStopAddedCount");
  if (v6)
  {
    v7 = 0;
    v8 = (unsigned __int16)a3;
    while (1)
    {
      objc_msgSend(v13, "subdataWithRange:", v7, 4);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (unsigned __int16 *)objc_msgSend(v9, "bytes");

      if (v10)
      {
        if (*v10 == v8)
          break;
      }
      v7 += 4;
      if (!--v6)
        goto LABEL_19;
    }
    objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", v7, 4, 0, 0);
    if ((*((_BYTE *)self + 17) & 2) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      v12 = -[WDParagraphPropertiesValues tabStopAddedCount](mTrackedProperties, "tabStopAddedCount");
    }
    else
    {
      if ((*((_BYTE *)self + 17) & 1) == 0)
        goto LABEL_19;
      mTrackedProperties = self->mOriginalProperties;
      v12 = -[WDParagraphPropertiesValues tabStopAddedCount](mTrackedProperties, "tabStopAddedCount");
    }
    -[WDParagraphPropertiesValues setTabStopAddedCount:](mTrackedProperties, "setTabStopAddedCount:", v12 - 1);
  }
LABEL_19:

}

- (unint64_t)tabStopDeletedPositionCount
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  void *v5;
  unint64_t v6;
  WDParagraphPropertiesValues *mOriginalProperties;
  unint64_t v8;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues tabStopDeletedCountOverridden](mTrackedProperties, "tabStopDeletedCountOverridden"))
      {
        -[WDParagraphPropertiesValues tabStopDeletedTable](self->mTrackedProperties, "tabStopDeletedTable");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "length");
        goto LABEL_10;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
    return 0;
  mOriginalProperties = self->mOriginalProperties;
  if (!mOriginalProperties
    || !-[WDParagraphPropertiesValues tabStopDeletedCountOverridden](mOriginalProperties, "tabStopDeletedCountOverridden"))
  {
    return 0;
  }
  -[WDParagraphPropertiesValues tabStopDeletedTable](self->mOriginalProperties, "tabStopDeletedTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
LABEL_10:
  v8 = v6 >> 1;

  return v8;
}

- (signed)tabStopDeletedPositionAt:(unint64_t)a3
{
  unint64_t v4;
  char v5;
  WDParagraphPropertiesValues *mTrackedProperties;
  void *v7;
  WDParagraphPropertiesValues *mOriginalProperties;
  signed __int16 v10;

  v10 = 0;
  v4 = 2 * a3;
  v5 = *((_BYTE *)self + 17);
  if ((v5 & 6) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues tabStopDeletedCountOverridden](mTrackedProperties, "tabStopDeletedCountOverridden"))
      {
        -[WDParagraphPropertiesValues tabStopDeletedTable](self->mTrackedProperties, "tabStopDeletedTable");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "getBytes:range:", &v10, v4, 2);
LABEL_10:

        return v10;
      }
      v5 = *((_BYTE *)self + 17);
    }
  }
  if ((v5 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      if (-[WDParagraphPropertiesValues tabStopDeletedCountOverridden](mOriginalProperties, "tabStopDeletedCountOverridden"))
      {
        -[WDParagraphPropertiesValues tabStopDeletedTable](self->mOriginalProperties, "tabStopDeletedTable");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "getBytes:range:", &v10, v4, 2);
        goto LABEL_10;
      }
    }
  }
  return v10;
}

- (void)removeTabStopDeletedPosition:(signed __int16)a3
{
  WDParagraphPropertiesValues *mOriginalProperties;
  unint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  unsigned __int16 *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  uint64_t v12;
  id v13;

  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
    {
      v13 = 0;
      goto LABEL_19;
    }
    mOriginalProperties = self->mOriginalProperties;
    if (!mOriginalProperties)
      goto LABEL_7;
LABEL_5:
    -[WDParagraphPropertiesValues tabStopDeletedTable](mOriginalProperties, "tabStopDeletedTable");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  mOriginalProperties = self->mTrackedProperties;
  if (mOriginalProperties)
    goto LABEL_5;
LABEL_7:
  v13 = 0;
LABEL_8:
  v6 = -[WDParagraphProperties tabStopDeletedPositionCount](self, "tabStopDeletedPositionCount");
  if (v6)
  {
    v7 = 0;
    v8 = (unsigned __int16)a3;
    while (1)
    {
      objc_msgSend(v13, "subdataWithRange:", v7, 2);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (unsigned __int16 *)objc_msgSend(v9, "bytes");

      if (v10)
      {
        if (*v10 == v8)
          break;
      }
      v7 += 2;
      if (!--v6)
        goto LABEL_19;
    }
    objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", v7, 2, 0, 0);
    if ((*((_BYTE *)self + 17) & 2) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      v12 = -[WDParagraphPropertiesValues tabStopDeletedCount](mTrackedProperties, "tabStopDeletedCount");
    }
    else
    {
      if ((*((_BYTE *)self + 17) & 1) == 0)
        goto LABEL_19;
      mTrackedProperties = self->mOriginalProperties;
      v12 = -[WDParagraphPropertiesValues tabStopDeletedCount](mTrackedProperties, "tabStopDeletedCount");
    }
    -[WDParagraphPropertiesValues setTabStopDeletedCount:](mTrackedProperties, "setTabStopDeletedCount:", v12 - 1);
  }
LABEL_19:

}

- (int)formattingChanged
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues formattingChangedOverridden](mTrackedProperties, "formattingChangedOverridden"))
      {
LABEL_8:
        LODWORD(v6) = -[WDParagraphPropertiesValues formattingChanged](*p_mTrackedProperties, "formattingChanged");
        return (int)v6;
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) == 0)
  {
    LODWORD(v6) = 0;
    return (int)v6;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v6 = mOriginalProperties;
  if (mOriginalProperties)
  {
    LODWORD(v6) = -[WDParagraphPropertiesValues formattingChangedOverridden](v6, "formattingChangedOverridden");
    p_mTrackedProperties = p_mOriginalProperties;
    if ((_DWORD)v6)
      goto LABEL_8;
  }
  return (int)v6;
}

- (BOOL)isFormattingChangedOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues formattingChangedOverridden](mTrackedProperties, "formattingChangedOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues formattingChangedOverridden](mOriginalProperties, "formattingChangedOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues formattingChangedOverridden](v5, "formattingChangedOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues formattingChangedOverridden](v5, "formattingChangedOverridden");
  return 0;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v6;
  WDParagraphPropertiesValues **p_mOriginalProperties;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](mTrackedProperties, "indexToAuthorIDOfFormattingChangeOverridden"))
      {
        return -[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChange](*p_mTrackedProperties, "indexToAuthorIDOfFormattingChange");
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v6 = mOriginalProperties;
    if (mOriginalProperties)
    {
      p_mTrackedProperties = p_mOriginalProperties;
      if (-[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](v6, "indexToAuthorIDOfFormattingChangeOverridden"))
      {
        return -[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChange](*p_mTrackedProperties, "indexToAuthorIDOfFormattingChange");
      }
    }
  }
  return 0;
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  uint64_t v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setIndexToAuthorIDOfFormattingChange:](mOriginalProperties, "setIndexToAuthorIDOfFormattingChange:", v3);
  objc_msgSend(*p_mOriginalProperties, "setIndexToAuthorIDOfFormattingChangeOverridden:", 1);
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](mTrackedProperties, "indexToAuthorIDOfFormattingChangeOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 1) == 0)
    {
      if ((v3 & 4) == 0)
        return 0;
      mOriginalProperties = self->mOriginalProperties;
      if (!mOriginalProperties
        || !-[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](mOriginalProperties, "indexToAuthorIDOfFormattingChangeOverridden"))
      {
        return 0;
      }
    }
    v5 = self->mOriginalProperties;
    if (!v5)
      return 0;
    return -[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](v5, "indexToAuthorIDOfFormattingChangeOverridden");
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](v5, "indexToAuthorIDOfFormattingChangeOverridden");
  return 0;
}

- (BOOL)contextualSpacing
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues **p_mTrackedProperties;
  WDParagraphPropertiesValues *v7;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) != 0)
    goto LABEL_5;
  if ((*((_BYTE *)self + 17) & 4) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDParagraphPropertiesValues contextualSpacingOverridden](mTrackedProperties, "contextualSpacingOverridden"))
      {
LABEL_5:
        p_mTrackedProperties = &self->mTrackedProperties;
        return -[WDParagraphPropertiesValues contextualSpacing](*p_mTrackedProperties, "contextualSpacing");
      }
      v3 = *((_BYTE *)self + 17);
    }
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    v7 = mOriginalProperties;
    if (mOriginalProperties)
    {
      if (-[WDParagraphPropertiesValues contextualSpacingOverridden](v7, "contextualSpacingOverridden"))
        return -[WDParagraphPropertiesValues contextualSpacing](*p_mTrackedProperties, "contextualSpacing");
    }
  }
  return 0;
}

- (void)setContextualSpacing:(BOOL)a3
{
  _BOOL8 v3;
  WDParagraphPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  WDParagraphPropertiesValues *v6;
  id v7;
  WDParagraphPropertiesValues *v8;
  id v9;
  id v10;
  id v11;

  v3 = a3;
  if ((*((_BYTE *)self + 17) & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 1) == 0)
      return;
    p_mOriginalProperties = (id *)&self->mOriginalProperties;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_9;
    v6 = objc_alloc_init(WDParagraphPropertiesValues);
    v7 = *p_mOriginalProperties;
    *p_mOriginalProperties = v6;

    if (!*p_mOriginalProperties)
      return;
    goto LABEL_8;
  }
  p_mOriginalProperties = (id *)&self->mTrackedProperties;
  mOriginalProperties = self->mTrackedProperties;
  if (!mOriginalProperties)
  {
    v8 = objc_alloc_init(WDParagraphPropertiesValues);
    v9 = *p_mOriginalProperties;
    *p_mOriginalProperties = v8;

    if (!*p_mOriginalProperties)
      return;
LABEL_8:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopAddedTable:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(*p_mOriginalProperties, "setTabStopDeletedTable:", v11);

    mOriginalProperties = (WDParagraphPropertiesValues *)*p_mOriginalProperties;
  }
LABEL_9:
  -[WDParagraphPropertiesValues setContextualSpacing:](mOriginalProperties, "setContextualSpacing:", v3);
  objc_msgSend(*p_mOriginalProperties, "setContextualSpacingOverridden:", 1);
}

- (BOOL)isContextualSpacingOverridden
{
  char v3;
  WDParagraphPropertiesValues *mTrackedProperties;
  WDParagraphPropertiesValues *v5;
  WDParagraphPropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 17);
  if ((v3 & 2) == 0)
  {
    if ((*((_BYTE *)self + 17) & 4) != 0)
    {
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
      {
        if (-[WDParagraphPropertiesValues contextualSpacingOverridden](mTrackedProperties, "contextualSpacingOverridden"))
        {
          goto LABEL_5;
        }
        v3 = *((_BYTE *)self + 17);
      }
    }
    if ((v3 & 5) != 0)
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties)
      {
        if (-[WDParagraphPropertiesValues contextualSpacingOverridden](mOriginalProperties, "contextualSpacingOverridden"))
        {
          v5 = self->mOriginalProperties;
          if (v5)
            return -[WDParagraphPropertiesValues contextualSpacingOverridden](v5, "contextualSpacingOverridden");
        }
      }
    }
    return 0;
  }
LABEL_5:
  v5 = self->mTrackedProperties;
  if (v5)
    return -[WDParagraphPropertiesValues contextualSpacingOverridden](v5, "contextualSpacingOverridden");
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDParagraphProperties *v4;
  id WeakRetained;
  uint64_t v6;
  WDCharacterProperties *mCharacterProperties;
  WDParagraphPropertiesValues *mOriginalProperties;
  uint64_t v9;
  WDParagraphPropertiesValues *v10;
  WDParagraphPropertiesValues *mTrackedProperties;
  uint64_t v12;
  WDParagraphPropertiesValues *v13;
  WDParagraphProperties *v14;

  v4 = -[WDParagraphProperties init](+[WDParagraphProperties allocWithZone:](WDParagraphProperties, "allocWithZone:", a3), "init");
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)&v4->mDocument, WeakRetained);

    v6 = -[WDCharacterProperties copy](self->mCharacterProperties, "copy");
    mCharacterProperties = v4->mCharacterProperties;
    v4->mCharacterProperties = (WDCharacterProperties *)v6;

    v4->mCharacterPropertiesOverridden = self->mCharacterPropertiesOverridden;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      v9 = -[WDParagraphPropertiesValues copy](mOriginalProperties, "copy");
      v10 = v4->mOriginalProperties;
      v4->mOriginalProperties = (WDParagraphPropertiesValues *)v9;

    }
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      v12 = -[WDParagraphPropertiesValues copy](mTrackedProperties, "copy");
      v13 = v4->mTrackedProperties;
      v4->mTrackedProperties = (WDParagraphPropertiesValues *)v12;

    }
    v14 = v4;
  }

  return v4;
}

- (void)copyPropertiesInto:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  WDParagraphPropertiesValues *mOriginalProperties;
  uint64_t v10;
  void *v11;
  WDParagraphPropertiesValues *mTrackedProperties;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  if (v15)
  {
    v4 = (void *)*((_QWORD *)v15 + 3);
    if (v4)
    {
      *((_QWORD *)v15 + 3) = 0;

    }
    v5 = (void *)*((_QWORD *)v15 + 4);
    if (v5)
    {
      *((_QWORD *)v15 + 4) = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)v15 + 5, WeakRetained);

    v7 = -[WDCharacterProperties copy](self->mCharacterProperties, "copy");
    v8 = (void *)*((_QWORD *)v15 + 1);
    *((_QWORD *)v15 + 1) = v7;

    *((_BYTE *)v15 + 16) = self->mCharacterPropertiesOverridden;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      v10 = -[WDParagraphPropertiesValues copy](mOriginalProperties, "copy");
      v11 = (void *)*((_QWORD *)v15 + 3);
      *((_QWORD *)v15 + 3) = v10;

    }
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      v13 = -[WDParagraphPropertiesValues copy](mTrackedProperties, "copy");
      v14 = (void *)*((_QWORD *)v15 + 4);
      *((_QWORD *)v15 + 4) = v13;

    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mTrackedProperties, 0);
  objc_storeStrong((id *)&self->mOriginalProperties, 0);
  objc_storeStrong((id *)&self->mCharacterProperties, 0);
}

- (BOOL)isAnythingOverriddenIn:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "baseStyleOverridden") & 1) != 0
      || (objc_msgSend(v4, "pageBreakBeforeOverridden") & 1) != 0
      || (objc_msgSend(v4, "listLevelOverridden") & 1) != 0
      || (objc_msgSend(v4, "listIndexOverridden") & 1) != 0
      || (objc_msgSend(v4, "topBorderOverridden") & 1) != 0
      || (objc_msgSend(v4, "leftBorderOverridden") & 1) != 0
      || (objc_msgSend(v4, "bottomBorderOverridden") & 1) != 0
      || (objc_msgSend(v4, "rightBorderOverridden") & 1) != 0
      || (objc_msgSend(v4, "betweenBorderOverridden") & 1) != 0
      || (objc_msgSend(v4, "barBorderOverridden") & 1) != 0
      || (objc_msgSend(v4, "shadingOverridden") & 1) != 0
      || (objc_msgSend(v4, "dropCapOverridden") & 1) != 0
      || (objc_msgSend(v4, "widthOverridden") & 1) != 0
      || (objc_msgSend(v4, "heightOverridden") & 1) != 0
      || (objc_msgSend(v4, "heightRuleOverridden") & 1) != 0
      || (objc_msgSend(v4, "verticalSpaceOverridden") & 1) != 0
      || (objc_msgSend(v4, "horizontalSpaceOverridden") & 1) != 0
      || (objc_msgSend(v4, "wrapOverridden") & 1) != 0
      || (objc_msgSend(v4, "horizontalAnchorOverridden") & 1) != 0
      || (objc_msgSend(v4, "verticalAnchorOverridden") & 1) != 0
      || (objc_msgSend(v4, "horizontalPositionOverridden") & 1) != 0
      || (objc_msgSend(v4, "verticalPositionOverridden") & 1) != 0
      || (objc_msgSend(v4, "wrapCodeOverridden") & 1) != 0
      || (objc_msgSend(v4, "anchorLockOverridden") & 1) != 0
      || (objc_msgSend(v4, "spaceBeforeOverridden") & 1) != 0
      || (objc_msgSend(v4, "spaceBeforeAutoOverridden") & 1) != 0
      || (objc_msgSend(v4, "spaceAfterOverridden") & 1) != 0
      || (objc_msgSend(v4, "spaceAfterAutoOverridden") & 1) != 0
      || (objc_msgSend(v4, "lineSpacingOverridden") & 1) != 0
      || (objc_msgSend(v4, "lineSpacingRuleOverridden") & 1) != 0
      || (objc_msgSend(v4, "leftIndentOverridden") & 1) != 0
      || (objc_msgSend(v4, "leadingIndentOverridden") & 1) != 0
      || (objc_msgSend(v4, "followingIndentOverridden") & 1) != 0
      || (objc_msgSend(v4, "rightIndentOverridden") & 1) != 0
      || (objc_msgSend(v4, "firstLineIndentOverridden") & 1) != 0
      || (objc_msgSend(v4, "justificationOverridden") & 1) != 0
      || (objc_msgSend(v4, "physicalJustificationOverridden") & 1) != 0
      || (objc_msgSend(v4, "outlineLevelOverridden") & 1) != 0
      || (objc_msgSend(v4, "keepNextParagraphTogetherOverridden") & 1) != 0
      || (objc_msgSend(v4, "keepLinesTogetherOverridden") & 1) != 0
      || (objc_msgSend(v4, "suppressAutoHyphensOverridden") & 1) != 0
      || (objc_msgSend(v4, "suppressLineNumbersOverridden") & 1) != 0
      || (objc_msgSend(v4, "widowControlOverridden") & 1) != 0
      || (objc_msgSend(v4, "biDiOverridden") & 1) != 0
      || (objc_msgSend(v4, "kinsokuOffOverridden") & 1) != 0
      || (objc_msgSend(v4, "tabStopAddedCountOverridden") & 1) != 0
      || (objc_msgSend(v4, "tabStopDeletedCountOverridden") & 1) != 0
      || (objc_msgSend(v4, "formattingChangedOverridden") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = objc_msgSend(v4, "indexToAuthorIDOfFormattingChangeOverridden");
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDParagraphProperties;
  -[WDParagraphProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
