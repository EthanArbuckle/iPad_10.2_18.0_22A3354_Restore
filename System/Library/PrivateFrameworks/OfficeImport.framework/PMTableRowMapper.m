@implementation PMTableRowMapper

- (PMTableRowMapper)initWithOadTable:(id)a3 rowIndex:(unint64_t)a4 parent:(id)a5
{
  id v9;
  id v10;
  PMTableRowMapper *v11;
  PMTableRowMapper *v12;
  uint64_t v13;
  OADTableRow *mRow;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PMTableRowMapper;
  v11 = -[CMMapper initWithParent:](&v16, sel_initWithParent_, v10);
  v12 = v11;
  if (v11)
  {
    v11->mRowIndex = a4;
    objc_storeStrong((id *)&v11->mTable, a3);
    -[OADTable rowAtIndex:](v12->mTable, "rowAtIndex:", a4);
    v13 = objc_claimAutoreleasedReturnValue();
    mRow = v12->mRow;
    v12->mRow = (OADTableRow *)v13;

  }
  return v12;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  unint64_t mRowIndex;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PMTableCellMapper *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addChild:", v7);
  mRowIndex = self->mRowIndex;
  if (!mRowIndex)
  {
    -[OADTable tableProperties](self->mTable, "tableProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "firstRow");

    if ((v10 & 1) != 0)
    {
      -[OADTable tableProperties](self->mTable, "tableProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "style");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstRowStyle");
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v16 = (void *)v13;

      goto LABEL_10;
    }
    mRowIndex = self->mRowIndex;
  }
  if (mRowIndex == -[OADTable rowCount](self->mTable, "rowCount"))
  {
    -[OADTable tableProperties](self->mTable, "tableProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "lastRow");

    if (v15)
    {
      -[OADTable tableProperties](self->mTable, "tableProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "style");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastRowStyle");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v16 = 0;
LABEL_10:
  objc_msgSend(v6, "setCurrentRowStyle:", v16);
  v22 = v16;
  v17 = -[OADTableRow cellCount](self->mRow, "cellCount");
  if (v17)
  {
    v18 = 0;
    v19 = 0;
    do
    {
      -[OADTableRow cellAtIndex:](self->mRow, "cellAtIndex:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = -[PMTableCellMapper initWithOadTableCell:rowIndex:columnIndex:parent:]([PMTableCellMapper alloc], "initWithOadTableCell:rowIndex:columnIndex:parent:", v20, self->mRowIndex, v18, self);
      -[PMTableCellMapper mapAt:withState:](v21, "mapAt:withState:", v7, v6);

      ++v18;
      v19 = v20;
    }
    while (v17 != v18);
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v6, "setCurrentRowStyle:", 0);

}

- (float)height
{
  float result;

  -[OADTableRow height](self->mRow, "height");
  return result;
}

- (unint64_t)cellCount
{
  return -[OADTableRow cellCount](self->mRow, "cellCount");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRow, 0);
  objc_storeStrong((id *)&self->mTable, 0);
}

@end
