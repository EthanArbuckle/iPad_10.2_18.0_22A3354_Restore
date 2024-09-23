@implementation EDFormulaHelper

- (EDFormulaHelper)initWithWorkbook:(id)a3 worksheet:(id)a4 rowNumber:(int)a5 columnNumber:(int)a6
{
  id v11;
  id v12;
  EDFormulaHelper *v13;
  EDFormulaHelper *v14;
  uint64_t v15;
  ECMappingContext *mMappingContext;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EDFormulaHelper;
  v13 = -[EDFormulaHelper init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mWorkbook, a3);
    objc_storeStrong((id *)&v14->mWorksheet, a4);
    v14->mRowNumber = a5;
    v14->mColumnNumber = a6;
    objc_msgSend(v11, "mappingContext");
    v15 = objc_claimAutoreleasedReturnValue();
    mMappingContext = v14->mMappingContext;
    v14->mMappingContext = (ECMappingContext *)v15;

  }
  return v14;
}

- (int)resolveFunctionName:(id)a3
{
  id v3;
  id v4;
  unsigned __int16 *var1;
  int v6;
  CsString v8;

  v3 = a3;
  CsString::CsString(&v8);
  v4 = objc_retainAutorelease(v3);
  CsString::append(&v8, (const unsigned __int16 *)objc_msgSend(v4, "cStringUsingEncoding:", 10), objc_msgSend(v4, "length"));
  if (v8.var1)
    var1 = v8.var1;
  else
    var1 = (unsigned __int16 *)&unk_22A4C1F40;
  v6 = XlFunctionIdForName(var1);
  CsString::~CsString(&v8);

  return v6;
}

- (unint64_t)resolveName:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  v5 = -[EDWorkbook indexOfSheet:](self->mWorkbook, "indexOfSheet:", self->mWorksheet);
  -[EDWorkbook resources](self->mWorkbook, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "names");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "nameString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0 && (!objc_msgSend(v11, "sheetIndex") || v5 == objc_msgSend(v11, "sheetIndex")))
          break;
      }

      if (v8 == ++v9)
        goto LABEL_8;
    }

  }
  else
  {
LABEL_8:
    v9 = -1;
  }

  return v9;
}

- (id)resolveTable:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  int mColumnNumber;
  int v21;
  int mRowNumber;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = -[EDWorkbook sheetCount](self->mWorkbook, "sheetCount");
    if (v5)
    {
      v6 = 0;
      while (1)
      {
        -[EDWorksheet tables](self->mWorksheet, "tables");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
          break;
LABEL_8:
        if (++v6 == v5)
          goto LABEL_17;
      }
      v9 = 0;
      while (1)
      {
        -[EDWorksheet tables](self->mWorksheet, "tables");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
          goto LABEL_18;

        if (v8 == ++v9)
          goto LABEL_8;
      }
    }
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  -[EDWorksheet tables](self->mWorksheet, "tables");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
    goto LABEL_17;
  v16 = 0;
  while (1)
  {
    -[EDWorksheet tables](self->mWorksheet, "tables");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "tableRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "firstColumn");
    mColumnNumber = self->mColumnNumber;
    if (v19 <= mColumnNumber && mColumnNumber <= (int)objc_msgSend(v18, "lastColumn"))
    {
      v21 = objc_msgSend(v18, "firstRow");
      mRowNumber = self->mRowNumber;
      if (v21 <= mRowNumber && mRowNumber <= (int)objc_msgSend(v18, "lastRow"))
        break;
    }

    if (v15 == ++v16)
      goto LABEL_17;
  }

LABEL_18:
  return v11;
}

- (unint64_t)resolveSheet:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  char v7;
  unint64_t v8;

  v4 = a3;
  v5 = -[ECMappingContext mappedSheetIndexForSheetName:](self->mMappingContext, "mappedSheetIndexForSheetName:", v4);
  if (v5 == -1)
  {
    -[EDWorkbook workbookName](self->mWorkbook, "workbookName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = -1;
      goto LABEL_5;
    }
    v5 = 0;
  }
  v8 = -[EDFormulaHelper createIndexWithType:firstSheetIndex:lastSheetIndex:](self, "createIndexWithType:firstSheetIndex:lastSheetIndex:", 1, v5, v5);
LABEL_5:

  return v8;
}

- (unint64_t)createIndexWithType:(int)a3 firstSheetIndex:(unint64_t)a4 lastSheetIndex:(unint64_t)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v7 = *(_QWORD *)&a3;
  -[EDWorkbook resources](self->mWorkbook, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "links");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "addOrEquivalentLinkReferenceOfType:firstSheetIndex:lastSheetIndex:", v7, a4, a5);

  return v10;
}

- (BOOL)isCurrentSheet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[EDSheet name](self->mWorksheet, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

- (unint64_t)resolveTableToSheetId:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    -[EDSheet name](self->mWorksheet, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[EDFormulaHelper resolveSheet:](self, "resolveSheet:", v12);
LABEL_13:

    goto LABEL_14;
  }
  v5 = -[EDWorkbook sheetCount](self->mWorkbook, "sheetCount");
  if (v5)
  {
    v6 = 0;
    while (1)
    {
      -[EDWorkbook sheetAtIndex:loadIfNeeded:](self->mWorkbook, "sheetAtIndex:loadIfNeeded:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "tables");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9)
          break;
      }
LABEL_9:

      if (++v6 == v5)
        goto LABEL_10;
    }
    v10 = 0;
    while (1)
    {
      objc_msgSend(v7, "tables");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v4);

      if (v14)
        break;

      if (v9 == ++v10)
        goto LABEL_9;
    }
    objc_msgSend(v7, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[EDFormulaHelper resolveSheet:](self, "resolveSheet:", v17);

    goto LABEL_13;
  }
LABEL_10:
  v15 = -1;
LABEL_14:

  return v15;
}

- (unint64_t)resolveFirstSheet:(id)a3 lastSheet:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;

  v6 = a4;
  v7 = -[ECMappingContext mappedSheetIndexForSheetName:](self->mMappingContext, "mappedSheetIndexForSheetName:", a3);
  v8 = -[ECMappingContext mappedSheetIndexForSheetName:](self->mMappingContext, "mappedSheetIndexForSheetName:", v6);
  if (v7 == -1 || v8 == -1)
    v10 = -1;
  else
    v10 = -[EDFormulaHelper createIndexWithType:firstSheetIndex:lastSheetIndex:](self, "createIndexWithType:firstSheetIndex:lastSheetIndex:", 1, v7, v8);

  return v10;
}

- (unint64_t)resolveFile:(id)a3
{
  return -[EDFormulaHelper createIndexWithType:firstSheetIndex:lastSheetIndex:](self, "createIndexWithType:firstSheetIndex:lastSheetIndex:", 2, 65534, 65534);
}

- (unint64_t)resolveTableColumn:(id)a3 columnName:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a4;
  objc_msgSend(a3, "tableColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v5);

      if ((v11 & 1) != 0)
        break;
      if (v7 == ++v8)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8 = -1;
  }

  return v8;
}

- (id)workbook
{
  return self->mWorkbook;
}

- (int)rowNumber
{
  return self->mRowNumber;
}

- (int)columnNumber
{
  return self->mColumnNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMappingContext, 0);
  objc_storeStrong((id *)&self->mWorksheet, 0);
  objc_storeStrong((id *)&self->mWorkbook, 0);
}

@end
