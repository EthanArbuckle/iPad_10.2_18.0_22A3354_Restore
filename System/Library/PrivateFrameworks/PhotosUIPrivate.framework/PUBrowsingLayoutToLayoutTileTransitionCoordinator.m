@implementation PUBrowsingLayoutToLayoutTileTransitionCoordinator

- (id)newTileAnimationOptions
{
  return objc_alloc_init(PUBrowsingTileViewAnimationOptions);
}

- (id)animationDuration
{
  return &unk_1E59BC500;
}

- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isUpdatingDisplayedContent"))
    v7 = objc_msgSend(v5, "shouldPreserveCurrentContent");
  else
    v7 = 0;

  return v7;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  double v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isUpdatingDisplayedContent"))
  {

LABEL_6:
    v13.receiver = self;
    v13.super_class = (Class)PUBrowsingLayoutToLayoutTileTransitionCoordinator;
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator finalLayoutInfoForDisappearingTileController:fromLayoutInfo:](&v13, sel_finalLayoutInfoForDisappearingTileController_fromLayoutInfo_, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = objc_msgSend(v6, "shouldPreserveCurrentContent");

  if ((v9 & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v7, "zPosition");
  objc_msgSend(v7, "layoutInfoWithZPosition:", v10 + 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  int v24;
  char v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PUBrowsingLayoutToLayoutTileTransitionCoordinator;
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator optionsForAnimatingTileController:toLayoutInfo:withAnimationType:](&v26, sel_optionsForAnimatingTileController_toLayoutInfo_withAnimationType_, v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isUpdatingDisplayedContent");

  if (v12)
  {
    if (objc_msgSend(v8, "shouldPreserveCurrentContent"))
    {
      objc_msgSend(v10, "setDuration:", 0.0);
      objc_msgSend(v10, "setDelay:", 0.0);
      -[PUDefaultLayoutToLayoutTileTransitionCoordinator context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayedContentUpdateGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCompletionGroup:", v14);

      if ((objc_msgSend(v8, "shouldAvoidInPlaceSnapshottedFadeOut") & 1) == 0)
        objc_msgSend(v10, "setShouldFadeOutSnapshotAfterCompletionGroup:", 1);
    }
  }
  else
  {
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataSource");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v19, "isEqual:", v21);

      if ((v25 & 1) == 0)
      {
        if ((unint64_t)(a5 - 1) >= 2)
        {
          if (a5 == 3)
          {
            objc_msgSend(v9, "tileKind");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("PUTileKindItemContent"));

            if (v24)
              objc_msgSend(v10, "setKind:", 101);
          }
        }
        else
        {
          objc_msgSend(v10, "setDelay:", 0.25);
        }
      }
    }
    else
    {

    }
  }

  return v10;
}

@end
