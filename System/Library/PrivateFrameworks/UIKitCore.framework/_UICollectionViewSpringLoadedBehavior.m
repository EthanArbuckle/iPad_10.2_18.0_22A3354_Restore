@implementation _UICollectionViewSpringLoadedBehavior

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;

  v5 = a4;
  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideTargetItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  objc_msgSend(v6, "_indexPathForItemAtPoint:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cellForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && !objc_msgSend(v9, "isUserInteractionEnabled"))
    goto LABEL_5;
  if (v7)
  {
    if ((objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
    {
LABEL_5:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  objc_msgSend(v5, "setOverrideTargetView:", 0);
  objc_msgSend(v5, "targetView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "_shouldSpringLoadItemAtIndexPath:withContext:", v8, v5))
    goto LABEL_13;
  objc_msgSend(v5, "targetView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v12)
  {
    objc_msgSend(v5, "targetView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOverrideTargetView:", v14);

  }
  objc_msgSend(v6, "_delegateActual");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0
    || (objc_msgSend(v6, "_delegateProxy"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "collectionView:shouldHighlightItemAtIndexPath:", v6, v8),
        v17,
        v18))
  {
    objc_msgSend(v5, "setOverrideTargetItem:", v8);
    v11 = 1;
  }
  else
  {
LABEL_13:
    v11 = 0;
  }

LABEL_15:
  return v11;
}

@end
