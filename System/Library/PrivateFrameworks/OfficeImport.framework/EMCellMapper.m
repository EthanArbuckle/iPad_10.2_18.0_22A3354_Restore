@implementation EMCellMapper

- (EMCellMapper)initWithEDCell:(EDCellHeader *)a3 rowInfo:(EDRowInfo *)a4 parent:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  EMCellMapper *v12;
  EMCellMapper *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  EDReference *edMergedCellReference;
  EDReference *v19;
  int firstColumn;

  v10 = a5;
  v11 = a6;
  v12 = -[EMCellMapper initWithParent:](self, "initWithParent:", v10);
  v13 = v12;
  if (v12)
  {
    v12->edCell = a3;
    v12->rowNumber = a4->var1;
    v14 = columnNumberForEDCell(a3);
    v13->firstColumn = v14;
    if (v13->edCell)
    {
      objc_msgSend(v11, "currentSheet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mergedCells");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "referenceContainingRow:column:", v13->rowNumber, v13->firstColumn);
      v17 = objc_claimAutoreleasedReturnValue();
      edMergedCellReference = v13->edMergedCellReference;
      v13->edMergedCellReference = (EDReference *)v17;

      v19 = v13->edMergedCellReference;
      if (v19)
        firstColumn = -[EDReference lastColumn](v19, "lastColumn");
      else
        firstColumn = v13->firstColumn;
      v13->lastColumn = firstColumn;

      v14 = v13->firstColumn;
    }
    v13->columnSpan = v13->lastColumn - v14 + 1;
  }

  return v13;
}

- (EMCellMapper)initWithParent:(id)a3
{
  EMCellMapper *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EMCellMapper;
  result = -[CMMapper initWithParent:](&v4, sel_initWithParent_, a3);
  if (result)
  {
    result->firstCellFlag = 0;
    result->spreadLeftFlag = 1;
    result->firstColumn = -1;
    result->lastColumn = -1;
    result->edCell = 0;
    result->rowNumber = -1;
    result->columnWidth = 0.0;
  }
  return result;
}

- (void)setFirstCellFlag
{
  self->firstCellFlag = 1;
}

- (int)lastColumn
{
  return self->lastColumn;
}

- (BOOL)isCellMerged
{
  unsigned int v3;
  int rowNumber;
  BOOL result;

  result = 0;
  if (self->edMergedCellReference)
  {
    v3 = columnNumberForEDCell(self->edCell);
    self->firstColumn = -[EDReference firstColumn](self->edMergedCellReference, "firstColumn");
    rowNumber = self->rowNumber;
    if (__PAIR64__(v3, -[EDReference firstRow](self->edMergedCellReference, "firstRow")) != __PAIR64__(self->firstColumn, rowNumber))return 1;
  }
  return result;
}

