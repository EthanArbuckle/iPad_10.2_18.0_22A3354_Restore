@implementation PSListControllerDefaultNavigationCoordinator

- (BOOL)listControllerShouldNotDeselectAfterAppearing:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "splitViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 == v7;

  objc_msgSend(v3, "splitViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = v8 & ~objc_msgSend(v9, "isCollapsed");
  return (char)v3;
}

- (BOOL)listControllerIsOnTopOfNavigationStack:(id)a3 searchTopMostViewControllerChildren:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v7 == v5;
  if (v7 != v5 && v4)
  {
    objc_msgSend(v5, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "childViewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "containsObject:", v5);

  }
  return v8;
}

- (BOOL)listControllerShouldDeselectAfterFormSheetDisappearance:(id)a3 givenRootController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (void)listController:(id)a3 pushViewController:(id)a4 givenRootController:(id)a5 withModalStylePopupStateApplicator:(id)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  void (**v13)(id, uint64_t);
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;

  v7 = a7;
  v28 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "presentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 0, 0);
    v15 = v11;
    objc_msgSend(v15, "setupController");
    if (objc_msgSend(v15, "usePopupStyle"))
    {
      v13[2](v13, objc_msgSend(v15, "popupStyleIsModal"));
      objc_msgSend(v15, "setModalPresentationStyle:", 7);
      objc_msgSend(v15, "popoverPresentationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDelegate:", v28);
      objc_msgSend(v16, "setPermittedArrowDirections:", 0);
      objc_msgSend(v16, "setSourceView:", 0);
      objc_msgSend(v16, "_setCentersPopoverIfSourceViewNotSet:", 1);
      objc_msgSend(v28, "presentViewController:animated:completion:", v15, 1, 0);
      objc_msgSend(v28, "table");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "indexPathForSelectedRow");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v18, 1);

    }
    else
    {
      objc_msgSend(v28, "splitViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isCollapsed");

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v28, "table");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "indexPathForSelectedRow");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "deselectRowAtIndexPath:animated:", v22, 1);

      }
      if (PSIsRunningInAssistant())
      {
        objc_msgSend(v15, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "layoutIfNeeded");

      }
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "sf_isiPhone");

      if (v25)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "viewControllers");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v27, "setEdgeToEdgeCells:", 1);

        }
      }
      objc_msgSend(v28, "presentViewController:animated:completion:", v15, v7, 0);
    }
    goto LABEL_19;
  }
  if (!v7)
  {
    objc_msgSend(v28, "navigationController");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", v11, 0);
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v28, "showViewController:sender:", v11, v28);
LABEL_20:

}

@end
