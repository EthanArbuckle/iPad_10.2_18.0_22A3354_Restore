@implementation TSTTableStyleNetwork

- (TSTTableStyle)tableStyle
{
  return self->mTableStyle;
}

- (void)setTableStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mTableStyle = (TSTTableStyle *)a3;
}

- (TSTCellStyle)bodyCellStyle
{
  return self->mBodyCellStyle;
}

- (void)setBodyCellStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mBodyCellStyle = (TSTCellStyle *)a3;
}

- (TSTCellStyle)headerColumnCellStyle
{
  return self->mHeaderColumnCellStyle;
}

- (void)setHeaderColumnCellStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mHeaderColumnCellStyle = (TSTCellStyle *)a3;
}

- (TSTCellStyle)footerRowCellStyle
{
  return self->mFooterRowCellStyle;
}

- (void)setFooterRowCellStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mFooterRowCellStyle = (TSTCellStyle *)a3;
}

- (TSTCellStyle)headerRowCellStyle
{
  return self->mHeaderRowCellStyle;
}

- (void)setHeaderRowCellStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mHeaderRowCellStyle = (TSTCellStyle *)a3;
}

- (TSWPParagraphStyle)bodyTextStyle
{
  return self->mBodyTextStyle;
}

- (void)setBodyTextStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mBodyTextStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPParagraphStyle)headerColumnTextStyle
{
  return self->mHeaderColumnTextStyle;
}

- (void)setHeaderColumnTextStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mHeaderColumnTextStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPParagraphStyle)footerRowTextStyle
{
  return self->mFooterRowTextStyle;
}

- (void)setFooterRowTextStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mFooterRowTextStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPParagraphStyle)headerRowTextStyle
{
  return self->mHeaderRowTextStyle;
}

- (void)setHeaderRowTextStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mHeaderRowTextStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPParagraphStyle)tableNameStyle
{
  return self->mTableNameStyle;
}

- (void)setTableNameStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mTableNameStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPShapeStyle)tableNameShapeStyle
{
  return self->mTableNameShapeStyle;
}

- (void)setTableNameShapeStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mTableNameShapeStyle = (TSWPShapeStyle *)a3;
}

- (unint64_t)presetIndex
{
  return self->mPresetIndex;
}

- (void)setPresetIndex:(unint64_t)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mPresetIndex = a3;
}

+ (id)networkFromTableModel:(id)a3
{
  TSTTableStyleNetwork *v4;

  v4 = -[TSTTableStyleNetwork initWithContext:]([TSTTableStyleNetwork alloc], "initWithContext:", objc_msgSend(a3, "context"));
  -[TSTTableStyleNetwork setStylesFromTableModel:](v4, "setStylesFromTableModel:", a3);
  -[TSTTableStyleNetwork setPresetIndex:](v4, "setPresetIndex:", objc_msgSend(a3, "presetIndex"));
  return v4;
}

