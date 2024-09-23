@implementation STSResultDetailViewController

- (void)loadView
{
  STSResultDetailView *v3;
  void *v4;
  STSResultDetailView *v5;

  v3 = [STSResultDetailView alloc];
  v5 = -[STSResultDetailView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[STSResultDetailView setDelegate:](v5, "setDelegate:", self);
  -[STSResultDetailView setContentSize:](v5, "setContentSize:", self->_contentSize.width, self->_contentSize.height);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__handleTap_);
  objc_msgSend(v4, "setDelegate:", self);
  -[STSResultDetailView addGestureRecognizer:](v5, "addGestureRecognizer:", v4);
  -[STSResultDetailViewController setView:](self, "setView:", v5);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[STSResultDetailViewController modalPresentationStyle](self, "modalPresentationStyle") == 6)
  {
    -[STSResultDetailViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), width, height);

  }
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, 0);
  v9.receiver = self;
  v9.super_class = (Class)STSResultDetailViewController;
  -[STSResultDetailViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setUseBackgroundBlur:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[STSResultDetailViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseBackgroundBlur:", v3);

}

- (void)_handleTap:(id)a3
{
  -[STSResultDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setContentSize:(CGSize)a3
{
  CGSize *p_contentSize;
  id v6;

  p_contentSize = &self->_contentSize;
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    p_contentSize->width = a3.width;
    self->_contentSize.height = a3.height;
    if (-[STSResultDetailViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[STSResultDetailViewController view](self, "view");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContentSize:", p_contentSize->width, p_contentSize->height);

    }
  }
}

- (UIImage)thumbnail
{
  void *v2;
  void *v3;

  -[STSResultDetailViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (STSAnimatedImageInfo)thumbnailInfo
{
  void *v2;
  void *v3;

  -[STSResultDetailViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STSAnimatedImageInfo *)v3;
}

- (CGSize)providerIconSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[STSResultDetailViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerIconSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setProviderIconSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[STSResultDetailViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProviderIconSize:", width, height);

}

- (UIImage)providerIcon
{
  void *v2;
  void *v3;

  -[STSResultDetailViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setProviderIcon:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STSResultDetailViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProviderIcon:", v4);

}

- (NSString)providerName
{
  void *v2;
  void *v3;

  -[STSResultDetailViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setProviderName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STSResultDetailViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProviderName:", v4);

}

- (BOOL)isFullscreen
{
  void *v2;
  char v3;

  -[STSResultDetailViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFullscreen");

  return v3;
}

- (void)setIsFullscreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[STSResultDetailViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsFullscreen:", v3);

}

- (void)setSearchResult:(id)a3
{
  SFSearchResult *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SFSearchResult *v15;

  v5 = (SFSearchResult *)a3;
  if (self->_searchResult != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_searchResult, a3);
    -[SFSearchResult sts_userReportRequest](self->_searchResult, "sts_userReportRequest");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          v8 = -[STSResultDetailViewController numberOfReportedResults](self, "numberOfReportedResults"),
          v7,
          v8 <= 0x1E))
    {
      -[STSResultDetailViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShowReportConcern:", 1);

      -[STSResultDetailViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reportConcernButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STSResultDetailViewController searchResult](self, "searchResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sts_userReportRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "affordanceText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:forState:", v14, 0);

    }
    else
    {
      -[STSResultDetailViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShowReportConcern:", 0);
    }

    v5 = v15;
  }

}

- (void)updateWithThumbnail:(id)a3 orThumbnailInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[STSResultDetailViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithThumbnail:orThumbnailInfo:", v7, v6);

}

- (void)updateCustomContentWithView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STSResultDetailViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomContentView:", v4);

}

- (CGRect)contentFrameForBounds:(CGRect)a3 traitCollection:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[STSResultDetailViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentFrameForBounds:traitCollection:", v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)detailViewDidTapProvider:(id)a3
{
  void *v4;

  -[STSResultDetailViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailViewControllerDidSelectProviderLink:", self);

  -[STSResultDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)detailViewDidTapSend:(id)a3
{
  void *v4;

  -[STSResultDetailViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailViewControllerDidInsert:", self);

  -[STSResultDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)detailViewDidTapReportConcern:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[STSResultDetailViewController searchResult](self, "searchResult", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sts_userReportRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v5, "dismissText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke;
  v26[3] = &unk_24E745A48;
  v26[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v11);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v5, "userReportOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_3;
        v21[3] = &unk_24E745AB0;
        v21[4] = self;
        v21[5] = v17;
        objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v18, 0, v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v14);
  }

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_6;
  v20[3] = &unk_24E7457A8;
  v20[4] = self;
  -[STSResultDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, v20);

}

void __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_2;
  block[3] = &unk_24E7457A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowReportConcern:", 1);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportConcernButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "searchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sts_userReportRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "affordanceText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v7, 0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportConcernButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

uint64_t __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_4;
  block[3] = &unk_24E7457A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "searchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailViewControllerDidReportConcern:result:punchout:", v3, v4, *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, &__block_literal_global);
}

void __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowReportConcern:", 1);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateReportConcernButtonTitle");

}

void __63__STSResultDetailViewController_detailViewDidTapReportConcern___block_invoke_6(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShowReportConcern:", 0);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if (self->_allowCustomContentViewInteraction)
  {
    objc_msgSend(a4, "view", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSResultDetailViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (STSResultDetailViewControllerDelegate)delegate
{
  return (STSResultDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  objc_storeStrong((id *)&self->_contentURL, a3);
}

- (NSURL)providerURL
{
  return self->_providerURL;
}

- (void)setProviderURL:(id)a3
{
  objc_storeStrong((id *)&self->_providerURL, a3);
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_queryString, a3);
}

- (BOOL)useBackgroundBlur
{
  return self->_useBackgroundBlur;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (SFSearchResult)searchResult
{
  return self->_searchResult;
}

- (unint64_t)numberOfReportedResults
{
  return self->_numberOfReportedResults;
}

- (void)setNumberOfReportedResults:(unint64_t)a3
{
  self->_numberOfReportedResults = a3;
}

- (BOOL)allowCustomContentViewInteraction
{
  return self->_allowCustomContentViewInteraction;
}

- (void)setAllowCustomContentViewInteraction:(BOOL)a3
{
  self->_allowCustomContentViewInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_providerURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
