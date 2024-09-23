@implementation QLItem

- (void)_commonInit
{
  self->_canBeShared = 1;
  self->_useLoadingTimeout = 1;
}

- (QLItem)initWithPreviewItemProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5 fileSize:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  QLItem *v15;
  QLItem *v16;
  uint64_t v17;
  QLUTIAnalyzer *UTIAnalyzer;
  QLItem *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)QLItem;
  v15 = -[QLItem init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_previewItemProvider, a3);
    objc_storeStrong((id *)&v16->_itemSize, a6);
    objc_storeStrong((id *)&v16->_previewItemContentType, a4);
    objc_storeStrong((id *)&v16->_previewItemTitle, a5);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD3308]), "initWithContentType:", v12);
    UTIAnalyzer = v16->_UTIAnalyzer;
    v16->_UTIAnalyzer = (QLUTIAnalyzer *)v17;

    -[QLItem _commonInit](v16, "_commonInit");
    v19 = v16;
  }

  return v16;
}

- (QLItem)initWithFPItem:(id)a3
{
  id v5;
  QLItem *v6;
  QLItem *v7;
  uint64_t v8;
  NSString *previewItemContentType;
  uint64_t v10;
  NSString *previewItemTitle;
  uint64_t v12;
  QLUTIAnalyzer *UTIAnalyzer;
  QLItem *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)QLItem;
  v6 = -[QLItem init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fpItem, a3);
    objc_msgSend(v5, "typeIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    previewItemContentType = v7->_previewItemContentType;
    v7->_previewItemContentType = (NSString *)v8;

    objc_msgSend(v5, "displayName");
    v10 = objc_claimAutoreleasedReturnValue();
    previewItemTitle = v7->_previewItemTitle;
    v7->_previewItemTitle = (NSString *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD3308]), "initWithContentType:", v7->_previewItemContentType);
    UTIAnalyzer = v7->_UTIAnalyzer;
    v7->_UTIAnalyzer = (QLUTIAnalyzer *)v12;

    -[QLItem _commonInit](v7, "_commonInit");
    v14 = v7;
  }

  return v7;
}

- (QLItem)initWithData:(id)a3 contentType:(id)a4 previewTitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  QLItem *v12;
  QLItem *v13;
  uint64_t v14;
  QLUTIAnalyzer *UTIAnalyzer;
  QLItem *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)QLItem;
  v12 = -[QLItem init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_previewItemData, a3);
    objc_storeStrong((id *)&v13->_previewItemContentType, a4);
    objc_storeStrong((id *)&v13->_previewItemTitle, a5);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD3308]), "initWithContentType:", v10);
    UTIAnalyzer = v13->_UTIAnalyzer;
    v13->_UTIAnalyzer = (QLUTIAnalyzer *)v14;

    -[QLItem _commonInit](v13, "_commonInit");
    v16 = v13;
  }

  return v13;
}

- (QLItem)initWithDataProvider:(id)a3 contentType:(id)a4 previewTitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  QLItem *v12;
  QLItem *v13;
  uint64_t v14;
  QLUTIAnalyzer *UTIAnalyzer;
  QLItem *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)QLItem;
  v12 = -[QLItem init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_previewItemDataProvider, a3);
    objc_storeStrong((id *)&v13->_previewItemContentType, a4);
    objc_storeStrong((id *)&v13->_previewItemTitle, a5);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD3308]), "initWithContentType:", v10);
    UTIAnalyzer = v13->_UTIAnalyzer;
    v13->_UTIAnalyzer = (QLUTIAnalyzer *)v14;

    -[QLItem _commonInit](v13, "_commonInit");
    v16 = v13;
  }

  return v13;
}

- (QLItem)initWithURL:(id)a3
{
  id v4;
  QLItem *v5;
  QLItem *v6;
  id v7;
  void *v8;
  uint64_t v9;
  QLUTIAnalyzer *UTIAnalyzer;
  QLItem *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLItem;
  v5 = -[QLItem init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[QLItem setPreviewItemURL:](v5, "setPreviewItemURL:", v4);
    v7 = objc_alloc(MEMORY[0x1E0CD3308]);
    -[QLItem previewItemURL](v6, "previewItemURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithURL:", v8);
    UTIAnalyzer = v6->_UTIAnalyzer;
    v6->_UTIAnalyzer = (QLUTIAnalyzer *)v9;

    -[QLItem _commonInit](v6, "_commonInit");
    v11 = v6;
  }

  return v6;
}

- (QLItem)initWithURL:(id)a3 previewTitle:(id)a4 editingMode:(int64_t)a5
{
  id v8;
  id v9;
  QLItem *v10;
  QLItem *v11;
  id v12;
  void *v13;
  uint64_t v14;
  QLUTIAnalyzer *UTIAnalyzer;
  QLItem *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)QLItem;
  v10 = -[QLItem init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    -[QLItem setPreviewItemURL:](v10, "setPreviewItemURL:", v8);
    objc_storeStrong((id *)&v11->_previewItemTitle, a4);
    v11->_editingMode = a5;
    v12 = objc_alloc(MEMORY[0x1E0CD3308]);
    -[QLItem previewItemURL](v11, "previewItemURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithURL:", v13);
    UTIAnalyzer = v11->_UTIAnalyzer;
    v11->_UTIAnalyzer = (QLUTIAnalyzer *)v14;

    -[QLItem _commonInit](v11, "_commonInit");
    v16 = v11;
  }

  return v11;
}

- (QLItem)initWithURLSandboxWrapper:(id)a3
{
  id v5;
  QLItem *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  QLUTIAnalyzer *UTIAnalyzer;
  QLItem *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLItem;
  v6 = -[QLItem init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItem setPreviewItemURL:](v6, "setPreviewItemURL:", v7);

    objc_storeStrong((id *)&v6->_sandboxingURLWrapper, a3);
    v8 = objc_alloc(MEMORY[0x1E0CD3308]);
    -[QLItem previewItemURL](v6, "previewItemURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithURL:", v9);
    UTIAnalyzer = v6->_UTIAnalyzer;
    v6->_UTIAnalyzer = (QLUTIAnalyzer *)v10;

    -[QLItem _commonInit](v6, "_commonInit");
    v12 = v6;
  }

  return v6;
}

- (QLItem)initWithURLSandboxWrapper:(id)a3 previewTitle:(id)a4 editingMode:(int64_t)a5
{
  id v9;
  id v10;
  QLItem *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  QLUTIAnalyzer *UTIAnalyzer;
  QLItem *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)QLItem;
  v11 = -[QLItem init](&v19, sel_init);
  if (v11)
  {
    objc_msgSend(v9, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItem setPreviewItemURL:](v11, "setPreviewItemURL:", v12);

    objc_storeStrong((id *)&v11->_sandboxingURLWrapper, a3);
    objc_storeStrong((id *)&v11->_previewItemTitle, a4);
    v11->_editingMode = a5;
    v13 = objc_alloc(MEMORY[0x1E0CD3308]);
    -[QLItem previewItemURL](v11, "previewItemURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithURL:", v14);
    UTIAnalyzer = v11->_UTIAnalyzer;
    v11->_UTIAnalyzer = (QLUTIAnalyzer *)v15;

    -[QLItem _commonInit](v11, "_commonInit");
    v17 = v11;
  }

  return v11;
}

- (QLItem)initWithURL:(id)a3 MIMEType:(id)a4
{
  id v6;
  id v7;
  QLItem *v8;
  QLItem *v9;
  void *v10;
  QLItem *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)QLItem;
  v8 = -[QLItem init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[QLItem setPreviewItemURL:](v8, "setPreviewItemURL:", v6);
    v10 = (void *)QLTypeCopyUTIForURLAndMimeType(v6, v7);
    -[QLItem setPreviewItemContentType:](v9, "setPreviewItemContentType:", v10);

    -[QLItem _commonInit](v9, "_commonInit");
    v11 = v9;
  }

  return v9;
}

- (QLItem)initWithSearchableItemUniqueIdentifier:(id)a3 queryString:(id)a4 applicationBundleIdentifier:(id)a5 previewTitle:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  QLItem *v15;
  QLItem *v16;
  QLItem *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)QLItem;
  v15 = -[QLItem init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_searchableItemIdentifier, a3);
    objc_storeStrong((id *)&v16->_spotlightQueryString, a4);
    objc_storeStrong((id *)&v16->_searchableItemApplicationBundleIdentifier, a5);
    objc_storeStrong((id *)&v16->_previewItemTitle, a6);
    -[QLItem _commonInit](v16, "_commonInit");
    v17 = v16;
  }

  return v16;
}

- (QLItem)initWithSearchableItemUniqueIdentifier:(id)a3 applicationBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  QLItem *v9;
  QLItem *v10;
  QLItem *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)QLItem;
  v9 = -[QLItem init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_previewItemType = 14;
    objc_storeStrong((id *)&v9->_searchableItemIdentifier, a3);
    objc_storeStrong((id *)&v10->_searchableItemApplicationBundleIdentifier, a4);
    -[QLItem _commonInit](v10, "_commonInit");
    v11 = v10;
  }

  return v10;
}

- (QLItem)init
{
  QLItem *v2;
  QLItem *v3;
  QLItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLItem;
  v2 = -[QLItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[QLItem _commonInit](v2, "_commonInit");
    v4 = v3;
  }

  return v3;
}