+ (id)networkWithContext:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  uint64_t v6;
  TSTTableStyleNetwork *v10;
  TSSPropertyMap *v11;
  TSTTableStyle *v12;
  uint64_t v13;
  TSSPropertyMap *v14;
  TSTCellStyle *v15;
  id v16;
  id v17;

  v6 = *(_QWORD *)&a6;
  v10 = -[TSTTableStyleNetwork initWithContext:]([TSTTableStyleNetwork alloc], "initWithContext:", a3);
  v11 = objc_alloc_init(TSSPropertyMap);
  +[TSTTableStyle initDefaultPropertyMap:presetIndex:colors:alternate:](TSTTableStyle, "initDefaultPropertyMap:presetIndex:colors:alternate:", v11, a4, a5, v6);
  v12 = -[TSTTableStyle initWithContext:name:overridePropertyMap:isVariation:]([TSTTableStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, v11, 0);

  -[TSTTableStyleNetwork setTableStyle:](v10, "setTableStyle:", v12);
  v13 = 0;
  do
  {
    v14 = objc_alloc_init(TSSPropertyMap);
    +[TSTCellStyle initDefaultPropertyMap:forTableArea:presetIndex:colors:alternate:](TSTCellStyle, "initDefaultPropertyMap:forTableArea:presetIndex:colors:alternate:", v14, v13, a4, a5, v6);
    v15 = -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSTCellStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, v14, 0);
    -[TSTTableStyleNetwork setCellStyle:forTableArea:](v10, "setCellStyle:forTableArea:", v15, v13);

    v16 = +[TSWPParagraphStyle defaultStyleWithContext:](TSWPParagraphStyle, "defaultStyleWithContext:", a3);
    objc_msgSend(v16, "setValue:forProperty:", +[TSWPParagraphStyle defaultValueForProperty:](TSWPParagraphStyle, "defaultValueForProperty:", 16), 16);
    objc_msgSend(v16, "setCGFloatValue:forProperty:", 17, 15.0);
    -[TSTTableStyleNetwork setTextStyle:forTableArea:](v10, "setTextStyle:forTableArea:", v16, v13);
    v13 = (v13 + 1);
  }
  while ((_DWORD)v13 != 4);
  v17 = +[TSWPParagraphStyle defaultStyleWithContext:](TSWPParagraphStyle, "defaultStyleWithContext:", a3);
  objc_msgSend(v17, "setValue:forProperty:", +[TSWPParagraphStyle defaultValueForProperty:](TSWPParagraphStyle, "defaultValueForProperty:", 16), 16);
  objc_msgSend(v17, "setCGFloatValue:forProperty:", 17, 15.0);
  -[TSTTableStyleNetwork setTableNameStyle:](v10, "setTableNameStyle:", v17);
  -[TSTTableStyleNetwork setPresetIndex:](v10, "setPresetIndex:", a4);
  return v10;
}

+ (id)createStylesInStylesheet:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  uint64_t v6;
  uint64_t v10;
  TSSPropertyMap *v11;
  uint64_t v12;
  BOOL v14;
  id v15;
  id v16;
  TSSPropertyMap *v17;
  TSTCellStyle *v18;
  id v19;
  char v20;
  id v21;
  char v24;
  id v25;
  unsigned int v26;

  v6 = *(_QWORD *)&a6;
  v10 = objc_msgSend(a3, "context");
  v11 = objc_alloc_init(TSSPropertyMap);
  v25 = a5;
  +[TSTTableStyle initDefaultPropertyMap:presetIndex:colors:alternate:](TSTTableStyle, "initDefaultPropertyMap:presetIndex:colors:alternate:", v11, a4, a5, v6);
  objc_msgSend(a3, "addStyle:withIdentifier:", -[TSTTableStyle initWithContext:name:overridePropertyMap:isVariation:]([TSTTableStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", v10, 0, v11, 0), +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a4));

  v12 = 0;
  v26 = v6;
  v14 = (_DWORD)v6 == 2 || (v6 & 0xFFFFFFFD) == 4;
  v24 = !v14;
  do
  {
    v15 = +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a4, v12);
    v16 = +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a4, v12);
    v17 = objc_alloc_init(TSSPropertyMap);
    +[TSTCellStyle initDefaultPropertyMap:forTableArea:presetIndex:colors:alternate:](TSTCellStyle, "initDefaultPropertyMap:forTableArea:presetIndex:colors:alternate:", v17, v12, a4, v25, v26);
    v18 = -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSTCellStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", v10, 0, v17, 0);
    v19 = +[TSWPParagraphStyle defaultStyleWithContext:](TSWPParagraphStyle, "defaultStyleWithContext:", v10);
    objc_msgSend(v19, "setValue:forProperty:", +[TSWPParagraphStyle defaultValueForProperty:](TSWPParagraphStyle, "defaultValueForProperty:", 16), 16);
    objc_msgSend(v19, "setCGFloatValue:forProperty:", 17, 15.0);
    objc_msgSend(v19, "setCGFloatValue:forProperty:", 81, 0.0);
    if ((_DWORD)v12)
      v20 = 1;
    else
      v20 = v24;
    if ((v20 & 1) == 0)
      objc_msgSend(v19, "setValue:forProperty:", objc_msgSend(MEMORY[0x24BEB3C40], "whiteColor"), 18);
    objc_msgSend(a3, "addStyle:withIdentifier:", v18, v15);
    objc_msgSend(a3, "addStyle:withIdentifier:", v19, v16);

    v12 = (v12 + 1);
  }
  while ((_DWORD)v12 != 4);
  v21 = +[TSWPParagraphStyle defaultStyleWithContext:](TSWPParagraphStyle, "defaultStyleWithContext:", v10);
  objc_msgSend(v21, "setValue:forProperty:", +[TSWPParagraphStyle defaultValueForProperty:](TSWPParagraphStyle, "defaultValueForProperty:", 16), 16);
  objc_msgSend(v21, "setCGFloatValue:forProperty:", 17, 15.0);
  objc_msgSend(a3, "addStyle:withIdentifier:", v21, +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a4));
  objc_msgSend(a3, "addStyle:withIdentifier:", +[TSTTableStyleNetwork defaultTableNameShapeStyleWithContext:](TSTTableStyleNetwork, "defaultTableNameShapeStyleWithContext:", v10), +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:](TSTTableStyleNetwork, "tableNameShapeStyleIDForPreset:", a4));
  return (id)objc_msgSend(a1, "networkFromStylesheet:presetIndex:", a3, a4);
}

