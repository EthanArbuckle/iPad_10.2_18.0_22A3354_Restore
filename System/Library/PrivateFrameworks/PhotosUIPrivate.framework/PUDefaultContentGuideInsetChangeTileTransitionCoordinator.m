@implementation PUDefaultContentGuideInsetChangeTileTransitionCoordinator

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  double v15;

  v6 = a4;
  v7 = -[PUTileTransitionCoordinator newTileAnimationOptions](self, "newTileAnimationOptions");
  -[PUDefaultContentGuideInsetChangeTileTransitionCoordinator viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tileKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", PUTileKindProgressIndicator))
  {
    objc_msgSend(v6, "tileKind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", PUTileKindAssetExplorerReviewScreenProgressIndicator);

    if (v11)
      goto LABEL_4;
    objc_msgSend(v6, "tileKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", PUTileKindBackground))
    {
      v14 = objc_msgSend(v8, "isScrubbing");

      if (v14)
      {
        v15 = 0.0;
LABEL_10:
        objc_msgSend(v7, "setDuration:", v15);
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "setKind:", 0);
    v15 = PUChromeAnimationDuration(v8);
    goto LABEL_10;
  }

LABEL_4:
  objc_msgSend(v7, "setKind:", 1003);
  PUBackgroundColorAnimatorBlockForChromeAnimation(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomViewAnimatorBlock:", v12);

LABEL_11:
  return v7;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
