@implementation WMTableRowMapper

+ (BOOL)isTableRowDeleted:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characterProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeletedOverridden") && (objc_msgSend(v4, "deleted") & 0xFFFFFF7F) == 1;

  return v5;
}

- (WMTableRowMapper)initWithWDTableRow:(id)a3 parent:(id)a4
{
  id v7;
  id v8;
  WMTableRowMapper *v9;
  WMTableRowMapper *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WMTableRowMapper;
  v9 = -[CMMapper initWithParent:](&v13, sel_initWithParent_, v8);
  v10 = v9;
  if (v9)
  {
    v9->mHeight = 0.0;
    objc_storeStrong((id *)&v9->mWdTableRow, a3);
    objc_msgSend(v7, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMTableRowMapper setRowProperties:](v10, "setRowProperties:", v11);

  }
  return v10;
}

- (void)setRowProperties:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isHeightOverridden"))
    self->mHeight = (double)objc_msgSend(v4, "height");

}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  WMStyle *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  WMTableCellMapper *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (!+[WMTableRowMapper isTableRowDeleted:](WMTableRowMapper, "isTableRowDeleted:", self->mWdTableRow))
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addChild:", v7);
    v8 = objc_alloc_init(WMStyle);
    -[CMStyle appendPropertyForName:stringValue:](v8, "appendPropertyForName:stringValue:", 0x24F3E6698, CFSTR("top"));
    -[WMStyle cssStyleString](v8, "cssStyleString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, v7, v9);
    v10 = -[WDTableRow cellCount](self->mWdTableRow, "cellCount");
    if (v10)
    {
      v16 = v9;
      v11 = 0;
      v12 = 0;
      for (i = 0; i != v10; ++i)
      {
        -[WDTableRow cellAt:](self->mWdTableRow, "cellAt:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = -[WMTableCellMapper initWithWDTableCell:atIndex:parent:]([WMTableCellMapper alloc], "initWithWDTableCell:atIndex:parent:", v14, v12, self);
        -[WMTableCellMapper mapAt:withState:](v15, "mapAt:withState:", v7, v6);
        v12 = -[WMTableCellMapper colSpan](v15, "colSpan") + v12;

        v11 = v14;
      }

      v9 = v16;
    }

  }
}

- (double)height
{
  return self->mHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mWdTableRow, 0);
}

@end
