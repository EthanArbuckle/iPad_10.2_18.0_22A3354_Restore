@implementation PUEditDateTimeActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BD10];
}

- (id)activityTitle
{
  return PULocalizedString(CFSTR("SHARING_EDIT_DATE_TIME_TITLE"));
}

- (id)_systemImageName
{
  return CFSTR("calendar.badge.clock");
}

- (id)activityViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[PXActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CD1570];
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchOptionsWithPhotoLibrary:orObject:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = *MEMORY[0x1E0CD1A08];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchPropertySets:", v10);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__PUEditDateTimeActivity_activityViewController__block_invoke;
  v14[3] = &unk_1E58A9910;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0D7B7A8], "dateTimeViewControllerWithAssets:completion:", v11, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    return 0;
  -[PXActivity itemSourceController](self, "itemSourceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "canPerformEditOperation:", 3, (_QWORD)v14))
        {
          v12 = 0;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_12:

  return v12;
}

uint64_t __48__PUEditDateTimeActivity_activityViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", a2);
}

@end
