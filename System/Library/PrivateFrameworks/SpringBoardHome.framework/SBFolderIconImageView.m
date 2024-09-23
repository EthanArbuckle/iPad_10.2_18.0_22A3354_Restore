@implementation SBFolderIconImageView

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (BOOL)hasCustomBackgroundView
{
  return self->_hasCustomBackgroundView;
}

uint64_t __51__SBFolderIconImageView_setIcon_location_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccessibilityBackgroundContrast");
}

- (id)_folderIconImageCache
{
  void *v2;
  void *v3;

  -[SBIconImageView iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "folderIconImageCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
}

- (void)_updateCurrentBackgroundStyle
{
  unint64_t v3;
  unint64_t transitionToken;
  UIView *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  UIView *v13;
  void *v14;
  UIView *v15;
  void (**v16)(_QWORD);
  UIView *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  UIView *solidColorBackgroundView;
  UIView *v28;
  double v29;
  UIView *v30;
  id v31;
  UIView *v32;
  id v33;
  id v34;
  void (**v35)(void *, uint64_t);
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  unint64_t v41;
  _QWORD v42[4];
  UIView *v43;
  SBFolderIconImageView *v44;
  _QWORD v45[4];
  UIView *v46;
  _QWORD aBlock[4];
  UIView *v48;
  _QWORD v49[4];
  UIView *v50;
  id v51;
  _QWORD v52[4];
  UIView *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  _QWORD v58[4];
  UIView *v59;
  _QWORD v60[5];
  _QWORD v61[4];
  UIView *v62;
  SBFolderIconImageView *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;

  v3 = -[SBFolderIconImageView concreteBackgroundStyle](self, "concreteBackgroundStyle");
  -[SBFolderIconImageView setCurrentBackgroundStyle:](self, "setCurrentBackgroundStyle:", v3);
  transitionToken = self->_transitionToken;
  self->_transitionToken = transitionToken + 1;
  v5 = self->_backgroundView;
  v6 = MEMORY[0x1E0C809B0];
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v3 == 2)
    {
      -[SBIconImageView iconView](self, "iconView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessibilityTintColor");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_5;
      v9 = (void *)v8;
      objc_msgSend(v7, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupDock"), v10);

      SBHomeAccessibilityTintColor(v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_5:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SBIconImageView iconView](self, "iconView");
    v17 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView iconImageInfo](v17, "iconImageInfo");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    solidColorBackgroundView = self->_solidColorBackgroundView;
    if (solidColorBackgroundView)
    {
      v28 = solidColorBackgroundView;
      -[UIView _continuousCornerRadius](v28, "_continuousCornerRadius");
      if (v29 == v26)
      {
        v14 = 0;
      }
      else
      {
        v52[0] = v6;
        v52[1] = 3221225472;
        v52[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_4;
        v52[3] = &unk_1E8D84E58;
        v53 = v28;
        v54 = v20;
        v55 = v22;
        v56 = v24;
        v57 = v26;
        v14 = _Block_copy(v52);

      }
      v49[0] = v6;
      v49[1] = 3221225472;
      v49[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_5;
      v49[3] = &unk_1E8D84EF0;
      v50 = v28;
      v51 = v12;
      v33 = v12;
      v32 = v28;
      v16 = (void (**)(_QWORD))_Block_copy(v49);

      v18 = 0;
    }
    else
    {
      v61[0] = v6;
      v61[1] = 3221225472;
      v61[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke;
      v61[3] = &unk_1E8D86EF0;
      v30 = v5;
      v65 = v20;
      v66 = v22;
      v67 = v24;
      v68 = v26;
      v62 = v30;
      v63 = self;
      v64 = v12;
      v31 = v12;
      v14 = _Block_copy(v61);
      v60[0] = v6;
      v60[1] = 3221225472;
      v60[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_2;
      v60[3] = &unk_1E8D84C50;
      v60[4] = self;
      v16 = (void (**)(_QWORD))_Block_copy(v60);
      v58[0] = v6;
      v58[1] = 3221225472;
      v58[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_3;
      v58[3] = &unk_1E8D84C50;
      v59 = v30;
      v18 = _Block_copy(v58);

      v32 = v62;
    }

  }
  else
  {
    v13 = self->_solidColorBackgroundView;
    aBlock[0] = v6;
    aBlock[1] = 3221225472;
    aBlock[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_6;
    aBlock[3] = &unk_1E8D84C50;
    v48 = v5;
    v14 = _Block_copy(aBlock);
    v45[0] = v6;
    v45[1] = 3221225472;
    v45[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_7;
    v45[3] = &unk_1E8D84C50;
    v15 = v13;
    v46 = v15;
    v16 = (void (**)(_QWORD))_Block_copy(v45);
    v42[0] = v6;
    v42[1] = 3221225472;
    v42[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_8;
    v42[3] = &unk_1E8D84EF0;
    v43 = v15;
    v44 = self;
    v17 = v15;
    v18 = _Block_copy(v42);

    v12 = v48;
  }

  v39[0] = v6;
  v39[1] = 3221225472;
  v39[2] = __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_9;
  v39[3] = &unk_1E8D87EF8;
  v41 = transitionToken;
  v39[4] = self;
  v34 = v18;
  v40 = v34;
  v35 = (void (**)(void *, uint64_t))_Block_copy(v39);
  if (v14)
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v14);
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
  {
    v36 = (void *)MEMORY[0x1E0D01908];
    objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationSettings");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "factoryWithSettings:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "animateWithFactory:actions:completion:", v38, v16, v35);

  }
  else
  {
    v16[2](v16);
    v35[2](v35, 1);
  }

}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_9(uint64_t result)
{
  if (*(_QWORD *)(result + 48) == *(_QWORD *)(*(_QWORD *)(result + 32) + 664))
  {
    result = *(_QWORD *)(result + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)setCurrentBackgroundStyle:(unint64_t)a3
{
  self->_currentBackgroundStyle = a3;
}

- (unint64_t)concreteBackgroundStyle
{
  unint64_t result;

  result = -[SBFolderIconImageView backgroundStyle](self, "backgroundStyle");
  if (!result)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
      return 2;
    else
      return 1;
  }
  return result;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (unint64_t)visibleMiniIconListIndex
{
  return self->_currentPageIndex;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[SBFolderIconImageView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldRasterize:", 0);

  -[SBFolderIconImageView scrollToTopOfFirstPageAnimated:](self, "scrollToTopOfFirstPageAnimated:", 0);
  -[SBFolderIconImageView setBackgroundAndIconGridImageAlpha:](self, "setBackgroundAndIconGridImageAlpha:", 1.0);
  -[SBFolderIconImageView setBackgroundScale:](self, "setBackgroundScale:", 1.0);
  -[SBFolderIconImageView _setPageElements:](self, "_setPageElements:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SBFolderIconImageView;
  -[SBIconImageView prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)scrollToTopOfFirstPageAnimated:(BOOL)a3
{
  -[SBFolderIconImageView scrollToTopOfPage:animated:](self, "scrollToTopOfPage:animated:", 0, a3);
}

- (void)scrollToTopOfPage:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t currentPageIndex;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v4 = a4;
  v7 = -[NSMutableArray count](self->_pageElements, "count");
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v7 > a3)
  {
    if (self->_currentPageIndex != a3
      || (-[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", a3),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "visibleRow"),
          v8,
          v9))
    {
      v10 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
      v11 = v10;
      currentPageIndex = self->_currentPageIndex;
      if (currentPageIndex <= a3)
      {
        if (currentPageIndex >= a3)
        {
          -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:");
          v17 = objc_claimAutoreleasedReturnValue();
          v14 = 0;
          if (v11 == 1)
            v18 = 0;
          else
            v18 = (void *)v17;
          v19 = v18;
          if (v11 == 1)
            v16 = (void *)v17;
          else
            v16 = 0;
          goto LABEL_33;
        }
        if (v10 == 1)
          v13 = a3;
        else
          v13 = self->_currentPageIndex;
        if (v10 == 1)
          v14 = 1;
        else
          v14 = 2;
        if (v10 == 1)
          v15 = self->_currentPageIndex;
        else
          v15 = a3;
      }
      else
      {
        if (v10 == 1)
          v13 = self->_currentPageIndex;
        else
          v13 = a3;
        if (v10 == 1)
          v14 = 2;
        else
          v14 = 1;
        if (v10 == 1)
          v15 = a3;
        else
          v15 = self->_currentPageIndex;
      }
      -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", v13);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
      -[SBFolderIconImageView _performScrollingDirection:targetPageIndex:targetPageScrollRow:newLeftElement:newRightElement:animated:](self, "_performScrollingDirection:targetPageIndex:targetPageScrollRow:newLeftElement:newRightElement:animated:", v14, a3, 0, v19, v16, v4);

    }
  }
}

- (void)updateImageAnimated:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _SBFolderPageElement *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t i;
  _SBFolderPageElement *v14;
  NSMutableArray *pageElements;
  void *v16;
  uint64_t v17;
  _SBFolderPageElement *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (-[SBIconImageView canUpdateImage](self, "canUpdateImage", a3))
  {
    -[SBFolderIconImageView _folderIcon](self, "_folderIcon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "folder");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4 && v5)
    {
      -[SBIconImageView iconView](self, "iconView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "overrideImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = objc_alloc_init(_SBFolderPageElement);
        -[_SBFolderPageElement setFolderIcon:](v9, "setFolderIcon:", v4);
        -[_SBFolderPageElement setImage:](v9, "setImage:", v8);
        v20[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFolderIconImageView _setPageElements:](self, "_setPageElements:", v10);

      }
      else
      {
        v19 = v7;
        v11 = objc_msgSend(v6, "listCount");
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
        if (v11)
        {
          for (i = 0; i != v11; ++i)
          {
            v14 = objc_alloc_init(_SBFolderPageElement);
            -[_SBFolderPageElement setGridImagePossible:](v14, "setGridImagePossible:", 1);
            -[_SBFolderPageElement setPageIndex:](v14, "setPageIndex:", i);
            -[_SBFolderPageElement setFolderIcon:](v14, "setFolderIcon:", v4);
            pageElements = self->_pageElements;
            if (pageElements && -[NSMutableArray count](pageElements, "count") > i)
            {
              -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", i);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "visibleRow");

            }
            else
            {
              v17 = 0;
            }
            -[_SBFolderPageElement setVisibleRow:](v14, "setVisibleRow:", v17);
            objc_msgSend(v12, "addObject:", v14);

          }
        }
        v18 = objc_alloc_init(_SBFolderPageElement);
        -[_SBFolderPageElement setPageIndex:](v18, "setPageIndex:", v11);
        -[_SBFolderPageElement setFolderIcon:](v18, "setFolderIcon:", v4);
        objc_msgSend(v12, "addObject:", v18);
        -[SBFolderIconImageView _setPageElements:](self, "_setPageElements:", v12);

        v7 = v19;
        v8 = 0;
      }

    }
  }
}

- (void)fulfillGridImageForPageElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFolderIconImageView _folderIconImageCache](self, "_folderIconImageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageView _folderIcon](self, "_folderIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "pageIndex");
  if (v5)
  {
    objc_msgSend(v5, "imageForPageAtIndex:inFolderIcon:imageAppearance:", v8, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_11;
    SBLogIcon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412802;
      v14 = v5;
      v15 = 2112;
      v16 = (uint64_t)v6;
      v17 = 2048;
      v18 = v8;
      _os_log_error_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_ERROR, "Did not get a folder icon image from image cache: %@, folder icon: %@, page index: %lu", (uint8_t *)&v13, 0x20u);
    }

  }
  -[SBFolderIconImageView representedListLayout](self, "representedListLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBFolderIconImageCache imageForPageAtIndex:inFolderIcon:imageAppearance:listLayout:gridCellImageProvider:pool:](SBFolderIconImageCache, "imageForPageAtIndex:inFolderIcon:imageAppearance:listLayout:gridCellImageProvider:pool:", v8, v6, v7, v11, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    SBLogIcon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412802;
      v14 = v6;
      v15 = 2048;
      v16 = v8;
      v17 = 2112;
      v18 = (uint64_t)v11;
      _os_log_error_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_ERROR, "Did not get a folder icon image from cache-less constructor for folder icon: %@, page index: %lu, layout: %@", (uint8_t *)&v13, 0x20u);
    }

  }
LABEL_11:
  objc_msgSend(v4, "setGridImage:", v9);

}

- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  char isKindOfClass;
  _QWORD block[5];
  objc_super v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SBFolderIconImageView _folderIcon](self, "_folderIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageView _folderIconImageCache](self, "_folderIconImageCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    objc_msgSend(v11, "removeObserver:forFolderIcon:", self, v10);
  objc_msgSend(v10, "removeObserver:", self);
  v17.receiver = self;
  v17.super_class = (Class)SBFolderIconImageView;
  -[SBIconImageView setIcon:location:animated:](&v17, sel_setIcon_location_animated_, v8, v9, v5);
  if (v8)
    objc_msgSend(v12, "addObserver:forFolderIcon:", self, v8);
  if (-[SBFolderIconImageView usesLayersForMiniIcons](self, "usesLayersForMiniIcons"))
    objc_msgSend(v8, "addObserver:", self);
  v13 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SBFolderIconImageView_setIcon_location_animated___block_invoke;
  block[3] = &unk_1E8D84C50;
  block[4] = self;
  dispatch_after(v13, MEMORY[0x1E0C80D38], block);
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[UIView setBlurEnabled:](self->_backgroundView, "setBlurEnabled:", SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupDock"), v9) ^ 1);

}

- (void)_setPageElements:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *pageElements;

  if (self->_pageElements != a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "copy");
    pageElements = self->_pageElements;
    self->_pageElements = v4;

    -[SBFolderIconImageView _setupGridViewsInDefaultConfiguration](self, "_setupGridViewsInDefaultConfiguration");
    -[SBFolderIconImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setupGridViewsInDefaultConfiguration
{
  unint64_t currentPageIndex;
  unint64_t v4;
  uint64_t v5;
  id v6;

  currentPageIndex = self->_currentPageIndex;
  v4 = -[NSMutableArray count](self->_pageElements, "count") - 1;
  if (currentPageIndex < v4)
    v4 = currentPageIndex;
  self->_currentPageIndex = v4;
  if (-[NSMutableArray count](self->_pageElements, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", self->_currentPageIndex);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  -[SBFolderIconGridViewing setElement:](self->_leftWrapperView, "setElement:", v5);
  -[SBFolderIconGridViewing setElement:](self->_rightWrapperView, "setElement:", 0);
  -[SBFolderIconImageView _showLeftMinigrid](self, "_showLeftMinigrid");

}

- (void)_showLeftMinigrid
{
  -[SBFolderIconImageView bounds](self, "bounds");
  -[UIView setBounds:](self->_pageGridContainer, "setBounds:", 0.0, 0.0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBFolderIconImageView;
  -[SBIconImageView layoutSubviews](&v15, sel_layoutSubviews);
  -[SBFolderIconImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIView setBounds:](self->_backgroundView, "setBounds:", 0.0, 0.0);
  -[UIView setBounds:](self->_solidColorBackgroundView, "setBounds:", 0.0, 0.0, v4, v6);
  UIRectGetCenter();
  v8 = v7;
  v10 = v9;
  -[UIView setCenter:](self->_backgroundView, "setCenter:");
  -[UIView setCenter:](self->_solidColorBackgroundView, "setCenter:", v8, v10);
  -[UIView setCenter:](self->_crossfadeScalingView, "setCenter:", v8, v10);
  -[UIView setFrame:](self->_pageGridContainer, "setFrame:", 0.0, 0.0, v4, v6);
  -[SBFolderIconImageView _interiorGridSize](self, "_interiorGridSize");
  UIRectCenteredIntegralRectScale();
  UIRectGetCenter();
  v12 = v11;
  v14 = v13;
  -[SBFolderIconGridViewing setCenter:](self->_leftWrapperView, "setCenter:", 0);
  -[SBFolderIconGridViewing setCenter:](self->_rightWrapperView, "setCenter:", v4 + v12, v14);
}

- (CGSize)_interiorGridSize
{
  objc_class *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = -[SBFolderIconImageView _iconGridImageClass](self, "_iconGridImageClass");
  -[SBFolderIconImageView representedListLayout](self, "representedListLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class sizeForLayout:](v3, "sizeForLayout:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)representedListLayout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBIconImageView iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "representedFolderIconLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listLayoutProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutForIconLocation:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (Class)_iconGridImageClass
{
  return (Class)objc_opt_self();
}

- (void)setBackgroundScale:(double)a3
{
  void *v5;
  UIView *backgroundView;
  UIView *solidColorBackgroundView;
  void *v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  -[SBFolderIconImageView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayoutOnGeometryChange:", 0);

  backgroundView = self->_backgroundView;
  CGAffineTransformMakeScale(&v10, a3, a3);
  -[UIView setTransform:](backgroundView, "setTransform:", &v10);
  solidColorBackgroundView = self->_solidColorBackgroundView;
  CGAffineTransformMakeScale(&v9, a3, a3);
  -[UIView setTransform:](solidColorBackgroundView, "setTransform:", &v9);
  -[SBFolderIconImageView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayoutOnGeometryChange:", 1);

}

- (void)setBackgroundAndIconGridImageAlpha:(double)a3
{
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:");
  -[UIView setAlpha:](self->_solidColorBackgroundView, "setAlpha:", a3);
  -[SBFolderIconGridViewing setAlpha:](self->_leftWrapperView, "setAlpha:", a3);
  -[SBFolderIconGridViewing setAlpha:](self->_rightWrapperView, "setAlpha:", a3);
}

- (SBFolderIconImageView)initWithFrame:(CGRect)a3
{
  SBFolderIconImageView *v3;
  UIView *v4;
  UIView *backgroundView;
  UIView *v6;
  UIView *pageGridContainer;
  void *v8;
  SBFolderIconGridViewing *v9;
  SBFolderIconGridViewing *leftWrapperView;
  SBFolderIconGridViewing *v11;
  SBFolderIconGridViewing *rightWrapperView;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBFolderIconImageView;
  v3 = -[SBIconImageView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    -[UIView setUserInteractionEnabled:](v3->_backgroundView, "setUserInteractionEnabled:", 0);
    -[SBFolderIconImageView insertSubview:atIndex:](v3, "insertSubview:atIndex:", v3->_backgroundView, 0);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    pageGridContainer = v3->_pageGridContainer;
    v3->_pageGridContainer = v6;

    -[SBFolderIconImageView insertSubview:aboveSubview:](v3, "insertSubview:aboveSubview:", v3->_pageGridContainer, v3->_backgroundView);
    -[UIView setClipsToBounds:](v3->_pageGridContainer, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v3->_pageGridContainer, "setUserInteractionEnabled:", 0);
    objc_msgSend((id)objc_opt_class(), "allowsLayersForMiniIcons");
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (SBFolderIconGridViewing *)objc_alloc_init((Class)v8);
    leftWrapperView = v3->_leftWrapperView;
    v3->_leftWrapperView = v9;

    -[SBFolderIconGridViewing setFolderIconImageView:](v3->_leftWrapperView, "setFolderIconImageView:", v3);
    -[UIView addSubview:](v3->_pageGridContainer, "addSubview:", v3->_leftWrapperView);
    v11 = (SBFolderIconGridViewing *)objc_alloc_init((Class)v8);
    rightWrapperView = v3->_rightWrapperView;
    v3->_rightWrapperView = v11;

    -[SBFolderIconGridViewing setFolderIconImageView:](v3->_rightWrapperView, "setFolderIconImageView:", v3);
    -[UIView insertSubview:aboveSubview:](v3->_pageGridContainer, "insertSubview:aboveSubview:", v3->_rightWrapperView, v3->_leftWrapperView);
    -[SBFolderIconImageView _updateRasterization](v3, "_updateRasterization");
    -[SBFolderIconImageView _updateAccessibilityBackgroundContrast](v3, "_updateAccessibilityBackgroundContrast");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v3, sel__updateAccessibilityBackgroundContrast, *MEMORY[0x1E0DC45B8], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBFolderIconImageView;
  -[SBIconImageView dealloc](&v4, sel_dealloc);
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if (-[SBFolderIconImageView backgroundStyle](self, "backgroundStyle") != a3)
  {
    self->_backgroundStyle = a3;
    -[SBFolderIconImageView _updateCurrentBackgroundStyle](self, "_updateCurrentBackgroundStyle");
  }
}

- (BOOL)isPageGridHidden
{
  return -[UIView isHidden](self->_pageGridContainer, "isHidden");
}

- (void)setPageGridHidden:(BOOL)a3
{
  -[UIView setHidden:](self->_pageGridContainer, "setHidden:", a3);
}

+ (BOOL)allowsLayersForMiniIcons
{
  return 0;
}

+ (BOOL)usesCachedImagesForMiniIconLayers
{
  return 1;
}

- (BOOL)usesLayersForMiniIcons
{
  void *v2;
  char isKindOfClass;

  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)contentsImage
{
  return 0;
}

- (id)_generateSquareContentsImage
{
  return 0;
}

- (void)iconViewFolderIconImageCacheDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFolderIconImageView;
  -[SBIconImageView iconViewFolderIconImageCacheDidChange](&v5, sel_iconViewFolderIconImageCacheDidChange);
  -[SBFolderIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0);
  -[SBFolderIconImageView _folderIconImageCache](self, "_folderIconImageCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObserver:forFolderIcon:", self, v4);

}

- (id)snapshot
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  CGRect v20;

  -[SBFolderIconImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFolderIconImageView _imageFromRect:](self, "_imageFromRect:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v13 = v12;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  if (v13 > CGRectGetHeight(v20))
  {
    v14 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v11, "sbf_CGImageBackedImage");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "CGImage");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v16, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v18;
  }
  return v11;
}

- (void)scrollToFirstGapAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id *v10;
  uint64_t v11;
  unint64_t currentPageIndex;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;

  v3 = a3;
  if (-[NSMutableArray count](self->_pageElements, "count"))
  {
    -[SBFolderIconImageView _folderIcon](self, "_folderIcon");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "folder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_indexPathToRevealForJiggleMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = SBFolderRelativeListIndex(v6);
    if (!v6 || (v8 = v7, v7 == 0x7FFFFFFFFFFFFFFFLL) || v7 >= -[NSMutableArray count](self->_pageElements, "count"))
    {
LABEL_38:

      return;
    }
    -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v9, "firstVisibleRowForGap");
    v10 = (id *)MEMORY[0x1E0DC4730];
    v11 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
    currentPageIndex = self->_currentPageIndex;
    if (v8 >= currentPageIndex)
    {
      if (v8 <= currentPageIndex)
      {
        v18 = objc_msgSend(*v10, "userInterfaceLayoutDirection");
        -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", self->_currentPageIndex);
        v19 = objc_claimAutoreleasedReturnValue();
        v14 = 0;
        v20 = v18 == 0;
        if (v18)
          v16 = 0;
        else
          v16 = (void *)v19;
        if (v20)
          v17 = 0;
        else
          v17 = (void *)v19;
        goto LABEL_34;
      }
      if (v11 == 1)
        v13 = v8;
      else
        v13 = self->_currentPageIndex;
      if (v11 == 1)
        v14 = 1;
      else
        v14 = 2;
      if (v11 == 1)
        v15 = self->_currentPageIndex;
      else
        v15 = v8;
    }
    else
    {
      if (v11 == 1)
        v13 = self->_currentPageIndex;
      else
        v13 = v8;
      if (v11 == 1)
        v14 = 2;
      else
        v14 = 1;
      if (v11 == 1)
        v15 = v8;
      else
        v15 = self->_currentPageIndex;
    }
    -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
    -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", self->_currentPageIndex);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (self->_currentPageIndex != v8 || objc_msgSend(v21, "visibleRow") != v23)
      -[SBFolderIconImageView _performScrollingDirection:targetPageIndex:targetPageScrollRow:newLeftElement:newRightElement:animated:](self, "_performScrollingDirection:targetPageIndex:targetPageScrollRow:newLeftElement:newRightElement:animated:", v14, v8, v23, v16, v17, v3);

    goto LABEL_38;
  }
}

- (void)scrollToGapOrTopIfFullOfPage:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t currentPageIndex;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  if (-[NSMutableArray count](self->_pageElements, "count") > a3)
  {
    -[SBFolderIconImageView _folderIcon](self, "_folderIcon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForFirstFreeSlotAvoidingFirstList:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (SBFolderRelativeListIndex(v9) == a3)
    {
      -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "firstVisibleRowForGap");

    }
    else
    {
      v11 = 0;
    }
    currentPageIndex = self->_currentPageIndex;
    if (currentPageIndex <= a3)
    {
      -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", self->_currentPageIndex);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (currentPageIndex >= a3)
      {
        v13 = 0;
        v14 = 0;
      }
      else
      {
        -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 2;
      }
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", a3);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", self->_currentPageIndex);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 1;
    }
    -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", self->_currentPageIndex);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (self->_currentPageIndex != a3 || objc_msgSend(v15, "visibleRow") != v11)
      -[SBFolderIconImageView _performScrollingDirection:targetPageIndex:targetPageScrollRow:newLeftElement:newRightElement:animated:](self, "_performScrollingDirection:targetPageIndex:targetPageScrollRow:newLeftElement:newRightElement:animated:", v14, a3, v11, v17, v13, v4);

  }
}

- (unint64_t)visibleMiniIconCount
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  -[SBFolderIconImageView representedListLayout](self, "representedListLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfRowsForOrientation:", 1);
  v4 = objc_msgSend(v2, "numberOfColumnsForOrientation:", 1) * v3;

  return v4;
}

- (unint64_t)firstVisibleMiniIconIndex
{
  void *v2;
  unint64_t v3;

  -[SBFolderIconImageView _currentPageElement](self, "_currentPageElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "firstVisibleMiniIconIndex");

  return v3;
}

- (unint64_t)centerVisibleMiniIconIndex
{
  return -[SBFolderIconImageView firstVisibleMiniIconIndex](self, "firstVisibleMiniIconIndex") + 4;
}

- (unint64_t)lastVisibleMiniIconIndex
{
  unint64_t v3;

  v3 = -[SBFolderIconImageView firstVisibleMiniIconIndex](self, "firstVisibleMiniIconIndex");
  return v3 + -[SBFolderIconImageView visibleMiniIconCount](self, "visibleMiniIconCount") - 1;
}

- (CGRect)frameForMiniIconAtIndex:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", a3, self->_currentPageIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageView frameForMiniIconAtIndexPath:](self, "frameForMiniIconAtIndexPath:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)visibleImageRelativeFrameForMiniIconAtIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[SBFolderIconImageView frameForMiniIconAtIndex:](self, "frameForMiniIconAtIndex:", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBIconImageView visibleBounds](self, "visibleBounds");
  v13 = v5 - v12;
  v15 = v7 - v14;
  v16 = v9;
  v17 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

- (CGRect)frameForMiniIconAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
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
  CGRect result;

  v4 = a3;
  -[SBFolderIconImageView layoutIfNeeded](self, "layoutIfNeeded");
  v5 = -[NSMutableArray count](self->_pageElements, "count");
  if (v5 <= objc_msgSend(v4, "sbListIndex"))
  {
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v6 = objc_msgSend(v4, "sbIconIndex");
    -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", objc_msgSend(v4, "sbListIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gridImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_class();
    -[SBFolderIconImageView representedListLayout](self, "representedListLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBFolderIconImageView firstVisibleMiniIconIndex](self, "firstVisibleMiniIconIndex");
    -[SBFolderIconImageView _folderIcon](self, "_folderIcon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "gridCellIndexForIconIndex:", v6);

    objc_msgSend(v13, "rectAtIndex:inLayout:maxCount:", v15, v14, objc_msgSend(v8, "numberOfCells"));
    v19 = v18;
    objc_msgSend(v13, "rectAtIndex:inLayout:maxCount:", v17, v14, objc_msgSend(v8, "numberOfCells"));
    v21 = v20;
    v11 = v22;
    v12 = v23;
    v25 = v24 - v19;
    -[SBFolderIconGridViewing bounds](self->_leftWrapperView, "bounds");
    if (v27 == *MEMORY[0x1E0C9D820] && v26 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[SBFolderIconImageView _interiorGridSize](self, "_interiorGridSize");
      -[SBFolderIconImageView bounds](self, "bounds");
      UIRectCenteredIntegralRectScale();
      v9 = v21 + v33;
      v10 = v25 + v34;
    }
    else
    {
      -[SBFolderIconImageView convertRect:fromView:](self, "convertRect:fromView:", self->_leftWrapperView, v21, v25, v11, v12);
      v9 = v29;
      v10 = v30;
      v11 = v31;
      v12 = v32;
    }

  }
  v35 = v9;
  v36 = v10;
  v37 = v11;
  v38 = v12;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (double)iconGridImageAlpha
{
  double v3;
  double v4;
  double result;

  -[SBFolderIconGridViewing alpha](self->_leftWrapperView, "alpha");
  v4 = v3;
  -[SBFolderIconGridViewing alpha](self->_rightWrapperView, "alpha");
  if (v4 >= result)
    return v4;
  return result;
}

- (void)setIconGridImageAlpha:(double)a3
{
  -[SBFolderIconGridViewing setAlpha:](self->_leftWrapperView, "setAlpha:");
  -[SBFolderIconGridViewing setAlpha:](self->_rightWrapperView, "setAlpha:", a3);
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
  void *v7;
  double v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  int v12;
  UIView *v13;

  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  v13 = v5;
  if (backgroundView != v5)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    self->_hasCustomBackgroundView = 1;
    if (v13)
    {
      -[SBIconImageView iconView](self, "iconView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "iconImageInfo");
      -[UIView _setContinuousCornerRadius:](v13, "_setContinuousCornerRadius:", v8);
      objc_opt_self();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[SBIconImageView location](self, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupDock"), v11);

        -[UIView setBlurEnabled:](v13, "setBlurEnabled:", v12 ^ 1u);
      }
      -[UIView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
      -[SBFolderIconImageView insertSubview:atIndex:](self, "insertSubview:atIndex:", v13, 0);

    }
  }

}

- (void)prepareToCrossfadeWithFloatyFolderView:(id)a3 allowFolderInteraction:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  UIView *v8;
  UIView *crossfadeScalingView;
  UIView *v10;
  UIView *solidColorBackgroundView;
  UIView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIView *v18;
  double v19;
  CGAffineTransform v20;

  v4 = a4;
  v7 = a3;
  -[SBFolderIconImageView _setAnimating:](self, "_setAnimating:", 1);
  -[SBFolderIconImageView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v4);
  objc_storeStrong((id *)&self->_crossfadeFolderView, a3);
  objc_msgSend(v7, "borrowScalingView");
  v8 = (UIView *)objc_claimAutoreleasedReturnValue();
  crossfadeScalingView = self->_crossfadeScalingView;
  self->_crossfadeScalingView = v8;

  v10 = self->_backgroundView;
  solidColorBackgroundView = self->_solidColorBackgroundView;
  if (solidColorBackgroundView)
  {
    v12 = solidColorBackgroundView;

    v10 = v12;
  }
  -[SBFolderIconImageView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_crossfadeScalingView, v10);
  -[SBIconImageView visibleBounds](self, "visibleBounds");
  v14 = v13;
  v16 = v15;
  -[UIView bounds](self->_crossfadeScalingView, "bounds");
  v18 = self->_crossfadeScalingView;
  CGAffineTransformMakeScale(&v20, v14 / v17, v16 / v19);
  -[UIView setTransform:](v18, "setTransform:", &v20);
  -[SBFolderIconImageView setFloatyFolderCrossfadeFraction:](self, "setFloatyFolderCrossfadeFraction:", 0.0);
  -[SBFolderIconImageView layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)setFloatyFolderCrossfadeFraction:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v5 = 1.0 - a3;
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 1.0 - a3);
  -[UIView setAlpha:](self->_solidColorBackgroundView, "setAlpha:", v5);
  -[SBIconImageView setOverlayAlpha:](self, "setOverlayAlpha:", v5);
  -[SBFloatyFolderView setBackgroundAlpha:](self->_crossfadeFolderView, "setBackgroundAlpha:", a3);
  -[SBIconImageView visibleBounds](self, "visibleBounds");
  v7 = v6;
  -[UIView bounds](self->_crossfadeScalingView, "bounds");
  v9 = v7 / v8;
  -[SBIconImageView iconView](self, "iconView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "iconImageInfo");
  v11 = v10;
  -[SBFloatyFolderView cornerRadius](self->_crossfadeFolderView, "cornerRadius");
  v13 = v12;
  v14 = v9 * v12 * a3 + v5 * v11;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v14);
  -[SBFolderIconImageView setPageGridCornerRadius:](self, "setPageGridCornerRadius:", v14);
  -[UIView _setContinuousCornerRadius:](self->_solidColorBackgroundView, "_setContinuousCornerRadius:", v14);
  -[SBFloatyFolderView setCornerRadius:](self->_crossfadeFolderView, "setCornerRadius:", v13 * a3 + v5 * (v11 / v9));

}

- (void)cleanupAfterFloatyFolderCrossfade
{
  UIView *crossfadeScalingView;
  __int128 v4;
  void *v5;
  double v6;
  double v7;
  SBFloatyFolderView *crossfadeFolderView;
  UIView *v9;
  SBFloatyFolderView *v10;
  _OWORD v11[3];

  -[SBFolderIconImageView _setAnimating:](self, "_setAnimating:", 0);
  -[SBFolderIconImageView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_solidColorBackgroundView, "setAlpha:", 1.0);
  -[SBIconImageView setOverlayAlpha:](self, "setOverlayAlpha:", 1.0);
  crossfadeScalingView = self->_crossfadeScalingView;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v11[0] = *MEMORY[0x1E0C9BAA8];
  v11[1] = v4;
  v11[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](crossfadeScalingView, "setTransform:", v11);
  -[SBFloatyFolderView setBackgroundAlpha:](self->_crossfadeFolderView, "setBackgroundAlpha:", 1.0);
  -[SBFolderView returnScalingView](self->_crossfadeFolderView, "returnScalingView");
  -[SBIconImageView iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconImageInfo");
  v7 = v6;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v6);
  -[SBFolderIconImageView setPageGridCornerRadius:](self, "setPageGridCornerRadius:", v7);
  -[UIView _setContinuousCornerRadius:](self->_solidColorBackgroundView, "_setContinuousCornerRadius:", v7);
  crossfadeFolderView = self->_crossfadeFolderView;
  -[SBFloatyFolderView cornerRadius](crossfadeFolderView, "cornerRadius");
  -[SBFloatyFolderView setCornerRadius:](crossfadeFolderView, "setCornerRadius:");
  v9 = self->_crossfadeScalingView;
  self->_crossfadeScalingView = 0;

  v10 = self->_crossfadeFolderView;
  self->_crossfadeFolderView = 0;

}

- (void)iconViewLegibilitySettingsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFolderIconImageView;
  -[SBIconImageView iconViewLegibilitySettingsDidChange](&v3, sel_iconViewLegibilitySettingsDidChange);
  -[SBFolderIconImageView _updateAccessibilityBackgroundContrast](self, "_updateAccessibilityBackgroundContrast");
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFolderIconImageView;
  -[SBIconImageView descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_animating, CFSTR("animating"));
  return v4;
}

- (void)folderIconImageCache:(id)a3 didUpdateImagesForFolderIcon:(id)a4
{
  -[SBFolderIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0, a4);
}

void __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:");
  objc_msgSend(v3, "_setContinuousCornerRadius:", *(double *)(a1 + 80));
  objc_msgSend(v3, "setClipsToBounds:", 1);
  objc_msgSend(*(id *)(a1 + 40), "insertSubview:aboveSubview:", v3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAlpha:", 0.0);
  objc_msgSend(v3, "setBackgroundColor:", *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 592);
  *(_QWORD *)(v4 + 592) = v3;

}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "setAlpha:", 1.0);
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", *(double *)(a1 + 64));
}

uint64_t __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

void __54__SBFolderIconImageView__updateCurrentBackgroundStyle__block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 == *(void **)(v3 + 592))
  {
    *(_QWORD *)(v3 + 592) = 0;

  }
}

- (void)_setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    -[SBFolderIconImageView _updateRasterization](self, "_updateRasterization");
  }
}

