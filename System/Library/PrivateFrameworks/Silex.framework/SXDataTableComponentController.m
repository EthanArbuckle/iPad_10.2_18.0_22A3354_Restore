@implementation SXDataTableComponentController

- (SXDataTableComponentController)initWithStyleFactory:(id)a3 textSourceFactory:(id)a4 dataSource:(id)a5 recordValueTransformerFactory:(id)a6 DOMObjectProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SXDataTableComponentController *v18;
  SXDataTableComponentController *v19;
  uint64_t v20;
  SXDataTableDictionary *cellObjects;
  uint64_t v22;
  SXDataTableDictionary *textLayouters;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SXDataTableComponentController;
  v18 = -[SXDataTableComponentController init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_styleFactory, a3);
    objc_storeStrong((id *)&v19->_textSourceFactory, a4);
    objc_storeWeak((id *)&v19->_dataSource, v15);
    +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", -[SXDataTableComponentController numberOfRows](v19, "numberOfRows"), -[SXDataTableComponentController numberOfColumns](v19, "numberOfColumns"));
    v20 = objc_claimAutoreleasedReturnValue();
    cellObjects = v19->_cellObjects;
    v19->_cellObjects = (SXDataTableDictionary *)v20;

    +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", -[SXDataTableComponentController numberOfRows](v19, "numberOfRows"), -[SXDataTableComponentController numberOfColumns](v19, "numberOfColumns"));
    v22 = objc_claimAutoreleasedReturnValue();
    textLayouters = v19->_textLayouters;
    v19->_textLayouters = (SXDataTableDictionary *)v22;

    objc_storeStrong((id *)&v19->_recordValueTransformerFactory, a6);
    objc_storeStrong((id *)&v19->_DOMObjectProvider, a7);
    -[SXDataTableComponentController loadRecords](v19, "loadRecords");
  }

  return v19;
}

- (void)loadRecords
{
  SXDataSortDescriptorFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SXDataSortDescriptorFactory);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SXDataTableComponentController component](self, "component", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortBy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "descriptor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXDataTableComponentController dataDescriptorForIdentifier:](self, "dataDescriptorForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[SXDataSortDescriptorFactory sortDescriptorForDataDescriptor:ascending:](v3, "sortDescriptorForDataDescriptor:ascending:", v13, objc_msgSend(v11, "direction") == 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v4, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  -[SXDataTableComponentController component](self, "component");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "recordsUsingSortDescriptors:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentController setRecords:](self, "setRecords:", v17);

}

- (void)prepareForLayout
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SXDataTableComponentController textLayouters](self, "textLayouters", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reset");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)indexPathIsHeader:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  BOOL result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[SXDataTableComponentController hasRowHeader](self, "hasRowHeader") && !var0)
    return 1;
  result = -[SXDataTableComponentController hasColumnHeader](self, "hasColumnHeader");
  if (var1)
    return 0;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPathSubstractingHeaders:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  _BOOL4 v6;
  _BOOL8 v7;
  unint64_t v8;
  _BOOL4 v9;
  _BOOL8 v10;
  unint64_t v11;
  unint64_t v12;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = -[SXDataTableComponentController hasRowHeader](self, "hasRowHeader");
  if (var0)
    v7 = v6;
  else
    v7 = 0;
  v8 = var0 - v7;
  v9 = -[SXDataTableComponentController hasColumnHeader](self, "hasColumnHeader");
  if (var1)
    v10 = v9;
  else
    v10 = 0;
  v11 = var1 - v10;
  v12 = v8;
  result.var1 = v11;
  result.var0 = v12;
  return result;
}

- (BOOL)hasColumnHeader
{
  void *v3;
  char v4;

  if (-[SXDataTableComponentController dataOrientation](self, "dataOrientation") != 1)
    return 0;
  -[SXDataTableComponentController component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showDescriptorLabels");

  return v4;
}

- (BOOL)hasRowHeader
{
  void *v4;
  char v5;

  if (-[SXDataTableComponentController dataOrientation](self, "dataOrientation"))
    return 0;
  -[SXDataTableComponentController component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showDescriptorLabels");

  return v5;
}

- (unint64_t)dataOrientation
{
  void *v2;
  unint64_t v3;

  -[SXDataTableComponentController component](self, "component");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataOrientation");

  return v3;
}

- (id)tableBorder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SXDataTableComponentController styleFactory](self, "styleFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataTableStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "border");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SXDataTableComponentController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unitConverterForDataTableComponentController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setUnitConverter:", v7);
  }
  return v5;
}

