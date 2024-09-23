@implementation PXGViewSlowAnimationsDiagnosticsService

- (PXGViewSlowAnimationsDiagnosticsService)initWithItemProviders:(id)a3
{
  id v4;
  PXGViewSlowAnimationsDiagnosticsService *v5;
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
  v18.super_class = (Class)PXGViewSlowAnimationsDiagnosticsService;
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
  void *v2;
  __CFString *v3;
  __CFString *v4;

  -[PXGViewSlowAnimationsDiagnosticsService gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "slowAnimationsEnabled"))
    v3 = CFSTR("Disable Slow Animations");
  else
    v3 = CFSTR("Enable Slow Animations");
  v4 = v3;

  return v4;
}

- (BOOL)canPerformAction
{
  void *v2;
  BOOL v3;

  -[PXGViewSlowAnimationsDiagnosticsService gridView](self, "gridView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)performAction
{
  uint64_t v3;
  void *v4;
  id v5;

  -[PXGViewSlowAnimationsDiagnosticsService gridView](self, "gridView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "slowAnimationsEnabled") ^ 1;
  -[PXGViewSlowAnimationsDiagnosticsService gridView](self, "gridView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSlowAnimationsEnabled:", v3);

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