- (void)_performScrollingDirection:(int64_t)a3 targetPageIndex:(unint64_t)a4 targetPageScrollRow:(unint64_t)a5 newLeftElement:(id)a6 newRightElement:(id)a7 animated:(BOOL)a8
{
  _BOOL4 v8;
  SBFolderIconGridViewing **p_leftWrapperView;
  SBFolderIconGridViewing *leftWrapperView;
  id v16;
  SBFolderIconGridViewing **p_rightWrapperView;
  uint64_t v18;
  double v19;
  int v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  BOOL v24;
  _QWORD v25[6];
  _QWORD v26[5];
  BOOL v27;
  _QWORD v28[7];

  v8 = a8;
  p_leftWrapperView = &self->_leftWrapperView;
  leftWrapperView = self->_leftWrapperView;
  v16 = a7;
  -[SBFolderIconGridViewing setElement:](leftWrapperView, "setElement:", a6);
  p_rightWrapperView = &self->_rightWrapperView;
  -[SBFolderIconGridViewing setElement:](self->_rightWrapperView, "setElement:", v16);

  v18 = MEMORY[0x1E0C809B0];
  if (a3 == 1)
  {
    -[SBFolderIconImageView _showRightMinigrid](self, "_showRightMinigrid");
    p_rightWrapperView = p_leftWrapperView;
LABEL_5:
    -[SBFolderIconGridViewing positionAtRow:](*p_rightWrapperView, "positionAtRow:", a5);
    if (v8)
      v19 = 0.4;
    else
      v19 = 0.0;
    goto LABEL_12;
  }
  if (a3 == 2)
  {
    -[SBFolderIconImageView _showLeftMinigrid](self, "_showLeftMinigrid");
    goto LABEL_5;
  }
  if (v8)
    v19 = 0.4;
  else
    v19 = 0.0;
  if (!a3)
  {
    v20 = 1;
    goto LABEL_15;
  }
LABEL_12:
  if (v8)
    -[SBFolderIconImageView _setAnimating:](self, "_setAnimating:", 1);
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke;
  v28[3] = &unk_1E8D84C78;
  v28[4] = self;
  v28[5] = a3;
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_2;
  v26[3] = &unk_1E8D87F20;
  v27 = v8;
  v26[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v28, v26, v19, 0.0);
  v20 = 0;
LABEL_15:
  -[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", self->_currentPageIndex);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "visibleRow");
  if (v20 && v22 != a5)
  {
    if (v8)
      -[SBFolderIconImageView _setAnimating:](self, "_setAnimating:", 1);
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_3;
    v25[3] = &unk_1E8D84C78;
    v25[4] = self;
    v25[5] = a5;
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_4;
    v23[3] = &unk_1E8D87F20;
    v24 = v8;
    v23[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v25, v23, v19, 0.0);
  }
  self->_currentPageIndex = a4;
  if (!v8)
    -[SBFolderIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0);

}

uint64_t __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1 == 1)
    return objc_msgSend(*(id *)(result + 32), "_showLeftMinigrid");
  if (v1 == 2)
    return objc_msgSend(*(id *)(result + 32), "_showRightMinigrid");
  return result;
}

