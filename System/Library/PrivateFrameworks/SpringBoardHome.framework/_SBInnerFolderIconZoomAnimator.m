@implementation _SBInnerFolderIconZoomAnimator

- (_SBInnerFolderIconZoomAnimator)initWithFolderController:(id)a3 iconView:(id)a4 iconZoomScaleDimension:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v18;
  objc_super v19;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  v11 = -[SBIconZoomAnimator initWithAnimationContainer:](&v19, sel_initWithAnimationContainer_, v9);
  if (v11)
  {
    objc_msgSend(v9, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
    objc_storeStrong((id *)v11 + 19, v14);

    objc_storeStrong((id *)v11 + 20, a4);
    CGAffineTransformMakeScale(&v18, x, y);
    v15 = *(_OWORD *)&v18.a;
    v16 = *(_OWORD *)&v18.tx;
    *(_OWORD *)(v11 + 184) = *(_OWORD *)&v18.c;
    *(_OWORD *)(v11 + 200) = v16;
    *(_OWORD *)(v11 + 168) = v15;

  }
  return (_SBInnerFolderIconZoomAnimator *)v11;
}

- (void)_prepareAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  -[SBIconZoomAnimator _prepareAnimation](&v33, sel__prepareAnimation);
  -[SBIconView listLayoutProvider](self->_folderIconView, "listLayoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForIconLocation:", CFSTR("SBIconLocationFolder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconView _iconImageView](self->_folderIconView, "_iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView folderIconImageCache](self->_folderIconView, "folderIconImageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView traitCollection](self->_folderIconView, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SBHIconListLayoutFolderIconGridCellSize(v4);
  v10 = v9;
  objc_msgSend(v4, "iconImageInfo");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = objc_msgSend(v5, "usesLayersForMiniIcons");
  else
    v20 = 0;

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __51___SBInnerFolderIconZoomAnimator__prepareAnimation__block_invoke;
  v23[3] = &unk_1E8D884D8;
  v32 = v20;
  v26 = v12;
  v27 = v14;
  v28 = v16;
  v29 = v18;
  v24 = v7;
  v25 = v6;
  v30 = v8;
  v31 = v10;
  v21 = v6;
  v22 = v7;
  -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", v23);

}

- (void)_setAnimationFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  -[SBIconZoomAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  -[_SBInnerFolderIconZoomAnimator _applyIconCrossfadeForZoomFraction:](self, "_applyIconCrossfadeForZoomFraction:", a3);
  -[_SBInnerFolderIconZoomAnimator _applyIconTransformForZoomFraction:](self, "_applyIconTransformForZoomFraction:", a3);
}

- (void)_cleanupAnimation
{
  objc_super v3;

  -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", &__block_literal_global_29);
  v3.receiver = self;
  v3.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  -[SBIconZoomAnimator _cleanupAnimation](&v3, sel__cleanupAnimation);
}

- (unint64_t)_numberOfSignificantAnimations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  return -[SBIconZoomAnimator _numberOfSignificantAnimations](&v3, sel__numberOfSignificantAnimations) + 2;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[6];
  objc_super v22;

  v8 = a5;
  v9 = -[SBIconAnimator isAnimating](self, "isAnimating");
  v22.receiver = self;
  v22.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  -[SBIconZoomAnimator _animateToFraction:afterDelay:withSharedCompletion:](&v22, sel__animateToFraction_afterDelay_withSharedCompletion_, v8, a3, a4);
  -[SBIconAnimator settings](self, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    v12 = 6;
  else
    v12 = 2;
  v13 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(v10, "effectiveCrossfadeAnimationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "BSAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "factoryWithSettings:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setAllowsAdditiveAnimations:", 1);
  v17 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __85___SBInnerFolderIconZoomAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke;
  v21[3] = &unk_1E8D84C78;
  v21[4] = self;
  *(double *)&v21[5] = a3;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:completion:", v16, v12, v21, v8, a4);
  v18 = (void *)MEMORY[0x1E0D01908];
  -[SBIconAnimator centralAnimationFactory](self, "centralAnimationFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __85___SBInnerFolderIconZoomAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke_2;
  v20[3] = &unk_1E8D84C78;
  v20[4] = self;
  *(double *)&v20[5] = a3;
  objc_msgSend(v18, "animateWithFactory:additionalDelay:options:actions:completion:", v19, v12, v20, v8, a4);

}

- (void)_applyIconCrossfadeForZoomFraction:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69___SBInnerFolderIconZoomAnimator__applyIconCrossfadeForZoomFraction___block_invoke;
  v17[3] = &__block_descriptor_40_e34_v28__0__SBIcon_8__SBIconView_16B24l;
  *(double *)&v17[4] = a3;
  -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBFolderView iconListViews](self->_folderView, "iconListViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 1.0 - a3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[SBFolderView currentIconListView](self->_folderView, "currentIconListView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 != v12)
          objc_msgSend(v11, "setAlpha:", v9);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

}

- (void)_applyIconTransformForZoomFraction:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69___SBInnerFolderIconZoomAnimator__applyIconTransformForZoomFraction___block_invoke;
  v3[3] = &unk_1E8D88540;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[SBIconZoomAnimator enumerateIconsAndIconViewsWithHandler:](self, "enumerateIconsAndIconViewsWithHandler:", v3);
}

- (void)_calculateZoomedOffset:(CGPoint *)a3 scale:(CGPoint *)a4 forIcon:(id)a5 withView:(id)a6
{
  id v10;
  id v11;
  void *v12;
  __int128 v13;
  double width;
  double height;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;

  v10 = a5;
  v11 = a6;
  -[SBIconZoomAnimator iconListView](self, "iconListView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView visibleImageRelativeFrameForMiniIconAtIndex:](self->_folderIconView, "visibleImageRelativeFrameForMiniIconAtIndex:", objc_msgSend(v12, "indexOfIcon:", v10));
  v13 = *(_OWORD *)&self->_folderIconViewScaleTransform.c;
  *(_OWORD *)&v26.a = *(_OWORD *)&self->_folderIconViewScaleTransform.a;
  *(_OWORD *)&v26.c = v13;
  *(_OWORD *)&v26.tx = *(_OWORD *)&self->_folderIconViewScaleTransform.tx;
  v28 = CGRectApplyAffineTransform(v27, &v26);
  width = v28.size.width;
  height = v28.size.height;
  if (a4)
  {
    v16 = self->_folderIconViewScaleTransform.d / self->_folderIconViewScaleTransform.a;
    objc_msgSend(v11, "iconImageVisibleSize");
    v18 = width / v17;
    a4->x = v18;
    if (v16 > 1.0)
    {
      objc_msgSend(v11, "iconImageVisibleSize");
      v18 = height / v19;
    }
    a4->y = v18;
  }
  UIRectGetCenter();
  v21 = v20;
  v23 = v22;
  -[SBFloatyFolderView visibleFolderRelativeImageCenterForIcon:](self->_folderView, "visibleFolderRelativeImageCenterForIcon:", v10);
  if (a3)
  {
    a3->x = v21 - v24;
    a3->y = v23 - v25;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIconView, 0);
  objc_storeStrong((id *)&self->_folderView, 0);
}

@end
