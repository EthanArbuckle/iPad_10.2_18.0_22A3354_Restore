@implementation PUDefaultLayoutToLayoutTileTransitionCoordinator

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUDefaultLayoutToLayoutTileTransitionCoordinator;
  -[PUDefaultTileTransitionCoordinator optionsForAnimatingTileController:toLayoutInfo:withAnimationType:](&v15, sel_optionsForAnimatingTileController_toLayoutInfo_withAnimationType_, a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isViewControllerTransition");

  if (v11)
    objc_msgSend(v9, "setHighFrameRateReason:", 2228228);
  objc_msgSend(v8, "tileKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", PUTileKindBackground);

  if ((v13 & 1) == 0)
    -[PUDefaultTileTransitionCoordinator configureOptions:forSpringAnimationsZoomingIn:](self, "configureOptions:forSpringAnimationsZoomingIn:", v9, -[PUDefaultLayoutToLayoutTileTransitionCoordinator _isZoomingIn](self, "_isZoomingIn"));

  return v9;
}

- (BOOL)useDoubleSidedTransitionForUpdatedTileController:(id)a3 toLayoutInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;

  v5 = a4;
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v5, "dataSourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    objc_msgSend(v5, "indexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetReferenceAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator anchorAssetReference](self, "anchorAssetReference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    v17 = v16 ^ 1;
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  objc_super v36;
  id v37;
  id v38;

  v6 = a3;
  v7 = a4;
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator anchorAssetReference](self, "anchorAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    objc_msgSend(v8, "indexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

  }
  else
  {
    v13 = 0;
  }

  if (!v8 || v13)
  {
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dataSource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = 0;
    }

    -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

    objc_msgSend(v7, "indexPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tileKind");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUAssetsDataSourceConverter defaultConverter](PUAssetsDataSourceConverter, "defaultConverter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v23;
    v38 = v22;
    v25 = objc_msgSend(v24, "convertIndexPath:tileKind:fromDataSource:toDataSource:", &v38, &v37, v21, v35);
    v26 = v38;

    v27 = v37;
    v28 = 0;
    if (v25)
    {
      v6 = v19;
      if (!v26 || !v27)
      {
LABEL_20:

        if (v28)
          goto LABEL_24;
        goto LABEL_21;
      }
      -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layoutInfoForTileWithIndexPath:kind:", v26, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v7, "coordinateSystem");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "layoutInfoByInterpolatingWithLayoutInfo:mixFactor:coordinateSystem:", v30, v31, 1.0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28 = 0;
      }

    }
    v6 = v19;
    goto LABEL_20;
  }
