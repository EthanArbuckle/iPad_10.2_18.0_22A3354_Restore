@implementation SimilarResultsViewController

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SimilarResultsViewController;
  -[SimpleResultsViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = sub_1002A8AA0(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController titleHeaderView](self, "titleHeaderView"));
  v5 = v4;
  if (v3 == 5)
  {
    objc_msgSend(v4, "setButtonHidden:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v5, "setTitleViewInsets:", 32.0, 0.0, 0.0, 0.0);
  }
  else
  {
    objc_msgSend(v4, "setTitleView:", 0);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController headerView](self, "headerView"));
  objc_msgSend(v6, "setPreservesSuperviewLayoutMargins:", 1);

  -[SimilarResultsViewController updateTitle](self, "updateTitle");
}

- (void)setHeaderTitle:(id)a3
{
  id v5;
  objc_super v6;

  v5 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    v6.receiver = self;
    v6.super_class = (Class)SimilarResultsViewController;
    -[SimpleResultsViewController setHeaderTitle:](&v6, "setHeaderTitle:", v5);
  }
  else
  {
    objc_storeStrong((id *)&self->_headerTitle, a3);
    if (-[SimilarResultsViewController isViewLoaded](self, "isViewLoaded"))
      -[SimilarResultsViewController updateTitle](self, "updateTitle");
  }

}

- (void)updateTitle
{
  NSString *headerTitle;
  id v4;
  objc_super v5;

  if (sub_1002A8AA0(self) == 5)
  {
    v5.receiver = self;
    v5.super_class = (Class)SimilarResultsViewController;
    -[SimpleResultsViewController updateTitle:](&v5, "updateTitle:", 0);
  }
  else
  {
    headerTitle = self->_headerTitle;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v4, "setTitle:", headerTitle);

  }
}

- (void)_captureTapActionWithSearchResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController originalMapItem](self, "originalMapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_relatedPlaceLists"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = objc_msgSend(v6, "type");

  switch(v7)
  {
    case 0u:
    case 4u:
      if (-[SimilarResultsViewController _isDisplayingAssociatedTrailsOrTrailheads](self, "_isDisplayingAssociatedTrailsOrTrailheads"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController originalMapItem](self, "originalMapItem"));
        v9 = objc_msgSend(v8, "_mapsui_associatedHikingItemType");

        if (v9 == 1)
        {
          v10 = 365;
          v11 = 128;
        }
        else if (v9 == 2)
        {
          v10 = 412;
          v11 = 129;
        }
        else
        {
          v11 = 0;
          v10 = 0;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
        v26 = objc_msgSend(v25, "_hasMUID");

        if (!v26)
        {
          v12 = 0;
          if (!(_DWORD)v11)
            goto LABEL_11;
          goto LABEL_26;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v23, "_muid")));
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
        v19 = objc_msgSend(v18, "_hasHikeInfo");

        if (!v19)
        {
          v12 = 0;
          goto LABEL_11;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_hikeAssociatedInfo"));
        v22 = objc_msgSend(v21, "hasEncryptedTourMuid");

        if (!v22)
        {
          v12 = 0;
          v10 = 467;
          v11 = 133;
LABEL_26:
          if (!(_DWORD)v10)
            goto LABEL_11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController analyticsDelegate](self, "analyticsDelegate"));
          objc_msgSend(v13, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", v10, v11, v12, 0, 0);
          goto LABEL_10;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_hikeAssociatedInfo"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v24, "encryptedTourMuid")));

        v10 = 467;
        v11 = 133;
      }

      if (!(_DWORD)v11)
        goto LABEL_11;
      goto LABEL_26;
    case 1u:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController analyticsDelegate](self, "analyticsDelegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v13, "_muid")));
      v15 = v12;
      v16 = 6079;
      v17 = 655;
      goto LABEL_9;
    case 2u:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController analyticsDelegate](self, "analyticsDelegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v13, "_muid")));
      v15 = v12;
      v16 = 6081;
      v17 = 656;
      goto LABEL_9;
    case 3u:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController analyticsDelegate](self, "analyticsDelegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v13, "_muid")));
      v15 = v12;
      v16 = 6080;
      v17 = 654;
LABEL_9:
      objc_msgSend(v15, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", v16, v17, v14, 0, 0);

LABEL_10:
LABEL_11:

      goto LABEL_12;
    default:
LABEL_12:

      return;
  }
}

- (void)_captureCloseAction
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController originalMapItem](self, "originalMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_relatedPlaceLists"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = objc_msgSend(v5, "type");

  switch(v6)
  {
    case 0u:
    case 4u:
      if (!-[SimilarResultsViewController _isDisplayingAssociatedTrailsOrTrailheads](self, "_isDisplayingAssociatedTrailsOrTrailheads"))return;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController originalMapItem](self, "originalMapItem"));
      v8 = objc_msgSend(v7, "_mapsui_associatedHikingItemType");

      if (v8 == 2)
      {
        v9 = 129;
        goto LABEL_11;
      }
      if (v8 == 1)
      {
        v9 = 128;
LABEL_11:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController analyticsDelegate](self, "analyticsDelegate"));
        v12 = v10;
        v11 = v9;
        goto LABEL_12;
      }
      return;
    case 1u:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController analyticsDelegate](self, "analyticsDelegate"));
      v12 = v10;
      v11 = 655;
      goto LABEL_12;
    case 2u:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController analyticsDelegate](self, "analyticsDelegate"));
      v12 = v10;
      v11 = 656;
      goto LABEL_12;
    case 3u:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController analyticsDelegate](self, "analyticsDelegate"));
      v12 = v10;
      v11 = 654;
LABEL_12:
      objc_msgSend(v10, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 4, v11, 0, 0, 0);

      return;
    default:
      return;
  }
}

- (BOOL)_isDisplayingAssociatedTrailsOrTrailheads
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SimilarResultsViewController originalMapItem](self, "originalMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_trailHead"));
  v4 = v3 != 0;

  return v4;
}

- (MKMapItem)originalMapItem
{
  return self->_originalMapItem;
}

- (void)setOriginalMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_originalMapItem, a3);
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  return (_MKInfoCardAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_originalMapItem, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
