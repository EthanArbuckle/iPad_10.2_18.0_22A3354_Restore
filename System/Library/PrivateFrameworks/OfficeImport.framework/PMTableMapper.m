@implementation PMTableMapper

- (PMTableMapper)initWithOadTable:(id)a3 bounds:(id)a4 parent:(id)a5
{
  id v9;
  id v10;
  id v11;
  PMTableMapper *v12;
  PMTableMapper *v13;
  CMTableGridInfo *v14;
  CMTableGridInfo *mGrid;
  CMDrawableStyle *v16;
  CMDrawableStyle *mStyle;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PMTableMapper;
  v12 = -[CMMapper initWithParent:](&v19, sel_initWithParent_, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mTable, a3);
    v14 = objc_alloc_init(CMTableGridInfo);
    mGrid = v13->mGrid;
    v13->mGrid = v14;

    v16 = objc_alloc_init(CMDrawableStyle);
    mStyle = v13->mStyle;
    v13->mStyle = v16;

    objc_storeStrong((id *)&v13->mBounds, a4);
  }

  return v13;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  CMDrawableStyle *mStyle;
  unint64_t v9;
  uint64_t v10;
  PMTableRowMapper *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addChild:", v7);
  mStyle = self->mStyle;
  -[OADOrientedBounds bounds](self->mBounds, "bounds");
  -[CMDrawableStyle addPositionProperties:](mStyle, "addPositionProperties:");
  -[PMTableMapper mapTablePropertiesWithState:](self, "mapTablePropertiesWithState:", v6);
  -[PMTableMapper mapColumnGridAt:withState:](self, "mapColumnGridAt:withState:", v7, v6);
  v9 = -[OADTable rowCount](self->mTable, "rowCount");
  if (v9)
  {
    v10 = 0;
    do
    {
      v11 = -[PMTableRowMapper initWithOadTable:rowIndex:parent:]([PMTableRowMapper alloc], "initWithOadTable:rowIndex:parent:", self->mTable, v10, self);
      -[PMTableRowMapper mapAt:withState:](v11, "mapAt:withState:", v7, v6);

      ++v10;
    }
    while (v9 != v10);
  }
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v7, self->mStyle);

}

- (void)mapTablePropertiesWithState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[OADTable tableProperties](self->mTable, "tableProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "background");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fill");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "fill");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v8, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[CMStyle appendPropertyForName:color:](self->mStyle, "appendPropertyForName:color:", 0x24F3E6CB8, v9);

  }
  -[CMStyle appendPropertyForName:intValue:](self->mStyle, "appendPropertyForName:intValue:", 0x24F3E6EF8, 0);
  -[CMStyle appendPropertyForName:intValue:](self->mStyle, "appendPropertyForName:intValue:", 0x24F3E6C18, 0);
  -[CMStyle appendPropertyForName:intValue:](self->mStyle, "appendPropertyForName:intValue:", 0x24F3E6BF8, 0);

}

- (void)mapColumnGridAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  unint64_t i;
  void *v9;
  CMStyle *v10;
  float v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[OADTable grid](self->mTable, "grid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v7, "columnCount"); ++i)
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(CMStyle);
    -[PMTableMapper columnWidthAtIndex:state:](self, "columnWidthAtIndex:state:", i, v6);
    -[CMStyle appendPropertyForName:length:unit:](v10, "appendPropertyForName:length:unit:", 0x24F3C93F8, 1, v11);
    -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](self, "addStyleUsingGlobalCacheTo:style:embedStyle:", v9, v10, 1);
    objc_msgSend(v12, "addChild:", v9);

  }
}

- (float)columnWidthAtIndex:(unint64_t)a3 state:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;

  -[OADTable grid](self->mTable, "grid", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "columnAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "width");
    v9 = v8;

  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (unint64_t)rowCount
{
  return -[OADTable rowCount](self->mTable, "rowCount");
}

- (id)tableBorderStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[OADTable tableProperties](self->mTable, "tableProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wholeTableStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "borderStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultCellFillForRow:(unint64_t)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  float v28;
  double v29;
  float v30;
  void *v31;
  void *v32;
  uint64_t v33;

  v6 = a4;
  -[OADTable tableProperties](self->mTable, "tableProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "background");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fill");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (a3 || !objc_msgSend(v7, "firstRow"))
      {
        if ((objc_msgSend(v7, "bandRow") & 1) == 0)
        {
          +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v11, v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

          goto LABEL_24;
        }
        v17 = objc_msgSend(v7, "firstRow");
        +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v11, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v18;
        if (((a3 ^ v17) & 1) != 0)
          v19 = 0.2;
        else
          v19 = 0.4;
        objc_msgSend(v18, "redComponent");
        v21 = v20;
        objc_msgSend(v14, "greenComponent");
        v23 = v22;
        objc_msgSend(v14, "blueComponent");
        v25 = v24;
        objc_msgSend(v14, "alphaComponent");
        v26 = v21;
        v27 = v23;
        v28 = v25;
        v30 = v29;
        +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", (float)((float)(1.0 - v19) + (float)(v26 * v19)), (float)((float)(1.0 - v19) + (float)(v27 * v19)), (float)((float)(1.0 - v19) + (float)(v28 * v19)), v30);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v16 = (void *)v15;

        goto LABEL_23;
      }
    }
    else if (a3 || !objc_msgSend(v7, "firstRow"))
    {
      if ((objc_msgSend(v7, "bandRow") & 1) != 0)
      {
        if ((a3 & 1) == objc_msgSend(v7, "firstRow"))
          objc_msgSend(v9, "band1HorzStyle");
        else
          objc_msgSend(v9, "wholeTableStyle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "cellStyle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "fill");
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v9, "wholeTableStyle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "cellStyle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "fill");
        v33 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v33;

      +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v14, v6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(v9, "firstRowStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fill");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v14, v6);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v16 = 0;
LABEL_24:

  return v16;
}

- (id)grid
{
  return self->mGrid;
}

- (id)defaultCellFillWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PMTableMapper cellStyle](self, "cellStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "fill");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBounds, 0);
  objc_storeStrong((id *)&self->mGrid, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mTable, 0);
}

- (id)cellStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[OADTable tableProperties](self->mTable, "tableProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "wholeTableStyle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "cellStyle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