LABEL_21:
  if (!-[PUDefaultLayoutToLayoutTileTransitionCoordinator _isCenterTileLayoutInfo:](self, "_isCenterTileLayoutInfo:", v7))goto LABEL_23;
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator _centerTileLayoutInfoWithDefaultDisappearance:layoutWhereCenterTileExists:layoutWhereCenterTileDisappeared:](self, "_centerTileLayoutInfoWithDefaultDisappearance:layoutWhereCenterTileExists:layoutWhereCenterTileDisappeared:", v7, v32, v33);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
LABEL_23:
    v36.receiver = self;
    v36.super_class = (Class)PUDefaultLayoutToLayoutTileTransitionCoordinator;
    -[PUDefaultTileTransitionCoordinator initialLayoutInfoForAppearingTileController:toLayoutInfo:](&v36, sel_initialLayoutInfoForAppearingTileController_toLayoutInfo_, v6, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_24:

  return v28;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator anchorAssetReference](self, "anchorAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    objc_msgSend(v8, "indexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

  }
  else
  {
    v13 = 0;
  }

  if (!v8 || v13)
  {
    v31 = v6;
    objc_msgSend(v7, "dataSourceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tileKind");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "isEqualToString:", v19);

    if ((v20 & 1) != 0)
    {
      v21 = 0;
      if (!v15)
      {
        v6 = v31;
LABEL_14:

        if (v21)
          goto LABEL_18;
        goto LABEL_15;
      }
      v6 = v31;
      if (!v16)
        goto LABEL_14;
      -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "layoutInfoForTileWithIndexPath:kind:", v15, v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v21 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v7, "coordinateSystem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layoutInfoByInterpolatingWithLayoutInfo:mixFactor:coordinateSystem:", v23, v24, 1.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "isEqualToString:", v25);

      v21 = 0;
    }

    v6 = v31;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
  if (!-[PUDefaultLayoutToLayoutTileTransitionCoordinator _isCenterTileLayoutInfo:](self, "_isCenterTileLayoutInfo:", v7))goto LABEL_17;
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator _centerTileLayoutInfoWithDefaultDisappearance:layoutWhereCenterTileExists:layoutWhereCenterTileDisappeared:](self, "_centerTileLayoutInfoWithDefaultDisappearance:layoutWhereCenterTileExists:layoutWhereCenterTileDisappeared:", v7, v26, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
LABEL_17:
    v32.receiver = self;
    v32.super_class = (Class)PUDefaultLayoutToLayoutTileTransitionCoordinator;
    -[PUDefaultTileTransitionCoordinator finalLayoutInfoForDisappearingTileController:fromLayoutInfo:](&v32, sel_finalLayoutInfoForDisappearingTileController_fromLayoutInfo_, v6, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator fixedCoordinateSystem](self, "fixedCoordinateSystem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutInfoWithCoordinateSystem:", v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_18:

  return v21;
}

- (BOOL)_isCenterTileLayoutInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PUOneUpTilingLayout centerTileKinds](PUOneUpTilingLayout, "centerTileKinds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tileKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5);
  return (char)v3;
}

- (id)_centerTileLayoutInfoWithDefaultDisappearance:(id)a3 layoutWhereCenterTileExists:(id)a4 layoutWhereCenterTileDisappeared:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __CFString *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  CGAffineTransform v39;
  __CFString *v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v9, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v13 = 0;
LABEL_13:
    v14 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v9, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v11 && v13)
  {
    objc_msgSend(v7, "dataSourceIdentifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
    {

    }
    else
    {
      v17 = v16;
      v18 = objc_msgSend(v15, "isEqual:", v16);

      if ((v18 & 1) == 0)
      {
        PLOneUpGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v7;
          v44 = 2112;
          v45 = v11;
          _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEFAULT, "Version mismatch between %@ and %@, this might cause incorrect animations.", buf, 0x16u);
        }

        goto LABEL_13;
      }
    }
    objc_msgSend(v7, "indexPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUAssetsDataSourceConverter defaultConverter](PUAssetsDataSourceConverter, "defaultConverter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = CFSTR("PUTileKindItemContent");
    v41 = v20;
    v22 = objc_msgSend(v21, "convertIndexPath:tileKind:fromDataSource:toDataSource:", &v41, &v40, v11, v13);
    v23 = v41;

    v24 = v40;
    if (v22)
    {
      objc_msgSend(v9, "layoutInfoForTileWithIndexPath:kind:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "center");
        v28 = v27;
        v30 = v29;
        objc_msgSend(v7, "size");
        v33 = v31;
        v34 = v32;
        if (v31 < v32)
          v31 = v32;
        CGAffineTransformMakeScale(&v39, 1.0 / v31, 1.0 / v31);
        objc_msgSend(v7, "zPosition");
        v36 = v35;
        objc_msgSend(v26, "coordinateSystem");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "layoutInfoWithCenter:size:alpha:transform:zPosition:coordinateSystem:", &v39, v37, v28, v30, v33, v34, 0.0, v36);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
LABEL_24:

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUDefaultLayoutToLayoutTileTransitionCoordinator;
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" fromLayout:%@ toLayout:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setContext:(id)a3
{
  PUTilingLayoutTransitionContext *v5;
  PUTilingLayoutTransitionContext *v6;

  v5 = (PUTilingLayoutTransitionContext *)a3;
  if (self->_context != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_context, a3);
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator _invalidateIsZoomingIn](self, "_invalidateIsZoomingIn");
    v5 = v6;
  }

}

