@implementation PXPeopleDetailSettingsFaceCropDataSource

- (PXPeopleDetailSettingsFaceCropDataSource)init
{
  PXPeopleDetailSettingsFaceCropDataSource *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PHFetchResult *fetchResult;
  NSMutableDictionary *v8;
  NSMutableDictionary *images;
  dispatch_queue_t v10;
  OS_dispatch_queue *imagesIsolationQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXPeopleDetailSettingsFaceCropDataSource;
  v2 = -[PXPeopleDetailSettingsFaceCropDataSource init](&v13, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CD1538];
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchFaceCropsWithOptions:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    fetchResult = v2->_fetchResult;
    v2->_fetchResult = (PHFetchResult *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    images = v2->_images;
    v2->_images = v8;

    v10 = dispatch_queue_create("PXPeopleDetailSettingsFaceCropDataSource.images", 0);
    imagesIsolationQueue = v2->_imagesIsolationQueue;
    v2->_imagesIsolationQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (id)imageAtIndexPath:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__94434;
  v28 = __Block_byref_object_dispose__94435;
  v29 = 0;
  -[PXPeopleDetailSettingsFaceCropDataSource imagesIsolationQueue](self, "imagesIsolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PXPeopleDetailSettingsFaceCropDataSource_imageAtIndexPath___block_invoke;
  block[3] = &unk_1E513FD98;
  v23 = &v24;
  block[4] = self;
  v7 = v4;
  v22 = v7;
  dispatch_sync(v5, block);

  v8 = (void *)v25[5];
  if (!v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0DC3870]);
    -[PXPeopleDetailSettingsFaceCropDataSource fetchResult](self, "fetchResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resourceData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "initWithData:", v12);
    v14 = (void *)v25[5];
    v25[5] = v13;

    -[PXPeopleDetailSettingsFaceCropDataSource imagesIsolationQueue](self, "imagesIsolationQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __61__PXPeopleDetailSettingsFaceCropDataSource_imageAtIndexPath___block_invoke_2;
    v18[3] = &unk_1E513FD98;
    v18[4] = self;
    v20 = &v24;
    v19 = v7;
    dispatch_sync(v15, v18);

    v8 = (void *)v25[5];
  }
  v16 = v8;

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (unint64_t)numberOfAssets
{
  void *v2;
  unint64_t v3;

  -[PXPeopleDetailSettingsFaceCropDataSource fetchResult](self, "fetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)nameAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;

  v4 = a3;
  -[PXPeopleDetailSettingsFaceCropDataSource fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesForFaceCrop:options:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonWithFace:options:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15)
      {
        objc_msgSend(v13, "name");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = CFSTR("unnamed");
      }

    }
    else
    {
      v16 = CFSTR("unnamed");
    }

  }
  else
  {
    v16 = CFSTR("unnamed");
  }

  return v16;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void)setFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_fetchResult, a3);
}

- (NSMutableDictionary)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_storeStrong((id *)&self->_images, a3);
}

- (OS_dispatch_queue)imagesIsolationQueue
{
  return self->_imagesIsolationQueue;
}

- (void)setImagesIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imagesIsolationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesIsolationQueue, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

void __61__PXPeopleDetailSettingsFaceCropDataSource_imageAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "images");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__PXPeopleDetailSettingsFaceCropDataSource_imageAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "images");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

}

@end
