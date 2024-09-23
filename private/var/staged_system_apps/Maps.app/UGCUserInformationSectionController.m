@implementation UGCUserInformationSectionController

- (UGCUserInformationSectionController)initWithInsetGrouped:(BOOL)a3
{
  UGCUserInformationSectionController *v4;
  UGCUserInformationSectionController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UGCUserInformationSectionController;
  v4 = -[UGCUserInformationSectionController init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_isInsetGrouped = a3;
    -[UGCUserInformationSectionController _setupUserInfoView](v4, "_setupUserInfoView");
  }
  return v5;
}

- (void)_setupUserInfoView
{
  UGCUserInformationCell *v3;
  UGCUserInformationCell *userInformationCell;
  uint64_t v5;

  v3 = -[UGCUserInformationCell initWithEmphasis:]([UGCUserInformationCell alloc], "initWithEmphasis:", 1);
  userInformationCell = self->_userInformationCell;
  self->_userInformationCell = v3;

  -[UGCUserInformationCell setWantsButtonShapes:](self->_userInformationCell, "setWantsButtonShapes:", !self->_isInsetGrouped);
  -[UGCUserInformationCell updateLayoutMarginsForIsInsetGrouped:](self->_userInformationCell, "updateLayoutMarginsForIsInsetGrouped:", self->_isInsetGrouped);
  -[UGCUserInformationCell setDelegate:](self->_userInformationCell, "setDelegate:", self);
  if (!self->_isInsetGrouped)
  {
    v5 = sub_1002A8AA0(self->_userInformationCell);
    if (v5 != 5 && (MapsFeature_IsEnabled_ARPCommunityID(v5) & 1) == 0)
      -[UGCPOIEnrichmentEditorCell setShowTopHairline:](self->_userInformationCell, "setShowTopHairline:", 1);
  }
  -[UGCUserInformationSectionController _retrieveUserInformation](self, "_retrieveUserInformation");
}

- (void)_retrieveUserInformation
{
  void *v3;
  void *v4;
  UGCUserInformationViewModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  if (v3)
  {
    v5 = objc_alloc_init(UGCUserInformationViewModel);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[UGC] Contribution Name"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));
    -[UGCUserInformationViewModel setUserName:](v5, "setUserName:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userEmail"));
    -[UGCUserInformationViewModel setUserEmail:](v5, "setUserEmail:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userIcon"));
    -[UGCUserInformationViewModel setUserIcon:](v5, "setUserIcon:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserInformationSectionController _legalDisclosureString](self, "_legalDisclosureString"));
    -[UGCUserInformationViewModel setLegalDisclosureString:](v5, "setLegalDisclosureString:", v12);

    -[UGCUserInformationCell setViewModel:](self->_userInformationCell, "setViewModel:", v5);
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1006105DC;
    v13[3] = &unk_1011B29A8;
    objc_copyWeak(&v15, &location);
    v14 = v4;
    objc_msgSend(v14, "retrieveAddressForLocationWithCompletion:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

- (id)_legalDisclosureString
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  int IsEnabled_ARPCommunityID;
  void *v7;

  v2 = -[UGCUserInformationSectionController isInsetGrouped](self, "isInsetGrouped");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Inline ratings legal disclaimer [UGC]");
  }
  else
  {
    IsEnabled_ARPCommunityID = MapsFeature_IsEnabled_ARPCommunityID(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    if (IsEnabled_ARPCommunityID)
      v5 = CFSTR("Ratings and photos legal disclaimer for CommunityID [UGC]");
    else
      v5 = CFSTR("Ratings and photos legal disclaimer [UGC]");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v7;
}

- (NSArray)rowItems
{
  NSArray *rowItems;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  void *v11;
  void *v12;

  rowItems = self->_rowItems;
  if (!rowItems)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentRowItem rowItemWithView:](UGCPOIEnrichmentRowItem, "rowItemWithView:", self->_userInformationCell));
    v12 = v4;
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v6 = self->_rowItems;
    self->_rowItems = v5;

    rowItems = self->_rowItems;
    if (self->_isInsetGrouped)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentGroupedSectionView groupedSectionRowItemWithRowItems:bottomSpacing:](UGCPOIEnrichmentGroupedSectionView, "groupedSectionRowItemWithRowItems:bottomSpacing:", rowItems, 16.0));
      v11 = v7;
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
      v9 = self->_rowItems;
      self->_rowItems = v8;

      rowItems = self->_rowItems;
    }
  }
  return rowItems;
}

- (void)userInformationCellDidSelectLegalAttribution:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sectionControllerRequestsLegalAttribution:", self);

}

- (UGCSectionControllerDelegate)delegate
{
  return (UGCSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  self->_formInteractionEnabled = a3;
}

- (UGCPOIEnrichmentAnalyticsDelegate)analyticsDelegate
{
  return (UGCPOIEnrichmentAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (BOOL)isInsetGrouped
{
  return self->_isInsetGrouped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowItems, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInformationCell, 0);
}

@end
