@implementation PXGViewSnapshotDiagnosticsService

- (PXGViewSnapshotDiagnosticsService)initWithItemProviders:(id)a3
{
  id v4;
  PXGViewSnapshotDiagnosticsService *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXGViewSnapshotDiagnosticsService;
  v5 = -[PXDiagnosticsService initWithItemProviders:](&v20, sel_initWithItemProviders_, v4);
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = v4;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierTungstenView"), v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_storeStrong((id *)&v5->_tungstenView, v11);
          objc_msgSend(v10, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierViewController"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_storeStrong((id *)&v5->_viewController, v12);
          if (v5->_tungstenView && v5->_viewController)
          {

            goto LABEL_17;
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_17:

    v4 = v14;
  }

  return v5;
}

- (id)title
{
  return CFSTR("Full-Page Snapshot");
}

- (BOOL)canPerformAction
{
  void *v2;
  BOOL v3;

  -[PXGViewSnapshotDiagnosticsService tungstenView](self, "tungstenView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)performAction
{
  void *v3;
  void *v4;
  id v5;

  -[PXGViewSnapshotDiagnosticsService tungstenView](self, "tungstenView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualDiagnosticsConfigurationForFullPageSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGViewSnapshotDiagnosticsService viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXVisualDiagnosticsFactory showVisualDiagnosticsWithConfiguration:fromViewController:completionHandler:](PXVisualDiagnosticsFactory, "showVisualDiagnosticsWithConfiguration:fromViewController:completionHandler:", v3, v4, 0);

}

- (PXGView)tungstenView
{
  return self->_tungstenView;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_tungstenView, 0);
}

@end
