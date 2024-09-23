@implementation PXContentSyndicationMockCMMDataSource

- (PXContentSyndicationMockCMMDataSource)initWithCMMDataSource:(id)a3
{
  id v5;
  PXContentSyndicationMockCMMDataSource *v6;
  PXContentSyndicationMockCMMDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXContentSyndicationMockCMMDataSource;
  v6 = -[PXContentSyndicationMockCMMDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cmmDataSource, a3);

  return v7;
}

- (int64_t)identifier
{
  void *v2;
  int64_t v3;

  -[PXContentSyndicationMockCMMDataSource cmmDataSource](self, "cmmDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "identifier");

  return v3;
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  PXContentSyndicationItem *v8;
  _OWORD v10[2];

  -[PXContentSyndicationMockCMMDataSource cmmDataSource](self, "cmmDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v5;
  objc_msgSend(v4, "invitationAtItemIndexPath:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXContentSyndicationItem initWithAssetCollection:]([PXContentSyndicationItem alloc], "initWithAssetCollection:", v7);

  return v8;
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD v9[2];

  -[PXContentSyndicationMockCMMDataSource cmmDataSource](self, "cmmDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v5;
  objc_msgSend(v4, "invitationAtItemIndexPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mostRecentlyAddedDate
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;

  -[PXContentSyndicationMockCMMDataSource cmmDataSource](self, "cmmDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v9 = 0u;
  v10 = 0u;
  if (v2)
  {
    objc_msgSend(v2, "firstItemIndexPath");
    v4 = v9;
  }
  else
  {
    v4 = 0;
  }
  if (v4 == *(_QWORD *)off_1E50B7E98)
  {
    v5 = 0;
  }
  else
  {
    v8[0] = v9;
    v8[1] = v10;
    objc_msgSend(v3, "invitationAtItemIndexPath:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "creationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)collectionAtIndexPath:(id)a3
{
  id v4;
  _OWORD v6[4];

  v4 = a3;
  -[PXContentSyndicationMockCMMDataSource identifier](self, "identifier");
  PXSimpleIndexPathFromIndexPath();

  memset(v6, 0, sizeof(v6));
  -[PXContentSyndicationMockCMMDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)collectionListForSection:(int64_t)a3
{
  return 0;
}

- (int64_t)countForCollection:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EEA14980) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockCMMDataSource.m"), 98, CFSTR("%@ should be nil or conform to protocol %@, but %@ doesn't"), CFSTR("collection"), CFSTR("PXDisplayAssetCollection"), v10);

    }
    v7 = objc_msgSend(v6, "estimatedAssetCount");
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXContentSyndicationMockCMMDataSource cmmDataSource](self, "cmmDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PXContentSyndicationMockCMMDataSource cmmDataSource](self, "cmmDataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  return v4;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  void *v6;
  int64_t v7;

  -[PXContentSyndicationMockCMMDataSource cmmDataSource](self, "cmmDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSubitemsInItem:section:", a3, a4);

  return v7;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD v9[2];

  -[PXContentSyndicationMockCMMDataSource cmmDataSource](self, "cmmDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v5;
  objc_msgSend(v4, "invitationAtItemIndexPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PXCMMInvitationsDataSource)cmmDataSource
{
  return self->_cmmDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmmDataSource, 0);
}

@end
