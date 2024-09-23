@implementation PXGadgetAnchorHelper

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAnchorPosition:(int64_t)a3
{
  self->_anchorPosition = a3;
}

- (PXGadgetAnchorHelper)initWithNavigationHelper:(id)a3 dataSourceManager:(id)a4
{
  id v7;
  id v8;
  PXGadgetAnchorHelper *v9;
  PXGadgetAnchorHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXGadgetAnchorHelper;
  v9 = -[PXGadgetAnchorHelper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationHelper, a3);
    objc_storeStrong((id *)&v10->_dataSourceManager, a4);
  }

  return v10;
}

- (BOOL)hasAnchor
{
  void *v2;
  BOOL v3;

  -[PXGadgetAnchorHelper currentAnchor](self, "currentAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)saveAnchor
{
  void *v3;
  void *v4;

  -[PXGadgetAnchorHelper _generateAnchor](self, "_generateAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PXGadgetAnchorHelper setCurrentAnchor:](self, "setCurrentAnchor:", v3);
    v3 = v4;
  }

}

- (void)clearAnchor
{
  -[PXGadgetAnchorHelper setCurrentAnchor:](self, "setCurrentAnchor:", 0);
}

- (void)navigateToAnchorIfNeeded
{
  void *v3;
  id v4;

  -[PXGadgetAnchorHelper currentAnchor](self, "currentAnchor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGadgetAnchorHelper navigationHelper](self, "navigationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v3, "hasPendingNavigation") & 1) == 0)
    objc_msgSend(v3, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", v4, 0, 0);

}

- (id)_generateAnchor
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXGadgetAnchorHelper delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedVisibleIndexPathsForAnchorHelper:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        if ((objc_msgSend(v3, "anchorHelper:indexPathIsFullyVisible:", self, v10, (_QWORD)v16) & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v11 = v10;

      if (v11)
        goto LABEL_19;
    }
    else
    {
LABEL_10:

    }
    v12 = -[PXGadgetAnchorHelper anchorPosition](self, "anchorPosition", (_QWORD)v16);
    if (v12 == 1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v5, "count") >> 1);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12)
      {
        v11 = 0;
        goto LABEL_19;
      }
      objc_msgSend(v5, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (id)v13;
LABEL_19:
    -[PXGadgetAnchorHelper _convertIndexPathToGadget:](self, "_convertIndexPathToGadget:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (id)_convertIndexPathToGadget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];

  v4 = a3;
  -[PXGadgetAnchorHelper dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "section");
  v8 = objc_msgSend(v4, "item");

  if (v4 && v7 < objc_msgSend(v6, "numberOfSections") && v8 < objc_msgSend(v6, "numberOfItemsInSection:", v7))
  {
    v11[0] = objc_msgSend(v6, "identifier");
    v11[1] = v7;
    v11[2] = v8;
    v11[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "gadgetAtIndexPath:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PXGadgetAnchorHelperDelegate)delegate
{
  return (PXGadgetAnchorHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)anchorPosition
{
  return self->_anchorPosition;
}

- (PXGadget)currentAnchor
{
  return self->_currentAnchor;
}

- (void)setCurrentAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_currentAnchor, a3);
}

- (PXGadgetNavigationHelper)navigationHelper
{
  return self->_navigationHelper;
}

- (void)setNavigationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_navigationHelper, a3);
}

- (PXGadgetDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_navigationHelper, 0);
  objc_storeStrong((id *)&self->_currentAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