- (unint64_t)numberOfRows
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL8 v10;

  v3 = -[SXDataTableComponentController dataOrientation](self, "dataOrientation");
  -[SXDataTableComponentController component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "descriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = objc_msgSend(v5, "numberOfRecords");
  }

  v9 = -[SXDataTableComponentController hasRowHeader](self, "hasRowHeader");
  if (v8)
    v10 = v9;
  else
    v10 = 0;
  return v8 + v10;
}

- (unint64_t)numberOfColumns
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  _BOOL8 v10;

  v3 = -[SXDataTableComponentController dataOrientation](self, "dataOrientation");
  -[SXDataTableComponentController component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    v7 = objc_msgSend(v5, "numberOfRecords");
  }
  else
  {
    objc_msgSend(v5, "descriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count");

  }
  v9 = -[SXDataTableComponentController hasColumnHeader](self, "hasColumnHeader");
  if (v7)
    v10 = v9;
  else
    v10 = 0;
  return v7 + v10;
}

- (id)backgroundColorForRowAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[SXDataTableComponentController rowStyleForRowIndex:](self, "rowStyleForRowIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)backgroundColorForColumnAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[SXDataTableComponentController columnStyleForColumnIndex:](self, "columnStyleForColumnIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cellObjectForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableComponentController cellObjects](self, "cellObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForIndexPath:", var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[SXDataTableComponentController dataDescriptorForIndexPath:](self, "dataDescriptorForIndexPath:", var0, var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SXDataTableComponentController indexPathIsHeader:](self, "indexPathIsHeader:", var0, var1))
    {
      objc_msgSend(v8, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_7;
    }
    else
    {
      v9 = -[SXDataTableComponentController indexPathSubstractingHeaders:](self, "indexPathSubstractingHeaders:", var0, var1);
      -[SXDataTableComponentController recordForIndexPath:](self, "recordForIndexPath:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDataTableComponentController recordValueTransformerFactory](self, "recordValueTransformerFactory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordValueTransformerForDataDescriptor:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "transformValueForRecord:descriptor:", v11, v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
LABEL_7:

        return v7;
      }
    }
    -[SXDataTableComponentController cellObjects](self, "cellObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forIndexPath:", v7, var0, var1);

    goto LABEL_7;
  }
  return v7;
}

