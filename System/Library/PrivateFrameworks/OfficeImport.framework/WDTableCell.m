@implementation WDTableCell

- (WDTableCell)initWithRow:(id)a3 at:(unint64_t)a4
{
  id v6;
  WDTableCell *v7;
  WDTableCell *v8;
  id v9;
  id v10;
  void *v11;
  WDText *v12;
  void *v13;
  uint64_t v14;
  WDText *mText;
  WDTableCellProperties *v16;
  void *v17;
  uint64_t v18;
  WDTableCellProperties *mProperties;
  NSString *mIdentifier;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WDTableCell;
  v7 = -[WDTableCell init](&v22, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = objc_storeWeak((id *)&v7->mRow, v6);
    v8->mIndex = a4;
    v10 = v9;
    objc_msgSend(v6, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [WDText alloc];
    objc_msgSend(v11, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WDText initWithDocument:textType:tableCell:](v12, "initWithDocument:textType:tableCell:", v13, objc_msgSend(v11, "textType"), v8);
    mText = v8->mText;
    v8->mText = (WDText *)v14;

    v16 = [WDTableCellProperties alloc];
    objc_msgSend(v11, "document");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WDTableCellProperties initWithDocument:](v16, "initWithDocument:", v17);
    mProperties = v8->mProperties;
    v8->mProperties = (WDTableCellProperties *)v18;

    mIdentifier = v8->mIdentifier;
    v8->mIdentifier = 0;

  }
  return v8;
}

- (id)properties
{
  return self->mProperties;
}

- (id)text
{
  return self->mText;
}

- (WDTableRow)row
{
  return (WDTableRow *)objc_loadWeakRetained((id *)&self->mRow);
}

- (BOOL)useTrackedProperties
{
  return self->mUseTrackedProperties;
}

- (void)setUseTrackedProperties:(BOOL)a3
{
  self->mUseTrackedProperties = a3;
}

- (unint64_t)index
{
  return self->mIndex;
}

- (int64_t)compareIndex:(id)a3
{
  unint64_t mIndex;
  unint64_t v4;
  BOOL v5;
  int64_t v6;

  mIndex = self->mIndex;
  v4 = *((_QWORD *)a3 + 1);
  v5 = mIndex >= v4;
  v6 = mIndex > v4;
  if (v5)
    return v6;
  else
    return -1;
}

- (void)clearProperties
{
  WDTableCellProperties *mProperties;

  mProperties = self->mProperties;
  self->mProperties = 0;

}

- (id)identifier
{
  return self->mIdentifier;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *mIdentifier;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  mIdentifier = self->mIdentifier;
  self->mIdentifier = v4;

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDTableCell;
  -[WDTableCell description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mRow);
  objc_storeStrong((id *)&self->mIdentifier, 0);
  objc_storeStrong((id *)&self->mText, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end
