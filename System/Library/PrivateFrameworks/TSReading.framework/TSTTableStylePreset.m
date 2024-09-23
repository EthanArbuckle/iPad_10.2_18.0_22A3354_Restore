@implementation TSTTableStylePreset

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mIndex = a3;
}

- (void)setStyleNetwork:(id)a3
{
  TSTTableStyleNetwork *v5;
  unint64_t mIndex;
  void *v7;
  uint64_t v8;

  -[TSPObject willModify](self, "willModify");
  v5 = (TSTTableStyleNetwork *)objc_msgSend(a3, "copy");

  self->mStyleNetwork = v5;
  mIndex = self->mIndex;
  if (mIndex != -[TSTTableStyleNetwork presetIndex](v5, "presetIndex"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStylePreset setStyleNetwork:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStylePreset.mm"), 64, CFSTR("expected equality between %s and %s"), "mIndex", "mStyleNetwork.presetIndex");
  }
}

- (TSTTableStyleNetwork)styleNetwork
{
  return (TSTTableStyleNetwork *)-[TSTTableStyleNetwork copy](self->mStyleNetwork, "copy");
}

- (id)p_documentRoot
{
  return -[TSPObjectContext documentRoot](-[TSPObject context](self, "context"), "documentRoot");
}

- (TSTTableStylePreset)initWithStyleNetwork:(id)a3 index:(unint64_t)a4
{
  TSTTableStylePreset *v6;
  TSTTableStylePreset *v7;
  TSTTableStyleNetwork *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSTTableStylePreset;
  v6 = -[TSPObject initWithContext:](&v12, sel_initWithContext_, objc_msgSend(a3, "context"));
  v7 = v6;
  if (v6)
  {
    v6->mIndex = a4;
    v8 = (TSTTableStyleNetwork *)objc_msgSend(a3, "copy");
    v7->mStyleNetwork = v8;
    if (-[TSTTableStyleNetwork presetIndex](v8, "presetIndex") != a4)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStylePreset initWithStyleNetwork:index:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStylePreset.mm"), 87, CFSTR("expected equality between %s and %s"), "index", "mStyleNetwork.presetIndex");
    }
  }
  return v7;
}

- (TSTTableStylePreset)initWithContext:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableStylePreset initWithContext:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStylePreset.mm"), 95, CFSTR("Should always be intialized with a network and a index"));
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableStylePreset;
  -[TSTTableStylePreset dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  BOOL result;

  objc_opt_class();
  v4 = TSUDynamicCast();
  result = 0;
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[TSTTableStylePreset index](self, "index");
    if (v6 == objc_msgSend(v5, "index")
      && -[TSTTableStyleNetwork isEqual:](-[TSTTableStylePreset styleNetwork](self, "styleNetwork"), "isEqual:", objc_msgSend(v5, "styleNetwork")))
    {
      return 1;
    }
  }
  return result;
}

- (unint64_t)hash
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return self->mIndex + -[NSString hash](NSStringFromClass(v3), "hash");
}

- (BOOL)isThemeEquivalent:(id)a3
{
  return a3 == self;
}

- (NSString)presetKind
{
  return (NSString *)String;
}

- (id)swatchImage
{
  return 0;
}

- (id)styleNetworkInStylesheet:(id)a3
{
  if (self->mStyleNetwork)
    return self->mStyleNetwork;
  else
    return +[TSTTableStyleNetwork networkFromStylesheet:presetIndex:](TSTTableStyleNetwork, "networkFromStylesheet:presetIndex:", a3, self->mIndex);
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height;
  double width;
  double y;
  double x;
  TSTTableStyleNetwork *mStyleNetwork;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  mStyleNetwork = self->mStyleNetwork;
  if (!mStyleNetwork)
    mStyleNetwork = -[TSTTableStylePreset styleNetworkInStylesheet:](self, "styleNetworkInStylesheet:", objc_msgSend(-[TSTTableStylePreset p_documentRoot](self, "p_documentRoot"), "stylesheet"));
  objc_msgSend(-[TSSStyle valueForProperty:](-[TSTTableStyleNetwork headerRowCellStyle](mStyleNetwork, "headerRowCellStyle"), "valueForProperty:", 898), "drawSwatchInRect:inContext:", a4, x, y, width, height);
}

- (id)referencedStyles
{
  void *v3;
  TSTTableStyleNetwork *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[TSTTableStylePreset styleNetwork](self, "styleNetwork", 0);
  v5 = -[TSTTableStyleNetwork countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[TSTTableStyleNetwork countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  TSTTableStyle *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  TSWPParagraphStyle *v12;
  uint64_t v13;
  TSWPShapeStyle *v14;
  uint64_t v15;

  v5 = -[TSTTableStyleNetwork tableStyle](self->mStyleNetwork, "tableStyle");
  objc_opt_class();
  (*((void (**)(id, TSTTableStyle *))a3 + 2))(a3, v5);
  v6 = TSUDynamicCast();
  if ((TSTTableStyle *)v6 != v5)
    -[TSTTableStyleNetwork setTableStyle:](self->mStyleNetwork, "setTableStyle:", v6);
  v7 = 0;
  do
  {
    v8 = -[TSTTableStyleNetwork cellStyleForTableArea:](self->mStyleNetwork, "cellStyleForTableArea:", v7);
    objc_opt_class();
    (*((void (**)(id, id))a3 + 2))(a3, v8);
    v9 = TSUDynamicCast();
    if ((id)v9 != v8)
      -[TSTTableStyleNetwork setCellStyle:forTableArea:](self->mStyleNetwork, "setCellStyle:forTableArea:", v9, v7);
    v10 = -[TSTTableStyleNetwork textStyleForTableArea:](self->mStyleNetwork, "textStyleForTableArea:", v7);
    objc_opt_class();
    (*((void (**)(id, id))a3 + 2))(a3, v10);
    v11 = TSUDynamicCast();
    if ((id)v11 != v10)
      -[TSTTableStyleNetwork setTextStyle:forTableArea:](self->mStyleNetwork, "setTextStyle:forTableArea:", v11, v7);
    v7 = (v7 + 1);
  }
  while ((_DWORD)v7 != 4);
  v12 = -[TSTTableStyleNetwork tableNameStyle](self->mStyleNetwork, "tableNameStyle");
  objc_opt_class();
  (*((void (**)(id, TSWPParagraphStyle *))a3 + 2))(a3, v12);
  v13 = TSUDynamicCast();
  if ((TSWPParagraphStyle *)v13 != v12)
    -[TSTTableStyleNetwork setTableNameStyle:](self->mStyleNetwork, "setTableNameStyle:", v13);
  v14 = -[TSTTableStyleNetwork tableNameShapeStyle](self->mStyleNetwork, "tableNameShapeStyle");
  objc_opt_class();
  (*((void (**)(id, TSWPShapeStyle *))a3 + 2))(a3, v14);
  v15 = TSUDynamicCast();
  if ((TSWPShapeStyle *)v15 != v14)
    -[TSTTableStyleNetwork setTableNameShapeStyle:](self->mStyleNetwork, "setTableNameShapeStyle:", v15);
}

@end
