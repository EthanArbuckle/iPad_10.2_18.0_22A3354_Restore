@implementation EMColumnInfoMapper

- (EMColumnInfoMapper)initWithDefaultWidth:(double)a3 span:(unint64_t)a4 parent:(id)a5
{
  id v8;
  EMColumnInfoMapper *v9;
  EMColumnInfoMapper *v10;
  EDColumnInfo *edColumnInfo;
  void *v12;
  double v13;
  unint64_t v14;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)EMColumnInfoMapper;
  v9 = -[CMMapper initWithParent:](&v16, sel_initWithParent_, v8);
  v10 = v9;
  if (v9)
  {
    edColumnInfo = v9->edColumnInfo;
    v9->edColumnInfo = 0;

    objc_msgSend(v8, "columnWidthConvertor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lassoColumnWidthFromXl:", a3);
    v10->columnWidth = v13;

    if (a4 <= 1)
      v14 = 1;
    else
      v14 = a4;
    v10->columnSpan = v14;
  }

  return v10;
}

- (double)columnWidth
{
  return self->columnWidth;
}

- (EMColumnInfoMapper)initWithEDColumnInfo:(id)a3 maxSpan:(unint64_t)a4 parent:(id)a5
{
  id v9;
  id v10;
  EMColumnInfoMapper *v11;
  EMColumnInfoMapper *v12;
  id *p_edColumnInfo;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  unint64_t columnSpan;
  objc_super v21;

  v9 = a3;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)EMColumnInfoMapper;
  v11 = -[CMMapper initWithParent:](&v21, sel_initWithParent_, v10);
  v12 = v11;
  if (v11)
  {
    p_edColumnInfo = (id *)&v11->edColumnInfo;
    objc_storeStrong((id *)&v11->edColumnInfo, a3);
    objc_msgSend(v10, "columnWidthConvertor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_edColumnInfo, "width");
    objc_msgSend(v14, "lassoColumnWidthFromXl:");
    v12->columnWidth = v15;

    v12->columnSpan = 1;
    objc_msgSend(*p_edColumnInfo, "range");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = objc_msgSend(v16, "lastColumn");
      columnSpan = (int)(v18 - objc_msgSend(v17, "firstColumn") + 1);
      v12->columnSpan = columnSpan;
    }
    else
    {
      columnSpan = v12->columnSpan;
    }
    if (columnSpan > a4)
      v12->columnSpan = a4;

  }
  return v12;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  CMLengthProperty *v10;
  void *v11;
  id v12;

  v12 = a3;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addChild:", v11);
  v10 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", self->columnWidth + 1.0);
  -[CMLengthProperty cssStringForName:](v10, "cssStringForName:", CFSTR("width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("style"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAttribute:", v6);
  if (self->columnSpan >= 2)
  {
    v7 = 1;
    do
    {
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("style"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:", v9);
      objc_msgSend(v12, "addChild:", v8);

      ++v7;
    }
    while (self->columnSpan > v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->edColumnInfo, 0);
}

@end
