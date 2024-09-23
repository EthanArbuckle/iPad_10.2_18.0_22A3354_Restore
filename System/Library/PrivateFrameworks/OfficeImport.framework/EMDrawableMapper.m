@implementation EMDrawableMapper

- (EMDrawableMapper)initWithOADDrawable:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  EMDrawableMapper *v8;
  EMDrawableMapper *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EMDrawableMapper;
  v8 = -[CMDrawableMapper initWithOadDrawable:parent:](&v13, sel_initWithOadDrawable_parent_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[EMDrawableMapper worksheetMapper](v8, "worksheetMapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->mRowGrid = (double *)objc_msgSend(v10, "rowGrid");

    -[EMDrawableMapper worksheetMapper](v9, "worksheetMapper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->mColumnGrid = (double *)objc_msgSend(v11, "columnGrid");

  }
  return v9;
}

- (id)worksheetMapper
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.mParent);
  if (WeakRetained)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(WeakRetained, "parent");
      v3 = objc_claimAutoreleasedReturnValue();

      WeakRetained = (id)v3;
    }
    while (v3);
  }
  return WeakRetained;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  OADDrawable *mDrawable;
  uint64_t v10;
  NSData *mImageBinaryData;
  uint64_t mResourceType;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (!-[OADDrawable hidden](self->super.mDrawable, "hidden"))
  {
    -[EMDrawableMapper mapBounds](self, "mapBounds");
    -[CMDrawableStyle addPositionProperties:](self->super.mStyle, "addPositionProperties:", self->super.mBox.origin.x, self->super.mBox.origin.y, self->super.mBox.size.width, self->super.mBox.size.height);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMDrawableMapper mapOfficeArtShapeAt:withState:](self, "mapOfficeArtShapeAt:withState:", v6, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[EMDrawableMapper mapOfficeArtGroupAt:withState:](self, "mapOfficeArtGroupAt:withState:", v6, v7);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[EMDrawableMapper mapChartAt:withState:](self, "mapChartAt:withState:", v6, v7);
        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          mDrawable = self->super.mDrawable;
          if ((isKindOfClass & 1) != 0)
          {
            v17.receiver = self;
            v17.super_class = (Class)EMDrawableMapper;
            -[CMDrawableMapper setWithOadImage:](&v17, sel_setWithOadImage_, mDrawable);
            if (!self->super.mImageBinaryData)
              goto LABEL_16;
            +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
            v10 = objc_claimAutoreleasedReturnValue();
            mImageBinaryData = self->super.mImageBinaryData;
            mResourceType = self->super.mResourceType;
            v16.receiver = self;
            v16.super_class = (Class)EMDrawableMapper;
            -[CMDrawableMapper saveResourceAndReturnPath:withType:](&v16, sel_saveResourceAndReturnPath_withType_, mImageBinaryData, mResourceType);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v10, v13);

            v14 = (void *)v10;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[EMDrawableMapper mapDiagramAt:withState:](self, "mapDiagramAt:withState:", v6, v7);
              goto LABEL_16;
            }
            +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[CMStyle appendPropertyForName:stringWithColons:](self->super.mStyle, "appendPropertyForName:stringWithColons:", 0x24F3E6CF8, CFSTR(": 1px solid black;"));
          }
          if (v14)
          {
            objc_msgSend(v6, "addChild:", v14);
            -[EMCellStyle cssStyleString](self->super.mStyle, "cssStyleString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, v14, v15);

          }
        }
      }
    }
  }
LABEL_16:

}

- (void)mapBounds
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  OADOrientedBounds *v7;
  OADOrientedBounds *mOrientedBounds;

  if (!self->super.mOrientedBounds)
  {
    -[EMDrawableMapper getImageRect](self, "getImageRect");
    self->super.mBox.origin.x = v3;
    self->super.mBox.origin.y = v4;
    self->super.mBox.size.width = v5;
    self->super.mBox.size.height = v6;
    +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
    v7 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
    mOrientedBounds = self->super.mOrientedBounds;
    self->super.mOrientedBounds = v7;

  }
}