+ (id)itemWithPreviewItem:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    v5 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "internalCopy");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOriginalPreviewItem:", v3);
    }
    else
    {
      v5 = (id)objc_opt_new();
      objc_msgSend(v5, "setOriginalPreviewItem:", v3);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "previewItemTitle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(v3, "previewItemTitle");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setPreviewItemTitle:", v7);

        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "backgroundColorOverride");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setBackgroundColorOverride:", v8);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "previewItemContentType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPreviewItemContentType:", v9);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "MIMEType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)QLTypeCopyUTIForURLAndMimeType(0, v10);
        objc_msgSend(v5, "setPreviewItemContentType:", v11);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "setIsPromisedItem:", objc_msgSend(v3, "isPromisedItem"));
      }
      else
      {
        objc_msgSend(v5, "previewItemURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setIsPromisedItem:", v12 == 0);

      }
      objc_msgSend(v5, "previewItemContentType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_alloc(MEMORY[0x1E0CD3308]);
      if (v13)
      {
        objc_msgSend(v5, "previewItemContentType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "initWithContentType:", v15);
      }
      else
      {
        objc_msgSend(v5, "previewItemURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "initWithURL:", v15);
      }
      v17 = (void *)v16;
      objc_msgSend(v5, "setUTIAnalyzer:", v16);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "previewOptions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setClientPreviewOptions:", v18);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "previewItemDisplayState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPreviewItemDisplayState:", v19);

      }
    }
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  char v4;
  objc_super v5;

  -[QLItem editedCopy](self, "editedCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "temporaryDirectoryWasCreatedInHost");

  if ((v4 & 1) == 0)
    -[QLItem _removeEditedCopyIfExists](self, "_removeEditedCopyIfExists");
  v5.receiver = self;
  v5.super_class = (Class)QLItem;
  -[QLItem dealloc](&v5, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  unint64_t v44;
  int64_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  char v69;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[QLItem previewItemURL](self, "previewItemURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewItemURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = __18__QLItem_isEqual___block_invoke((uint64_t)v7, v6, v7);

    if (!v8)
      goto LABEL_28;
    -[QLItem previewItemData](self, "previewItemData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewItemData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = __18__QLItem_isEqual___block_invoke((uint64_t)v10, v9, v10);

    if (!v11)
      goto LABEL_28;
    -[QLItem fpItem](self, "fpItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fpItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = __18__QLItem_isEqual___block_invoke((uint64_t)v13, v12, v13);

    if (!v14)
      goto LABEL_28;
    -[QLItem relativePath](self, "relativePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relativePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = __18__QLItem_isEqual___block_invoke((uint64_t)v16, v15, v16);

    if (!v17)
      goto LABEL_28;
    -[QLItem previewItemProvider](self, "previewItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewItemProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = __18__QLItem_isEqual___block_invoke((uint64_t)v19, v18, v19);

    if (!v20)
      goto LABEL_28;
    -[QLItem itemSize](self, "itemSize");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemSize");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = __18__QLItem_isEqual___block_invoke((uint64_t)v22, v21, v22);

    if (!v23)
      goto LABEL_28;
    -[QLItem previewItemContentType](self, "previewItemContentType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewItemContentType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = __18__QLItem_isEqual___block_invoke((uint64_t)v25, v24, v25);

    if (!v26)
      goto LABEL_28;
    -[QLItem backgroundColorOverride](self, "backgroundColorOverride");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColorOverride");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = __18__QLItem_isEqual___block_invoke((uint64_t)v28, v27, v28);

    if (!v29)
      goto LABEL_28;
    -[QLItem previewItemTitle](self, "previewItemTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewItemTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = __18__QLItem_isEqual___block_invoke((uint64_t)v31, v30, v31);

    if (!v32)
      goto LABEL_28;
    -[QLItem editedFileURL](self, "editedFileURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editedFileURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = __18__QLItem_isEqual___block_invoke((uint64_t)v34, v33, v34);

    if (!v35)
      goto LABEL_28;
    -[QLItem password](self, "password");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "password");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = __18__QLItem_isEqual___block_invoke((uint64_t)v37, v36, v37);

    if (!v38)
      goto LABEL_28;
    -[QLItem uuid](self, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = __18__QLItem_isEqual___block_invoke((uint64_t)v40, v39, v40);

    if (!v41)
      goto LABEL_28;
    -[QLItem previewItemDataProvider](self, "previewItemDataProvider");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewItemDataProvider");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42 != v43)
      goto LABEL_28;
    v44 = -[QLItem previewItemType](self, "previewItemType");
    if (v44 != objc_msgSend(v5, "previewItemType"))
      goto LABEL_28;
    v45 = -[QLItem processIdentifier](self, "processIdentifier");
    if (v45 != objc_msgSend(v5, "processIdentifier"))
      goto LABEL_28;
    v46 = -[QLItem isPromisedItem](self, "isPromisedItem");
    if (v46 != objc_msgSend(v5, "isPromisedItem"))
      goto LABEL_28;
    v47 = -[QLItem useFullPDFTransition](self, "useFullPDFTransition");
    if (v47 != objc_msgSend(v5, "useFullPDFTransition"))
      goto LABEL_28;
    v48 = -[QLItem useLoadingTimeout](self, "useLoadingTimeout");
    if (v48 != objc_msgSend(v5, "useLoadingTimeout"))
      goto LABEL_28;
    v49 = -[QLItem wantsPreviewInDebugViewController](self, "wantsPreviewInDebugViewController");
    if (v49 != objc_msgSend(v5, "wantsPreviewInDebugViewController"))
      goto LABEL_28;
    -[QLItem sandboxingURLWrapper](self, "sandboxingURLWrapper");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "url");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sandboxingURLWrapper");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "url");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = __18__QLItem_isEqual___block_invoke((uint64_t)v53, v51, v53);

    if (!v54)
      goto LABEL_28;
    -[QLItem searchableItemIdentifier](self, "searchableItemIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchableItemIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = __18__QLItem_isEqual___block_invoke((uint64_t)v56, v55, v56);

    if (!v57)
      goto LABEL_28;
    -[QLItem spotlightQueryString](self, "spotlightQueryString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightQueryString");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = __18__QLItem_isEqual___block_invoke((uint64_t)v59, v58, v59);

    if (!v60)
      goto LABEL_28;
    -[QLItem searchableItemApplicationBundleIdentifier](self, "searchableItemApplicationBundleIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchableItemApplicationBundleIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = __18__QLItem_isEqual___block_invoke((uint64_t)v62, v61, v62);

    if (!v63)
      goto LABEL_28;
    -[QLItem previewItemProviderProgress](self, "previewItemProviderProgress");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewItemProviderProgress");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = __18__QLItem_isEqual___block_invoke((uint64_t)v65, v64, v65);

    if (v66)
    {
      -[QLItem clientPreviewOptions](self, "clientPreviewOptions");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientPreviewOptions");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = __18__QLItem_isEqual___block_invoke((uint64_t)v68, v67, v68);

    }
    else
    {
LABEL_28:
      v69 = 0;
    }

  }
  else
  {
    v69 = 0;
  }

  return v69;
}

uint64_t __18__QLItem_isEqual___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  v5 = a3;
  v6 = (void *)v5;
  if (v4 | v5)
  {
    v7 = 0;
    if (v4 && v5)
      v7 = objc_msgSend((id)v4, "isEqual:", v5);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)internalCopy
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setPreviewItemURL:", self->_previewItemURL);
  objc_msgSend(v3, "setPreviewItemData:", self->_previewItemData);
  objc_msgSend(v3, "setFpItem:", self->_fpItem);
  objc_msgSend(v3, "setPreviewItemProvider:", self->_previewItemProvider);
  objc_msgSend(v3, "setRelativePath:", self->_relativePath);
  objc_msgSend(v3, "setItemSize:", self->_itemSize);
  -[QLItem fetcher](self, "fetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetcher:", v4);

  objc_msgSend(v3, "setUTIAnalyzer:", self->_UTIAnalyzer);
  objc_msgSend(v3, "setPreviewItemContentType:", self->_previewItemContentType);
  objc_msgSend(v3, "setPreviewItemType:", self->_previewItemType);
  objc_msgSend(v3, "setBackgroundColorOverride:", self->_backgroundColorOverride);
  objc_msgSend(v3, "setPreviewItemTitle:", self->_previewItemTitle);
  objc_msgSend(v3, "setEditedCopy:", self->_editedCopy);
  objc_msgSend(v3, "setPassword:", self->_password);
  objc_msgSend(v3, "setUuid:", self->_uuid);
  objc_msgSend(v3, "setProcessIdentifier:", self->_processIdentifier);
  objc_msgSend(v3, "setIsPromisedItem:", self->_isPromisedItem);
  objc_msgSend(v3, "setUseFullPDFTransition:", self->_useFullPDFTransition);
  objc_msgSend(v3, "setUseLoadingTimeout:", self->_useLoadingTimeout);
  objc_msgSend(v3, "setSearchableItemIdentifier:", self->_searchableItemIdentifier);
  objc_msgSend(v3, "setSpotlightQueryString:", self->_spotlightQueryString);
  objc_msgSend(v3, "setSearchableItemApplicationBundleIdentifier:", self->_searchableItemApplicationBundleIdentifier);
  objc_msgSend(v3, "setCanBeShared:", self->_canBeShared);
  objc_msgSend(v3, "setCanBeEdited:", self->_canBeEdited);
  objc_msgSend(v3, "setCanHandleEditedCopy:", self->_canHandleEditedCopy);
  objc_msgSend(v3, "setOriginalContentWasUpdated:", self->_originalContentWasUpdated);
  objc_msgSend(v3, "setEditingMode:", self->_editingMode);
  objc_msgSend(v3, "setEditedFileBehavior:", self->_editedFileBehavior);
  objc_msgSend(v3, "setShouldPreventMachineReadableCodeDetection:", self->_shouldPreventMachineReadableCodeDetection);
  objc_msgSend(v3, "setWantsPreviewInDebugViewController:", self->_wantsPreviewInDebugViewController);
  objc_msgSend(v3, "setPreviewItemDataProvider:", self->_previewItemDataProvider);
  objc_msgSend(v3, "setSandboxingURLWrapper:", self->_sandboxingURLWrapper);
  objc_msgSend(v3, "setClientPreviewOptions:", self->_clientPreviewOptions);
  objc_msgSend(v3, "setClientPreviewItemDisplayState:", self->_clientPreviewItemDisplayState);
  objc_msgSend(v3, "setInternalShouldCreateTemporaryDirectoryInHost:", self->_internalShouldCreateTemporaryDirectoryInHost);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
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
  void *v15;
  void *v16;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v44 = a3;
  -[QLItem previewItemURL](self, "previewItemURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QLItem previewItemURL](self, "previewItemURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v5, CFSTR("previewItemURL"));

  }
  -[QLItem previewItemData](self, "previewItemData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[QLItem previewItemData](self, "previewItemData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v7, CFSTR("previewItemData"));

  }
  -[QLItem fpItem](self, "fpItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[QLItem fpItem](self, "fpItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v9, CFSTR("fpItem"));

  }
  -[QLItem relativePath](self, "relativePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[QLItem relativePath](self, "relativePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v11, CFSTR("relativePath"));

  }
  -[QLItem itemSize](self, "itemSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[QLItem itemSize](self, "itemSize");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v13, CFSTR("itemSize"));

  }
  -[QLItem fetcher](self, "fetcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[QLItem fetcher](self, "fetcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v15, CFSTR("fetcher"));

  }
  -[QLItem UTIAnalyzer](self, "UTIAnalyzer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[QLItem UTIAnalyzer](self, "UTIAnalyzer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v17, CFSTR("UTIAnalyzer"));

  }
  -[QLItem previewItemContentType](self, "previewItemContentType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[QLItem previewItemContentType](self, "previewItemContentType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v19, CFSTR("previewItemContentType"));

  }
  -[QLItem backgroundColorOverride](self, "backgroundColorOverride");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[QLItem backgroundColorOverride](self, "backgroundColorOverride");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v21, CFSTR("backgroundColorOverride"));

  }
  -[QLItem previewItemTitle](self, "previewItemTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[QLItem previewItemTitle](self, "previewItemTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v23, CFSTR("previewItemTitle"));

  }
  -[QLItem password](self, "password");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[QLItem password](self, "password");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v25, CFSTR("password"));

  }
  -[QLItem uuid](self, "uuid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[QLItem uuid](self, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v27, CFSTR("uuid"));

  }
  -[QLItem searchableItemIdentifier](self, "searchableItemIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[QLItem searchableItemIdentifier](self, "searchableItemIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v29, CFSTR("searchableItemIdentifier"));

  }
  -[QLItem spotlightQueryString](self, "spotlightQueryString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[QLItem spotlightQueryString](self, "spotlightQueryString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v31, CFSTR("spotlightQueryString"));

  }
  -[QLItem searchableItemApplicationBundleIdentifier](self, "searchableItemApplicationBundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[QLItem searchableItemApplicationBundleIdentifier](self, "searchableItemApplicationBundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v33, CFSTR("searchableItemApplicationBundleIdentifier"));

  }
  -[QLItem sandboxingURLWrapper](self, "sandboxingURLWrapper");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[QLItem sandboxingURLWrapper](self, "sandboxingURLWrapper");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v35, CFSTR("sandboxingURLWrapper"));

  }
  -[QLItem clientPreviewOptions](self, "clientPreviewOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[QLItem clientPreviewOptions](self, "clientPreviewOptions");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v37, CFSTR("clientPreviewOptions"));

  }
  -[QLItem clientPreviewItemDisplayState](self, "clientPreviewItemDisplayState");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[QLItem clientPreviewItemDisplayState](self, "clientPreviewItemDisplayState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v39, CFSTR("clientPreviewItemDisplayState"));

  }
  -[QLItem generatedURLHandler](self, "generatedURLHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[QLItem generatedURLHandler](self, "generatedURLHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "encodeObject:forKey:", v41, CFSTR("generatedURLHandler"));

  }
  -[QLItem internalShouldCreateTemporaryDirectoryInHost](self, "internalShouldCreateTemporaryDirectoryInHost");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "encodeBool:forKey:", objc_msgSend(v42, "BOOLValue"), CFSTR("internalShouldCreateTemporaryDirectoryInHost"));

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "encodeInteger:forKey:", (int)objc_msgSend(v43, "processIdentifier"), CFSTR("processIdentifier"));

  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem isPromisedItem](self, "isPromisedItem"), CFSTR("isPromisedItem"));
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem useFullPDFTransition](self, "useFullPDFTransition"), CFSTR("useFullPDFTransition"));
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem useLoadingTimeout](self, "useLoadingTimeout"), CFSTR("useLoadingTimeout"));
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem canBeShared](self, "canBeShared"), CFSTR("canBeShared"));
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem canBeEdited](self, "canBeEdited"), CFSTR("canBeEdited"));
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem canHandleEditedCopy](self, "canHandleEditedCopy"), CFSTR("canHandleEditedCopy"));
  objc_msgSend(v44, "encodeInteger:forKey:", -[QLItem editingMode](self, "editingMode"), CFSTR("editingMode"));
  objc_msgSend(v44, "encodeInteger:forKey:", -[QLItem editedFileBehavior](self, "editedFileBehavior"), CFSTR("editedFileBehavior"));
  objc_msgSend(v44, "encodeInteger:forKey:", -[QLItem shouldPreventMachineReadableCodeDetection](self, "shouldPreventMachineReadableCodeDetection"), CFSTR("shouldPreventMachineReadableCodeDetection"));
  objc_msgSend(v44, "encodeBool:forKey:", -[QLItem wantsPreviewInDebugViewController](self, "wantsPreviewInDebugViewController"), CFSTR("wantsPreviewInDebugViewController"));

}

