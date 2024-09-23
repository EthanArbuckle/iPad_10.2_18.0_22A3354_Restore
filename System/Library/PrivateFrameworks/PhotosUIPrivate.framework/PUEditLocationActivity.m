@implementation PUEditLocationActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BD18];
}

- (id)activityTitle
{
  return PULocalizedString(CFSTR("SHARING_EDIT_LOCATION"));
}

- (id)_systemImageName
{
  return CFSTR("mappin.circle");
}

- (id)activityViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[PXActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__PUEditLocationActivity_activityViewController__block_invoke;
  v10[3] = &unk_1E58A9910;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0D7B7B8], "searchViewControllerWithAssets:delegate:completion:", v7, self, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 1;
    -[PXActivity itemSourceController](self, "itemSourceController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__PUEditLocationActivity_canPerformWithActivityItems___block_invoke;
    v10[3] = &unk_1E58A5220;
    v10[4] = &v11;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    v8 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)locationSearchDataSource:(id)a3 didSelectLocationSearchResult:(id)a4
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1, a4);
}

- (void)locationSearchDataSourceDidRemoveLocation:(id)a3
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

uint64_t __54__PUEditLocationActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "canPerformEditOperation:", 3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

uint64_t __48__PUEditLocationActivity_activityViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", a2);
}

@end
