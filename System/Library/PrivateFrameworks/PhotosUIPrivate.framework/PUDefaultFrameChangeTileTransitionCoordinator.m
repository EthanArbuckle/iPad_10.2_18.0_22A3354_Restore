@implementation PUDefaultFrameChangeTileTransitionCoordinator

- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4
{
  id v5;
  _BOOL4 v6;

  v5 = a4;
  if (-[PUDefaultFrameChangeTileTransitionCoordinator shouldCrossFadeTiles](self, "shouldCrossFadeTiles"))
    LOBYTE(v6) = 1;
  else
    v6 = !-[PUDefaultFrameChangeTileTransitionCoordinator _isLayoutInfoVisible:](self, "_isLayoutInfoVisible:", v5);

  return v6;
}

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a4;
  -[PUDefaultTileTransitionCoordinator _layoutInfoWithDefaultDisappearance:](self, "_layoutInfoWithDefaultDisappearance:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PUDefaultFrameChangeTileTransitionCoordinator _isLayoutInfoVisible:](self, "_isLayoutInfoVisible:", v5))
  {
    -[PUDefaultFrameChangeTileTransitionCoordinator _layoutInfoForDisappearedInvisibleTile:](self, "_layoutInfoForDisappearedInvisibleTile:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PUDefaultFrameChangeTileTransitionCoordinator _invisibleTileControllers](self, "_invisibleTileControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  v10 = v6;
  if (v9)
  {
    -[PUDefaultFrameChangeTileTransitionCoordinator _layoutInfoForDisappearedInvisibleTile:](self, "_layoutInfoForDisappearedInvisibleTile:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_layoutInfoForDisappearedInvisibleTile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _OWORD v41[3];
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v4 = a3;
  -[PUDefaultFrameChangeTileTransitionCoordinator tilingView](self, "tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataSourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  v11 = v4;
  if (v10)
  {
    objc_msgSend(v6, "visibleRect");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v6, "coordinateSystem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateSystem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v20, v21, v13, v15);
    v24 = v23;

    objc_msgSend(v4, "center");
    v26 = v25;
    v28 = v27;
    v42.origin.x = v22;
    v42.origin.y = v24;
    v42.size.width = v17;
    v42.size.height = v19;
    v29 = CGRectGetWidth(v42) * 3.0;
    v43.origin.x = v22;
    v43.origin.y = v24;
    v43.size.width = v17;
    v43.size.height = v19;
    v30 = v26 <= CGRectGetMidX(v43);
    v31 = -1.0;
    if (!v30)
      v31 = 1.0;
    v32 = v26 + v29 * v31;
    v44.origin.x = v22;
    v44.origin.y = v24;
    v44.size.width = v17;
    v44.size.height = v19;
    v33 = CGRectGetHeight(v44) * 3.0;
    v45.origin.x = v22;
    v45.origin.y = v24;
    v45.size.width = v17;
    v45.size.height = v19;
    v30 = v28 <= CGRectGetMidY(v45);
    v34 = -1.0;
    if (!v30)
      v34 = 1.0;
    v35 = v28 + v33 * v34;
    objc_msgSend(v4, "size");
    v37 = v36;
    v39 = v38;
    if (v4)
      objc_msgSend(v4, "transform");
    else
      memset(v41, 0, sizeof(v41));
    objc_msgSend(v4, "layoutInfoWithCenter:size:transform:", v41, v32, v35, v37, v39);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)prepare
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  PUDefaultFrameChangeTileTransitionCoordinator *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultFrameChangeTileTransitionCoordinator tilingView](self, "tilingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __56__PUDefaultFrameChangeTileTransitionCoordinator_prepare__block_invoke;
  v9 = &unk_1E58A3198;
  v10 = self;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateAllTileControllersUsingBlock:", &v6);

  -[PUDefaultFrameChangeTileTransitionCoordinator _setInvisibleTileControllers:](self, "_setInvisibleTileControllers:", v5, v6, v7, v8, v9, v10);
}

- (BOOL)_isLayoutInfoVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGRect v29;
  CGRect v30;

  v4 = a3;
  -[PUDefaultFrameChangeTileTransitionCoordinator tilingView](self, "tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "visibleRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "coordinateSystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinateSystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v15, v16, v8, v10);
  v19 = v18;

  objc_msgSend(v4, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v29.origin.x = v21;
  v29.origin.y = v23;
  v29.size.width = v25;
  v29.size.height = v27;
  v30.origin.x = v17;
  v30.origin.y = v19;
  v30.size.width = v12;
  v30.size.height = v14;
  LOBYTE(v4) = CGRectIntersectsRect(v29, v30);

  return (char)v4;
}

- (BOOL)shouldCrossFadeTiles
{
  return self->_shouldCrossFadeTiles;
}

- (void)setShouldCrossFadeTiles:(BOOL)a3
{
  self->_shouldCrossFadeTiles = a3;
}

- (PUTilingView)tilingView
{
  return (PUTilingView *)objc_loadWeakRetained((id *)&self->_tilingView);
}

- (void)setTilingView:(id)a3
{
  objc_storeWeak((id *)&self->_tilingView, a3);
}

- (NSSet)_invisibleTileControllers
{
  return self->__invisibleTileControllers;
}

- (void)_setInvisibleTileControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__invisibleTileControllers, 0);
  objc_destroyWeak((id *)&self->_tilingView);
}

void __56__PUDefaultFrameChangeTileTransitionCoordinator_prepare__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "layoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(*(id *)(a1 + 32), "_isLayoutInfoVisible:", v3) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

@end
