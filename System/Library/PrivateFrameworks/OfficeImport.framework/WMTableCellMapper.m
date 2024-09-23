@implementation WMTableCellMapper

- (WMTableCellMapper)initWithWDTableCell:(id)a3 atIndex:(unsigned int)a4 parent:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  WMTableCellMapper *v11;
  WMTableCellMapper *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double mWidth;
  objc_super v19;

  v6 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WMTableCellMapper;
  v11 = -[CMMapper initWithParent:](&v19, sel_initWithParent_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mWdTableCell, a3);
    objc_msgSend(v9, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12->mWidth = (double)(int)objc_msgSend(v13, "width");

    v12->mHeight = 0.0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "height");
      v12->mHeight = v14;
    }
    -[WMTableCellMapper tableMapper](v12, "tableMapper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "columnInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    mWidth = v12->mWidth;
    *(float *)&mWidth = mWidth;
    v12->mColSpan = objc_msgSend(v16, "columnSpan:at:", v6, mWidth);

  }
  return v12;
}

- (id)tableMapper
{
  void *v2;
  uint64_t v3;

  -[CMMapper parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "parent");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  WMStyle *v12;
  WMStyle *v13;
  double mWidth;
  double v15;
  void *v16;
  void *v17;
  WMSectionContentMapper *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addChild:", v8);
  v9 = v8;

  if (self->mColSpan >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), self->mColSpan);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("colspan"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttribute:", v11);

  }
  -[WMTableCellMapper mapCellStyleAt:](self, "mapCellStyleAt:", v9);
  v19 = v9;
  if (self->mWidth > 0.0)
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addChild:");
    v12 = objc_alloc_init(WMStyle);
    v13 = v12;
    mWidth = self->mWidth;
    v15 = self->mLeftPadding + self->mRightPadding;
    if (mWidth <= v15)
      v15 = 0.0;
    -[CMStyle appendPropertyForName:length:unit:](v12, "appendPropertyForName:length:unit:", 0x24F3E6FB8, 2, mWidth - v15);
    -[WMStyle cssStyleString](v13, "cssStyleString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, v19, v16);

  }
  -[WDTableCell text](self->mWdTableCell, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WMSectionContentMapper initWithWDText:parent:]([WMSectionContentMapper alloc], "initWithWDText:parent:", v17, self);
  -[WMSectionContentMapper mapAt:withState:](v18, "mapAt:withState:", v19, v7);

}

- (void)mapCellStyleAt:(id)a3
{
  WMTableCellStyle *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_alloc_init(WMTableCellStyle);
  -[WDTableCell row](self->mWdTableCell, "row");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isBaseStyleOverridden"))
  {
    objc_msgSend(v7, "baseStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMTableCellStyle addTableCellStyleProperties:](v4, "addTableCellStyleProperties:", v8);

  }
  -[WDTableCell properties](self->mWdTableCell, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WMTableCellStyle addTableCellProperties:](v4, "addTableCellProperties:", v9);

  -[WMTableCellStyle leftPadding](v4, "leftPadding");
  self->mLeftPadding = v10;
  -[WMTableCellStyle rightPadding](v4, "rightPadding");
  self->mRightPadding = v11;
  -[WMTableCellMapper tableMapper](self, "tableMapper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insideBorders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[CMStyle addProperty:forKey:](v4, "addProperty:forKey:", v13, 0x24F3E71D8);
  if (self->mHeight > 0.0)
    -[CMStyle appendPropertyForName:length:unit:](v4, "appendPropertyForName:length:unit:", 0x24F3D5658, 2);
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v14, v4);

}

- (unsigned)colSpan
{
  return self->mColSpan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mWdTableCell, 0);
}

@end