- (QLItem)initWithCoder:(id)a3
{
  id v4;
  QLItem *v5;
  void *v6;
  uint64_t v7;
  QLItemFetcher *fetcher;
  uint64_t v9;
  QLUTIAnalyzer *UTIAnalyzer;
  uint64_t v11;
  FPItem *fpItem;
  uint64_t v13;
  NSURL *previewItemURL;
  uint64_t v15;
  NSData *previewItemData;
  uint64_t v17;
  NSString *relativePath;
  uint64_t v19;
  NSNumber *itemSize;
  uint64_t v21;
  NSString *previewItemContentType;
  uint64_t v23;
  UIColor *backgroundColorOverride;
  uint64_t v25;
  NSString *previewItemTitle;
  uint64_t v27;
  NSString *password;
  uint64_t v29;
  NSUUID *uuid;
  uint64_t v31;
  NSString *searchableItemIdentifier;
  uint64_t v33;
  NSString *spotlightQueryString;
  uint64_t v35;
  NSString *searchableItemApplicationBundleIdentifier;
  uint64_t v37;
  FPSandboxingURLWrapper *sandboxingURLWrapper;
  uint64_t v39;
  uint64_t v40;
  NSNumber *internalShouldCreateTemporaryDirectoryInHost;
  void *v42;
  uint64_t v43;
  NSDictionary *clientPreviewOptions;
  void *v45;
  uint64_t v46;
  NSDictionary *clientPreviewItemDisplayState;
  uint64_t v48;
  QLURLHandler *generatedURLHandler;
  QLItem *v50;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)QLItem;
  v5 = -[QLItem init](&v52, sel_init);
  if (v5)
  {
    +[QLItemFetcherFactory possibleFetcherClasses](QLItemFetcherFactory, "possibleFetcherClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("fetcher"));
    v7 = objc_claimAutoreleasedReturnValue();
    fetcher = v5->_fetcher;
    v5->_fetcher = (QLItemFetcher *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UTIAnalyzer"));
    v9 = objc_claimAutoreleasedReturnValue();
    UTIAnalyzer = v5->_UTIAnalyzer;
    v5->_UTIAnalyzer = (QLUTIAnalyzer *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpItem"));
    v11 = objc_claimAutoreleasedReturnValue();
    fpItem = v5->_fpItem;
    v5->_fpItem = (FPItem *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewItemURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    previewItemURL = v5->_previewItemURL;
    v5->_previewItemURL = (NSURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewItemData"));
    v15 = objc_claimAutoreleasedReturnValue();
    previewItemData = v5->_previewItemData;
    v5->_previewItemData = (NSData *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relativePath"));
    v17 = objc_claimAutoreleasedReturnValue();
    relativePath = v5->_relativePath;
    v5->_relativePath = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemSize"));
    v19 = objc_claimAutoreleasedReturnValue();
    itemSize = v5->_itemSize;
    v5->_itemSize = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewItemContentType"));
    v21 = objc_claimAutoreleasedReturnValue();
    previewItemContentType = v5->_previewItemContentType;
    v5->_previewItemContentType = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColorOverride"));
    v23 = objc_claimAutoreleasedReturnValue();
    backgroundColorOverride = v5->_backgroundColorOverride;
    v5->_backgroundColorOverride = (UIColor *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewItemTitle"));
    v25 = objc_claimAutoreleasedReturnValue();
    previewItemTitle = v5->_previewItemTitle;
    v5->_previewItemTitle = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
    v27 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v29 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v29;

    v5->_processIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("processIdentifier"));
    v5->_isPromisedItem = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPromisedItem"));
    v5->_useFullPDFTransition = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useFullPDFTransition"));
    v5->_useLoadingTimeout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLoadingTimeout"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchableItemIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    searchableItemIdentifier = v5->_searchableItemIdentifier;
    v5->_searchableItemIdentifier = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spotlightQueryString"));
    v33 = objc_claimAutoreleasedReturnValue();
    spotlightQueryString = v5->_spotlightQueryString;
    v5->_spotlightQueryString = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchableItemApplicationBundleIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    searchableItemApplicationBundleIdentifier = v5->_searchableItemApplicationBundleIdentifier;
    v5->_searchableItemApplicationBundleIdentifier = (NSString *)v35;

    v5->_canBeShared = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeShared"));
    v5->_canBeEdited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeEdited"));
    v5->_canHandleEditedCopy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canHandleEditedCopy"));
    v5->_editedFileBehavior = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("editedFileBehavior"));
    v5->_shouldPreventMachineReadableCodeDetection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shouldPreventMachineReadableCodeDetection")) != 0;
    v5->_editingMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("editingMode"));
    v5->_wantsPreviewInDebugViewController = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsPreviewInDebugViewController"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxingURLWrapper"));
    v37 = objc_claimAutoreleasedReturnValue();
    sandboxingURLWrapper = v5->_sandboxingURLWrapper;
    v5->_sandboxingURLWrapper = (FPSandboxingURLWrapper *)v37;

    v39 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("internalShouldCreateTemporaryDirectoryInHost"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39);
    v40 = objc_claimAutoreleasedReturnValue();
    internalShouldCreateTemporaryDirectoryInHost = v5->_internalShouldCreateTemporaryDirectoryInHost;
    v5->_internalShouldCreateTemporaryDirectoryInHost = (NSNumber *)v40;

    +[QLItem customExtensionCommunicationEncodedClasses](QLItem, "customExtensionCommunicationEncodedClasses");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("clientPreviewOptions"));
    v43 = objc_claimAutoreleasedReturnValue();
    clientPreviewOptions = v5->_clientPreviewOptions;
    v5->_clientPreviewOptions = (NSDictionary *)v43;

    +[QLItem customExtensionCommunicationEncodedClasses](QLItem, "customExtensionCommunicationEncodedClasses");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("clientPreviewItemDisplayState"));
    v46 = objc_claimAutoreleasedReturnValue();
    clientPreviewItemDisplayState = v5->_clientPreviewItemDisplayState;
    v5->_clientPreviewItemDisplayState = (NSDictionary *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("generatedURLHandler"));
    v48 = objc_claimAutoreleasedReturnValue();
    generatedURLHandler = v5->_generatedURLHandler;
    v5->_generatedURLHandler = (QLURLHandler *)v48;

    v50 = v5;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)QLItem;
  -[QLItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItem previewItemTitle](self, "previewItemTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSDictionary)clientPreviewOptions
{
  NSDictionary *clientPreviewOptions;
  NSDictionary *v3;
  QLItem *v5;
  QLItem *v6;
  void *v7;
  char v8;
  void *v9;

  clientPreviewOptions = self->_clientPreviewOptions;
  if (!clientPreviewOptions)
  {
    -[QLItem originalPreviewItem](self, "originalPreviewItem");
    v5 = (QLItem *)objc_claimAutoreleasedReturnValue();
    if (v5 == self)
    {

    }
    else
    {
      v6 = v5;
      -[QLItem originalPreviewItem](self, "originalPreviewItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[QLItem originalPreviewItem](self, "originalPreviewItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "previewOptions");
        v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

        return v3;
      }
    }
    v3 = 0;
    return v3;
  }
  v3 = clientPreviewOptions;
  return v3;
}