uint64_t __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    if (*(_BYTE *)(result + 40))
    {
      objc_msgSend(*(id *)(result + 32), "updateImageAnimated:", 0);
      return objc_msgSend(*(id *)(v2 + 32), "_setAnimating:", 0);
    }
  }
  return result;
}

uint64_t __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "positionAtRow:", *(_QWORD *)(a1 + 40));
}

uint64_t __128__SBFolderIconImageView__performScrollingDirection_targetPageIndex_targetPageScrollRow_newLeftElement_newRightElement_animated___block_invoke_4(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    if (*(_BYTE *)(result + 40))
    {
      objc_msgSend(*(id *)(result + 32), "updateImageAnimated:", 0);
      return objc_msgSend(*(id *)(v2 + 32), "_setAnimating:", 0);
    }
  }
  return result;
}

- (void)setIconView:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFolderIconImageView;
  v4 = a3;
  -[SBIconImageView setIconView:](&v7, sel_setIconView_, v4);
  objc_msgSend(v4, "iconImageInfo", v7.receiver, v7.super_class);
  v6 = v5;

  -[SBFolderIconImageView setPageGridCornerRadius:](self, "setPageGridCornerRadius:", v6);
}

- (id)_currentPageElement
{
  return (id)-[NSMutableArray objectAtIndex:](self->_pageElements, "objectAtIndex:", self->_currentPageIndex);
}

