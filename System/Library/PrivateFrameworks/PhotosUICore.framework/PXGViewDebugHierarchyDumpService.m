@implementation PXGViewDebugHierarchyDumpService

- (PXGViewDebugHierarchyDumpService)initWithItemProviders:(id)a3
{
  id v4;
  PXGViewDebugHierarchyDumpService *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PXGView *gridView;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGViewDebugHierarchyDumpService;
  v5 = -[PXDiagnosticsService initWithItemProviders:](&v18, sel_initWithItemProviders_, v4);
  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierTungstenView"), (_QWORD)v14);
        v11 = objc_claimAutoreleasedReturnValue();
        gridView = v5->_gridView;
        v5->_gridView = (PXGView *)v11;

        if (v5->_gridView)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  return v5;
}

- (id)title
{
  return CFSTR("Dump Debug Hierarchy");
}

- (BOOL)canPerformAction
{
  void *v2;
  BOOL v3;

  -[PXGViewDebugHierarchyDumpService gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)performAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[PXGViewDebugHierarchyDumpService gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporaryDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFileNameForExportingDebugHierarchy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v7 = objc_msgSend(v2, "exportDebugHierarchyToURL:error:", v6, &v19);
  v8 = v19;
  if (v7)
    v9 = CFSTR("Success");
  else
    v9 = CFSTR("An error occurred");
  if ((v7 & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = v9;
    objc_msgSend(v6, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Debug hierarchy saved to %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v9;
    objc_msgSend(v8, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v13, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v16);

  objc_msgSend(v2, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rootViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentViewController:animated:completion:", v15, 1, 0);

}

- (PXGView)gridView
{
  return self->_gridView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridView, 0);
}

@end