- (void)setPreviewOptions:(id)a3
{
  objc_storeStrong((id *)&self->_clientPreviewOptions, a3);
}

- (NSDictionary)clientPreviewItemDisplayState
{
  NSDictionary *clientPreviewItemDisplayState;
  NSDictionary *v3;
  QLItem *v5;
  QLItem *v6;
  void *v7;
  char v8;
  void *v9;

  clientPreviewItemDisplayState = self->_clientPreviewItemDisplayState;
  if (!clientPreviewItemDisplayState)
  {
    -[QLItem originalPreviewItem](self, "originalPreviewItem");
    v5 = (QLItem *)objc_claimAutoreleasedReturnValue();
    if (v5 == self)
    {

    }
    else
    {
      v6 = v5;
      -[QLItem originalPreviewItem](self, "originalPreviewItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[QLItem originalPreviewItem](self, "originalPreviewItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "previewItemDisplayState");
        v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

        return v3;
      }
    }
    v3 = 0;
    return v3;
  }
  v3 = clientPreviewItemDisplayState;
  return v3;
}

- (void)setPreviewItemDisplayState:(id)a3
{
  objc_storeStrong((id *)&self->_clientPreviewItemDisplayState, a3);
}

- (BOOL)isPromisedItem
{
  QLItem *v3;
  QLItem *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  -[QLItem originalPreviewItem](self, "originalPreviewItem");
  v3 = (QLItem *)objc_claimAutoreleasedReturnValue();
  if (v3 == self)
  {

  }
  else
  {
    v4 = v3;
    -[QLItem originalPreviewItem](self, "originalPreviewItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[QLItem originalPreviewItem](self, "originalPreviewItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPromisedItem");

      return v8;
    }
  }
  return self->_isPromisedItem;
}

- (NSURL)alternateShareURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v2 = self;
  -[QLItem originalPreviewItem](self, "originalPreviewItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if ((void *)v3 == v2)
  {
    v7 = 0;
  }
  else
  {
    v4 = (void *)v3;
    objc_msgSend(v2, "originalPreviewItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
    {
      v7 = 0;
      return (NSURL *)v7;
    }
    objc_msgSend(v2, "originalPreviewItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "alternateShareURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v7;
}

- (QLItemFetcher)fetcher
{
  QLItemFetcher *fetcher;
  QLItemFetcher *v4;
  QLItemFetcher *v5;

  fetcher = self->_fetcher;
  if (!fetcher)
  {
    +[QLItemFetcherFactory fetcherForPreviewItem:](QLItemFetcherFactory, "fetcherForPreviewItem:", self);
    v4 = (QLItemFetcher *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fetcher;
    self->_fetcher = v4;

    fetcher = self->_fetcher;
  }
  return fetcher;
}

- (id)createPreviewContext
{
  void *v3;
  void *v4;
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

  v3 = (void *)objc_opt_new();
  -[QLItem thumbnailGenerator](self, "thumbnailGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setThumbnailGenerator:", v4);

  -[QLItem previewItemTitle](self, "previewItemTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreviewTitle:", v5);

  -[QLItem previewItemContentType](self, "previewItemContentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginalContentType:", v6);

  -[QLItem generatedItemContentType](self, "generatedItemContentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "setContentType:", v7);
  }
  else
  {
    -[QLItem previewItemContentType](self, "previewItemContentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContentType:", v8);

  }
  objc_msgSend(v3, "setCanBeEdited:", -[QLItem canBeEdited](self, "canBeEdited"));
  objc_msgSend(v3, "setCanBeShared:", -[QLItem canBeShared](self, "canBeShared"));
  objc_msgSend(v3, "setEditedFileBehavior:", -[QLItem editedFileBehavior](self, "editedFileBehavior"));
  objc_msgSend(v3, "setShouldPreventMachineReadableCodeDetection:", -[QLItem shouldPreventMachineReadableCodeDetection](self, "shouldPreventMachineReadableCodeDetection"));
  -[QLItem password](self, "password");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPassword:", v9);

  objc_msgSend(v3, "setPreviewItemType:", -[QLItem previewItemType](self, "previewItemType"));
  -[QLItem backgroundColorOverride](self, "backgroundColorOverride");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v10);

  -[QLItem itemSize](self, "itemSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItemSize:", v11);

  objc_msgSend(v3, "setProcessIdentifier:", -[QLItem processIdentifier](self, "processIdentifier"));
  objc_msgSend(v3, "setItem:", self);
  -[QLItem clientPreviewOptions](self, "clientPreviewOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientPreviewOptions:", v12);

  objc_msgSend(v3, "setStringEncoding:", -[QLItem stringEncoding](self, "stringEncoding"));
  -[QLItem attachments](self, "attachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttachments:", v13);

  -[QLItem bitmapFormat](self, "bitmapFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBitmapFormat:", v14);

  return v3;
}

- (NSUUID)uuid
{
  NSUUID *uuid;
  NSUUID *v4;
  NSUUID *v5;

  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = (NSUUID *)objc_opt_new();
    v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (NSNumber)itemSize
{
  NSNumber *itemSize;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  itemSize = self->_itemSize;
  if (!itemSize)
  {
    -[QLItem fetcher](self, "fetcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemSize");
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_itemSize;
    self->_itemSize = v5;

    itemSize = self->_itemSize;
  }
  return itemSize;
}

- (NSURL)previewItemURL
{
  NSURL *previewItemURL;
  QLURLHandler *generatedURLHandler;
  NSURL *v5;
  NSURL *v6;

  previewItemURL = self->_previewItemURL;
  if (!previewItemURL)
  {
    generatedURLHandler = self->_generatedURLHandler;
    if (generatedURLHandler)
      -[QLURLHandler fileURL](generatedURLHandler, "fileURL");
    else
      -[QLPreviewItemPrivateProtocol previewItemURL](self->_originalPreviewItem, "previewItemURL");
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v6 = self->_previewItemURL;
    self->_previewItemURL = v5;

    previewItemURL = self->_previewItemURL;
  }
  return previewItemURL;
}

- (BOOL)canBePreviewed
{
  return -[QLItem previewItemType](self, "previewItemType") != 15;
}

- (QLItemThumbnailGeneratorProtocolInternal)thumbnailGenerator
{
  QLItemThumbnailGeneratorProtocolInternal *thumbnailGenerator;
  QLSingleItemThumbnailGenerator *v4;
  QLItemThumbnailGeneratorProtocolInternal *v5;

  thumbnailGenerator = self->_thumbnailGenerator;
  if (!thumbnailGenerator)
  {
    v4 = -[QLSingleItemThumbnailGenerator initWithItem:]([QLSingleItemThumbnailGenerator alloc], "initWithItem:", self);
    v5 = self->_thumbnailGenerator;
    self->_thumbnailGenerator = (QLItemThumbnailGeneratorProtocolInternal *)v4;

    thumbnailGenerator = self->_thumbnailGenerator;
  }
  return thumbnailGenerator;
}

- (QLPreviewItemPrivateProtocol)originalPreviewItem
{
  if (self->_originalPreviewItem)
    self = (QLItem *)self->_originalPreviewItem;
  return (QLPreviewItemPrivateProtocol *)self;
}

- (void)setPreviewItemProviderProgress:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__QLItem_setPreviewItemProviderProgress___block_invoke;
  v6[3] = &unk_1E9EFBFC8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  QLRunInMainThread(v6);

}

void __41__QLItem_setPreviewItemProviderProgress___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  float v4;
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "fetcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetcher");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "floatValue");
    objc_msgSend(v5, "updatedURLWithProgress:", v4);

  }
}

