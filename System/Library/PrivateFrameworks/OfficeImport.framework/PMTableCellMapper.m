@implementation PMTableCellMapper

- (PMTableCellMapper)initWithOadTableCell:(id)a3 rowIndex:(unint64_t)a4 columnIndex:(int)a5 parent:(id)a6
{
  id v11;
  id v12;
  PMTableCellMapper *v13;
  PMTableCellMapper *v14;
  CMStyle *v15;
  CMStyle *mStyle;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PMTableCellMapper;
  v13 = -[CMMapper initWithParent:](&v18, sel_initWithParent_, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mCell, a3);
    v14->mColIndex = a5;
    v14->mRowIndex = a4;
    v15 = objc_alloc_init(CMStyle);
    mStyle = v14->mStyle;
    v14->mStyle = v15;

  }
  return v14;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  float v15;
  float v16;
  void *v17;
  PMShapeTextMapper *v18;
  uint64_t v19;
  CMStyle *mStyle;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  if (-[OADTableCell horzMerge](self->mCell, "horzMerge") || -[OADTableCell vertMerge](self->mCell, "vertMerge"))
  {
    v8 = v6;
  }
  else
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addChild:", v9);
    v8 = v9;

    if (-[OADTableCell gridSpan](self->mCell, "gridSpan") >= 2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[OADTableCell gridSpan](self->mCell, "gridSpan"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3E66D8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:", v11);

    }
    if (-[OADTableCell rowSpan](self->mCell, "rowSpan") < 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);
      objc_msgSend(WeakRetained, "height");
      v16 = v15;

      -[CMStyle appendPropertyForName:length:unit:](self->mStyle, "appendPropertyForName:length:unit:", 0x24F3D5658, 10, v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[OADTableCell rowSpan](self->mCell, "rowSpan"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3E6C58, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:", v13);

    }
    -[PMTableCellMapper mapBordersWithState:](self, "mapBordersWithState:", v7);
    -[OADTableCell textBody](self->mCell, "textBody");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PMShapeTextMapper initWithOadTextBody:bounds:parent:]([PMShapeTextMapper alloc], "initWithOadTextBody:bounds:parent:", v17, 0, self);
    v19 = -[PMShapeTextMapper textAnchor](v18, "textAnchor");
    -[PMShapeTextMapper mapAt:withState:](v18, "mapAt:withState:", v8, v7);
    -[PMTableCellMapper mapCellPropertiesWithState:textAnchor:](self, "mapCellPropertiesWithState:textAnchor:", v7, v19);
    mStyle = self->mStyle;
    v21.receiver = self;
    v21.super_class = (Class)PMTableCellMapper;
    -[CMMapper addStyleUsingGlobalCacheTo:style:](&v21, sel_addStyleUsingGlobalCacheTo_style_, v8, mStyle);

  }
}

- (void)mapBordersWithState:(id)a3
{
  unint64_t mRowIndex;
  void *v5;
  uint64_t v6;
  uint64_t mColIndex;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CMBordersProperty *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  mRowIndex = self->mRowIndex;
  -[PMTableCellMapper tableMapper](self, "tableMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rowCount");

  mColIndex = self->mColIndex;
  -[PMTableCellMapper rowMapper](self, "rowMapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cellCount");

  -[PMTableCellMapper tableMapper](self, "tableMapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableBorderStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "currentRowStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "borderStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[OADTableCell properties](self->mCell, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(CMBordersProperty);
  objc_msgSend(v15, "topStroke");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v15, "topStroke");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v18, 1, v29);
  }
  else
  {
    objc_msgSend(v14, "topStroke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v14, "topStroke");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v18, 1, v29);
    }
    else
    {
      if (mRowIndex)
        objc_msgSend(v11, "horzInsideStroke");
      else
        objc_msgSend(v11, "topStroke");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v18, 1, v29);
    }
  }

  objc_msgSend(v15, "bottomStroke");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v15, "bottomStroke");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v21, 3, v29);
  }
  else
  {
    objc_msgSend(v14, "bottomStroke");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v14, "bottomStroke");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v21, 3, v29);
    }
    else
    {
      if (mRowIndex == v6 - 1)
        objc_msgSend(v11, "bottomStroke");
      else
        objc_msgSend(v11, "horzInsideStroke");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v21, 3, v29);
    }
  }

  objc_msgSend(v15, "leftStroke");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v15, "leftStroke");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v24, 2, v29);
  }
  else
  {
    objc_msgSend(v14, "leftStroke");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v14, "leftStroke");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v24, 2, v29);
    }
    else
    {
      if ((_DWORD)mColIndex)
        objc_msgSend(v11, "vertInsideStroke");
      else
        objc_msgSend(v11, "leftStroke");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v24, 2, v29);
    }
  }

  objc_msgSend(v15, "rightStroke");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v15, "rightStroke");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v27, 4, v29);
  }
  else
  {
    objc_msgSend(v14, "rightStroke");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v14, "rightStroke");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v27, 4, v29);
    }
    else
    {
      if (v9 - 1 == mColIndex)
        objc_msgSend(v11, "rightStroke");
      else
        objc_msgSend(v11, "vertInsideStroke");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMBordersProperty setFromOadStroke:atLocation:state:](v16, "setFromOadStroke:atLocation:state:", v27, 4, v29);
    }
  }

  -[CMBordersProperty adjustValues](v16, "adjustValues");
  -[CMStyle addProperty:forKey:](self->mStyle, "addProperty:forKey:", v16, CFSTR("cellBorders"));

}

- (id)tableMapper
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);
  objc_msgSend(WeakRetained, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)rowMapper
{
  CMMapper **p_mParent;
  id WeakRetained;
  char isKindOfClass;
  id v5;

  p_mParent = &self->super.mParent;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = objc_loadWeakRetained((id *)p_mParent);
  else
    v5 = 0;
  return v5;
}

- (float)widthWithState:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  unint64_t i;
  float v9;

  v4 = a3;
  -[PMTableCellMapper tableMapper](self, "tableMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnWidthAtIndex:state:", self->mColIndex, v4);
  v7 = v6;
  for (i = 1; i < -[OADTableCell gridSpan](self->mCell, "gridSpan"); ++i)
  {
    objc_msgSend(v5, "columnWidthAtIndex:state:", i + self->mColIndex, v4);
    v7 = v7 + v9;
  }

  return v7;
}

- (void)mapCellPropertiesWithState:(id)a3 textAnchor:(unsigned __int8)a4
{
  unsigned int v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  -[OADTableCell properties](self->mCell, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isTextAnchorOverridden"))
    v4 = objc_msgSend(v6, "textAnchor");
  if (v4 <= 2)
    -[CMStyle appendPropertyForName:stringValue:](self->mStyle, "appendPropertyForName:stringValue:", 0x24F3E6698, *(&off_24F3BFA58)[(char)v4]);
  objc_msgSend(v6, "fill");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "fill");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_9;
  }
  else
  {
    -[PMTableCellMapper tableMapper](self, "tableMapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultCellFillForRow:withState:", self->mRowIndex, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
LABEL_9:
      -[CMStyle appendPropertyForName:color:](self->mStyle, "appendPropertyForName:color:", 0x24F3E6CB8, v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mCell, 0);
}

@end
