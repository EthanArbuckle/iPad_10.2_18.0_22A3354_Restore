@implementation _PXStoryMemoryFeedDataSource

- (_PXStoryMemoryFeedDataSource)initWithDataSource:(id)a3
{
  id v5;
  _PXStoryMemoryFeedDataSource *v6;
  _PXStoryMemoryFeedDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryMemoryFeedDataSource;
  v6 = -[_PXStoryMemoryFeedDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_dataSource;
}

- (id)objectIDAtIndexPath:(PXSimpleIndexPath *)a3
{
  PXSectionedDataSource *dataSource;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v10[2];

  dataSource = self->_dataSource;
  v4 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v4;
  -[PXSectionedDataSource objectReferenceAtIndexPath:](dataSource, "objectReferenceAtIndexPath:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)objectReferenceNearestToObjectReference:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  PXSectionedDataSource *dataSource;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  PXSectionedDataSource *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  -[PXSectionedDataSource objectReferenceNearestToObjectReference:](self->_dataSource, "objectReferenceNearestToObjectReference:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    objc_msgSend(v4, "leafObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    if (-[PXSectionedDataSource numberOfSections](self->_dataSource, "numberOfSections") == 1 && v9)
    {
      v25 = v7;
      v10 = *(_QWORD *)off_1E50B8778;
      v26 = *((_QWORD *)off_1E50B8778 + 2);
      v27 = *((_QWORD *)off_1E50B8778 + 3);
      v28 = *((_QWORD *)off_1E50B8778 + 1);
      v11 = -[PXSectionedDataSource numberOfItemsInSection:](self->_dataSource, "numberOfItemsInSection:", 0);
      v12 = -[PXSectionedDataSource identifier](self->_dataSource, "identifier");
      if (v11 >= 1)
      {
        v13 = v12;
        v14 = 0;
        v15 = 1.79769313e308;
        do
        {
          dataSource = self->_dataSource;
          v29 = v13;
          v30 = 0;
          v31 = v14;
          v32 = 0x7FFFFFFFFFFFFFFFLL;
          -[PXSectionedDataSource objectAtIndexPath:](dataSource, "objectAtIndexPath:", &v29);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "assetCollection");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "creationDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceDate:", v9);
          v21 = v20;

          v22 = -v21;
          if (v21 >= 0.0)
            v22 = v21;
          if (v22 < v15)
          {
            v27 = 0x7FFFFFFFFFFFFFFFLL;
            v28 = 0;
            v26 = v14;
            v10 = v13;
            v15 = v22;
          }

          ++v14;
        }
        while (v11 != v14);
      }
      if (v10 == *(_QWORD *)off_1E50B7E98)
      {
        v6 = 0;
      }
      else
      {
        v23 = self->_dataSource;
        v29 = v10;
        v30 = v28;
        v31 = v26;
        v32 = v27;
        -[PXSectionedDataSource objectReferenceAtIndexPath:](v23, "objectReferenceAtIndexPath:", &v29);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v25;
    }

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
