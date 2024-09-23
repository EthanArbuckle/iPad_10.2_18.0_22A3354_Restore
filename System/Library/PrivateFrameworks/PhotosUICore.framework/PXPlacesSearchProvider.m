@implementation PXPlacesSearchProvider

- (PXPlacesSearchProvider)init
{
  PXPlacesSearchProvider *v2;
  void *v3;
  PXPlacesSnapshotFactory *v4;
  PXPlacesSnapshotFactory *factory;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPlacesSearchProvider;
  v2 = -[PXPlacesSearchProvider init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PXPlacesSnapshotFactory initWithPhotoLibrary:]([PXPlacesSnapshotFactory alloc], "initWithPhotoLibrary:", v3);
    factory = v2->_factory;
    v2->_factory = v4;

    v6 = dispatch_queue_create("PXPlacesSearchProvider", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)requestMapSnapshotForQuery:(id)a3 size:(CGSize)a4 traitCollectionForSnapshot:(id)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  +[PXPlacesSearchProvider _extendedTraitCollectionForTraitCollection:](PXPlacesSearchProvider, "_extendedTraitCollectionForTraitCollection:", a5);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesSearchProvider serialQueue](self, "serialQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPlacesSearchProvider _placesSnapshotOptionsForSize:extendedTraitCollection:serialQueue:](PXPlacesSearchProvider, "_placesSnapshotOptionsForSize:extendedTraitCollection:serialQueue:", v16, v13, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesSearchProvider factory](self, "factory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requestMapSnapshotForQuery:snapshotOptions:completion:", v12, v14, v11);

}

- (void)requestMapSnapshotOfRegion:(id *)a3 size:(CGSize)a4 traitCollectionForSnapshot:(id)a5 completion:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double width;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  height = a4.height;
  width = a4.width;
  v18 = a5;
  +[PXPlacesSearchProvider _extendedTraitCollectionForTraitCollection:](PXPlacesSearchProvider, "_extendedTraitCollectionForTraitCollection:", a3);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesSearchProvider serialQueue](self, "serialQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPlacesSearchProvider _placesSnapshotOptionsForSize:extendedTraitCollection:serialQueue:](PXPlacesSearchProvider, "_placesSnapshotOptionsForSize:extendedTraitCollection:serialQueue:", v22, v19, v12, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesSearchProvider factory](self, "factory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "requestMapSnapshotOfRegion:snapshotOptions:completion:", v20, v18, width, height, v14, v13);

}

- (void)requestBoundingRegionForQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[PXPlacesSearchProvider factory](self, "factory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PXPlacesSearchProvider_requestBoundingRegionForQuery_completion___block_invoke;
  v10[3] = &unk_1E5131F80;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "requestBoundingRegionForQuery:completion:", v7, v10);

}

- (PXPlacesSnapshotFactory)factory
{
  return self->_factory;
}

- (void)setFactory:(id)a3
{
  objc_storeStrong((id *)&self->_factory, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_factory, 0);
}

uint64_t __67__PXPlacesSearchProvider_requestBoundingRegionForQuery_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_extendedTraitCollectionForTraitCollection:(id)a3
{
  id v3;
  PKExtendedTraitCollection *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(PKExtendedTraitCollection);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  -[PKExtendedTraitCollection setDisplayScale:](v4, "setDisplayScale:");

  -[PKExtendedTraitCollection setTraitCollectionForMapKit:](v4, "setTraitCollectionForMapKit:", v3);
  return v4;
}

+ (id)_placesSnapshotOptionsForSize:(CGSize)a3 extendedTraitCollection:(id)a4 serialQueue:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  PXPlacesSnapshotOptions *v10;

  height = a3.height;
  width = a3.width;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(PXPlacesSnapshotOptions);
  -[PXPlacesSnapshotOptions setQueue:](v10, "setQueue:", v8);

  -[PXPlacesSnapshotOptions setViewSize:](v10, "setViewSize:", width, height);
  -[PXPlacesSnapshotOptions setExtendedTraitCollection:](v10, "setExtendedTraitCollection:", v9);

  -[PXPlacesSnapshotOptions setShowsPointLabels:](v10, "setShowsPointLabels:", 0);
  return v10;
}

@end
