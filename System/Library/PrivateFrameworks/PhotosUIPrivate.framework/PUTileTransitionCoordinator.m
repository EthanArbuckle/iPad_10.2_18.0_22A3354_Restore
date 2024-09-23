@implementation PUTileTransitionCoordinator

+ (id)browsingTileTransitionCoordinatorForTransitionFromLayout:(id)a3 toLayout:(id)a4 withTilingView:(id)a5 anchorAssetReference:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PUBrowsingLayoutToLayoutTileTransitionCoordinator *v16;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(a5, "fixedCoordinateSystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(PUBrowsingLayoutToLayoutTileTransitionCoordinator);
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setFromLayout:](v16, "setFromLayout:", v14);

  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setToLayout:](v16, "setToLayout:", v13);
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setAnchorAssetReference:](v16, "setAnchorAssetReference:", v12);

  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setContext:](v16, "setContext:", v11);
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setFixedCoordinateSystem:](v16, "setFixedCoordinateSystem:", v15);

  return v16;
}

+ (id)defaultTileTransitionCoordinatorForTransitionFromLayout:(id)a3 toLayout:(id)a4 withTilingView:(id)a5 anchorAssetReference:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PUDefaultLayoutToLayoutTileTransitionCoordinator *v16;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(a5, "fixedCoordinateSystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(PUDefaultLayoutToLayoutTileTransitionCoordinator);
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setFromLayout:](v16, "setFromLayout:", v14);

  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setToLayout:](v16, "setToLayout:", v13);
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setAnchorAssetReference:](v16, "setAnchorAssetReference:", v12);

  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setContext:](v16, "setContext:", v11);
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator setFixedCoordinateSystem:](v16, "setFixedCoordinateSystem:", v15);

  return v16;
}

+ (id)defaultTileTransitionCoordinatorForUpdates
{
  return objc_alloc_init(PUDefaultUpdateTileTransitionCoordinator);
}

+ (id)defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:(BOOL)a3 tilingView:(id)a4
{
  _BOOL8 v4;
  id v5;
  PUDefaultFrameChangeTileTransitionCoordinator *v6;

  v4 = a3;
  v5 = a4;
  v6 = objc_alloc_init(PUDefaultFrameChangeTileTransitionCoordinator);
  -[PUDefaultFrameChangeTileTransitionCoordinator setShouldCrossFadeTiles:](v6, "setShouldCrossFadeTiles:", v4);
  -[PUDefaultFrameChangeTileTransitionCoordinator setTilingView:](v6, "setTilingView:", v5);

  -[PUDefaultFrameChangeTileTransitionCoordinator prepare](v6, "prepare");
  return v6;
}

+ (id)defaultTileTransitionCoordinatorForReattachedTileControllers:(id)a3 context:(id)a4
{
  id v4;
  PUDefaultReattachedTileTransitionCoordinator *v5;

  v4 = a4;
  v5 = objc_alloc_init(PUDefaultReattachedTileTransitionCoordinator);
  -[PUDefaultReattachedTileTransitionCoordinator setContext:](v5, "setContext:", v4);

  return v5;
}

+ (id)defaultTileTransitionCoordinatorForLayoutInvalidationContext:(id)a3 layout:(id)a4 tilingView:(id)a5 viewModel:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  PUDefaultContentGuideInsetChangeTileTransitionCoordinator *v13;

  v8 = a3;
  v9 = a5;
  v10 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    v12 = objc_msgSend(v11, "options");
    if (objc_msgSend(v11, "invalidatedContentInsets"))
    {
      v13 = objc_alloc_init(PUDefaultContentGuideInsetChangeTileTransitionCoordinator);
      -[PUDefaultFrameChangeTileTransitionCoordinator setShouldCrossFadeTiles:](v13, "setShouldCrossFadeTiles:", 0);
      -[PUDefaultFrameChangeTileTransitionCoordinator setTilingView:](v13, "setTilingView:", v9);
      -[PUDefaultContentGuideInsetChangeTileTransitionCoordinator setViewModel:](v13, "setViewModel:", v10);
      -[PUDefaultFrameChangeTileTransitionCoordinator prepare](v13, "prepare");
    }
    else if (objc_msgSend(v11, "invalidatedVideoPlaceholderTile"))
    {
      v13 = objc_alloc_init(PUDefaultTileTransitionCoordinator);
    }
    else if ((v12 & 3) != 0)
    {
      v13 = objc_alloc_init(PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator);
      -[PUDefaultContentGuideInsetChangeTileTransitionCoordinator setViewModel:](v13, "setViewModel:", v10);
      -[PUDefaultContentGuideInsetChangeTileTransitionCoordinator setShouldAnimateContent:](v13, "setShouldAnimateContent:", (v12 >> 1) & 1);
      -[PUDefaultContentGuideInsetChangeTileTransitionCoordinator setShouldAnimateAccessory:](v13, "setShouldAnimateAccessory:", v12 & 1);
      -[PUDefaultContentGuideInsetChangeTileTransitionCoordinator setShouldSlideAccessory:](v13, "setShouldSlideAccessory:", (v12 >> 2) & 1);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  return 0;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  return 0;
}

- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4
{
  return 0;
}

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  return 0;
}

- (id)newTileAnimationOptions
{
  return objc_alloc_init(PUTileAnimationOptions);
}

@end
