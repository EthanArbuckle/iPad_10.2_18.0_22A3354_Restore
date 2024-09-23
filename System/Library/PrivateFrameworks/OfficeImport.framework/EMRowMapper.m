@implementation EMRowMapper

- (EMRowMapper)initWithEDRowBlock:(id)a3 rowInfo:(EDRowInfo *)a4 parent:(id)a5
{
  id v9;
  id v10;
  EMRowMapper *v11;
  EMRowMapper *v12;
  uint64_t v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EMRowMapper;
  v11 = -[CMMapper initWithParent:](&v15, sel_initWithParent_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mRowBlock, a3);
    v12->mRowInfo = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12->columnGrid = (double *)objc_msgSend(v10, "columnGrid");
      v13 = objc_msgSend(v10, "columnCount");
    }
    else
    {
      v13 = 0;
      v12->columnGrid = 0;
    }
    v12->columnCount = v13;
  }

  return v12;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  uint64_t v6;
  unsigned int var2;
  uint64_t v8;
  uint64_t v9;
  int v10;
  EMCellMapper *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  EDCellHeader *v15;
  EDCellHeader *v16;
  int v17;
  EMCellMapper *v18;
  EMCellMapper *v19;
  char v20;
  char v21;
  EDRowInfo *mRowInfo;
  CMLengthProperty *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;

  v27 = a3;
  v29 = a4;
  if ((*((_BYTE *)self->mRowInfo + 23) & 2) != 0)
    goto LABEL_45;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v27, "addChild:");
  var2 = self->mRowInfo->var2;
  v8 = MEMORY[0x22E2DDB58](v6);
  if (var2 >= 0x401)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      if (!+[EMCellMapper isCellEmpty:](EMCellMapper, "isCellEmpty:", -[EDRowBlock cellAtIndex:rowInfo:](self->mRowBlock, "cellAtIndex:rowInfo:", v9, self->mRowInfo)))v10 = v9;
      v9 = (v9 + 1);
    }
    while (var2 != (_DWORD)v9);
    if (var2 >= v10 + 1)
      var2 = v10 + 1;
  }
  v26 = (void *)v8;
  if (!var2)
  {
    v16 = 0;
    v11 = 0;
    v13 = 0xFFFFFFFFLL;
    goto LABEL_38;
  }
  v11 = 0;
  v12 = -var2;
  v13 = 0xFFFFFFFFLL;
  v14 = 1;
  while (1)
  {
    v15 = -[EDRowBlock cellAtIndex:rowInfo:](self->mRowBlock, "cellAtIndex:rowInfo:", (v14 - 1), self->mRowInfo);
    if (v12 + (_DWORD)v14)
      v16 = -[EDRowBlock cellAtIndex:rowInfo:](self->mRowBlock, "cellAtIndex:rowInfo:", v14, self->mRowInfo);
    else
      v16 = 0;
    v17 = columnNumberForEDCell(v15);
    if (-[EMRowMapper isColumnHidden:](self, "isColumnHidden:", v17))
      goto LABEL_34;
    v18 = -[EMCellMapper initWithEDCell:rowInfo:parent:state:]([EMCellMapper alloc], "initWithEDCell:rowInfo:parent:state:", v15, self->mRowInfo, self, v29);
    v19 = v18;
    if (!v11)
      break;
    if (!-[EMCellMapper isCellEmpty](v18, "isCellEmpty")
      || !-[EMCellMapper isCellSpreading:](v19, "isCellSpreading:", v29))
    {
      LODWORD(v13) = v17 - 1;
      -[EMCellMapper setLastColumn:](v11, "setLastColumn:", (v17 - 1));
      -[EMCellMapper adjustColumnSpanForGrid:columnCount:nextCell:withState:](v11, "adjustColumnSpanForGrid:columnCount:nextCell:withState:", self->columnGrid, self->columnCount, v16, v29);
      -[EMCellMapper mapAt:withState:height:nextCell:](v11, "mapAt:withState:height:nextCell:", v28, v29, v16, 0.0);

      break;
    }
    v13 = -[EMCellMapper lastColumn](v19, "lastColumn");
LABEL_33:

LABEL_34:
    v14 = (v14 + 1);
    if (v12 + (_DWORD)v14 == 1)
      goto LABEL_38;
  }
  if ((_DWORD)v13 == -1)
    -[EMCellMapper setFirstCellFlag](v19, "setFirstCellFlag");
  if (v17 > (int)v13 + 1)
    -[EMRowMapper mapEmptyCellsAt:withState:firstColumn:lastColumn:](self, "mapEmptyCellsAt:withState:firstColumn:lastColumn:", v28, v29, (int)v13 + 1, v17 - 1);
  v13 = -[EMCellMapper lastColumn](v19, "lastColumn");
  if (-[EMCellMapper isCellMerged](v19, "isCellMerged"))
  {
    v11 = 0;
    goto LABEL_33;
  }
  if (-[EMCellMapper isCellSpreading:](v19, "isCellSpreading:", v29))
  {
    v11 = v19;
  }
  else
  {
    -[EMCellMapper adjustColumnSpanForGrid:columnCount:nextCell:withState:](v19, "adjustColumnSpanForGrid:columnCount:nextCell:withState:", self->columnGrid, self->columnCount, v16, v29);
    v11 = 0;
    -[EMCellMapper mapAt:withState:height:nextCell:](v19, "mapAt:withState:height:nextCell:", v28, v29, v16, 0.0);
  }
  v20 = objc_msgSend(v29, "isThumbnail");
  if ((v14 - 1) > 0x64)
    v21 = v20;
  else
    v21 = 0;
  if ((v21 & 1) == 0)
    goto LABEL_33;