- (NSString)previewItemTitle
{
  NSString *previewItemTitle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *v14;

  previewItemTitle = self->_previewItemTitle;
  if (!previewItemTitle)
  {
    -[QLItem previewItemURL](self, "previewItemURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[QLItem previewItemURL](self, "previewItemURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[QLItem previewItemURL](self, "previewItemURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        objc_msgSend(v7, "path");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v11 = (void *)v9;

        goto LABEL_10;
      }
      objc_msgSend(v7, "resourceSpecifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[QLItem previewItemURL](self, "previewItemURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resourceSpecifier");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    else
    {
      -[QLItem relativePath](self, "relativePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
LABEL_11:
        previewItemTitle = self->_previewItemTitle;
        return previewItemTitle;
      }
      -[QLItem relativePath](self, "relativePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_10:
    objc_msgSend(v11, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByDeletingPathExtension");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = self->_previewItemTitle;
    self->_previewItemTitle = v13;

    goto LABEL_11;
  }
  return previewItemTitle;
}

- (NSString)previewItemContentType
{
  NSString *previewItemContentType;
  void *v4;
  NSString *v5;
  NSString *v6;

  previewItemContentType = self->_previewItemContentType;
  if (!previewItemContentType)
  {
    -[QLItem UTIAnalyzer](self, "UTIAnalyzer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentType");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_previewItemContentType;
    self->_previewItemContentType = v5;

    previewItemContentType = self->_previewItemContentType;
  }
  return previewItemContentType;
}

- (unint64_t)previewItemType
{
  unint64_t result;
  NSObject **v4;
  NSObject *v5;
  unint64_t previewItemType;
  int v7;
  QLItem *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = self->_previewItemType;
  if (!result)
  {
    self->_previewItemType = -[QLItem _getPreviewItemType](self, "_getPreviewItemType");
    v4 = (NSObject **)MEMORY[0x1E0D83678];
    v5 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      previewItemType = self->_previewItemType;
      v7 = 138412546;
      v8 = self;
      v9 = 2048;
      v10 = previewItemType;
      _os_log_impl(&dword_1D936E000, v5, OS_LOG_TYPE_INFO, "Determined preview item type of item (%@) - Preview type is %lu #PreviewItem", (uint8_t *)&v7, 0x16u);
    }
    return self->_previewItemType;
  }
  return result;
}

- (unint64_t)generatedPreviewItemType
{
  void *v3;
  unint64_t result;
  NSObject *v5;
  unint64_t generatedPreviewItemType;
  NSObject **v7;
  int v8;
  QLItem *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[QLItem generatedItemContentType](self, "generatedItemContentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  result = self->_generatedPreviewItemType;
  if (!result)
  {
    self->_generatedPreviewItemType = -[QLItem _getGeneratedItemType](self, "_getGeneratedItemType");
    v5 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      v7 = (NSObject **)MEMORY[0x1E0D83678];
      QLSInitLogging();
      v5 = *v7;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      generatedPreviewItemType = self->_generatedPreviewItemType;
      v8 = 138412546;
      v9 = self;
      v10 = 2048;
      v11 = generatedPreviewItemType;
      _os_log_impl(&dword_1D936E000, v5, OS_LOG_TYPE_DEBUG, "Determined generated preview item type of item (%@) - Generated preview type is %lu #PreviewItem", (uint8_t *)&v8, 0x16u);
    }
    return self->_generatedPreviewItemType;
  }
  return result;
}

- (id)shareableURL
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;

  -[QLItem editedFileURL](self, "editedFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    v8 = v3;
  }
  else
  {
    -[QLItem alternateShareURL](self, "alternateShareURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[QLItem alternateShareURL](self, "alternateShareURL");
    else
      -[QLItem saveURL](self, "saveURL");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  if (v4)
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");

  return v10;
}

- (BOOL)shouldCreateTemporaryDirectoryInHost
{
  void *v2;
  char v3;

  -[QLItem internalShouldCreateTemporaryDirectoryInHost](self, "internalShouldCreateTemporaryDirectoryInHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSNumber)internalShouldCreateTemporaryDirectoryInHost
{
  void *v3;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSNumber *v8;
  NSObject *v9;
  void *v10;
  NSNumber *internalShouldCreateTemporaryDirectoryInHost;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_internalShouldCreateTemporaryDirectoryInHost)
  {
    -[QLItem previewItemURL](self, "previewItemURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (NSObject **)MEMORY[0x1E0D83678];
    v5 = *MEMORY[0x1E0D83678];
    if (v3)
    {
      if (!v5)
      {
        QLSInitLogging();
        v5 = *v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = v5;
        -[QLItem description](self, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v7;
        _os_log_impl(&dword_1D936E000, v6, OS_LOG_TYPE_DEFAULT, "QLPreviewItem has an url, create a tmp dir in the host: %@ #PreviewItem", (uint8_t *)&v13, 0xCu);

      }
      v8 = (NSNumber *)MEMORY[0x1E0C9AAB0];
    }
    else
    {
      if (!v5)
      {
        QLSInitLogging();
        v5 = *v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v5;
        -[QLItem description](self, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_DEFAULT, "QLPreviewItem has no url yet, don't create a tmp dir in the host: %@ #PreviewItem", (uint8_t *)&v13, 0xCu);

      }
      v8 = (NSNumber *)MEMORY[0x1E0C9AAA0];
    }
    internalShouldCreateTemporaryDirectoryInHost = self->_internalShouldCreateTemporaryDirectoryInHost;
    self->_internalShouldCreateTemporaryDirectoryInHost = v8;

  }
  return self->_internalShouldCreateTemporaryDirectoryInHost;
}

- (void)prepareSaveURL:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  -[QLItem fetcher](self, "fetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "prepareShareableItem:", v4);
  else
    v4[2](v4);

}

- (id)saveURL
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;

  -[QLItem fetcher](self, "fetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shareableItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[QLItem fetcher](self, "fetcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shareableItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[QLItem previewItemURL](self, "previewItemURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[QLItem previewItemURL](self, "previewItemURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (void)setEditedCopy:(id)a3
{
  QLPreviewItemEditedCopy *v5;
  QLPreviewItemEditedCopy *editedCopy;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  QLPreviewItemEditedCopy *v11;

  v5 = (QLPreviewItemEditedCopy *)a3;
  editedCopy = self->_editedCopy;
  if (editedCopy != v5)
  {
    v11 = v5;
    v7 = -[QLPreviewItemEditedCopy isEqual:](editedCopy, "isEqual:", v5);
    v5 = v11;
    if (!v7)
    {
      -[QLPreviewItemEditedCopy url](self->_editedCopy, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewItemEditedCopy url](v11, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) == 0)
        -[QLItem _removeEditedCopyIfExists](self, "_removeEditedCopyIfExists");
      objc_storeStrong((id *)&self->_editedCopy, a3);
      v5 = v11;
    }
  }

}

- (void)_removeEditedCopyIfExists
{
  QLPreviewItemEditedCopy *editedCopy;

  -[QLPreviewItemEditedCopy removeFromDisk:](self->_editedCopy, "removeFromDisk:", 1);
  editedCopy = self->_editedCopy;
  self->_editedCopy = 0;

}

- (NSURL)editedFileURL
{
  return -[QLPreviewItemEditedCopy url](self->_editedCopy, "url");
}

- (BOOL)supportsChromelessUI
{
  unint64_t v3;
  BOOL v4;
  void *v6;

  if (!_os_feature_enabled_impl())
    return 0;
  v3 = -[QLItem previewItemType](self, "previewItemType");
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 1;
  if (v3 != 1)
    return v3 == 11;
  -[QLItem UTIAnalyzer](self, "UTIAnalyzer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v6, "isAudioOnly") & 1) == 0 && (_os_feature_enabled_impl() & 1) != 0;

  return v4;
}

- (BOOL)shouldOpenInFullScreen
{
  unint64_t v3;
  int v4;
  void *v5;

  if (!_os_feature_enabled_impl())
    goto LABEL_6;
  v3 = -[QLItem previewItemType](self, "previewItemType");
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v3 == 1)
    {
      -[QLItem UTIAnalyzer](self, "UTIAnalyzer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "isAudioOnly") ^ 1;

      return v4;
    }
LABEL_6:
    LOBYTE(v4) = 0;
    return v4;
  }
  LOBYTE(v4) = 1;
  return v4;
}

+ (id)customExtensionCommunicationEncodedClasses
{
  if (customExtensionCommunicationEncodedClasses_onceToken != -1)
    dispatch_once(&customExtensionCommunicationEncodedClasses_onceToken, &__block_literal_global_105);
  return (id)customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses;
}

void __52__QLItem_customExtensionCommunicationEncodedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses;
  customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses = v7;

}

+ (id)encodedClasses
{
  if (encodedClasses_onceToken != -1)
    dispatch_once(&encodedClasses_onceToken, &__block_literal_global_111);
  return (id)encodedClasses__encodedClasses;
}

void __24__QLItem_encodedClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[QLItemFetcherFactory possibleFetcherClasses](QLItemFetcherFactory, "possibleFetcherClasses");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v4, "addObject:", objc_opt_class());
  +[QLItem customExtensionCommunicationEncodedClasses](QLItem, "customExtensionCommunicationEncodedClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromSet:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)encodedClasses__encodedClasses;
  encodedClasses__encodedClasses = v2;

}

- (BOOL)hasDeterminedPredictedPreferredContentSizeForOrbPlatter
{
  return self->hasDeterminedPredictedPreferredContentSizeForOrbPlatter;
}

- (void)setHasDeterminedPredictedPreferredContentSizeForOrbPlatter:(BOOL)a3
{
  self->hasDeterminedPredictedPreferredContentSizeForOrbPlatter = a3;
}

- (CGSize)preferredContentSizeForOrbPlatter
{
  double width;
  double height;
  CGSize result;

  width = self->preferredContentSizeForOrbPlatter.width;
  height = self->preferredContentSizeForOrbPlatter.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSizeForOrbPlatter:(CGSize)a3
{
  self->preferredContentSizeForOrbPlatter = a3;
}

- (BOOL)useFullPDFTransition
{
  return self->_useFullPDFTransition;
}

- (void)setUseFullPDFTransition:(BOOL)a3
{
  self->_useFullPDFTransition = a3;
}

- (BOOL)useLoadingTimeout
{
  return self->_useLoadingTimeout;
}

- (void)setUseLoadingTimeout:(BOOL)a3
{
  self->_useLoadingTimeout = a3;
}

- (NSNumber)previewItemProviderProgress
{
  return self->_previewItemProviderProgress;
}

- (BOOL)wantsPreviewInDebugViewController
{
  return self->_wantsPreviewInDebugViewController;
}

- (void)setWantsPreviewInDebugViewController:(BOOL)a3
{
  self->_wantsPreviewInDebugViewController = a3;
}

- (FPItem)fpItem
{
  return (FPItem *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFpItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setOriginalPreviewItem:(id)a3
{
  objc_storeStrong((id *)&self->_originalPreviewItem, a3);
}

- (void)setPreviewItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_previewItemURL, a3);
}

- (NSData)previewItemData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreviewItemData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(unint64_t)a3
{
  self->_stringEncoding = a3;
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (QLTBitmapFormat)bitmapFormat
{
  return (QLTBitmapFormat *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBitmapFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (QLURLHandler)generatedURLHandler
{
  return (QLURLHandler *)objc_getProperty(self, a2, 96, 1);
}

- (void)setGeneratedURLHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (QLPreviewItemDataProvider)previewItemDataProvider
{
  return (QLPreviewItemDataProvider *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPreviewItemDataProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)searchableItemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSearchableItemIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)spotlightQueryString
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSpotlightQueryString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)searchableItemApplicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSearchableItemApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)relativePath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRelativePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSItemProvider)previewItemProvider
{
  return (NSItemProvider *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPreviewItemProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setItemSize:(id)a3
{
  objc_storeStrong((id *)&self->_itemSize, a3);
}

- (void)setFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_fetcher, a3);
}

- (void)setThumbnailGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailGenerator, a3);
}

- (QLUTIAnalyzer)UTIAnalyzer
{
  return self->_UTIAnalyzer;
}

- (void)setUTIAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_UTIAnalyzer, a3);
}

- (void)setPreviewItemContentType:(id)a3
{
  objc_storeStrong((id *)&self->_previewItemContentType, a3);
}

- (UIColor)backgroundColorOverride
{
  return self->_backgroundColorOverride;
}

- (void)setBackgroundColorOverride:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorOverride, a3);
}

- (void)setPreviewItemTitle:(id)a3
{
  objc_storeStrong((id *)&self->_previewItemTitle, a3);
}

- (QLPreviewItemEditedCopy)editedCopy
{
  return self->_editedCopy;
}

- (QLPreviewItemEditedCopy)lastSavedEditedCopy
{
  return self->_lastSavedEditedCopy;
}

- (void)setLastSavedEditedCopy:(id)a3
{
  objc_storeStrong((id *)&self->_lastSavedEditedCopy, a3);
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setPreviewItemType:(unint64_t)a3
{
  self->_previewItemType = a3;
}

- (int64_t)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int64_t)a3
{
  self->_processIdentifier = a3;
}

- (void)setIsPromisedItem:(BOOL)a3
{
  self->_isPromisedItem = a3;
}

- (BOOL)canBeEdited
{
  return self->_canBeEdited;
}

- (void)setCanBeEdited:(BOOL)a3
{
  self->_canBeEdited = a3;
}

- (BOOL)canHandleEditedCopy
{
  return self->_canHandleEditedCopy;
}

- (void)setCanHandleEditedCopy:(BOOL)a3
{
  self->_canHandleEditedCopy = a3;
}

- (BOOL)originalContentWasUpdated
{
  return self->_originalContentWasUpdated;
}

- (void)setOriginalContentWasUpdated:(BOOL)a3
{
  self->_originalContentWasUpdated = a3;
}

- (BOOL)shouldPreventMachineReadableCodeDetection
{
  return self->_shouldPreventMachineReadableCodeDetection;
}

- (void)setShouldPreventMachineReadableCodeDetection:(BOOL)a3
{
  self->_shouldPreventMachineReadableCodeDetection = a3;
}

- (int64_t)editingMode
{
  return self->_editingMode;
}

- (void)setEditingMode:(int64_t)a3
{
  self->_editingMode = a3;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(BOOL)a3
{
  self->_canBeShared = a3;
}

- (unint64_t)editedFileBehavior
{
  return self->_editedFileBehavior;
}

- (void)setEditedFileBehavior:(unint64_t)a3
{
  self->_editedFileBehavior = a3;
}

- (void)setInternalShouldCreateTemporaryDirectoryInHost:(id)a3
{
  objc_storeStrong((id *)&self->_internalShouldCreateTemporaryDirectoryInHost, a3);
}

- (BOOL)hasDeterminedThirdPartyPreviewExtensionType
{
  return self->_hasDeterminedThirdPartyPreviewExtensionType;
}

- (void)setHasDeterminedThirdPartyPreviewExtensionType:(BOOL)a3
{
  self->_hasDeterminedThirdPartyPreviewExtensionType = a3;
}

- (unint64_t)previewExtensionType
{
  return self->_previewExtensionType;
}

- (void)setPreviewExtensionType:(unint64_t)a3
{
  self->_previewExtensionType = a3;
}

- (BOOL)hasDeterminedShouldUseExtensionThumbnail
{
  return self->_hasDeterminedShouldUseExtensionThumbnail;
}

- (void)setHasDeterminedShouldUseExtensionThumbnail:(BOOL)a3
{
  self->_hasDeterminedShouldUseExtensionThumbnail = a3;
}

- (BOOL)shouldUseExtensionThumbnail
{
  return self->_shouldUseExtensionThumbnail;
}

- (void)setShouldUseExtensionThumbnail:(BOOL)a3
{
  self->_shouldUseExtensionThumbnail = a3;
}

- (FPSandboxingURLWrapper)sandboxingURLWrapper
{
  return self->_sandboxingURLWrapper;
}

- (void)setSandboxingURLWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxingURLWrapper, a3);
}

- (void)setClientPreviewOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setClientPreviewItemDisplayState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (QLGeneratorFetcher)generationFetcher
{
  return (QLGeneratorFetcher *)objc_getProperty(self, a2, 312, 1);
}

- (void)setGenerationFetcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSString)generatedItemContentType
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setGeneratedItemContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (void)setGeneratedPreviewItemType:(unint64_t)a3
{
  self->_generatedPreviewItemType = a3;
}

