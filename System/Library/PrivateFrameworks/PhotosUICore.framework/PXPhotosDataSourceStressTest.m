@implementation PXPhotosDataSourceStressTest

- (PXPhotosDataSourceStressTest)init
{
  PXPhotosDataSourceStressTest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDataSourceStressTest;
  result = -[PXPhotosDataSourceStressTest init](&v3, sel_init);
  if (result)
  {
    result->_maximumAssetCount = 3;
    result->_updateInterval = 0.25;
  }
  return result;
}

- (void)setRunning:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_running != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __43__PXPhotosDataSourceStressTest_setRunning___block_invoke;
    v3[3] = &unk_1E5142B28;
    v3[4] = self;
    v4 = a3;
    -[PXPhotosDataSourceStressTest performChanges:](self, "performChanges:", v3);
  }
}

- (void)_prepare
{
  NSArray *v3;
  NSArray *categories;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *assetsByCategory;
  NSDictionary *v14;
  _QWORD v15[5];
  NSDictionary *v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD v19[4];
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    v21[0] = CFSTR("portrait");
    v21[1] = CFSTR("landscape");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    categories = self->_categories;
    self->_categories = v3;

    v5 = -[PXPhotosDataSourceStressTest maximumAssetCount](self, "maximumAssetCount");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v10);

    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__PXPhotosDataSourceStressTest__prepare__block_invoke;
    v15[3] = &unk_1E511B6D8;
    v15[4] = self;
    v12 = v6;
    v17 = v19;
    v18 = v5;
    v16 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);

    assetsByCategory = self->_assetsByCategory;
    self->_assetsByCategory = v12;
    v14 = v12;

    self->_sampleLength = 1;
    _Block_object_dispose(v19, 8);

  }
}

- (id)_categoryForAsset:(id)a3
{
  id v3;
  double v4;
  unint64_t v5;

  v3 = a3;
  v4 = (double)(unint64_t)objc_msgSend(v3, "pixelWidth");
  v5 = objc_msgSend(v3, "pixelHeight");

  if (v4 / (double)v5 > 2.0)
    return CFSTR("pano");
  if ((PXFloatEqualToFloatWithTolerance() & 1) != 0)
    return CFSTR("landscape");
  if (PXFloatEqualToFloatWithTolerance())
    return CFSTR("portrait");
  return 0;
}

- (void)_updateDataSource
{
  unint64_t sampleIndex;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PXPhotosDataSourceConfiguration *v16;
  PXPhotosDataSource *v17;
  uint64_t v18;
  PXPhotosDataSource *v19;
  unint64_t v20;
  unint64_t sampleLength;
  double v22;
  dispatch_time_t v23;
  void *v24;
  _QWORD block[4];
  id v26;
  id location;
  _QWORD v28[5];
  PXPhotosDataSource *v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (-[PXPhotosDataSourceStressTest isRunning](self, "isRunning"))
  {
    sampleIndex = self->_sampleIndex;
    v4 = -[NSArray count](self->_categories, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_sampleLength)
    {
      v5 = 0;
      v6 = 1;
      do
      {
        v7 = sampleIndex / v4;
        -[NSArray objectAtIndexedSubscript:](self->_categories, "objectAtIndexedSubscript:", sampleIndex % v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_assetsByCategory, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v5 % objc_msgSend(v9, "count"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v10);
        v6 *= v4;

        ++v5;
        sampleIndex = v7;
      }
      while (v5 < self->_sampleLength);
    }
    else
    {
      v6 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v24, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CD14E0];
    v30[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transientCollectionListWithCollections:title:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v15, 16);
    v17 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v16);
    -[PXPhotosDataSource setWantsCuration:forAssetCollection:](v17, "setWantsCuration:forAssetCollection:", 1, v11);
    v18 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __49__PXPhotosDataSourceStressTest__updateDataSource__block_invoke;
    v28[3] = &unk_1E5144868;
    v28[4] = self;
    v19 = v17;
    v29 = v19;
    -[PXPhotosDataSourceStressTest performChanges:](self, "performChanges:", v28);
    v20 = self->_sampleIndex + 1;
    self->_sampleIndex = v20;
    if (v20 >= v6)
    {
      ++self->_sampleLength;
      self->_sampleIndex = 0;
    }
    sampleLength = self->_sampleLength;
    if (sampleLength <= -[PXPhotosDataSourceStressTest maximumAssetCount](self, "maximumAssetCount"))
    {
      objc_initWeak(&location, self);
      -[PXPhotosDataSourceStressTest updateInterval](self, "updateInterval");
      v23 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
      block[0] = v18;
      block[1] = 3221225472;
      block[2] = __49__PXPhotosDataSourceStressTest__updateDataSource__block_invoke_2;
      block[3] = &unk_1E5148D30;
      objc_copyWeak(&v26, &location);
      dispatch_after(v23, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_setDataSource:(id)a3
{
  PXPhotosDataSource *v5;
  PXPhotosDataSource *v6;

  v5 = (PXPhotosDataSource *)a3;
  if (self->_dataSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[PXPhotosDataSourceStressTest signalChange:](self, "signalChange:", 2);
    v5 = v6;
  }

}

- (void)_setDataSourceIndex:(unint64_t)a3
{
  if (self->_dataSourceIndex != a3)
  {
    self->_dataSourceIndex = a3;
    -[PXPhotosDataSourceStressTest signalChange:](self, "signalChange:", 4);
  }
}

- (unint64_t)maximumAssetCount
{
  return self->_maximumAssetCount;
}

- (void)setMaximumAssetCount:(unint64_t)a3
{
  self->_maximumAssetCount = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (PXPhotosDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)dataSourceIndex
{
  return self->_dataSourceIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_assetsByCategory, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

uint64_t __49__PXPhotosDataSourceStressTest__updateDataSource__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setDataSource:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setDataSourceIndex:", objc_msgSend(*(id *)(a1 + 32), "dataSourceIndex") + 1);
}

void __49__PXPhotosDataSourceStressTest__updateDataSource__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDataSource");

}

void __40__PXPhotosDataSourceStressTest__prepare__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_categoryForAsset:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") < *(_QWORD *)(a1 + 56))
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);
      }
      objc_msgSend(v7, "addObject:", v10);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containsObject:", v6))
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }

  }
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v9 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count") * v8)
    *a4 = 1;

}

uint64_t __43__PXPhotosDataSourceStressTest_setRunning___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = *(_BYTE *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_prepare");
    return objc_msgSend(*(id *)(a1 + 32), "_updateDataSource");
  }
  return result;
}

@end
