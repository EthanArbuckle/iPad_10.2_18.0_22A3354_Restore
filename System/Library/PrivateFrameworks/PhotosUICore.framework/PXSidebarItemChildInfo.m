@implementation PXSidebarItemChildInfo

- (PXSidebarItemChildInfo)initWithListItem:(id)a3 dataSection:(id)a4 childIndex:(int64_t)a5
{
  id v8;
  id v9;
  PXSidebarItemChildInfo *v10;
  void *v11;
  uint64_t v12;
  PHCollection *collection;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PHFetchResult *fetchResult;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXSidebarItemChildInfo;
  v10 = -[PXSidebarItemChildInfo init](&v25, sel_init);
  if (v10)
  {
    objc_msgSend(v9, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collection");
    v12 = objc_claimAutoreleasedReturnValue();
    collection = v10->_collection;
    v10->_collection = (PHCollection *)v12;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v11;
    else
      v14 = 0;
    objc_storeStrong((id *)&v10->_fetchResult, v14);
    v15 = objc_msgSend(v9, "count");
    if (a5 == -1 || (v16 = v15, v15 < 1))
    {
      v10->_childIndexInFetchResult = -1;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:", a5 - (v15 == a5));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      fetchResult = v10->_fetchResult;
      objc_msgSend(v17, "collection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[PHFetchResult indexOfObject:](fetchResult, "indexOfObject:", v19);
      v21 = v20;
      if (v16 == a5)
        v22 = v20 + 1;
      else
        v22 = v20;

      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        v23 = -1;
      else
        v23 = v22;
      v10->_childIndexInFetchResult = v23;

    }
  }

  return v10;
}

- (PHCollection)collection
{
  return self->_collection;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (int64_t)childIndexInFetchResult
{
  return self->_childIndexInFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
