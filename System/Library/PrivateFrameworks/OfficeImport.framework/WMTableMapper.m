@implementation WMTableMapper

- (WMTableMapper)initWithWDTable:(id)a3 parent:(id)a4
{
  id v7;
  id v8;
  WMTableMapper *v9;
  WMTableMapper *v10;
  WMTableStyle *v11;
  void *v12;
  uint64_t v13;
  WMTableStyle *mStyle;
  uint64_t v15;
  WMBordersProperty *mInsideBorders;
  void *v17;
  uint64_t v18;
  WMTableColumnInfo *mColumnInfo;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WMTableMapper;
  v9 = -[CMMapper initWithParent:](&v21, sel_initWithParent_, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mWdTable, a3);
    v11 = [WMTableStyle alloc];
    objc_msgSend(v7, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WMTableStyle initWithWDTableProperties:](v11, "initWithWDTableProperties:", v12);
    mStyle = v10->mStyle;
    v10->mStyle = (WMTableStyle *)v13;

    -[CMStyle propertyForName:](v10->mStyle, "propertyForName:", 0x24F3E71B8);
    v15 = objc_claimAutoreleasedReturnValue();
    mInsideBorders = v10->mInsideBorders;
    v10->mInsideBorders = (WMBordersProperty *)v15;

    -[CMStyle properties](v10->mStyle, "properties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", 0x24F3E71B8);

    v18 = -[WMTableMapper copyColumnInfo](v10, "copyColumnInfo");
    mColumnInfo = v10->mColumnInfo;
    v10->mColumnInfo = (WMTableColumnInfo *)v18;

  }
  return v10;
}

- (id)copyColumnInfo
{
  unint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  WMTableColumnInfo *v7;
  uint64_t i;
  id v9;

  v3 = -[WDTable rowCount](self->mWdTable, "rowCount");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = -[WMTableMapper copyStopArrayForRow:](self, "copyStopArrayForRow:", 0);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = -[WMTableColumnInfo initWithStopArray:]([WMTableColumnInfo alloc], "initWithStopArray:", v5);
  if (v4 < 2)
  {
    v9 = v6;
  }
  else
  {
    for (i = 1; i != v4; ++i)
    {
      v9 = -[WMTableMapper copyStopArrayForRow:](self, "copyStopArrayForRow:", i);

      -[WMTableColumnInfo mergeStopArray:](v7, "mergeStopArray:", v9);
      v6 = v9;
    }
  }

  return v7;
}

- (id)copyStopArrayForRow:(unint64_t)a3
{
  void *v3;
  id v4;
  unint64_t v5;
  float v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  -[WDTable rowAt:](self->mWdTable, "rowAt:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = 0;
    v6 = 0.0;
    while (objc_msgSend(v3, "cellCount") > v5)
    {
      objc_msgSend(v3, "cellAt:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "properties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v6 + (float)(int)objc_msgSend(v8, "width");

      *(float *)&v9 = v6;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

      ++v5;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  WMTableRowMapper *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v6 = a4;
  if (!+[WMTableMapper isTableDeleted:](WMTableMapper, "isTableDeleted:", self->mWdTable))
  {
    v7 = MEMORY[0x22E2DDB58]();
    -[WDTable properties](self->mWdTable, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    if (objc_msgSend(v8, "isHorizontalPositionOverridden"))
      v9 = objc_msgSend(v8, "horizontalPosition");
    else
      v9 = 0;
    v10 = (float)v9;
    if (objc_msgSend(v8, "isLeftDistanceFromTextOverridden"))
      v10 = v10 - (float)objc_msgSend(v8, "leftDistanceFromText");
    if (objc_msgSend(v8, "isHorizontalAnchorOverridden")
      && objc_msgSend(v8, "horizontalAnchor") == 2)
    {
      objc_msgSend(v6, "leftMargin");
      v10 = v10 - v11;
    }
    -[CMStyle appendPropertyForName:length:unit:](self->mStyle, "appendPropertyForName:length:unit:", 0x24F3D5678, 2, v10);
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper archiver](self, "archiver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "progressiveMappingIsPausedOnPath:", 0);

    if (v14)
      objc_msgSend(v30, "addChild:", v12);
    -[WMStyle cssStyleString](self->mStyle, "cssStyleString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, v12, v28);
    -[CMMapper archiver](self, "archiver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pauseProgressiveMappingOnPath:", 0);
    v27 = v14;

    v16 = -[WDTable rowCount](self->mWdTable, "rowCount");
    v17 = (void *)v7;
    if (v16)
    {
      v18 = 0;
      for (i = 0; i != v16; ++i)
      {
        -[WDTable rowAt:](self->mWdTable, "rowAt:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = -[WMTableRowMapper initWithWDTableRow:parent:]([WMTableRowMapper alloc], "initWithWDTableRow:parent:", v20, self);
        -[WMTableRowMapper mapAt:withState:](v21, "mapAt:withState:", v12, v6);

        v18 = v20;
      }
    }
    else
    {
      v20 = 0;
    }
    v22 = v17;
    if ((v27 & 1) == 0)
    {
      -[CMMapper archiver](self, "archiver");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "restartProgressiveMappingOnPath:", 0);

      -[CMMapper archiver](self, "archiver");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pushCssToPath:", 0);

      -[CMMapper archiver](self, "archiver");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "XMLString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pushText:toPath:", v26, 0);

    }
    objc_autoreleasePoolPop(v22);
  }

}

+ (BOOL)isTableDeleted:(id)a3
{
  id v3;
  unint64_t v4;
  BOOL v5;
  unint64_t i;
  void *v7;
  BOOL v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "rowCount");
  if (v4)
  {
    v5 = 0;
    for (i = 0; i != v4; v5 = i >= v4)
    {
      objc_msgSend(v3, "rowAt:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[WMTableRowMapper isTableRowDeleted:](WMTableRowMapper, "isTableRowDeleted:", v7);

      if (!v8)
        break;
      ++i;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)columnInfo
{
  return self->mColumnInfo;
}

- (id)insideBorders
{
  return self->mInsideBorders;
}

- (void)setInsideBorders:(id)a3
{
  objc_storeStrong((id *)&self->mInsideBorders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColumnInfo, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mInsideBorders, 0);
  objc_storeStrong((id *)&self->mWdTable, 0);
}

@end
