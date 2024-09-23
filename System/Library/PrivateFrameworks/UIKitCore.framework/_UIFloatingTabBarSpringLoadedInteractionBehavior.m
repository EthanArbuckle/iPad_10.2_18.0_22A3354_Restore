@implementation _UIFloatingTabBarSpringLoadedInteractionBehavior

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  int v41;
  CGPoint v43;
  CGRect v44;

  v5 = a4;
  -[_UIFloatingTabBarSpringLoadedInteractionBehavior tabBar](self, "tabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEditing");

  if ((v8 & 1) == 0)
  {
    -[_UIFloatingTabBarSpringLoadedInteractionBehavior tabBar](self, "tabBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pinnedItemsView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v11);
    v13 = v12;
    v15 = v14;

    -[_UIFloatingTabBarSpringLoadedInteractionBehavior tabBar](self, "tabBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pinnedItemsView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "itemIndexForItemAtLocation:", v13, v15);

    objc_msgSend(v5, "targetItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarSpringLoadedInteractionBehavior tabBar](self, "tabBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v20, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locationInView:", v22);
      v24 = v23;
      v26 = v25;

      -[_UIFloatingTabBarSpringLoadedInteractionBehavior tabBar](self, "tabBar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "collectionView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      v43.x = v24;
      v43.y = v26;
      v29 = CGRectContainsPoint(v44, v43);

      if (!v29)
      {
        v36 = 0;
LABEL_17:
        v32 = 0;
        goto LABEL_18;
      }
      -[_UIFloatingTabBarSpringLoadedInteractionBehavior tabBar](self, "tabBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "collectionView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "indexPathForItemAtPoint:", v24, v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIFloatingTabBarSpringLoadedInteractionBehavior tabBar](self, "tabBar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dataSource");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "itemIdentifierForIndexPath:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "tabForSelection");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
        goto LABEL_18;
    }
    else
    {
      objc_msgSend(v20, "pinnedItemsView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "tabForSelectionAtItemIndex:", v18);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v18, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
LABEL_18:
        v9 = 0;
        goto LABEL_19;
      }
    }
    objc_msgSend(v5, "setTargetItem:", v32);
    if (!v19)
      goto LABEL_15;
    v38 = v19;
    v39 = v32;
    if (v38 == v39)
    {

      goto LABEL_15;
    }
    v40 = v39;
    if (v39)
    {
      v41 = objc_msgSend(v38, "isEqual:", v39);

      if (!v41)
      {
        v9 = 0;
        v32 = v40;
LABEL_19:

        goto LABEL_20;
      }
LABEL_15:
      v9 = objc_msgSend(v36, "isSpringLoaded");
      goto LABEL_19;
    }

    goto LABEL_17;
  }
  v9 = 0;
LABEL_20:

  return v9;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "state");
  objc_msgSend(v6, "targetItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarSpringLoadedInteractionBehavior tabBar](self, "tabBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_viewForItemAtIndexPath:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTargetView:", v9);

  -[_UIFloatingTabBarSpringLoadedInteractionBehavior tabBar](self, "tabBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blinkEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "interaction:didChangeWithContext:", v7, v6);

}

- (_UIFloatingTabBar)tabBar
{
  return (_UIFloatingTabBar *)objc_loadWeakRetained((id *)&self->_tabBar);
}

- (void)setTabBar:(id)a3
{
  objc_storeWeak((id *)&self->_tabBar, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBar);
}

@end