LABEL_38:
  mRowInfo = self->mRowInfo;
  if ((*((_BYTE *)mRowInfo + 23) & 1) != 0)
  {
    v23 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", (double)mRowInfo->var5 / 20.0);
    -[CMLengthProperty cssString](v23, "cssString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("height"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addAttribute:", v25);

  }
  if (v11)
  {
    -[EMCellMapper setLastColumn:](v11, "setLastColumn:", v13);
    -[EMCellMapper adjustColumnSpanForGrid:columnCount:nextCell:withState:](v11, "adjustColumnSpanForGrid:columnCount:nextCell:withState:", self->columnGrid, self->columnCount, 0, v29);
    -[EMCellMapper mapAt:withState:height:nextCell:](v11, "mapAt:withState:height:nextCell:", v28, v29, v16, 0.0);
    LODWORD(v13) = -[EMCellMapper lastColumn](v11, "lastColumn");

  }
  if (self->columnCount - 1 > (int)v13)
    -[EMRowMapper mapEmptyCellsAt:withState:firstColumn:lastColumn:](self, "mapEmptyCellsAt:withState:firstColumn:lastColumn:", v28, v29, (int)v13 + 1);
  objc_autoreleasePoolPop(v26);

LABEL_45:
}

- (BOOL)isColumnHidden:(unint64_t)a3
{
  double *columnGrid;

  columnGrid = self->columnGrid;
  return columnGrid && self->columnCount > a3 && columnGrid[a3] <= 0.0;
}

- (void)mapEmptyCellsAt:(id)a3 withState:(id)a4 firstColumn:(unint64_t)a5 lastColumn:(unint64_t)a6
{
  id i;
  EDCellHeader *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EMCellMapper *v17;
  unint64_t v18;
  double v19;
  id v20;

  v20 = a3;
  for (i = a4; a5 <= a6; ++a5)
  {
    if (!-[EMRowMapper isColumnHidden:](self, "isColumnHidden:", a5))
    {
      v11 = -[EMRowMapper cellWithColumnNumber:](self, "cellWithColumnNumber:", a5);
      if (v11)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(i, "currentSheet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "columnInfos");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "columnInfoForColumnNumber:", a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "style");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v16 != 0;
        if (v16)
        {
          v11 = (EDCellHeader *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
          initEDCell((int *)v11, a5, 0, 0);
          v11->var1 = objc_msgSend(v16, "index");
        }
        else
        {
          v11 = 0;
        }

        if (!v11)
        {
          v19 = 0.0;
          if (!a5)
          {
            LOWORD(v19) = self->mRowInfo->var5;
            v19 = (double)*(unint64_t *)&v19 / 20.0;
          }
          -[EMRowMapper insertEmptyCellAt:withColSpan:height:](self, "insertEmptyCellAt:withColSpan:height:", v20, 1, v19);
          if (!v16)
            continue;
          v11 = 0;
LABEL_11:
          free(v11);
          continue;
        }
      }
      v17 = -[EMCellMapper initWithEDCell:rowInfo:parent:state:]([EMCellMapper alloc], "initWithEDCell:rowInfo:parent:state:", v11, self->mRowInfo, self, i);
      LOWORD(v18) = self->mRowInfo->var5;
      -[EMCellMapper mapAt:withState:height:nextCell:](v17, "mapAt:withState:height:nextCell:", v20, i, 0, (double)v18 / 20.0);

      if (v12)
        goto LABEL_11;
    }
  }

}

- (EDCellHeader)cellWithColumnNumber:(unint64_t)a3
{
  EDCellHeader *v4;

  v4 = -[EDRowBlock cellWithColumnNumber:rowInfo:](self->mRowBlock, "cellWithColumnNumber:rowInfo:", a3, self->mRowInfo);
  if (columnNumberForEDCell(v4) == a3)
    return v4;
  else
    return 0;
}

- (void)insertEmptyCellAt:(id)a3 withColSpan:(unint64_t)a4 height:(double)a5
{
  void *v8;
  CMStyle *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addChild:", v8);
  if (a5 > 0.0)
  {
    v9 = objc_alloc_init(CMStyle);
    -[CMStyle appendPropertyForName:intValue:](v9, "appendPropertyForName:intValue:", 0x24F3D5658, (int)a5);
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v8, v9);

  }
  if (a4 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("colspan"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttribute:", v11);

  }
}

+ (void)mapEmptyRowAt:(id)a3 colspan:(unint64_t)a4 height:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addChild:", v7);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addChild:", v8);
  if (a5 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), (int)(a5 / 20.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("height"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAttribute:", v10);
  }
  if (a4 >= 2)
  {
    do
    {
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addChild:", v11);
      --a4;

    }
    while (a4 > 1);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRowBlock, 0);
}

- (BOOL)isMergedCell:(EDCellHeader *)a3
{
  return edCellHasRef((uint64_t)a3);
}

@end