- (id)textLayouterForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  SXTextLayouter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXTextLayouter *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableComponentController textLayouters](self, "textLayouters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForIndexPath:", var0, var1);
  v7 = (SXTextLayouter *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[SXDataTableComponentController cellObjectForIndexPath:](self, "cellObjectForIndexPath:", var0, var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SXDataTableComponentController textSourceFactory](self, "textSourceFactory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textSourceWithFormattedText:indexPath:dataSource:", v8, var0, var1, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDefaultTextAlignment:", objc_msgSend(v11, "horizontalAlignment"));
      v12 = [SXTextLayouter alloc];
      -[SXDataTableComponentController dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textComponentLayoutHostingForDataTableComponentController:", self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentRoot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SXTextLayouter initWithTextSource:andDocumentRoot:](v12, "initWithTextSource:andDocumentRoot:", v10, v15);

      -[SXDataTableComponentController textLayouters](self, "textLayouters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forIndexPath:", v7, var0, var1);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (double)minimumWidthForCellAtIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  id v31;
  SXTextUtilities *v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  SXTextUtilities *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableComponentController cellObjectForIndexPath:](self, "cellObjectForIndexPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[SXDataTableComponentController dataDescriptorForIndexPath:](self, "dataDescriptorForIndexPath:", var0, var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "format");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "minimumWidth");
    -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v10, v11);
    v13 = v12;
    objc_msgSend(v9, "maximumWidth");
    if (v14)
    {
      v15 = objc_msgSend(v9, "maximumWidth");
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v15, v16);
      if (v13 >= v17)
        v13 = v17;
    }
    v18 = objc_msgSend(v9, "minimumHeight");
    -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v18, v19);
    v21 = v20;
    objc_msgSend(v9, "maximumHeight");
    if (v22)
    {
      v23 = objc_msgSend(v9, "maximumHeight");
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v23, v24);
      if (v21 >= v25)
        v21 = v25;
    }
    objc_msgSend(v7, "widthForImageHeight:", v21);
    if (v13 < v26)
      v13 = v26;
    objc_msgSend(v9, "maximumHeight");
    if (v27)
    {
      v28 = objc_msgSend(v9, "maximumHeight");
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v28, v29);
      if (v13 >= v30)
        v13 = v30;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  v13 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_23;
  v31 = v6;
  -[SXDataTableComponentController textLayouterForIndexPath:](self, "textLayouterForIndexPath:", var0, var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "shouldWrapText"))
  {
    objc_msgSend(v9, "wpStorage");
    v32 = (SXTextUtilities *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wpStorage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentController minimumWidthForStorage:usingStringEnumeration:](self, "minimumWidthForStorage:usingStringEnumeration:", v33, 3);
    v13 = v34;

    if (v13 != 0.0)
      goto LABEL_21;
    -[SXTextUtilities string](v32, "string");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");

    if (!v36)
      goto LABEL_21;
    objc_msgSend(v9, "wpStorage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentController minimumWidthForStorage:usingStringEnumeration:](self, "minimumWidthForStorage:usingStringEnumeration:", v37, 2);
  }
  else
  {
    v39 = [SXTextUtilities alloc];
    objc_msgSend(v9, "wpStorage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[TSWPText initWithParagraphStyle:](v39, "initWithParagraphStyle:", v41);

    objc_msgSend(v9, "wpStorage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSWPText measureStorage:](v32, "measureStorage:", v37);
  }
  v13 = v38;

LABEL_21:
LABEL_22:

LABEL_23:
  -[SXDataTableComponentController columnStyleForColumnIndex:](self, "columnStyleForColumnIndex:", var1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "minimumWidth");
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v44, v45);
  v47 = v46;
  v48 = objc_msgSend(v42, "minimumWidth");
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v48, v49);
  if (v50 < v47)
    v50 = v47;
  if (v13 < v50)
    v13 = v50;

  return v13;
}

- (double)heightForCellndexPath:(id)a3 forWidth:(double)a4
{
  unint64_t var1;
  unint64_t var0;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableComponentController cellObjectForIndexPath:](self, "cellObjectForIndexPath:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SXDataTableComponentController dataDescriptorForIndexPath:](self, "dataDescriptorForIndexPath:", var0, var1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    objc_msgSend(v9, "format");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maximumWidth");
    if (v12)
    {
      v13 = objc_msgSend(v11, "maximumWidth");
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v13, v14);
      if (v15 <= a4)
        a4 = v15;
    }
    objc_msgSend(v11, "maximumHeight");
    if (v16)
    {
      v17 = objc_msgSend(v11, "maximumHeight");
      -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v17, v18);
      v20 = v19;
    }
    else
    {
      v20 = 1.79769313e308;
    }
    objc_msgSend(v10, "sizeThatFits:", a4, v20);
    v21 = v23;

    goto LABEL_11;
  }
  objc_opt_class();
  v21 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SXDataTableComponentController textLayouterForIndexPath:](self, "textLayouterForIndexPath:", var0, var1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calculateHeightForWidth:", a4);
    v21 = v22;
LABEL_11:

  }
  return v21;
}

- (double)widthForCellAtIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableComponentController columnStyleForColumnIndex:](self, "columnStyleForColumnIndex:", a3.var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "width");
  if (v8 == 1.79769313e308)
  {
    v10 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "width");
    v10 = v9;
  }
  objc_msgSend(v7, "width");
  if (v11 > v10)
  {
    objc_msgSend(v7, "width");
    if (v12 != 1.79769313e308)
    {
      objc_msgSend(v7, "width");
      v10 = v13;
    }
  }

  return v10;
}