+ (id)networkFromStylesheet:(id)a3 presetIndex:(unint64_t)a4
{
  TSTTableStyleNetwork *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = -[TSTTableStyleNetwork initWithContext:]([TSTTableStyleNetwork alloc], "initWithContext:", objc_msgSend(a3, "context"));
  v7 = objc_msgSend(a3, "cascadedStyleWithIdentifier:", +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a4));
  if (v7)
  {
    -[TSTTableStyleNetwork setTableStyle:](v6, "setTableStyle:", v7);
    objc_opt_class();
    objc_msgSend(a3, "cascadedStyleWithIdentifier:", +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a4));
    v8 = TSUDynamicCast();
    if (!v8)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 244, CFSTR("invalid nil value for '%s'"), "nameStyle");
    }
    -[TSTTableStyleNetwork setTableNameStyle:](v6, "setTableNameStyle:", v8);
    objc_opt_class();
    objc_msgSend(a3, "cascadedStyleWithIdentifier:", +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:](TSTTableStyleNetwork, "tableNameShapeStyleIDForPreset:", a4));
    v11 = TSUDynamicCast();
    if (!v11)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 251, CFSTR("invalid nil value for '%s'"), "tableNameShapeStyle");
    }
    -[TSTTableStyleNetwork setTableNameShapeStyle:](v6, "setTableNameShapeStyle:", v11);
    v14 = 0;
    while (1)
    {
      v15 = +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a4, v14);
      v16 = objc_msgSend(a3, "cascadedStyleWithIdentifier:", v15);
      if (!v16)
      {
        v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]");
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 261, CFSTR("no default cell style for id %@ in stylesheet %p"), v15, a3);
        return 0;
      }
      -[TSTTableStyleNetwork setCellStyle:forTableArea:](v6, "setCellStyle:forTableArea:", v16, v14);
      v17 = objc_msgSend(a3, "cascadedStyleWithIdentifier:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a4, v14));
      if (!v17)
        break;
      -[TSTTableStyleNetwork setTextStyle:forTableArea:](v6, "setTextStyle:forTableArea:", v17, v14);
      v14 = (v14 + 1);
      if ((_DWORD)v14 == 4)
      {
        -[TSTTableStyleNetwork setPresetIndex:](v6, "setPresetIndex:", a4);
        return v6;
      }
    }
    v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]");
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 271, CFSTR("no default cell style for id %@ in stylesheet %p"), v15, a3);
  }
  else
  {
    v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 232, CFSTR("no default table style in stylesheet %p"), a3, v25);
  }
  return 0;
}

+ (id)networkFromTheme:(id)a3 presetIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;

  if (!a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTTableStyleNetwork networkFromTheme:presetIndex:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 285, CFSTR("invalid nil value for '%s'"), "theme");
  }
  objc_opt_class();
  objc_msgSend(a3, "presetOfKind:index:", String, a4);
  return (id)objc_msgSend((id)TSUDynamicCast(), "styleNetwork");
}

+ (id)tableNameStyleIDForPreset:(unint64_t)a3
{
  return (id)String((uint64_t)TSTTableNameStylePrefix[0], a3, (uint64_t)CFSTR("textStyle"));
}

+ (id)tableNameShapeStyleIDForPreset:(unint64_t)a3
{
  return (id)String((uint64_t)CFSTR("tableName"), a3, (uint64_t)CFSTR("shapeStyle"));
}