- (UIView)currentPageView
{
  return (UIView *)self->_leftWrapperView;
}

- (NSArray)currentPageIconLayers
{
  void *v2;
  void *v3;
  void *v4;

  -[SBFolderIconImageView _currentPageElement](self, "_currentPageElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)_showRightMinigrid
{
  double v3;

  -[SBFolderIconImageView bounds](self, "bounds");
  -[UIView setBounds:](self->_pageGridContainer, "setBounds:", v3, 0.0);
}

- (void)fulfillGridLayerForPageElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SBFolderIconImageView _folderIcon](self, "_folderIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderIconImageView representedListLayout](self, "representedListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v11, "pageIndex");
  if (objc_msgSend((id)objc_opt_class(), "usesCachedImagesForMiniIconLayers"))
  {
    -[SBFolderIconImageView _folderIconImageCache](self, "_folderIconImageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layerForPageAtIndex:inFolderIcon:imageAppearance:", v8, v4, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "layerForListIndex:listLayout:imageAppearance:", v8, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBFolderIconImageView configureGridMiniLayer:](self, "configureGridMiniLayer:", v10);
  objc_msgSend(v11, "setGridLayer:", v10);

}

- (void)configureGridMiniLayer:(id)a3
{
  objc_msgSend(a3, "setMinificationFilter:", *MEMORY[0x1E0CD2EF8]);
}

- (void)setPageGridCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_pageGridContainer, "_setContinuousCornerRadius:", a3);
}