- (double)heightForCellAtIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableComponentController rowStyleForRowIndex:](self, "rowStyleForRowIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "height");
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v8, v9);
  v11 = v10;
  v12 = objc_msgSend(v7, "height");
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v12, v13);
  if (v11 < v14)
    v11 = v14;

  return v11;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)paddingForCellAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "padding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "left");
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v6, v7);
  v9 = v8;

  objc_msgSend(v4, "padding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "top");
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v11, v12);
  v14 = v13;

  objc_msgSend(v4, "padding");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "right");
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v16, v17);
  v19 = v18;

  objc_msgSend(v4, "padding");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "bottom");
  -[SXDataTableComponentController convertConvertibleValue:](self, "convertConvertibleValue:", v21, v22);
  v24 = v23;

  v25 = v14;
  v26 = v19;
  v27 = v24;
  v28 = v9;
  result.var3 = v28;
  result.var2 = v27;
  result.var1 = v26;
  result.var0 = v25;
  return result;
}

- (id)cellBorderForCellAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "border");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SXDataTableComponentController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unitConverterForDataTableComponentController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "border");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnitConverter:", v7);

  }
  objc_msgSend(v4, "border");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)verticalAlignmentForCellAtIndexPath:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verticalAlignment");

  return v4;
}

- (unint64_t)horizontalAlignmentForCellAtIndexPath:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalAlignment");

  return v4;
}

- (id)backgroundColorForCellAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", a3.var0, a3.var1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)rowDividerAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SXDataTableComponentController rowStyleForRowIndex:](self, "rowStyleForRowIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "divider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SXDataTableComponentController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unitConverterForDataTableComponentController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "divider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnitConverter:", v7);

  }
  objc_msgSend(v4, "divider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)columnDividerAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SXDataTableComponentController columnStyleForColumnIndex:](self, "columnStyleForColumnIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "divider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SXDataTableComponentController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unitConverterForDataTableComponentController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "divider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnitConverter:", v7);

  }
  objc_msgSend(v4, "divider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)textResizerForTextSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXDataTableComponentController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentColumnLayoutForDataTableComponentController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDataTableComponentController DOMObjectProvider](self, "DOMObjectProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SXDefaultTextStyleIdentifierForRole((uint64_t)CFSTR("body"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentController component](self, "component");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentTextStyleForIdentifiers:component:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[SXDataTableComponentController DOMObjectProvider](self, "DOMObjectProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("default");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableComponentController component](self, "component");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentTextStyleForIdentifiers:component:", v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = 1;
  -[SXDataTableComponentController componentTextStyleForTextSource:inheritingFromDefaultStyles:](self, "componentTextStyleForTextSource:inheritingFromDefaultStyles:", v4, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    v15 = objc_msgSend(v16, "fontScaling");
  v18 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)[SXTextResizer alloc], v6, v11, v15);

  return v18;
}

- (id)textRulesForTextSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXDataTableComponentController component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)additionsForTextSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "formattedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "formattedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "additions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "NSArray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (id)inlineTextStylesForTextSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "formattedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inlineTextStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "formattedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inlineTextStyles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "NSArray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SXDataTableComponentController component](self, "component");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "classification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultTextStyleIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v10);

  }
  v11 = objc_msgSend(v6, "indexPath");
  -[SXDataTableComponentController cellStyleForIndexPath:](self, "cellStyleForIndexPath:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textStyles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v14);

  objc_msgSend(v6, "formattedText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v6, "formattedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v18);

  }
  -[SXDataTableComponentController DOMObjectProvider](self, "DOMObjectProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentController component](self, "component");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentTextStyleForIdentifiers:component:", v7, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)defaultComponentTextStyleForTextSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  -[SXDataTableComponentController component](self, "component", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultTextStyleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDataTableComponentController DOMObjectProvider](self, "DOMObjectProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentController component](self, "component");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentTextStyleForIdentifiers:component:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)defaultComponentTextStylesForTextSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SXDataTableComponentController component](self, "component");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultTextStyleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[SXDataTableComponentController DOMObjectProvider](self, "DOMObjectProvider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXDataTableComponentController component](self, "component");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentTextStyleForIdentifiers:component:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v17, "addObject:", v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }

  return v17;
}