+ (id)defaultTableNameShapeStyleWithContext:(id)a3
{
  id v3;

  v3 = +[TSSStyle defaultStyleWithContext:](TSWPShapeStyle, "defaultStyleWithContext:", a3);
  objc_msgSend(v3, "setIntValue:forProperty:", 1, 149);
  objc_msgSend(v3, "setValue:forProperty:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"), 517);
  objc_msgSend(v3, "setValue:forProperty:", +[TSWPPadding padding](TSWPPadding, "padding"), 146);
  return v3;
}

- (TSTTableStyleNetwork)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTTableStyleNetwork;
  return -[TSPObject initWithContext:](&v4, sel_initWithContext_, a3);
}

- (TSTTableStyleNetwork)initWithContext:(id)a3 fromArray:(id)a4 presetIndex:(unint64_t)a5
{
  TSTTableStyleNetwork *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[12];

  v21[11] = *MEMORY[0x24BDAC8D0];
  v7 = -[TSTTableStyleNetwork initWithContext:](self, "initWithContext:", a3);
  if (objc_msgSend(a4, "count") != 11)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyleNetwork initWithContext:fromArray:presetIndex:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 330, CFSTR("expected equality between %s and %s"), "[array count]", "11");
  }
  if (v7)
  {
    v21[0] = &v7->mTableStyle;
    v21[1] = &v7->mHeaderRowCellStyle;
    v21[2] = &v7->mHeaderColumnCellStyle;
    v21[3] = &v7->mFooterRowCellStyle;
    v21[4] = &v7->mBodyCellStyle;
    v21[5] = &v7->mHeaderRowTextStyle;
    v21[6] = &v7->mHeaderColumnTextStyle;
    v21[7] = &v7->mFooterRowTextStyle;
    v21[8] = &v7->mBodyTextStyle;
    v21[9] = &v7->mTableNameStyle;
    v21[10] = &v7->mTableNameShapeStyle;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(a4);
          *(_QWORD *)v21[v12 + v14] = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v14);
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v12 += v14;
      }
      while (v11);
    }
    v7->mPresetIndex = a5;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3 context:(id)a4
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithContext:", a4);
  if (v5)
  {
    v5[7] = self->mTableStyle;
    v5[8] = self->mHeaderRowCellStyle;
    v5[9] = self->mHeaderColumnCellStyle;
    v5[10] = self->mFooterRowCellStyle;
    v5[11] = self->mBodyCellStyle;
    v5[12] = self->mHeaderRowTextStyle;
    v5[13] = self->mHeaderColumnTextStyle;
    v5[14] = self->mFooterRowTextStyle;
    v5[15] = self->mBodyTextStyle;
    v5[16] = self->mTableNameStyle;
    v5[17] = self->mTableNameShapeStyle;
    v5[6] = self->mPresetIndex;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSTTableStyleNetwork copyWithZone:context:](self, "copyWithZone:context:", a3, -[TSPObject context](self, "context"));
}

- (id)copyWithContext:(id)a3
{
  return -[TSTTableStyleNetwork copyWithZone:context:](self, "copyWithZone:context:", 0, a3);
}