- (CGRect)getImageRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[OADDrawable clientData](self->super.mDrawable, "clientData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasBounds"))
  {
    objc_msgSend(v7, "bounds");
    v3 = v8;
    v4 = v9;
    v5 = v10;
    v6 = v11;
  }
  else
  {
    objc_msgSend(v7, "anchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v7, "anchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMDrawableMapper mapAnchorToRect:rowGrid:columnGrid:](self, "mapAnchorToRect:rowGrid:columnGrid:", v13, self->mRowGrid, self->mColumnGrid);
      v3 = v14;
      v4 = v15;
      v5 = v16;
      v6 = v17;

    }
  }

  v18 = v3;
  v19 = v4;
  v20 = v5;
  v21 = v6;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)mapAnchorToRect:(id)a3 rowGrid:(double *)a4 columnGrid:(double *)a5
{
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "position");
    v11 = v10;
    objc_msgSend(v9, "size");
    v13 = v12;
    v15 = v14;
    v16 = 0.0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = objc_msgSend(v9, "from");
      -[EMDrawableMapper anchorMarkerToPosition:rowGrid:columnGrid:start:relative:](self, "anchorMarkerToPosition:rowGrid:columnGrid:start:relative:", v17, v18, a4, a5, 1, objc_msgSend(v9, "isRelative"));
      v16 = v19;
      v11 = v20;
      objc_msgSend(v9, "size");
      v13 = v21;
      v15 = v22;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = objc_msgSend(v9, "from");
        -[EMDrawableMapper anchorMarkerToPosition:rowGrid:columnGrid:start:relative:](self, "anchorMarkerToPosition:rowGrid:columnGrid:start:relative:", v23, v24, a4, a5, 1, objc_msgSend(v9, "isRelative"));
        v16 = v25;
        v11 = v26;
        v27 = objc_msgSend(v9, "to");
        -[EMDrawableMapper anchorMarkerToPosition:rowGrid:columnGrid:start:relative:](self, "anchorMarkerToPosition:rowGrid:columnGrid:start:relative:", v27, v28, a4, a5, 0, objc_msgSend(v9, "isRelative"));
        v13 = v29 - v16;
        v15 = v30 - v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMDrawableMapper.mm"), 253, CFSTR("Unknown class %@"), v9);

        v16 = *MEMORY[0x24BDBEFB0];
        v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        v13 = *MEMORY[0x24BDBF148];
        v15 = *(double *)(MEMORY[0x24BDBF148] + 8);
      }
    }
  }

  v32 = v16;
  v33 = v11;
  v34 = v13;
  v35 = v15;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGPoint)anchorMarkerToPosition:(EDCellAnchorMarker)a3 rowGrid:(double *)a4 columnGrid:(double *)a5 start:(BOOL)a6 relative:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGPoint result;

  v7 = a7;
  v10 = *(_QWORD *)&a3.rowIndex;
  v11 = *(_QWORD *)&a3.columnIndex;
  -[EMDrawableMapper worksheetMapper](self, "worksheetMapper", *(_QWORD *)&a3.columnIndex, *(_QWORD *)&a3.rowIndex, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "columnCount");

  -[EMDrawableMapper worksheetMapper](self, "worksheetMapper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "maxRowNumber");

  v17 = 0;
  v18 = 0.0;
  while (v14 != v17)
  {
    if (a5)
    {
      v19 = a5[v17];
      v18 = v18 + v19;
    }
    else
    {
      -[EMDrawableMapper worksheetMapper](self, "worksheetMapper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "defaultColumnWidth");
      v19 = v21;

    }
    if (++v17 > (unint64_t)(int)v11)
      goto LABEL_9;
  }
  -[EMDrawableMapper worksheetMapper](self, "worksheetMapper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "defaultColumnWidth");
  v24 = v23;

  -[EMDrawableMapper worksheetMapper](self, "worksheetMapper");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "defaultColumnWidth");
  v19 = v26;
  v18 = v18 + (double)(unint64_t)((int)v11 - v14 + 1) * v24;

LABEL_9:
  v27 = 0;
  if (v7)
    v28 = v18 + v19 * (float)(*((float *)&v11 + 1) + -1.0);
  else
    v28 = v18 + *((float *)&v11 + 1) - v19;
  v29 = 0.0;
  while (v27 <= v16)
  {
    v30 = a4[v27] / 20.0;
    v29 = v29 + v30;
    if (++v27 > (int)v10)
      goto LABEL_17;
  }
  -[EMDrawableMapper worksheetMapper](self, "worksheetMapper", 20.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "defaultRowHeight");
  v33 = v32;

  -[EMDrawableMapper worksheetMapper](self, "worksheetMapper");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "defaultRowHeight");
  v29 = v29 + v33 * (double)((int)v10 - v16) / 20.0;
  v30 = v35 / 20.0;

LABEL_17:
  v36 = v29 + v30 * (float)(*((float *)&v10 + 1) + -1.0);
  if (!v7)
    v36 = v29 + *((float *)&v10 + 1) - v30;
  v37 = v28 + 5.0;
  v38 = v36 + 11.0;
  result.y = v38;
  result.x = v37;
  return result;
}