- (void)setFromLayout:(id)a3
{
  PUTilingLayout *v5;
  PUTilingLayout *v6;

  v5 = (PUTilingLayout *)a3;
  if (self->_fromLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fromLayout, a3);
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator _invalidateIsZoomingIn](self, "_invalidateIsZoomingIn");
    v5 = v6;
  }

}

- (void)setToLayout:(id)a3
{
  PUTilingLayout *v5;
  PUTilingLayout *v6;

  v5 = (PUTilingLayout *)a3;
  if (self->_toLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_toLayout, a3);
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator _invalidateIsZoomingIn](self, "_invalidateIsZoomingIn");
    v5 = v6;
  }

}

- (BOOL)_isZoomingIn
{
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator _updateIsZoomingInIfNeeded](self, "_updateIsZoomingInIfNeeded");
  return self->__isZoomingIn;
}

- (void)_invalidateIsZoomingIn
{
  -[PUDefaultLayoutToLayoutTileTransitionCoordinator _setNeedsUpdateZoomingIn:](self, "_setNeedsUpdateZoomingIn:", 1);
}

- (void)_updateIsZoomingInIfNeeded
{
  void *v3;
  int64_t v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;

  if (-[PUDefaultLayoutToLayoutTileTransitionCoordinator _needsUpdateZoomingIn](self, "_needsUpdateZoomingIn"))
  {
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator _setNeedsUpdateZoomingIn:](self, "_setNeedsUpdateZoomingIn:", 0);
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator fromLayout](self, "fromLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PUDefaultLayoutToLayoutTileTransitionCoordinator _zoomLevelForLayout:](self, "_zoomLevelForLayout:", v3);

    -[PUDefaultLayoutToLayoutTileTransitionCoordinator toLayout](self, "toLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUDefaultLayoutToLayoutTileTransitionCoordinator _zoomLevelForLayout:](self, "_zoomLevelForLayout:", v5);

    v7 = 0;
    if (v6 > v4)
    {
      -[PUDefaultLayoutToLayoutTileTransitionCoordinator context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isCancelingTransition") ^ 1;

    }
    -[PUDefaultLayoutToLayoutTileTransitionCoordinator _setZoomingIn:](self, "_setZoomingIn:", v7);
  }
}

- (int64_t)_zoomLevelForLayout:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (PUTilingLayout)fromLayout
{
  return self->_fromLayout;
}

- (PUTilingLayout)toLayout
{
  return self->_toLayout;
}

- (PUAssetReference)anchorAssetReference
{
  return self->_anchorAssetReference;
}

- (void)setAnchorAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_anchorAssetReference, a3);
}

- (PUTilingLayoutTransitionContext)context
{
  return self->_context;
}

- (PUTilingCoordinateSystem)fixedCoordinateSystem
{
  return self->_fixedCoordinateSystem;
}

- (void)setFixedCoordinateSystem:(id)a3
{
  objc_storeStrong((id *)&self->_fixedCoordinateSystem, a3);
}

- (void)_setZoomingIn:(BOOL)a3
{
  self->__isZoomingIn = a3;
}

- (BOOL)_needsUpdateZoomingIn
{
  return self->__needsUpdateZoomingIn;
}

- (void)_setNeedsUpdateZoomingIn:(BOOL)a3
{
  self->__needsUpdateZoomingIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedCoordinateSystem, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_anchorAssetReference, 0);
  objc_storeStrong((id *)&self->_toLayout, 0);
  objc_storeStrong((id *)&self->_fromLayout, 0);
}

@end