- (id)copy
{
  return -[TSTTableStyleNetwork copyWithZone:context:](self, "copyWithZone:context:", 0, -[TSPObject context](self, "context"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableStyleNetwork;
  -[TSTTableStyleNetwork dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  TSTTableStyle *v7;
  TSTCellStyle *v8;
  TSTCellStyle *v9;
  TSTCellStyle *v10;
  TSTCellStyle *v11;
  TSWPParagraphStyle *v12;
  TSWPParagraphStyle *v13;
  TSWPParagraphStyle *v14;
  TSWPParagraphStyle *v15;
  TSWPParagraphStyle *v16;
  TSWPShapeStyle *v17;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[TSTTableStyleNetwork presetIndex](self, "presetIndex");
    if (v6 != objc_msgSend(v5, "presetIndex"))
      goto LABEL_14;
    v7 = -[TSTTableStyleNetwork tableStyle](self, "tableStyle");
    if (v7 != (TSTTableStyle *)objc_msgSend(v5, "tableStyle"))
      goto LABEL_14;
    v8 = -[TSTTableStyleNetwork bodyCellStyle](self, "bodyCellStyle");
    if (v8 != (TSTCellStyle *)objc_msgSend(v5, "bodyCellStyle"))
      goto LABEL_14;
    v9 = -[TSTTableStyleNetwork headerColumnCellStyle](self, "headerColumnCellStyle");
    if (v9 != (TSTCellStyle *)objc_msgSend(v5, "headerColumnCellStyle"))
      goto LABEL_14;
    v10 = -[TSTTableStyleNetwork footerRowCellStyle](self, "footerRowCellStyle");
    if (v10 != (TSTCellStyle *)objc_msgSend(v5, "footerRowCellStyle"))
      goto LABEL_14;
    v11 = -[TSTTableStyleNetwork headerRowCellStyle](self, "headerRowCellStyle");
    if (v11 == (TSTCellStyle *)objc_msgSend(v5, "headerRowCellStyle")
      && (v12 = -[TSTTableStyleNetwork bodyTextStyle](self, "bodyTextStyle"),
          v12 == (TSWPParagraphStyle *)objc_msgSend(v5, "bodyTextStyle"))
      && (v13 = -[TSTTableStyleNetwork headerColumnTextStyle](self, "headerColumnTextStyle"),
          v13 == (TSWPParagraphStyle *)objc_msgSend(v5, "headerColumnTextStyle"))
      && (v14 = -[TSTTableStyleNetwork footerRowTextStyle](self, "footerRowTextStyle"),
          v14 == (TSWPParagraphStyle *)objc_msgSend(v5, "footerRowTextStyle"))
      && (v15 = -[TSTTableStyleNetwork headerRowTextStyle](self, "headerRowTextStyle"),
          v15 == (TSWPParagraphStyle *)objc_msgSend(v5, "headerRowTextStyle"))
      && (v16 = -[TSTTableStyleNetwork tableNameStyle](self, "tableNameStyle"),
          v16 == (TSWPParagraphStyle *)objc_msgSend(v5, "tableNameStyle"))
      && (v17 = -[TSTTableStyleNetwork tableNameShapeStyle](self, "tableNameShapeStyle"),
          v17 == (TSWPShapeStyle *)objc_msgSend(v5, "tableNameShapeStyle")))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
LABEL_14:
      LODWORD(v4) = -[TSSStyle hasEqualValues:forProperties:](self->mTableStyle, "hasEqualValues:forProperties:", objc_msgSend(v5, "tableStyle"), +[TSSPropertySet propertySetWithProperties:](TSSPropertySet, "propertySetWithProperties:", 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780,
                        781,
                        782,
                        783,
                        784,
                        785,
                        786,
                        788,
                        789,
                        791,
                        793,
                        795,
                        796,
                        797,
                        0));
      if ((_DWORD)v4)
      {
        LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mHeaderRowCellStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "headerRowCellStyle"), "overridePropertyMap"));
        if ((_DWORD)v4)
        {
          LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mHeaderColumnCellStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "headerColumnCellStyle"), "overridePropertyMap"));
          if ((_DWORD)v4)
          {
            LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mFooterRowCellStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "footerRowCellStyle"), "overridePropertyMap"));
            if ((_DWORD)v4)
            {
              LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mBodyCellStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "bodyCellStyle"), "overridePropertyMap"));
              if ((_DWORD)v4)
              {
                LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mHeaderRowTextStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "headerRowTextStyle"), "overridePropertyMap"));
                if ((_DWORD)v4)
                {
                  LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mHeaderColumnTextStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "headerColumnTextStyle"), "overridePropertyMap"));
                  if ((_DWORD)v4)
                  {
                    LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mFooterRowTextStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "footerRowTextStyle"), "overridePropertyMap"));
                    if ((_DWORD)v4)
                      LOBYTE(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mBodyTextStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "bodyTextStyle"), "overridePropertyMap"));
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