- (unint64_t)generatedReplyType
{
  return self->_generatedReplyType;
}

- (void)setGeneratedReplyType:(unint64_t)a3
{
  self->_generatedReplyType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedItemContentType, 0);
  objc_storeStrong((id *)&self->_generationFetcher, 0);
  objc_storeStrong((id *)&self->_clientPreviewItemDisplayState, 0);
  objc_storeStrong((id *)&self->_clientPreviewOptions, 0);
  objc_storeStrong((id *)&self->_sandboxingURLWrapper, 0);
  objc_storeStrong((id *)&self->_internalShouldCreateTemporaryDirectoryInHost, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_lastSavedEditedCopy, 0);
  objc_storeStrong((id *)&self->_editedCopy, 0);
  objc_storeStrong((id *)&self->_previewItemTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColorOverride, 0);
  objc_storeStrong((id *)&self->_previewItemContentType, 0);
  objc_storeStrong((id *)&self->_UTIAnalyzer, 0);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_itemSize, 0);
  objc_storeStrong((id *)&self->_previewItemProvider, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_searchableItemApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_spotlightQueryString, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifier, 0);
  objc_storeStrong((id *)&self->_previewItemDataProvider, 0);
  objc_storeStrong((id *)&self->_generatedURLHandler, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_previewItemData, 0);
  objc_storeStrong((id *)&self->_previewItemURL, 0);
  objc_storeStrong((id *)&self->_originalPreviewItem, 0);
  objc_storeStrong((id *)&self->_fpItem, 0);
  objc_storeStrong((id *)&self->_previewItemProviderProgress, 0);
}

