@implementation UIViewController

- (void)_bk_setSceneController:(id)a3
{
  id v4;
  _BKSceneControllerWrapper *value;

  v4 = a3;
  value = -[_BKSceneControllerWrapper initWithSceneController:]([_BKSceneControllerWrapper alloc], "initWithSceneController:", v4);

  objc_setAssociatedObject(self, &off_1008ED5D8, value, (void *)1);
}

- (void)bk_presentCollectionWithID:(id)a3
{
  -[UIViewController bk_presentCollectionWithID:replaceExistingPresentedCollection:](self, "bk_presentCollectionWithID:replaceExistingPresentedCollection:", a3, 0);
}

- (void)bk_presentCollectionWithID:(id)a3 replaceExistingPresentedCollection:(BOOL)a4
{
  id v5;
  __objc2_class *v6;
  id v7;
  void *v8;
  BKLibraryBookshelfLibraryCollectionViewConfiguration *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];

  v43 = a4;
  v5 = a3;
  v45 = v5;
  if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDFinished))
  {
    v6 = BKLibraryBookshelfLibraryFinishedViewConfiguration;
LABEL_7:
    v7 = objc_alloc_init(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfController setupBookshelfWithConfig:](BKLibraryBookshelfController, "setupBookshelfWithConfig:", v7));
    v9 = (BKLibraryBookshelfLibraryCollectionViewConfiguration *)objc_claimAutoreleasedReturnValue(+[BCCollection titleForDefaultCollectionID:](BCCollection, "titleForDefaultCollectionID:", v5));
    objc_msgSend(v8, "setTitle:", v9);
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDWantToRead))
  {
    v6 = BKLibraryBookshelfLibraryWantToReadViewConfiguration;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDSamples))
  {
    v6 = BKLibraryBookshelfLibrarySamplesViewConfiguration;
    goto LABEL_7;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "collectionController"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "uiChildContext"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v5, v41, 0));

  v9 = -[BKLibraryBookshelfLibraryCollectionViewConfiguration initWithCollection:]([BKLibraryBookshelfLibraryCollectionViewConfiguration alloc], "initWithCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfController setupBookshelfWithConfig:](BKLibraryBookshelfController, "setupBookshelfWithConfig:", v9));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedTitle"));
  objc_msgSend(v8, "setTitle:", v42);

LABEL_8:
  v10 = objc_opt_class(BKMainFlowController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKPrimaryScenePresenting));
  v12 = BUDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v44 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rootBarCoordinator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectedNavigationController"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewControllers"));
  if ((unint64_t)objc_msgSend(v16, "count") < 2)
  {
    v20 = 0;
  }
  else
  {
    v17 = objc_opt_class(BKLibraryBookshelfCollectionViewController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastObject"));
    v19 = BUDynamicCast(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  }
  v21 = objc_opt_class(BKLibraryBookshelfCollectionViewController);
  v22 = BUDynamicCast(v21, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v24 = v16;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v30 = objc_opt_class(BKLibraryBookshelfCollectionViewController);
        v31 = BUDynamicCast(v30, v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        objc_msgSend(v32, "dismissReadingListPopover");

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v26);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "collectionID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "collectionID"));
  v35 = objc_msgSend(v33, "isEqualToString:", v34);

  if ((v35 & 1) == 0)
  {
    if (v43 && v20)
    {
      v36 = objc_msgSend(v24, "mutableCopy");
      objc_msgSend(v36, "removeLastObject");
      objc_msgSend(v36, "addObject:", v8);
      v37 = objc_msgSend(v36, "copy");
      objc_msgSend(v15, "setViewControllers:animated:", v37, 1);

    }
    else
    {
      objc_msgSend(v15, "pushViewController:animated:", v8, 1);
    }
  }

}

- (id)_bk_sceneController
{
  id AssociatedObject;
  void *v3;
  void *v4;

  AssociatedObject = objc_getAssociatedObject(self, &off_1008ED5D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sceneController"));

  return v4;
}

- (BKRootBarCoordinating)bk_rootBarCoordinator
{
  UIViewController *v2;
  UISplitViewController *v3;
  id v4;

  v2 = self;
  v3 = -[UIViewController splitViewController](v2, "splitViewController");
  if (!v3)
    v3 = -[UIViewController tabBarController](v2, "tabBarController");
  v4 = -[UISplitViewController bk_rootBarCoordinator](v3, "bk_rootBarCoordinator");

  return (BKRootBarCoordinating *)v4;
}

- (void)doneButtonPressed
{
  -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