- (unint64_t)hash
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return self->mPresetIndex + -[NSString hash](NSStringFromClass(v3), "hash");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  TSTCellStyle *mHeaderRowCellStyle;
  TSTCellStyle *mFooterRowCellStyle;
  TSWPParagraphStyle *mHeaderRowTextStyle;
  TSWPParagraphStyle *mFooterRowTextStyle;
  TSWPParagraphStyle *mTableNameStyle;
  unint64_t var0;
  unint64_t v11;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x24BDAC8D0];
  mHeaderRowCellStyle = self->mHeaderRowCellStyle;
  v15[0] = self->mTableStyle;
  v15[1] = mHeaderRowCellStyle;
  mFooterRowCellStyle = self->mFooterRowCellStyle;
  v15[2] = self->mHeaderColumnCellStyle;
  v15[3] = mFooterRowCellStyle;
  mHeaderRowTextStyle = self->mHeaderRowTextStyle;
  v15[4] = self->mBodyCellStyle;
  v15[5] = mHeaderRowTextStyle;
  mFooterRowTextStyle = self->mFooterRowTextStyle;
  v15[6] = self->mHeaderColumnTextStyle;
  v15[7] = mFooterRowTextStyle;
  mTableNameStyle = self->mTableNameStyle;
  v15[8] = self->mBodyTextStyle;
  v15[9] = mTableNameStyle;
  var0 = a3->var0;
  if (11 - a3->var0 >= a5)
    v11 = a5;
  else
    v11 = 11 - a3->var0;
  v15[10] = self->mTableNameShapeStyle;
  if (v11)
  {
    memcpy(a4, &v15[var0], 8 * v11);
    a3->var0 += v11;
    a3->var1 = a4;
    a3->var2 = (unint64_t *)&a3->var2;
  }
  return v11;
}

+ (id)identifiersForPresetIndex:(unint64_t)a3
{
  return objc_autorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a3), +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 1), +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 2), +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 3), +[TSTCellStyle styleIDForPreset:andTableArea:](
                                  TSTCellStyle,
                                  "styleIDForPreset:andTableArea:",
                                  a3,
                                  0),
                                +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 1), +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 2), +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 3), +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 0),
                                +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a3), +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:](TSTTableStyleNetwork, "tableNameShapeStyleIDForPreset:", a3), 0));
}

- (BOOL)stylesInStylesheet:(id)a3
{
  TSPObjectContext *v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSPObject context](self, "context");
  if (v5 == (TSPObjectContext *)objc_msgSend(a3, "context"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = -[TSTTableStyleNetwork countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
LABEL_6:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(self);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        v6 = objc_msgSend(a3, "containsStyle:", v11);
        if (!v6)
          break;
        if ((id)objc_msgSend(v11, "stylesheet") != a3)
          goto LABEL_2;
        if (v8 == ++v10)
        {
          v8 = -[TSTTableStyleNetwork countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          LOBYTE(v6) = 1;
          if (v8)
            goto LABEL_6;
          return v6;
        }
      }
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
LABEL_2:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)cellStyleForTableArea:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id result;

  switch(a3)
  {
    case 0u:
      v3 = 88;
      goto LABEL_7;
    case 1u:
    case 4u:
      v3 = 64;
      goto LABEL_7;
    case 2u:
      v3 = 72;
      goto LABEL_7;
    case 3u:
    case 5u:
      v3 = 80;
LABEL_7:
      result = *(Class *)((char *)&self->super.super.isa + v3);
      break;
    default:
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyleNetwork cellStyleForTableArea:]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 581, CFSTR("illegal table region in style bootstrapping"));
      result = 0;
      break;
  }
  return result;
}

- (id)textStyleForTableArea:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id result;

  switch(a3)
  {
    case 0u:
      v3 = 120;
      goto LABEL_7;
    case 1u:
    case 4u:
      v3 = 96;
      goto LABEL_7;
    case 2u:
      v3 = 104;
      goto LABEL_7;
    case 3u:
    case 5u:
      v3 = 112;
LABEL_7:
      result = *(Class *)((char *)&self->super.super.isa + v3);
      break;
    default:
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyleNetwork textStyleForTableArea:]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 600, CFSTR("illegal table region in style bootstrapping"));
      result = 0;
      break;
  }
  return result;
}

- (void)setCellStyle:(id)a3 forTableArea:(unsigned int)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  -[TSPObject willModify](self, "willModify");
  if (a4 >= 6)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyleNetwork setCellStyle:forTableArea:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 622, CFSTR("illegal table region in style bootstrapping"));
  }
  else
  {
    v7 = *(Class *)((char *)&self->super.super.isa + *off_24D82F298[a4]);
    if (v7)

  }
  switch(a4)
  {
    case 0u:
      v10 = (objc_class *)a3;
      v11 = 88;
      goto LABEL_11;
    case 1u:
    case 4u:
      v10 = (objc_class *)a3;
      v11 = 64;
      goto LABEL_11;
    case 2u:
      v10 = (objc_class *)a3;
      v11 = 72;
      goto LABEL_11;
    case 3u:
    case 5u:
      v10 = (objc_class *)a3;
      v11 = 80;
LABEL_11:
      *(Class *)((char *)&self->super.super.isa + v11) = v10;
      break;
    default:
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyleNetwork setCellStyle:forTableArea:]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 638, CFSTR("illegal table region in style bootstrapping"));
      break;
  }
}

