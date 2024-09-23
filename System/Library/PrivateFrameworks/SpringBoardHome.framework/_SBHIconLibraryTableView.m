@implementation _SBHIconLibraryTableView

- (_SBHIconLibraryTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  _SBHIconLibraryTableView *v4;
  uint64_t v5;
  SBFFeatherBlurView *headerBlur;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SBHIconLibraryTableView;
  v4 = -[_SBHIconLibraryTableView initWithFrame:style:](&v8, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E00]), "initWithRecipe:", 3);
    headerBlur = v4->_headerBlur;
    v4->_headerBlur = (SBFFeatherBlurView *)v5;

    -[_SBHIconLibraryTableView addSubview:](v4, "addSubview:", v4->_headerBlur);
  }
  return v4;
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
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double MaxY;
  _BOOL4 v30;
  BOOL v31;
  SBFFeatherBlurView *headerBlur;
  _BOOL4 v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  CGFloat rect2;
  double MinY;
  double v45;
  CGFloat v46;
  CGFloat v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  objc_super v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v55 = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)_SBHIconLibraryTableView;
  -[_SBHIconLibraryTableView layoutSubviews](&v53, sel_layoutSubviews);
  -[_SBHIconLibraryTableView sectionHeaderHeight](self, "sectionHeaderHeight");
  if (v3 == *MEMORY[0x1E0DC53D8])
    -[_SBHIconLibraryTableView _defaultSectionHeaderHeight](self, "_defaultSectionHeaderHeight");
  else
    -[_SBHIconLibraryTableView sectionHeaderHeight](self, "sectionHeaderHeight");
  rect2 = v4;
  -[_SBHIconLibraryTableView contentOffset](self, "contentOffset");
  v47 = v5;
  -[_SBHIconLibraryTableView bounds](self, "bounds");
  v46 = v6;
  -[_SBHIconLibraryTableView adjustedContentInset](self, "adjustedContentInset");
  v8 = v7;
  if (BSFloatGreaterThanFloat())
  {
    -[_SBHIconLibraryTableView contentOffset](self, "contentOffset");
    v10 = v8 + v9 <= 0.0;
  }
  else
  {
    v10 = 1;
  }
  if (-[_SBHIconLibraryTableView _headerAndFooterViewsFloat](self, "_headerAndFooterViewsFloat"))
  {
    v11 = (void *)MEMORY[0x1E0C99E10];
    -[_SBHIconLibraryTableView indexPathsForVisibleRows](self, "indexPathsForVisibleRows");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __42___SBHIconLibraryTableView_layoutSubviews__block_invoke;
    v52[3] = &unk_1E8D88D48;
    v52[4] = self;
    objc_msgSend(v12, "bs_mapNoNulls:", v52);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "orderedSetWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v49 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v20, "frame");
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v56.origin.x = 0.0;
          v56.origin.y = v47;
          v56.size.width = v46;
          v56.size.height = v8;
          MaxY = CGRectGetMaxY(v56);
          v57.origin.x = v22;
          v57.origin.y = v24;
          v57.size.width = v26;
          v57.size.height = v28;
          v45 = CGRectGetMaxY(v57);
          v58.origin.x = v22;
          v58.origin.y = v24;
          v58.size.width = v26;
          v58.size.height = v28;
          MinY = CGRectGetMinY(v58);
          v59.origin.x = 0.0;
          v59.origin.y = v47;
          v59.size.width = v46;
          v59.size.height = v8;
          v62.origin.y = CGRectGetMaxY(v59);
          v62.origin.x = 0.0;
          v60.origin.x = v22;
          v60.origin.y = v24;
          v60.size.width = v26;
          v60.size.height = v28;
          v62.size.width = v46;
          v62.size.height = rect2;
          v30 = CGRectIntersectsRect(v60, v62);
          v31 = v45 > MaxY + v28 || MinY < MaxY;
          headerBlur = self->_headerBlur;
          if (v31 && !v30)
            -[_SBHIconLibraryTableView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v20, headerBlur, MinY, v45);
          else
            -[_SBHIconLibraryTableView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v20, headerBlur, MinY, v45);
          v61.origin.x = 0.0;
          v61.size.width = v46;
          v61.origin.y = v47;
          v61.size.height = v8;
          v63.origin.x = v22;
          v63.origin.y = v24;
          v63.size.width = v26;
          v63.size.height = v28;
          v34 = CGRectIntersectsRect(v61, v63);
          v35 = 1.0;
          if (v34)
          {
            SBHCGRectIntersectionAsPercentage(0.0, v47, v46, v8, v22, v24, v26, v28);
            v35 = v36 * -3.0 + 1.0;
            if (v35 < 0.0)
              v35 = 0.0;
          }
          objc_msgSend(v20, "setAlpha:", v35);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v17);
    }

    v37 = objc_msgSend(v15, "count");
    v38 = -0.0;
    if (v37)
      v38 = rect2;
    v8 = v8 + v38;

  }
  -[SBFFeatherBlurView setFrame:](self->_headerBlur, "setFrame:", 0.0, v47, v46, v8 + 12.0);
  v39 = (void *)MEMORY[0x1E0DA9E00];
  -[SBFFeatherBlurView window](self->_headerBlur, "window");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "matchMoveAnimationForFrame:relativeToView:", v40, 0.0, v47 - v47, v46, v8 + 12.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFFeatherBlurView layer](self->_headerBlur, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addAnimation:forKey:", v41, CFSTR("SBHIconLibraryTableViewMatchMoveAnimation"));

  -[SBFFeatherBlurView setHidden:](self->_headerBlur, "setHidden:", v10);
}

- (SBFFeatherBlurView)headerBlur
{
  return self->_headerBlur;
}

- (void)setHeaderBlur:(id)a3
{
  objc_storeStrong((id *)&self->_headerBlur, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerBlur, 0);
}

@end