- (void)mapOfficeArtShapeAt:(id)a3 withState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  _BOOL4 v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CMStyle *v28;
  CMBordersProperty *v29;
  void *v30;
  CMBordersProperty *v31;
  CMDrawableStyle *mStyle;
  void *v33;
  void *v34;
  OADDrawable *v35;
  void *v36;
  id v37;
  id v38;
  objc_super v39;
  objc_super v40;

  v37 = a3;
  v38 = a4;
  -[OADDrawable clientData](self->super.mDrawable, "clientData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "comment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(v6, "comment"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "visible"),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v35 = self->super.mDrawable;
    v10 = -[OADDrawable type](v35, "type");
    -[OADDrawable shapeProperties](v35, "shapeProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fill");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v36 = (void *)v12;
    if (v12)
    {
      objc_opt_class();
      v13 = objc_opt_isKindOfClass() ^ 1;
    }
    objc_msgSend(v11, "stroke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[CMBordersProperty isStroked:](CMBordersProperty, "isStroked:", v14);

    v16 = objc_msgSend(v11, "isTextBox");
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == 202)
      v18 = 1;
    else
      v18 = v16;
    if ((v18 & 1) != 0 || v10 == 1 || v10 == 75 || ((v13 | v15) & 1) == 0)
    {
      -[EMDrawableMapper mapTextBoxAt:withState:](self, "mapTextBoxAt:withState:", v17, v38);
      if (v15)
      {
        v29 = [CMBordersProperty alloc];
        objc_msgSend(v11, "stroke");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[CMBordersProperty initWithOADStroke:](v29, "initWithOADStroke:", v30);

        -[CMStyle addProperty:forKey:](self->super.mStyle, "addProperty:forKey:", v31, 0x24F3E6CF8);
      }
      if ((v13 & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          mStyle = self->super.mStyle;
          objc_msgSend(v36, "color");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[CMColorProperty cssStringFromOADColor:](CMColorProperty, "cssStringFromOADColor:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMStyle appendPropertyForName:stringWithColons:](mStyle, "appendPropertyForName:stringWithColons:", 0x24F3E6CB8, v34);

        }
      }
      -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v17, self->super.mStyle);
      objc_msgSend(v37, "addChild:", v17);
    }
    else
    {
      -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v17, self->super.mStyle);
      v40.receiver = self;
      v40.super_class = (Class)EMDrawableMapper;
      -[CMDrawableMapper mapShapeGraphicsAt:withState:](&v40, sel_mapShapeGraphicsAt_withState_, v17, v38);
      objc_msgSend(v37, "addChild:", v17);
      if (objc_msgSend(v6, "hasText"))
      {
        +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMDrawableMapper mapTextBoxAt:withState:](self, "mapTextBoxAt:withState:", v19, v38);
        v39.receiver = self;
        v39.super_class = (Class)EMDrawableMapper;
        -[CMDrawableMapper shapeTextBoxRect](&v39, sel_shapeTextBoxRect);
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v28 = objc_alloc_init(CMStyle);
        -[CMStyle appendPositionInfoFromRect:](v28, "appendPositionInfoFromRect:", v21 - self->super.mBox.origin.x, v23 - self->super.mBox.origin.y, v25, v27);
        -[CMStyle appendPropertyForName:stringWithColons:](v28, "appendPropertyForName:stringWithColons:", 0x24F3D4B58, CFSTR(":absolute;"));
        -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v19, v28);
        objc_msgSend(v17, "addChild:", v19);

      }
    }

  }
}

- (void)mapTextBoxAt:(id)a3 withState:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  EMCellTextMapper *v10;
  void *v11;
  EMCellTextMapper *v12;
  id v13;

  v13 = a3;
  -[OADDrawable clientData](self->super.mDrawable, "clientData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "comment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_msgSend(v5, "comment"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "visible"),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    if (objc_msgSend(v5, "hasText"))
    {
      objc_msgSend(v5, "textBox");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = [EMCellTextMapper alloc];
      objc_msgSend(v9, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[EMCellTextMapper initWithEDString:style:parent:](v10, "initWithEDString:style:parent:", v11, 0, self);

      -[EMCellTextMapper mapTextRunsAt:](v12, "mapTextRunsAt:", v13);
    }
  }

}