- (void)setTextStyle:(id)a3 forTableArea:(unsigned int)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  -[TSPObject willModify](self, "willModify");
  if (a4 >= 6)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyleNetwork setTextStyle:forTableArea:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 658, CFSTR("illegal table region in style bootstrapping"));
  }
  else
  {
    v7 = *(Class *)((char *)&self->super.super.isa + *off_24D82F2C8[a4]);
    if (v7)

  }
  switch(a4)
  {
    case 0u:
      v10 = (objc_class *)a3;
      v11 = 120;
      goto LABEL_11;
    case 1u:
    case 4u:
      v10 = (objc_class *)a3;
      v11 = 96;
      goto LABEL_11;
    case 2u:
      v10 = (objc_class *)a3;
      v11 = 104;
      goto LABEL_11;
    case 3u:
    case 5u:
      v10 = (objc_class *)a3;
      v11 = 112;
LABEL_11:
      *(Class *)((char *)&self->super.super.isa + v11) = v10;
      break;
    default:
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyleNetwork setTextStyle:forTableArea:]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 674, CFSTR("illegal table region in style bootstrapping"));
      break;
  }
}

- (void)setStylesFromTableModel:(id)a3
{
  TSPObjectContext *v5;
  void *v6;
  uint64_t v7;

  -[TSPObject willModify](self, "willModify");
  v5 = (TSPObjectContext *)objc_msgSend(a3, "context");
  if (v5 != -[TSPObject context](self, "context"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStyleNetwork setStylesFromTableModel:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 683, CFSTR("Cannot set styles from a different context"));
  }
  self->mPresetIndex = objc_msgSend(a3, "presetIndex");
  -[TSTTableStyleNetwork setTableStyle:](self, "setTableStyle:", objc_msgSend(a3, "tableStyle"));
  -[TSTTableStyleNetwork setCellStyle:forTableArea:](self, "setCellStyle:forTableArea:", objc_msgSend(a3, "bodyCellStyle"), 0);
  -[TSTTableStyleNetwork setCellStyle:forTableArea:](self, "setCellStyle:forTableArea:", objc_msgSend(a3, "headerRowCellStyle"), 1);
  -[TSTTableStyleNetwork setCellStyle:forTableArea:](self, "setCellStyle:forTableArea:", objc_msgSend(a3, "headerColumnCellStyle"), 2);
  -[TSTTableStyleNetwork setCellStyle:forTableArea:](self, "setCellStyle:forTableArea:", objc_msgSend(a3, "footerRowCellStyle"), 3);
  -[TSTTableStyleNetwork setTextStyle:forTableArea:](self, "setTextStyle:forTableArea:", objc_msgSend(a3, "bodyTextStyle"), 0);
  -[TSTTableStyleNetwork setTextStyle:forTableArea:](self, "setTextStyle:forTableArea:", objc_msgSend(a3, "headerRowTextStyle"), 1);
  -[TSTTableStyleNetwork setTextStyle:forTableArea:](self, "setTextStyle:forTableArea:", objc_msgSend(a3, "headerColumnTextStyle"), 2);
  -[TSTTableStyleNetwork setTextStyle:forTableArea:](self, "setTextStyle:forTableArea:", objc_msgSend(a3, "footerRowTextStyle"), 3);
  -[TSTTableStyleNetwork setTableNameStyle:](self, "setTableNameStyle:", objc_msgSend(a3, "tableNameStyle"));
  -[TSTTableStyleNetwork setTableNameShapeStyle:](self, "setTableNameShapeStyle:", objc_msgSend(a3, "tableNameShapeStyle"));
}