- (id)contentSizeCategoryForTextSource:(id)a3
{
  void *v4;
  void *v5;

  -[SXDataTableComponentController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSizeCategoryForDataTableComponentController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXDataTableComponentController DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentController component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStyleForIdentifier:component:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)rowStyleForRowIndex:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = -[SXDataTableComponentController shouldTreatIndexPathAsHeader:](self, "shouldTreatIndexPathAsHeader:", a3, -1);
  -[SXDataTableComponentController styleFactory](self, "styleFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 || !v5)
  {
    objc_msgSend(v6, "rowStyleForRowIndex:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "headerRowStyleForRowIndex:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)columnStyleForColumnIndex:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = -[SXDataTableComponentController shouldTreatIndexPathAsHeader:](self, "shouldTreatIndexPathAsHeader:", -1, a3);
  if (a3 || !v5)
  {
    v8 = a3 - -[SXDataTableComponentController hasColumnHeader](self, "hasColumnHeader");
    -[SXDataTableComponentController styleFactory](self, "styleFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "columnStyleForColumnIndex:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SXDataTableComponentController styleFactory](self, "styleFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "headerColumnStyleForColumnIndex:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

  return v9;
}

- (id)cellStyleForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = -[SXDataTableComponentController shouldTreatIndexPathAsHeader:](self, "shouldTreatIndexPathAsHeader:");
  -[SXDataTableComponentController styleFactory](self, "styleFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "headerCellStyleForIndexPath:", var0, var1);
  else
    objc_msgSend(v7, "cellStyleForIndexPath:", var0, var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)recordForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  void *v7;

  var1 = a3.var1;
  var0 = a3.var0;
  if (!-[SXDataTableComponentController dataOrientation](self, "dataOrientation"))
    var1 = var0;
  -[SXDataTableComponentController records](self, "records");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dataDescriptorForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[SXDataTableComponentController dataOrientation](self, "dataOrientation"))
    var1 = var0;
  -[SXDataTableComponentController component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dataDescriptorForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SXDataTableComponentController component](self, "component", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "identifier");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if (v15)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  return v8;
}

- (double)minimumWidthForStorage:(id)a3 usingStringEnumeration:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  double v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = objc_msgSend(v6, "length");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__SXDataTableComponentController_minimumWidthForStorage_usingStringEnumeration___block_invoke;
  v11[3] = &unk_24D68B2E0;
  v8 = v5;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, a4, v11);
  v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __80__SXDataTableComponentController_minimumWidthForStorage_usingStringEnumeration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  SXTextUtilities *v9;
  void *v10;
  SXTextUtilities *v11;
  double v12;
  uint64_t v13;
  id v14;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v7, "newSubstorageWithRange:context:flags:", a3, a4, v8, 0);

  v9 = [SXTextUtilities alloc];
  objc_msgSend(v14, "paragraphStyleAtParIndex:effectiveRange:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TSWPText initWithParagraphStyle:](v9, "initWithParagraphStyle:", v10);

  -[TSWPText measureStorage:](v11, "measureStorage:", v14);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v13 + 24) >= v12)
    v12 = *(double *)(v13 + 24);
  *(double *)(v13 + 24) = v12;

}

- (id)component
{
  void *v3;
  void *v4;

  -[SXDataTableComponentController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentForDataTableComponentController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)convertConvertibleValue:(_SXConvertibleValue)a3
{
  unint64_t unit;
  double value;
  void *v6;
  void *v7;
  double v8;
  double v9;

  unit = a3.unit;
  value = a3.value;
  -[SXDataTableComponentController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitConverterForDataTableComponentController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertValueToPoints:", *(_QWORD *)&value, unit);
  v9 = v8;

  return v9;
}

- (SXDataTableDictionary)cellObjects
{
  return self->_cellObjects;
}

- (SXDataTableDictionary)textLayouters
{
  return self->_textLayouters;
}

- (SXDataTableComponentControllerDataSource)dataSource
{
  return (SXDataTableComponentControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SXDataTableStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (SXDataTableTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (SXDataRecordValueTransformerFactory)recordValueTransformerFactory
{
  return self->_recordValueTransformerFactory;
}

- (void)setRecordValueTransformerFactory:(id)a3
{
  objc_storeStrong((id *)&self->_recordValueTransformerFactory, a3);
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_recordValueTransformerFactory, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_textLayouters, 0);
  objc_storeStrong((id *)&self->_cellObjects, 0);
}

@end
