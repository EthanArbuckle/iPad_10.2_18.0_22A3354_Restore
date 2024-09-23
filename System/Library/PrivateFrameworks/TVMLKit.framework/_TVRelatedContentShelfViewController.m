@implementation _TVRelatedContentShelfViewController

- (void)setShelfViewController:(id)a3
{
  _TVShelfViewController *v5;
  _TVShelfViewController **p_shelfViewController;
  _TVShelfViewController *shelfViewController;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = (_TVShelfViewController *)a3;
  p_shelfViewController = &self->_shelfViewController;
  shelfViewController = self->_shelfViewController;
  if (shelfViewController != v5)
  {
    -[_TVShelfViewController willMoveToParentViewController:](shelfViewController, "willMoveToParentViewController:", 0);
    if (v5)
    {
      -[_TVRelatedContentShelfViewController addChildViewController:](self, "addChildViewController:", v5);
      -[_TVShelfViewController setDelegate:](v5, "setDelegate:", self);
      -[_TVRelatedContentShelfViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVShelfViewController view](v5, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setShelfView:", v9);

      -[_TVRelatedContentShelfViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVMLCollectionViewController collectionElement](v5, "collectionElement");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transferLayoutStylesFromElement:", v11);

      -[_TVRelatedContentShelfViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD1968];
      -[_TVShelfViewController view](v5, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tv_margin");
      objc_msgSend(v13, "valueWithUIEdgeInsets:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forTVViewStyle:", v15, CFSTR("margin"));

    }
    -[_TVShelfViewController removeFromParentViewController](*p_shelfViewController, "removeFromParentViewController");
    -[_TVShelfViewController didMoveToParentViewController:](v5, "didMoveToParentViewController:", self);
    objc_storeStrong((id *)&self->_shelfViewController, a3);
    -[_TVMLCollectionViewController collectionElement](v5, "collectionElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "firstItemElement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v19, "children", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v25, "tv_elementType") == 43)
          {
            -[_TVRelatedContentShelfViewController view](self, "view");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "style");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "tv_height");
            objc_msgSend(v26, "setRelatedHeight:");

            goto LABEL_14;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v22)
          continue;
        break;
      }
    }
LABEL_14:

    -[_TVMLCollectionViewController collectionView](*p_shelfViewController, "collectionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setRemembersLastFocusedIndexPath:", 1);

  }
}

- (void)loadView
{
  _TVRelatedContentShelfView *v3;
  _TVRelatedContentShelfView *v4;

  v3 = [_TVRelatedContentShelfView alloc];
  v4 = -[_TVRelatedContentShelfView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[_TVRelatedContentShelfViewController setView:](self, "setView:", v4);

}

- (void)shelfViewController:(id)a3 updateRelatedView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[_TVRelatedContentShelfViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelatedView:", v5);

}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[_TVRelatedContentShelfViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_TVRelatedContentShelfViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRelatedContentShelfViewController shelfViewController](self, "shelfViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_impressionableElementsForDocument:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  -[_TVRelatedContentShelfViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relatedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tv_impressionableElementsForDocument:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v11);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_TVShelfViewController)shelfViewController
{
  return self->_shelfViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfViewController, 0);
}

@end
