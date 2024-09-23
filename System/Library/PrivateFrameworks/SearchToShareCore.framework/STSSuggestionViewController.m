@implementation STSSuggestionViewController

- (STSSuggestionViewController)init
{
  STSSuggestionViewController *v2;
  STSSuggestionView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STSSuggestionViewController;
  v2 = -[STSSuggestionViewController init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(STSSuggestionView);
    -[STSSuggestionView setDelegate:](v3, "setDelegate:", v2);
    -[STSSuggestionView tableView](v3, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDataSource:", v2);

    -[STSSuggestionView tableView](v3, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v2);

    -[STSSuggestionView tableView](v3, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("SuggestionCell"));

    -[STSSuggestionView tableView](v3, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSeparatorStyle:", 1);

    -[STSSuggestionViewController setView:](v2, "setView:", v3);
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  -[STSSuggestionViewController view](self, "view", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[STSImageCache sharedCache](STSImageCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchProviderImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFooterImage:", v4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[STSSuggestionViewController _updateFooterOriginForBoundsHeight:](self, "_updateFooterOriginForBoundsHeight:", height);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, 0);
  v8.receiver = self;
  v8.super_class = (Class)STSSuggestionViewController;
  -[STSSuggestionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (UIEdgeInsets)contentInset
{
  void *v2;
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
  UIEdgeInsets result;

  -[STSSuggestionViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[STSSuggestionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentInset:", top, left, bottom, right);

  objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 0);
  -[STSSuggestionViewController _updateFooterOrigin](self, "_updateFooterOrigin");
  objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 1);
}

- (void)updateContentOffset:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  -[STSSuggestionViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSSuggestionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInset");
  objc_msgSend(v5, "setContentOffset:", -v8, a3);

}

- (void)clearSuggestions
{
  void *v3;
  void *v4;

  -[STSSearchModel removeQuerySuggestions](self->_searchModel, "removeQuerySuggestions");
  -[STSSuggestionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[STSSuggestionViewController _updateFooterOrigin](self, "_updateFooterOrigin");
}

- (void)updateQuerySuggestions:(id)a3
{
  void *v4;
  void *v5;

  -[STSSearchModel setQuerySuggestions:](self->_searchModel, "setQuerySuggestions:", a3);
  -[STSSuggestionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[STSSuggestionViewController _updateFooterOrigin](self, "_updateFooterOrigin");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[STSSearchModel querySuggestions](self->_searchModel, "querySuggestions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("SuggestionCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSSearchModel querySuggestions](self->_searchModel, "querySuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "suggestion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v13);

  objc_msgSend(v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v15);

  objc_msgSend(v7, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v17);

  _UIImageGetSearchGlass();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v18, "size");
  v21 = v20;
  v23 = v22;
  objc_msgSend(MEMORY[0x24BEBD4B8], "sts_magnifyingGlassGrayTintColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _UIImageGetSearchGlass();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v24, 0, v25, 0, v21, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setImage:", v26);

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BEBE770];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  -[STSSuggestionViewController selectionDelegate](self, "selectionDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "suggestionViewController:didSelectSuggestionAtIndex:", self, v6);
}

- (void)searchModelUpdatedQuerySuggestions:(id)a3
{
  void *v4;
  void *v5;

  -[STSSuggestionViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[STSSuggestionViewController _updateFooterOrigin](self, "_updateFooterOrigin");
}

- (void)suggestionViewDidTapLogo:(id)a3
{
  id v4;

  -[STSSuggestionViewController selectionDelegate](self, "selectionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionViewControllerDidTapLogo:", self);

}

- (void)_hideNoticeOverlay
{
  id v2;

  -[STSSuggestionViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOverlayView:animated:", 0, 1);

}

- (void)_updateFooterOrigin
{
  id v3;
  CGRect v4;

  -[STSSuggestionViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[STSSuggestionViewController _updateFooterOriginForBoundsHeight:](self, "_updateFooterOriginForBoundsHeight:", CGRectGetHeight(v4));

}

- (void)_updateFooterOriginForBoundsHeight:(double)a3
{
  void *v5;
  void *v6;
  double MinX;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  double MaxY;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  id v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  -[STSSuggestionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readableContentGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFrame");
  MinX = CGRectGetMinX(v54);
  -[STSSuggestionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "footerSize");
  v9 = 20.0;
  v11 = v10 + 20.0 + 10.0;

  if (MinX >= v11)
  {
    -[STSSuggestionViewController contentInset](self, "contentInset");
    v42 = a3 - v41;
    -[STSSuggestionViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "footerSize");
    v45 = v42 - v44;

    v20 = 1;
  }
  else
  {
    -[STSSearchModel querySuggestions](self->_searchModel, "querySuggestions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDD15D8];
      -[STSSearchModel querySuggestions](self->_searchModel, "querySuggestions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "indexPathForRow:inSection:", objc_msgSend(v15, "count") - 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[STSSuggestionViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cellForRowAtIndexPath:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v19 != 0;
      MaxY = a3;
      if (v19)
      {
        -[STSSuggestionViewController view](self, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        -[STSSuggestionViewController view](self, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "tableView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "convertRect:fromView:", v32, v24, v26, v28, v30);
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;

        v55.origin.x = v34;
        v55.origin.y = v36;
        v55.size.width = v38;
        v55.size.height = v40;
        MaxY = CGRectGetMaxY(v55);
      }

    }
    else
    {
      v20 = 0;
      MaxY = a3;
    }
    -[STSSuggestionViewController view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "readableContentGuide");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layoutFrame");
    v9 = CGRectGetMinX(v56);

    -[STSSuggestionViewController contentInset](self, "contentInset");
    v49 = a3 - v48;
    -[STSSuggestionViewController view](self, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "footerSize");
    v45 = v49 - v51;

    if (MaxY >= v45)
      v45 = MaxY;
  }
  -[STSSuggestionViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFooterOffset:", v9, v45);

  -[STSSuggestionViewController view](self, "view");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setShowingFooter:", v20);

}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
  objc_storeStrong((id *)&self->_searchModel, a3);
}

- (STSSuggestionViewControllerDelegate)selectionDelegate
{
  return (STSSuggestionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_searchModel, 0);
}

@end
