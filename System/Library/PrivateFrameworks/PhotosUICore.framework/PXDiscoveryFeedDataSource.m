@implementation PXDiscoveryFeedDataSource

- (PXDiscoveryFeedDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDiscoveryFeedDataSource.m"), 16, CFSTR("%s is not available as initializer"), "-[PXDiscoveryFeedDataSource init]");

  abort();
}

- (PXDiscoveryFeedDataSource)initWithAssetCollections:(id)a3
{
  id v5;
  PXDiscoveryFeedDataSource *v6;
  PXDiscoveryFeedDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDiscoveryFeedDataSource;
  v6 = -[PXDiscoveryFeedDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetCollections, a3);

  return v7;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PXDiscoveryFeedDataSource assetCollections](self, "assetCollections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;

  -[PXDiscoveryFeedDataSource assetCollections](self, "assetCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3->item);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t section;
  void *v11;
  void *v12;
  PXSimpleIndexPath v13;

  section = a3->section;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL
    || section != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *a3;
    PXSimpleIndexPathDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDiscoveryFeedDataSource.m"), 50, CFSTR("%@ invalid indexPath:%@"), self, v12, *(_OWORD *)&v13.dataSourceIdentifier, *(_OWORD *)&v13.item);

    abort();
  }
  return -[PXDiscoveryFeedDataSource assetCollections](self, "assetCollections");
}

- (PHFetchResult)assetCollections
{
  return self->_assetCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollections, 0);
}

@end