- (BOOL)pageGridClipsToBounds
{
  return -[UIView clipsToBounds](self->_pageGridContainer, "clipsToBounds");
}

- (void)setPageGridClipsToBounds:(BOOL)a3
{
  -[UIView setClipsToBounds:](self->_pageGridContainer, "setClipsToBounds:", a3);
}

- (void)folderIcon:(id)a3 containedIconImageDidUpdate:(id)a4
{
  -[SBFolderIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0, a4);
}

- (void)folderIcon:(id)a3 containedIconAccessoriesDidUpdate:(id)a4
{
  -[SBFolderIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0, a4);
}

- (void)folderIcon:(id)a3 containedIconLaunchEnabledDidChange:(id)a4
{
  -[SBFolderIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0, a4);
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (unint64_t)currentBackgroundStyle
{
  return self->_currentBackgroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeScalingView, 0);
  objc_storeStrong((id *)&self->_crossfadeFolderView, 0);
  objc_storeStrong((id *)&self->_pageElements, 0);
  objc_storeStrong((id *)&self->_rightWrapperView, 0);
  objc_storeStrong((id *)&self->_leftWrapperView, 0);
  objc_storeStrong((id *)&self->_pageGridContainer, 0);
  objc_storeStrong((id *)&self->_solidColorBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