- (id)styleArray
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[TSTTableStyleNetwork countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(self);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[TSTTableStyleNetwork countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)dictionaryWithPreset:(unint64_t)a3
{
  void *v5;
  TSTTableStyle *mTableStyle;
  TSTCellStyle *mBodyCellStyle;
  TSTCellStyle *mHeaderRowCellStyle;
  TSTCellStyle *mHeaderColumnCellStyle;
  TSTCellStyle *mFooterRowCellStyle;
  TSWPParagraphStyle *mBodyTextStyle;
  TSWPParagraphStyle *mHeaderRowTextStyle;
  TSWPParagraphStyle *mHeaderColumnTextStyle;
  TSWPParagraphStyle *mFooterRowTextStyle;
  TSWPParagraphStyle *mTableNameStyle;
  TSWPShapeStyle *mTableNameShapeStyle;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  mTableStyle = self->mTableStyle;
  if (mTableStyle)
    objc_msgSend(v5, "setObject:forKey:", mTableStyle, +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a3));
  mBodyCellStyle = self->mBodyCellStyle;
  if (mBodyCellStyle)
    objc_msgSend(v5, "setObject:forKey:", mBodyCellStyle, +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 0));
  mHeaderRowCellStyle = self->mHeaderRowCellStyle;
  if (mHeaderRowCellStyle)
    objc_msgSend(v5, "setObject:forKey:", mHeaderRowCellStyle, +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 1));
  mHeaderColumnCellStyle = self->mHeaderColumnCellStyle;
  if (mHeaderColumnCellStyle)
    objc_msgSend(v5, "setObject:forKey:", mHeaderColumnCellStyle, +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 2));
  mFooterRowCellStyle = self->mFooterRowCellStyle;
  if (mFooterRowCellStyle)
    objc_msgSend(v5, "setObject:forKey:", mFooterRowCellStyle, +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 3));
  mBodyTextStyle = self->mBodyTextStyle;
  if (mBodyTextStyle)
    objc_msgSend(v5, "setObject:forKey:", mBodyTextStyle, +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 0));
  mHeaderRowTextStyle = self->mHeaderRowTextStyle;
  if (mHeaderRowTextStyle)
    objc_msgSend(v5, "setObject:forKey:", mHeaderRowTextStyle, +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 1));
  mHeaderColumnTextStyle = self->mHeaderColumnTextStyle;
  if (mHeaderColumnTextStyle)
    objc_msgSend(v5, "setObject:forKey:", mHeaderColumnTextStyle, +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 2));
  mFooterRowTextStyle = self->mFooterRowTextStyle;
  if (mFooterRowTextStyle)
    objc_msgSend(v5, "setObject:forKey:", mFooterRowTextStyle, +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 3));
  mTableNameStyle = self->mTableNameStyle;
  if (mTableNameStyle)
    objc_msgSend(v5, "setObject:forKey:", mTableNameStyle, +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a3));
  mTableNameShapeStyle = self->mTableNameShapeStyle;
  if (mTableNameShapeStyle)
    objc_msgSend(v5, "setObject:forKey:", mTableNameShapeStyle, +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:](TSTTableStyleNetwork, "tableNameShapeStyleIDForPreset:", a3));
  return v5;
}

- (BOOL)valid
{
  return self->mTableStyle
      || self->mBodyCellStyle
      || self->mHeaderRowCellStyle
      || self->mHeaderColumnCellStyle
      || self->mFooterRowTextStyle
      || self->mBodyTextStyle
      || self->mHeaderRowTextStyle != 0;
}

- (TSTTableStyleNetwork)initWithContext:(id)a3 fromDictionary:(id)a4 withPreset:(unint64_t)a5
{
  TSTTableStyleNetwork *v7;
  TSTTableStyleNetwork *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSTTableStyleNetwork;
  v7 = -[TSPObject initWithContext:](&v10, sel_initWithContext_, a3);
  v8 = v7;
  if (v7)
  {
    v7->mPresetIndex = a5;
    v7->mTableStyle = (TSTTableStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a5));
    v8->mBodyCellStyle = (TSTCellStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a5, 0));
    v8->mHeaderRowCellStyle = (TSTCellStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a5, 1));
    v8->mHeaderColumnCellStyle = (TSTCellStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a5, 2));
    v8->mFooterRowCellStyle = (TSTCellStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a5, 3));
    v8->mBodyTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a5, 0));
    v8->mHeaderRowTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a5, 1));
    v8->mHeaderColumnTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a5, 2));
    v8->mFooterRowTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a5, 3));
    v8->mTableNameStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a5));
    v8->mTableNameShapeStyle = (TSWPShapeStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:](TSTTableStyleNetwork, "tableNameShapeStyleIDForPreset:", a5));
  }
  return v8;
}

@end
