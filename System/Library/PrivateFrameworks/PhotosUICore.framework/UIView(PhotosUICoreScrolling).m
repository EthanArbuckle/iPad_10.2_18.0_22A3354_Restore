@implementation UIView(PhotosUICoreScrolling)

- (uint64_t)px_areAllScrollViewsContainingPoint:()PhotosUICoreScrolling scrolledAtEdge:
{
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;

  objc_msgSend(a1, "hitTest:withEvent:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = a1;
  v12 = v11;

  objc_msgSend(v12, "_px_leafScrollViewAtPoint:", a2, a3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v12;
  v16 = v15;

  v17 = objc_msgSend(v16, "px_areAllContainerScrollViewsScrolledAtEdge:", a5);
  return v17;
}

- (id)_px_leafScrollViewAtPoint:()PhotosUICoreScrolling
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      objc_msgSend(v11, "convertPoint:fromView:", a1, a2, a3);
      v13 = v12;
      v15 = v14;
      if (objc_msgSend(v11, "pointInside:withEvent:", 0))
      {
        objc_msgSend(v11, "_px_leafScrollViewAtPoint:", v13, v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v16)
          break;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    v6 = a1;
    if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = 0;
      goto LABEL_15;
    }
    v16 = v6;
    v6 = v16;
  }
  v17 = v16;
LABEL_15:

  return v17;
}

- (uint64_t)px_areAllContainerScrollViewsScrolledAtEdge:()PhotosUICoreScrolling
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1;
  if (!v4)
    return 1;
  v5 = v4;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
LABEL_9:
    objc_msgSend(v5, "superview");
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
    if (!v11)
      return 1;
  }
  v6 = v5;
  if (!objc_msgSend(v6, "isScrollEnabled"))
    goto LABEL_8;
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldWorkAround126757137");

  if (v8)
  {
    objc_msgSend(v6, "panGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "state");

    if (v10 == 5)
      goto LABEL_8;
  }
  if (objc_msgSend(v6, "px_isScrolledAtEdge:", a3))
  {
LABEL_8:

    goto LABEL_9;
  }

  return 0;
}

@end
