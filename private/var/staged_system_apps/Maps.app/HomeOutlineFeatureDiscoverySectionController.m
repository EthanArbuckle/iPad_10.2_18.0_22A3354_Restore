@implementation HomeOutlineFeatureDiscoverySectionController

- (HomeOutlineFeatureDiscoverySectionController)initWithConfiguration:(id)a3 suggestionsDataProvider:(id)a4
{
  id v7;
  HomeOutlineFeatureDiscoverySectionController *v8;
  FeatureDiscoveryDataProvider *v9;
  FeatureDiscoveryDataProvider *featureDiscoveryDataProvider;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HomeOutlineFeatureDiscoverySectionController;
  v8 = -[HomeOutlineSectionController initWithConfiguration:](&v12, "initWithConfiguration:", a3);
  if (v8)
  {
    v9 = objc_alloc_init(FeatureDiscoveryDataProvider);
    featureDiscoveryDataProvider = v8->_featureDiscoveryDataProvider;
    v8->_featureDiscoveryDataProvider = v9;

    objc_storeStrong((id *)&v8->_suggestionsDataProvider, a4);
  }

  return v8;
}

- (NSArray)dataProviders
{
  SuggestionsDataProvider *suggestionsDataProvider;
  _QWORD v4[2];

  suggestionsDataProvider = self->_suggestionsDataProvider;
  v4[0] = self->_featureDiscoveryDataProvider;
  v4[1] = suggestionsDataProvider;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2));
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  return (MapsUIDiffableDataSourceViewModel *)-[SectionHeaderBasicOutlineCellModel initWithTitle:]([SectionHeaderBasicOutlineCellModel alloc], "initWithTitle:", &stru_1011EB268);
}

- (NSArray)itemSnapshots
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider features](self->_featureDiscoveryDataProvider, "features"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sectionIdentifier"));
  v8[1] = 3221225472;
  v8[2] = sub_10094F194;
  v8[3] = &unk_1011ACD28;
  v8[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HomeOutlineSectionBuilder itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:](HomeOutlineSectionBuilder, "itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:", v3, v5, -[HomeOutlineSectionController expanded](self, "expanded"), v8, &stru_1011DC9B8, &stru_1011DC9D8, &stru_1011DC9F8));

  return (NSArray *)v6;
}

- (id)contextMenuForSnapshot:(id)a3
{
  return 0;
}

- (BOOL)persistsExpansions
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionController:nodeSnapshotAtIndexPath:", self, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewModel"));
  v9 = objc_opt_class(FeatureDiscoveryModel);
  LOBYTE(v6) = objc_opt_isKindOfClass(v8, v9);

  if ((v6 & 1) != 0 && v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewModel"));
    objc_msgSend(v10, "markAsDisplayed");

  }
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_featureDiscoveryDataProvider, 0);
}

@end
