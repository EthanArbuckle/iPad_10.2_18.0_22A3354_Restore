@implementation PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v6 = a4;
  if (-[PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator shouldAnimateContent](self, "shouldAnimateContent"))
  {
    goto LABEL_6;
  }
  if (!-[PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator shouldAnimateAccessory](self, "shouldAnimateAccessory"))goto LABEL_7;
  objc_msgSend(v6, "tileKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", PUTileKindAccessory))
  {
    objc_msgSend(v6, "tileKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", PUTileKindPeople);

    if (v9)
      goto LABEL_6;
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }

LABEL_6:
  v10 = -[PUTileTransitionCoordinator newTileAnimationOptions](self, "newTileAnimationOptions");
  objc_msgSend(v10, "setKind:", 1001);
  objc_msgSend(v10, "setHighFrameRateReason:", 2228225);
LABEL_8:

  return v10;
}

- (id)_layoutInfoWithDefaultDisappearance:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
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
  double v37;
  double v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  void *v61;
  objc_super v63;
  _OWORD v64[3];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _OWORD v71[3];
  CGRect v72;

  v4 = a3;
  if (-[PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator shouldSlideAccessory](self, "shouldSlideAccessory")&& (objc_msgSend(v4, "tileKind"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "isEqualToString:", PUTileKindAccessory), v5, v6))
  {
    v7 = v4;
    -[PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetsDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSourceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
    {
      v61 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v7, "indexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetReferenceAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "assetViewModelForAssetReference:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentOffset");
    v17 = v16;

    objc_msgSend(v7, "untransformedContentFrame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(v7, "size");
    v27 = v26;
    v72.origin.x = v19;
    v72.origin.y = v21;
    v72.size.width = v23;
    v72.size.height = v25;
    v28 = v27 - (v17 + CGRectGetMaxY(v72));
    objc_msgSend(v7, "minimumVisibleHeight");
    if (v28 >= v29)
      v30 = v28;
    else
      v30 = v29;
    objc_msgSend(v7, "center");
    v32 = v31;
    v34 = v33 + v30;
    objc_msgSend(v7, "size");
    v36 = v35;
    v38 = v37;
    if (v7)
      objc_msgSend(v7, "transform");
    else
      memset(v71, 0, sizeof(v71));
    objc_msgSend(v7, "layoutInfoWithCenter:size:transform:", v71, v32, v34, v36, v38);
    v60 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator shouldSlideAccessory](self, "shouldSlideAccessory"))goto LABEL_21;
    objc_msgSend(v4, "tileKind");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqualToString:", PUTileKindPeople);

    if (!v40)
      goto LABEL_21;
    -[PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator viewModel](self, "viewModel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSourceIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqualToString:", v42);

    if ((v43 & 1) == 0)
    {

LABEL_21:
      v63.receiver = self;
      v63.super_class = (Class)PUDefaultAccessoryViewVisibilityChangeTileTransitionCoordinator;
      -[PUDefaultTileTransitionCoordinator _layoutInfoWithDefaultDisappearance:](&v63, sel__layoutInfoWithDefaultDisappearance_, v4);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(v4, "indexPath");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetReferenceAtIndexPath:", v44);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "assetViewModelForAssetReference:", v9);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "contentOffset");
    v47 = v46;

    objc_msgSend(v4, "size");
    v49 = v48 - v47;
    objc_msgSend(v4, "center");
    v51 = v50;
    v69 = 0u;
    v70 = 0u;
    v53 = v52 + v49;
    v68 = 0u;
    if (v4)
      objc_msgSend(v4, "transform");
    v64[0] = v68;
    v64[1] = v69;
    v64[2] = v70;
    -[PUDefaultTileTransitionCoordinator _adjustDefaultDisappearanceTransform:](self, "_adjustDefaultDisappearanceTransform:", v64);
    v68 = v65;
    v69 = v66;
    v70 = v67;
    objc_msgSend(v4, "size");
    v55 = v54;
    v57 = v56;
    objc_msgSend(v4, "zPosition");
    v59 = v58;
    objc_msgSend(v4, "coordinateSystem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v68;
    v66 = v69;
    v67 = v70;
    objc_msgSend(v4, "layoutInfoWithCenter:size:alpha:transform:zPosition:coordinateSystem:", &v65, v14, v51, v53, v55, v57, 0.0, v59);
    v60 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v60;

LABEL_20:
  if (!v61)
    goto LABEL_21;
LABEL_22:

  return v61;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (BOOL)shouldAnimateContent
{
  return self->_shouldAnimateContent;
}

- (void)setShouldAnimateContent:(BOOL)a3
{
  self->_shouldAnimateContent = a3;
}

- (BOOL)shouldAnimateAccessory
{
  return self->_shouldAnimateAccessory;
}

- (void)setShouldAnimateAccessory:(BOOL)a3
{
  self->_shouldAnimateAccessory = a3;
}

- (BOOL)shouldSlideAccessory
{
  return self->_shouldSlideAccessory;
}

- (void)setShouldSlideAccessory:(BOOL)a3
{
  self->_shouldSlideAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
