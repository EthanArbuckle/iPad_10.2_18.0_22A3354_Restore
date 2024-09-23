@implementation PXSettingsMeaningsTableViewController

- (PXSettingsMeaningsTableViewController)init
{
  PXSettingsMeaningsTableViewController *v2;
  PXSettingsMeaningsTableViewController *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXSettingsMeaningsTableViewController;
  v2 = -[PXSettingsMeaningsTableViewController init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXSettingsMeaningsTableViewController _meaningDataContainerByMeaningLabels](v2, "_meaningDataContainerByMeaningLabels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSettingsMeaningsTableViewController setMeaningDataContainerByMeaningLabels:](v3, "setMeaningDataContainerByMeaningLabels:", v4);

    -[PXSettingsMeaningsTableViewController meaningDataContainerByMeaningLabels](v3, "meaningDataContainerByMeaningLabels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Meaning Scores Not Found"), CFSTR("Please make sure to run the fingerprint generation before. "), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, &__block_literal_global_71695);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:", v8);
      -[PXSettingsMeaningsTableViewController presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", v7, 1, 0);

    }
  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSettingsMeaningsTableViewController;
  -[PXSettingsMeaningsTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsMeaningsTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PXSettingsMeaningsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsMultipleSelection:", 0);

  -[PXSettingsMeaningsTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXSettingsMeaningsTableViewCellId"));

}

- (id)_meaningDataContainerByMeaningLabels
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[PXSettingsMeaningsTableViewController _momentIdentifiersByMeaningLabel](self, "_momentIdentifiersByMeaningLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__71679;
  v15 = __Block_byref_object_dispose__71680;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PXSettingsMeaningsTableViewController__meaningDataContainerByMeaningLabels__block_invoke;
  v8[3] = &unk_1E5121168;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_momentIdentifiersByMeaningLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *meaningLabels;
  void *v37;
  PXSettingsMeaningsTableViewController *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("fingerprint.csv"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithContentsOfURL:encoding:error:", v7, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v38 = self;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v37 = v8;
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v11)
    {
      v12 = v11;
      v42 = 0;
      v13 = 1;
      v14 = *(_QWORD *)v47;
      v15 = CFSTR("Meaning_");
      v39 = *(_QWORD *)v47;
      v40 = v10;
      do
      {
        v16 = 0;
        v41 = v12;
        do
        {
          if (*(_QWORD *)v47 != v14)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v16), "componentsSeparatedByString:", CFSTR(","));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "subarrayWithRange:", 1, objc_msgSend(v17, "count") - 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v17;
          objc_msgSend(v17, "firstObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v45, "isEqualToString:", &stru_1E5149688) & 1) == 0)
          {
            if ((v13 & 1) != 0)
            {
              v19 = v18;
              v20 = v42;
              v42 = v19;
            }
            else
            {
              v43 = v45;
              if (objc_msgSend(v18, "count"))
              {
                v21 = 0;
                v22 = v42;
                do
                {
                  objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v23, "hasPrefix:", v15))
                  {
                    v24 = v15;
                    objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", v15, &stru_1E5149688);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "objectAtIndexedSubscript:", v21);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "BOOLValue");

                    if (v27)
                    {
                      objc_msgSend(v9, "valueForKey:", v25);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v29 = v28;
                      if (v28)
                      {
                        objc_msgSend(v28, "setByAddingObject:", v43);
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setValue:forKey:", v30, v25);
                      }
                      else
                      {
                        v31 = v9;
                        v32 = (void *)MEMORY[0x1E0C99E60];
                        v50 = v43;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v32, "setWithArray:", v30);
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v31, "setValue:forKey:", v33, v25);

                        v9 = v31;
                        v22 = v42;
                      }

                    }
                    v15 = v24;
                  }

                  ++v21;
                }
                while (v21 < objc_msgSend(v18, "count"));
                v14 = v39;
                v10 = v40;
                v12 = v41;
              }
              v20 = v43;
            }

            v13 = 0;
          }

          ++v16;
        }
        while (v16 != v12);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v12);
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v9, "allKeys");
    v34 = objc_claimAutoreleasedReturnValue();
    meaningLabels = v38->_meaningLabels;
    v38->_meaningLabels = (NSArray *)v34;

    v8 = v37;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXSettingsMeaningsTableViewController meaningLabels](self, "meaningLabels", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPhotosUIViewController *v13;
  void *v14;
  id v15;

  v5 = a4;
  -[PXSettingsMeaningsTableViewController meaningLabels](self, "meaningLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PXSettingsMeaningsTableViewController meaningDataContainerByMeaningLabels](self, "meaningDataContainerByMeaningLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "assetCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "curatedAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXPhotosViewConfigurationForAssetCollectionWithExistingAssetsFetchResult(v10, v11, 0, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v12);
  -[PXSettingsMeaningsTableViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", v13, 1);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXSettingsMeaningsTableViewCellId"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsMeaningsTableViewController meaningLabels](self, "meaningLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  return v7;
}

- (NSArray)meaningLabels
{
  return self->_meaningLabels;
}

- (void)setMeaningLabels:(id)a3
{
  objc_storeStrong((id *)&self->_meaningLabels, a3);
}

- (NSDictionary)meaningDataContainerByMeaningLabels
{
  return self->_meaningDataContainerByMeaningLabels;
}

- (void)setMeaningDataContainerByMeaningLabels:(id)a3
{
  objc_storeStrong((id *)&self->_meaningDataContainerByMeaningLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningDataContainerByMeaningLabels, 0);
  objc_storeStrong((id *)&self->_meaningLabels, 0);
}

void __77__PXSettingsMeaningsTableViewController__meaningDataContainerByMeaningLabels__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PXSettingsMeaningMomentDataContainer *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CD13B8];
  v6 = a2;
  objc_msgSend(a3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAssetCollectionsWithLocalIdentifiers:options:", v7, *(_QWORD *)(a1 + 32));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollections:options:", v11, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXSettingsMeaningMomentDataContainer initWithCuratedAssets:assetCollection:]([PXSettingsMeaningMomentDataContainer alloc], "initWithCuratedAssets:assetCollection:", v8, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v10, v6);

}

@end