- (BOOL)isCellSpreading:(id)a3
{
  id v4;
  EDCellHeader *edCell;
  EDCellHeader *v6;
  void *v7;
  EDResources *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  edCell = self->edCell;
  if (edCell && typeForEDCell(edCell))
  {
    v6 = self->edCell;
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resources");
    v8 = (EDResources *)objc_claimAutoreleasedReturnValue();
    styleForEDCell(v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isAlignmentInfoOverridden") & 1) != 0)
    {
      objc_msgSend(v9, "alignmentInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_msgSend(v10, "isHorizontalAlignOverridden") & 1) != 0
         && objc_msgSend(v10, "horizontalAlignment") == 6;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)adjustColumnSpanForGrid:(double *)a3 columnCount:(unint64_t)a4 nextCell:(EDCellHeader *)a5 withState:(id)a6
{
  int v10;
  unint64_t firstColumn;
  int lastColumn;
  double v14;
  double v15;
  void *v17;
  EDResources *v18;
  void *v19;
  int v20;
  int v21;
  id v22;

  v22 = a6;
  v10 = self->lastColumn - self->firstColumn + 1;
  self->columnSpan = v10;
  if (a3)
  {
    self->columnWidth = 0.0;
    firstColumn = self->firstColumn;
    lastColumn = self->lastColumn;
    if ((int)firstColumn <= lastColumn && firstColumn < a4)
    {
      v14 = 0.0;
      do
      {
        v15 = a3[firstColumn];
        if (v15 == 0.0)
        {
          self->columnSpan = --v10;
          lastColumn = self->lastColumn;
        }
        v14 = v14 + v15;
        self->columnWidth = v14;
        if (firstColumn + 1 >= a4)
          break;
      }
      while ((uint64_t)firstColumn++ < lastColumn);
    }
    if (a5 && typeForEDCell(a5) == 3)
    {
      objc_msgSend(v22, "document");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "resources");
      v18 = (EDResources *)objc_claimAutoreleasedReturnValue();
      stringValueForEDCell(a5, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = columnNumberForEDCell(a5);
        v21 = self->lastColumn + 1;

        if (v20 == v21)
          self->spreadLeftFlag = 0;
      }
      else
      {

      }
    }
  }

}

- (void)mapRowColSpansAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  EDReference *edMergedCellReference;
  int v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (self->columnSpan >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), self->columnSpan);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("colspan"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:", v8);

  }
  edMergedCellReference = self->edMergedCellReference;
  if (edMergedCellReference)
  {
    v10 = -[EDReference lastRow](edMergedCellReference, "lastRow");
    v11 = v10 - -[EDReference firstRow](self->edMergedCellReference, "firstRow");
    if (v11 >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), (v11 + 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("rowspan"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAttribute:", v13);

    }
  }

}

- (BOOL)isCellEmpty
{
  return objc_msgSend((id)objc_opt_class(), "isCellEmpty:", self->edCell);
}

- (void)setLastColumn:(int)a3
{
  self->lastColumn = a3;
}

- (int)firstColumn
{
  return self->firstColumn;
}

- (void)setFirstColumn:(int)a3
{
  self->firstColumn = a3;
}

- (double)columnWidth
{
  return self->columnWidth;
}

- (void)resetColumnSpan:(int)a3
{
  self->columnSpan = a3;
}

- (int)columnSpan
{
  return self->columnSpan;
}

+ (BOOL)isCellEmpty:(EDCellHeader *)a3
{
  return !a3 || typeForEDCell(a3) == 0;
}

- (BOOL)isFirstCell
{
  return self->firstCellFlag;
}

- (void)mapAt:(id)a3 withState:(id)a4 height:(double)a5 nextCell:(EDCellHeader *)a6
{
  id v10;
  id v11;
  void *v12;
  EDReference *edMergedCellReference;
  int v14;
  int v15;
  void *v16;
  EDCellHeader *edCell;
  void *v18;
  EDResources *v19;
  void *v20;
  _DWORD *v21;
  _DWORD *v22;
  EMCellTextMapper *v23;
  EDCellHeader *v24;
  void *v25;
  EDResources *v26;
  void *v27;
  EMCellTextMapper *v28;
  double v29;
  double v30;
  unint64_t v31;
  EMCellNumberMapper *v32;
  double v33;
  EDCellHeader *v34;
  void *v35;
  EDResources *v36;
  void *v37;
  double columnWidth;
  void *v39;
  EMCellNumberMapper *v40;
  void *v41;
  uint64_t v42;
  EMCellStyle *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  id v49;

  v10 = a3;
  v11 = a4;
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChild:", v12);
  edMergedCellReference = self->edMergedCellReference;
  if (edMergedCellReference
    && (v14 = -[EDReference lastRow](edMergedCellReference, "lastRow"),
        v14 > -[EDReference firstRow](self->edMergedCellReference, "firstRow")))
  {
    a5 = 0.0;
    v15 = 1;
  }
  else
  {
    v15 = objc_msgSend((id)objc_opt_class(), "isCellEmpty:", a6);
  }
  -[EMCellMapper mapRowColSpansAt:withState:](self, "mapRowColSpansAt:withState:", v12, v11);
  objc_msgSend(v11, "hyperlinkForRow:column:", self->rowNumber, columnNumberForEDCell(self->edCell));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[EMCellMapper mapHyperlink:at:](self, "mapHyperlink:at:", v16, v12);
    v49 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = v12;
  }

  edCell = self->edCell;
  objc_msgSend(v11, "document");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resources");
  v19 = (EDResources *)objc_claimAutoreleasedReturnValue();
  v48 = v15;
  styleForEDCell(edCell, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = typeForEDCell(self->edCell);
  v22 = v21;
  if ((_DWORD)v21 == 2)
  {
    v47 = v16;
    v32 = [EMCellNumberMapper alloc];
    v33 = numberValueForEDCell(self->edCell);
    v34 = self->edCell;
    objc_msgSend(v11, "document");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "resources");
    v36 = (EDResources *)objc_claimAutoreleasedReturnValue();
    styleForEDCell(v34, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    columnWidth = self->columnWidth;
    objc_msgSend(v11, "document");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[EMCellNumberMapper initWithDoubleValue:style:columnWidth:workbook:parent:](v32, "initWithDoubleValue:style:columnWidth:workbook:parent:", v37, v39, self, v33, columnWidth);

    -[EMCellNumberMapper mapAt:withState:](v40, "mapAt:withState:", v49, v11);
    v31 = 0;
    v16 = v47;
  }
  else if ((_DWORD)v21 == 3)
  {
    v23 = [EMCellTextMapper alloc];
    v24 = self->edCell;
    objc_msgSend(v11, "document");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "resources");
    v26 = (EDResources *)objc_claimAutoreleasedReturnValue();
    stringValueForEDCell(v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[EMCellTextMapper initWithEDString:style:parent:](v23, "initWithEDString:style:parent:", v27, v20, self);

    -[EMCellTextMapper mapAt:withState:columnWidth:height:spreadLeft:](v28, "mapAt:withState:columnWidth:height:spreadLeft:", v49, v11, self->spreadLeftFlag, self->columnWidth, a5);
    -[EMCellTextMapper contentWidth](v28, "contentWidth");
    v30 = v29;

    v31 = (unint64_t)v30;
  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v49, "stringValue");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "length");

  if (!v42)
    objc_msgSend(v49, "setStringValue:", CFSTR(" "));
  v43 = -[EMCellStyle initWithEDStyle:type:columnWidth:contentWidth:truncateContents:]([EMCellStyle alloc], "initWithEDStyle:type:columnWidth:contentWidth:truncateContents:", v20, v22, (unint64_t)self->columnWidth, v31, v48 ^ 1u);
  -[CMMapper archiver](self, "archiver");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addStyle:", v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", CFSTR("class"), v12, v45);
  }
  else
  {
    -[EMCellStyle cssStyleString](v43, "cssStyleString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "length"))
      -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", CFSTR("style"), v12, v46);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->edMergedCellReference, 0);
}

- (id)mapHyperlink:(id)a3 at:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v6 && !objc_msgSend(v6, "type"))
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C38, v8, v10);

    objc_msgSend(v7, "addChild:", v8);
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

@end
