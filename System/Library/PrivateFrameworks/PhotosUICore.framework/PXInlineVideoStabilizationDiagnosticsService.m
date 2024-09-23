@implementation PXInlineVideoStabilizationDiagnosticsService

- (PXInlineVideoStabilizationDiagnosticsService)initWithItemProviders:(id)a3
{
  id v4;
  PXInlineVideoStabilizationDiagnosticsService *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PHAsset *v11;
  PHAsset *asset;
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
  v18.super_class = (Class)PXInlineVideoStabilizationDiagnosticsService;
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
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAsset"), (_QWORD)v14);
          v11 = (PHAsset *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            asset = v5->_asset;
            v5->_asset = v11;

            goto LABEL_12;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

- (id)title
{
  return CFSTR("Inline Stabilization");
}

- (BOOL)canProvideContextualViewController
{
  void *v3;
  BOOL v4;

  +[PXInlineVideoStabilizationSettings sharedInstance](PXInlineVideoStabilizationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "showDiagnosticUI"))
    v4 = -[PHAsset playbackStyle](self->_asset, "playbackStyle") == 3
      || -[PHAsset playbackStyle](self->_asset, "playbackStyle") == 4;
  else
    v4 = 0;

  return v4;
}

- (id)contextualViewController
{
  PXInlineVideoStabilizationDiagnosticsViewController *v3;

  if (-[PXInlineVideoStabilizationDiagnosticsService canProvideContextualViewController](self, "canProvideContextualViewController"))
  {
    v3 = -[PXInlineVideoStabilizationDiagnosticsViewController initWithInputAsset:]([PXInlineVideoStabilizationDiagnosticsViewController alloc], "initWithInputAsset:", self->_asset);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