- (EMDrawableMapper)initWithChartDrawable:(id)a3 box:(CGRect)a4 parent:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  EMDrawableMapper *v13;
  EMDrawableMapper *v14;
  uint64_t v15;
  OADOrientedBounds *mOrientedBounds;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)EMDrawableMapper;
  v13 = -[CMDrawableMapper initWithOadDrawable:parent:](&v18, sel_initWithOadDrawable_parent_, v11, v12);
  v14 = v13;
  if (v13)
  {
    v13->mRowGrid = 0;
    v13->mColumnGrid = 0;
    v13->super.mBox.origin.x = x;
    v13->super.mBox.origin.y = y;
    v13->super.mBox.size.width = width;
    v13->super.mBox.size.height = height;
    +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", x, y, width, height);
    v15 = objc_claimAutoreleasedReturnValue();
    mOrientedBounds = v14->super.mOrientedBounds;
    v14->super.mOrientedBounds = (OADOrientedBounds *)v15;

  }
  return v14;
}

- (void)mapChartAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  EMChartMapper *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = -[EMChartMapper initWithChart:parent:]([EMChartMapper alloc], "initWithChart:parent:", self->super.mDrawable, self);
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  v11 = -[EMChartMapper copyPdfWithState:withSize:](v8, "copyPdfWithState:withSize:", v7, v9, v10);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v14.receiver = self;
    v14.super_class = (Class)EMDrawableMapper;
    -[CMDrawableMapper saveResourceAndReturnPath:withType:](&v14, sel_saveResourceAndReturnPath_withType_, v11, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v12, v13);

  }
  else
  {
    -[CMStyle appendPropertyForName:stringWithColons:](self->super.mStyle, "appendPropertyForName:stringWithColons:", 0x24F3E6CF8, CFSTR(": 1px solid black;"));
  }
  objc_msgSend(v6, "addChild:", v12);
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v12, self->super.mStyle);

}

- (void)mapOfficeArtGroupAt:(id)a3 withState:(id)a4
{
  id v6;
  OADDrawable *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  EMDrawableMapper *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = self->super.mDrawable;
  v8 = -[OADDrawable childCount](v7, "childCount");
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      -[OADDrawable childAtIndex:](v7, "childAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[EMDrawableMapper initWithOADDrawable:parent:]([EMDrawableMapper alloc], "initWithOADDrawable:parent:", v11, self);
      -[EMDrawableMapper mapAt:withState:](v12, "mapAt:withState:", v13, v6);

      ++v9;
      v10 = v11;
    }
    while (v8 != v9);

  }
}

- (EMDrawableMapper)initWithOADDrawable:(id)a3 rowGrid:(double *)a4 columnGrid:(double *)a5
{
  EMDrawableMapper *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EMDrawableMapper;
  result = -[CMDrawableMapper initWithOadDrawable:parent:](&v8, sel_initWithOadDrawable_parent_, a3, 0);
  if (result)
  {
    result->mRowGrid = a4;
    result->mColumnGrid = a5;
  }
  return result;
}

- (void)setBoundingBox
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  -[EMDrawableMapper getImageRect](self, "getImageRect");
  self->super.mBox.origin.x = v3;
  self->super.mBox.origin.y = v4;
  self->super.mBox.size.width = v5;
  self->super.mBox.size.height = v6;
}

+ (BOOL)isAnchorRelative:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "isRelative");
  else
    v4 = 0;

  return v4;
}

- (void)mapDiagramAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double Width;
  double Height;
  CMDrawingContext *v11;
  OADOrientedBounds *v12;
  OADOrientedBounds *mOrientedBounds;
  void *v14;
  CMDrawableStyle *v15;
  CMDiagramMapper *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v8, self->super.mStyle);
  objc_msgSend(v6, "addChild:", v8);
  v17 = v8;

  Width = CGRectGetWidth(self->super.mBox);
  Height = CGRectGetHeight(self->super.mBox);
  v11 = -[CMDrawingContext initWithFrame:]([CMDrawingContext alloc], "initWithFrame:", 0.0, 0.0, Width, Height);
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, 0.0, Width, Height);
  v12 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mOrientedBounds = self->super.mOrientedBounds;
  self->super.mOrientedBounds = v12;

  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(CMDrawableStyle);
  -[CMStyle appendPropertyForName:stringWithColons:](v15, "appendPropertyForName:stringWithColons:", 0x24F3D4B58, CFSTR(":absolute;"));
  -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v14, v15);
  v16 = -[CMDiagramMapper initWithOddDiagram:drawingContext:orientedBounds:parent:]([CMDiagramMapper alloc], "initWithOddDiagram:drawingContext:orientedBounds:parent:", self->super.mDrawable, v11, self->super.mOrientedBounds, self);
  -[CMDiagramMapper mapAt:withState:](v16, "mapAt:withState:", v14, v7);
  -[CMDrawableMapper mapDrawingContext:at:relative:withState:](self, "mapDrawingContext:at:relative:withState:", v11, v17, 0, v7);
  objc_msgSend(v17, "addChild:", v14);

}

@end