+ (id)supportedContentTypeIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__QLItem_PreviewInfo__supportedContentTypeIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedContentTypeIdentifiers_once != -1)
    dispatch_once(&supportedContentTypeIdentifiers_once, block);
  return (id)supportedContentTypeIdentifiers_sSupportedTypeIdentifiers;
}

void __54__QLItem_PreviewInfo__supportedContentTypeIdentifiers__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "contentTypesToPreviewTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)supportedContentTypeIdentifiers_sSupportedTypeIdentifiers;
  supportedContentTypeIdentifiers_sSupportedTypeIdentifiers = v3;

}

+ (id)supportedContentTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__QLItem_PreviewInfo__supportedContentTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedContentTypes_once != -1)
    dispatch_once(&supportedContentTypes_once, block);
  return (id)supportedContentTypes_sSupportedTypes;
}

void __44__QLItem_PreviewInfo__supportedContentTypes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "contentTypesToPreviewTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)supportedContentTypes_sSupportedTypes;
  supportedContentTypes_sSupportedTypes = v3;

}

+ (id)webContentTypes
{
  if (webContentTypes_once != -1)
    dispatch_once(&webContentTypes_once, &__block_literal_global_1);
  return (id)webContentTypes_sSet;
}

void __38__QLItem_PreviewInfo__webContentTypes__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)webContentTypes_sSet;
  webContentTypes_sSet = v0;

  v2 = (void *)webContentTypes_sSet;
  +[QLPreviewConverter convertibleTypes](QLPreviewConverter, "convertibleTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

  v4 = (void *)webContentTypes_sSet;
  v5 = *MEMORY[0x1E0CEC518];
  v7[0] = *MEMORY[0x1E0CEC5E0];
  v7[1] = v5;
  v7[2] = *MEMORY[0x1E0CEC658];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

}

+ (id)rtfContentTypes
{
  if (rtfContentTypes_once != -1)
    dispatch_once(&rtfContentTypes_once, &__block_literal_global_4);
  return (id)rtfContentTypes_sSet;
}

void __38__QLItem_PreviewInfo__rtfContentTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", *MEMORY[0x1E0CEC5C0], *MEMORY[0x1E0CEC5C8], *MEMORY[0x1E0CEC4E8], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rtfContentTypes_sSet;
  rtfContentTypes_sSet = v0;

}

+ (BOOL)contentTypeConformsToRTFD:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLItem rtfContentTypes](QLItem, "rtfContentTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _QLContentTypeConformsToContentTypeInSet(v3, v4);

  return v5;
}

+ (id)contentTypesToPreviewTypes
{
  if (contentTypesToPreviewTypes_once != -1)
    dispatch_once(&contentTypesToPreviewTypes_once, &__block_literal_global_7);
  return (id)contentTypesToPreviewTypes_sSupportedTypes;
}

void __49__QLItem_PreviewInfo__contentTypesToPreviewTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject **v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  CFArrayRef v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  _BYTE v57[128];
  _QWORD v58[15];
  _QWORD v59[18];

  v59[15] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEC478];
  v58[0] = *MEMORY[0x1E0CEC570];
  v58[1] = v0;
  v59[0] = &unk_1E9F080D8;
  v59[1] = &unk_1E9F080F0;
  v1 = *MEMORY[0x1E0CEC448];
  v58[2] = *MEMORY[0x1E0CEC638];
  v58[3] = v1;
  v59[2] = &unk_1E9F08108;
  v59[3] = &unk_1E9F08120;
  v2 = *MEMORY[0x1E0CEC5C0];
  v58[4] = *MEMORY[0x1E0CEC590];
  v58[5] = v2;
  v59[4] = &unk_1E9F08138;
  v59[5] = &unk_1E9F08138;
  v3 = *MEMORY[0x1E0CEC4E8];
  v58[6] = *MEMORY[0x1E0CEC5C8];
  v58[7] = v3;
  v59[6] = &unk_1E9F08138;
  v59[7] = &unk_1E9F08138;
  v4 = *MEMORY[0x1E0CEC540];
  v58[8] = *MEMORY[0x1E0CEC538];
  v58[9] = v4;
  v59[8] = &unk_1E9F08138;
  v59[9] = &unk_1E9F08150;
  v5 = *MEMORY[0x1E0CEC518];
  v58[10] = *MEMORY[0x1E0CEC5E0];
  v58[11] = v5;
  v59[10] = &unk_1E9F08168;
  v59[11] = &unk_1E9F08168;
  v6 = *MEMORY[0x1E0CEC5A8];
  v58[12] = *MEMORY[0x1E0CEC658];
  v58[13] = v6;
  v59[12] = &unk_1E9F08168;
  v59[13] = &unk_1E9F08138;
  v58[14] = *MEMORY[0x1E0CEC670];
  v59[14] = &unk_1E9F08138;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mutableCopy");
  v9 = (void *)contentTypesToPreviewTypes_sSupportedTypes;
  contentTypesToPreviewTypes_sSupportedTypes = v8;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.web-internet-location"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (NSObject **)MEMORY[0x1E0D83678];
  v40 = (void *)v10;
  if (v10)
  {
    objc_msgSend((id)contentTypesToPreviewTypes_sSupportedTypes, "setObject:forKeyedSubscript:", &unk_1E9F08180, v10);
  }
  else
  {
    v12 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_FAULT, "UTI com.apple.web-internet-location not recognized by the system #UTI", buf, 2u);
    }
  }
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("public.ndjson"));
  v13 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v13;
  if (v13)
  {
    objc_msgSend((id)contentTypesToPreviewTypes_sSupportedTypes, "setObject:forKeyedSubscript:", &unk_1E9F08138, v13, v13, v40);
  }
  else
  {
    v14 = *v11;
    if (!*v11)
    {
      QLSInitLogging();
      v14 = *v11;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D936E000, v14, OS_LOG_TYPE_FAULT, "UTI public.ndjson not recognized by the system #UTI", buf, 2u);
    }
  }
  if (_os_feature_enabled_impl())
    objc_msgSend((id)contentTypesToPreviewTypes_sSupportedTypes, "setObject:forKeyedSubscript:", &unk_1E9F08198, *MEMORY[0x1E0CEC410]);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = CGImageSourceCopyTypeIdentifiers();
  v16 = -[__CFArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v20, v39);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend((id)contentTypesToPreviewTypes_sSupportedTypes, "setObject:forKeyedSubscript:", &unk_1E9F081B0, v21);
        }
        else
        {
          v22 = *MEMORY[0x1E0D83678];
          if (!*MEMORY[0x1E0D83678])
          {
            QLSInitLogging();
            v22 = *MEMORY[0x1E0D83678];
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v20;
            _os_log_impl(&dword_1D936E000, v22, OS_LOG_TYPE_DEBUG, "Invalid UTI %@ returned by CGImageSourceCopyTypeIdentifiers() #UTI", buf, 0xCu);
          }
        }

      }
      v17 = -[__CFArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v17);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v46 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v28, v39);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend((id)contentTypesToPreviewTypes_sSupportedTypes, "setObject:forKeyedSubscript:", &unk_1E9F081C8, v29);
        }
        else
        {
          v30 = *MEMORY[0x1E0D83678];
          if (!*MEMORY[0x1E0D83678])
          {
            QLSInitLogging();
            v30 = *MEMORY[0x1E0D83678];
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v28;
            _os_log_impl(&dword_1D936E000, v30, OS_LOG_TYPE_DEBUG, "Invalid UTI %@ returned by [AVURLAsset audiovisualTypes] #UTI", buf, 0xCu);
          }
        }

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v25);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  +[QLPreviewConverter convertibleUTIs](QLPreviewConverter, "convertibleUTIs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v36, v39);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          objc_msgSend((id)contentTypesToPreviewTypes_sSupportedTypes, "setObject:forKeyedSubscript:", &unk_1E9F08168, v37);
        }
        else
        {
          v38 = *MEMORY[0x1E0D83678];
          if (!*MEMORY[0x1E0D83678])
          {
            QLSInitLogging();
            v38 = *MEMORY[0x1E0D83678];
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v36;
            _os_log_impl(&dword_1D936E000, v38, OS_LOG_TYPE_FAULT, "Invalid UTI %@ returned by [QLPreviewConverter convertibleUTIs] #UTI", buf, 0xCu);
          }
        }

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v33);
  }

  objc_msgSend((id)contentTypesToPreviewTypes_sSupportedTypes, "setObject:forKeyedSubscript:", &unk_1E9F08138, *MEMORY[0x1E0CEC668]);
}

- (unint64_t)_uncachedExtensionPreviewItemType
{
  void *v3;
  void *v4;
  char v5;
  unint64_t v6;
  NSObject **v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[QLItem previewItemContentType](self, "previewItemContentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_isWildcard"),
        v4,
        (v5 & 1) != 0)
    || (v6 = -[QLItem previewExtensionTypeToUse](self, "previewExtensionTypeToUse"), v6 == 15))
  {
    v7 = (NSObject **)MEMORY[0x1E0D83678];
    v8 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_DEFAULT, "Could not determine preview item type because type is wildcard or 3rd party extension not allowed: %@ #PreviewItem", (uint8_t *)&v10, 0xCu);
    }
    v6 = 15;
  }

  return v6;
}

- (unint64_t)_uncachedPreviewItemTypeForContentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject **v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *, _BYTE *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  +[QLItem contentTypesToPreviewTypes](QLItem, "contentTypesToPreviewTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 15;
  if (+[QLItem contentTypeConformsToRTFD:](QLItem, "contentTypeConformsToRTFD:", v4))
  {
    v7 = 4;
  }
  else
  {
    +[QLItem webContentTypes](QLItem, "webContentTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_QLContentTypeConformsToContentTypeInSet(v5, v8))
    {
      if (+[QLItem _previewExtensionKindForContentType:firstPartyExtension:](QLItem, "_previewExtensionKindForContentType:firstPartyExtension:", v4, 1) == 15)v7 = 6;
      else
        v7 = 12;
    }
    else if (_os_feature_enabled_impl()
           && (objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC410]) & 1) != 0)
    {
      v7 = 5;
    }
    else
    {
      v9 = *MEMORY[0x1E0CEC538];
      if (!objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC538])
        || (objc_msgSend(v5, "isEqual:", v9) & 1) != 0
        || (v7 = -[QLItem _uncachedExtensionPreviewItemType](self, "_uncachedExtensionPreviewItemType"), v7 == 15))
      {
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __62__QLItem_PreviewInfo___uncachedPreviewItemTypeForContentType___block_invoke;
        v17 = &unk_1E9EFC688;
        v10 = v5;
        v18 = v10;
        v19 = &v20;
        objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v14);
        v7 = v21[3];
        if (v7 == 15)
        {
          v11 = (NSObject **)MEMORY[0x1E0D83678];
          v12 = *MEMORY[0x1E0D83678];
          if (!*MEMORY[0x1E0D83678])
          {
            QLSInitLogging();
            v12 = *v11;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v10;
          }
          v7 = -[QLItem _uncachedExtensionPreviewItemType](self, "_uncachedExtensionPreviewItemType", v14, v15, v16, v17);
        }

      }
    }

  }
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __62__QLItem_PreviewInfo___uncachedPreviewItemTypeForContentType___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "conformsToType:", a2))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "integerValue");
    *a4 = 1;
  }

}

- (unint64_t)_getPreviewItemType
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  NSObject **v8;
  NSObject *v9;
  uint8_t v10[16];

  -[QLItem previewItemContentType](self, "previewItemContentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[QLItem _previewItemTypeForType:](self, "_previewItemTypeForType:", v3);
LABEL_5:
    v6 = v4;
    goto LABEL_6;
  }
  -[QLItem searchableItemIdentifier](self, "searchableItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4 = -[QLItem _uncachedExtensionPreviewItemType](self, "_uncachedExtensionPreviewItemType");
    goto LABEL_5;
  }
  v8 = (NSObject **)MEMORY[0x1E0D83678];
  v9 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_DEFAULT, "Could not determine preview item type of preview item because content type is nil #PreviewItem", v10, 2u);
  }
  v6 = 15;
LABEL_6:

  return v6;
}

- (unint64_t)_getGeneratedItemType
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  -[QLItem generatedItemContentType](self, "generatedItemContentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", v4))
  {

    goto LABEL_5;
  }
  v5 = -[QLItem generatedReplyType](self, "generatedReplyType");

  if (v5)
  {
LABEL_5:
    v6 = -[QLItem _previewItemTypeForType:](self, "_previewItemTypeForType:", v3);
    goto LABEL_6;
  }
  v6 = 2;
LABEL_6:

  return v6;
}

- (unint64_t)_previewItemTypeForType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  if (_previewItemTypeForType__once != -1)
    dispatch_once(&_previewItemTypeForType__once, &__block_literal_global_27);
  v5 = (id)_previewItemTypeForType__sCache;
  objc_sync_enter(v5);
  objc_msgSend((id)_previewItemTypeForType__sCache, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v6)
  {
    v7 = objc_msgSend(v6, "integerValue");
    if (v7 == 15)
      v7 = -[QLItem _uncachedExtensionPreviewItemType](self, "_uncachedExtensionPreviewItemType");
  }
  else
  {
    v7 = -[QLItem _uncachedPreviewItemTypeForContentType:](self, "_uncachedPreviewItemTypeForContentType:", v4);
    v8 = (id)_previewItemTypeForType__sCache;
    objc_sync_enter(v8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_previewItemTypeForType__sCache, "setObject:forKeyedSubscript:", v9, v4);

    objc_sync_exit(v8);
  }

  return v7;
}

void __47__QLItem_PreviewInfo___previewItemTypeForType___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_previewItemTypeForType__sCache;
  _previewItemTypeForType__sCache = (uint64_t)v0;

}

- (BOOL)isStandardQuickLookType
{
  unint64_t v2;

  v2 = -[QLItem previewItemType](self, "previewItemType");
  return v2 != 15 && (v2 & 0xFFFFFFFFFFFFFFFDLL) != 12;
}

+ (unint64_t)_previewExtensionKindForContentType:(id)a3 firstPartyExtension:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v11;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0D835D0];
  v6 = a3;
  objc_msgSend(v5, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 1;
  objc_msgSend(v7, "extensionForContentType:allowExtensionsForParentTypes:firstPartyExtension:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", v6, v4, v4, 0, 0, 0, 1, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "isGenerationPreview"))
      v9 = 13;
    else
      v9 = 12;
  }
  else
  {
    v9 = 15;
  }

  return v9;
}

- (unint64_t)previewExtensionTypeToUse
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;

  if (!-[QLItem hasDeterminedThirdPartyPreviewExtensionType](self, "hasDeterminedThirdPartyPreviewExtensionType"))
  {
    objc_msgSend(MEMORY[0x1E0D835D0], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItem searchableItemIdentifier](self, "searchableItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[QLItem searchableItemApplicationBundleIdentifier](self, "searchableItemApplicationBundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "existsExtensionForContentType:allowExtensionsForParentTypes:applicationBundleIdentifier:extensionType:generationType:", 0, 0, v5, 0, 2);

      if (v6)
        v7 = 14;
      else
        v7 = 15;
    }
    else
    {
      -[QLItem previewItemContentType](self, "previewItemContentType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = +[QLItem _previewExtensionKindForContentType:firstPartyExtension:](QLItem, "_previewExtensionKindForContentType:firstPartyExtension:", v8, 0);

    }
    -[QLItem setPreviewExtensionType:](self, "setPreviewExtensionType:", v7);
    -[QLItem setHasDeterminedThirdPartyPreviewExtensionType:](self, "setHasDeterminedThirdPartyPreviewExtensionType:", 1);

  }
  return -[QLItem previewExtensionType](self, "previewExtensionType");
}

- (BOOL)useExtensionThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  if (!-[QLItem hasDeterminedShouldUseExtensionThumbnail](self, "hasDeterminedShouldUseExtensionThumbnail"))
  {
    if (-[QLItem isStandardQuickLookType](self, "isStandardQuickLookType"))
    {
      -[QLItem setShouldUseExtensionThumbnail:](self, "setShouldUseExtensionThumbnail:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D835D0], "sharedManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLItem searchableItemIdentifier](self, "searchableItemIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[QLItem setShouldUseExtensionThumbnail:](self, "setShouldUseExtensionThumbnail:", 0);
        -[QLItem searchableItemApplicationBundleIdentifier](self, "searchableItemApplicationBundleIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v3, "existsExtensionForContentType:allowExtensionsForParentTypes:applicationBundleIdentifier:extensionType:generationType:", 0, 0, v5, 1, 2);
      }
      else
      {
        -[QLItem previewItemContentType](self, "previewItemContentType");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLItem setShouldUseExtensionThumbnail:](self, "setShouldUseExtensionThumbnail:", objc_msgSend(v3, "existsExtensionForContentType:allowExtensionsForParentTypes:applicationBundleIdentifier:extensionType:generationType:", v5, 0, 0, 1, 1));

        v6 = 0;
      }
      -[QLItem setShouldUseExtensionThumbnail:](self, "setShouldUseExtensionThumbnail:", v6 | -[QLItem shouldUseExtensionThumbnail](self, "shouldUseExtensionThumbnail"));
      if (v4)

    }
    -[QLItem setHasDeterminedShouldUseExtensionThumbnail:](self, "setHasDeterminedShouldUseExtensionThumbnail:", 1);
  }
  return -[QLItem shouldUseExtensionThumbnail](self, "shouldUseExtensionThumbnail");
}

- (double)maxLoadingTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if ((-[QLItem previewItemType](self, "previewItemType") & 0xFFFFFFFFFFFFFFFDLL) != 0xC)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0D835D0], "ql_previewExtensionCustomLoadingTimeForItem:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0.0;
  v4 = v3;
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  return v6;
}

- (unint64_t)maximumNumberOfCachedPreviews
{
  unint64_t v2;

  v2 = -[QLItem previewItemType](self, "previewItemType");
  if (v2 - 2 > 7)
    return 0;
  else
    return qword_1D93924E8[v2 - 2];
}

@end
