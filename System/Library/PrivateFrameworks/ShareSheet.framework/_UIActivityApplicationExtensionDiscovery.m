@implementation _UIActivityApplicationExtensionDiscovery

+ (id)extensionBasedActivityForExtension:(id)a3
{
  return _UIActivityFromApplicationExtension(a3);
}

+ (id)extensionMatchingDictionariesForExtensionItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "_matchingDictionaryRepresentation", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sh_removingUnsupportedTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (_UIActivityApplicationExtensionDiscovery)initWithExtensionPointIdentifiers:(id)a3
{
  id v4;
  _UIActivityApplicationExtensionDiscovery *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityApplicationExtensionDiscovery;
  v5 = -[_UIActivityApplicationExtensionDiscovery init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allObjects");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v7;
    }
    -[_UIActivityApplicationExtensionDiscovery setExtensionPointIdentifiers:](v5, "setExtensionPointIdentifiers:", v4);
  }

  return v5;
}

- (_UIActivityApplicationExtensionDiscovery)init
{
  void *v3;
  _UIActivityApplicationExtensionDiscovery *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0CB2A30];
  v6[1] = CFSTR("com.apple.services");
  v6[2] = CFSTR("com.apple.share-services");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIActivityApplicationExtensionDiscovery initWithExtensionPointIdentifiers:](self, "initWithExtensionPointIdentifiers:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIActivityApplicationExtensionDiscovery setExtensionPointIdentifiers:](self, "setExtensionPointIdentifiers:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityApplicationExtensionDiscovery;
  -[_UIActivityApplicationExtensionDiscovery dealloc](&v3, sel_dealloc);
}

+ (void)registerContinuousExtensionsDiscoveryOnLaunch
{
  id v2;

  v2 = +[_UIActivityApplicationExtensionsCache sharedExtensionsCache](_UIActivityApplicationExtensionsCache, "sharedExtensionsCache");
}

- (void)primeWithDiscoveryContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(a3, "activityItemValueExtensionMatchingDictionaries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIApplicationExtensionDiscoveryGetAttributesForExtensionMatchingDictionaries(v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIActivityApplicationExtensionDiscovery extensionPointIdentifiers](self, "extensionPointIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2A28]);

  +[_UIActivityApplicationExtensionsCache sharedExtensionsCache](_UIActivityApplicationExtensionsCache, "sharedExtensionsCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primeExtensionsResultWithMatchingAttributes:", v9);

}

- (id)_extensionsForMatchingContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v40;
  id *v41;
  _QWORD v42[4];
  id v43;

  v6 = a3;
  objc_msgSend(v6, "activityItemValueExtensionMatchingDictionaries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
  {
    v41 = a4;
    v10 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v6, "activityItemValueExtensionMatchingDictionaries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _UIApplicationExtensionDiscoveryGetAttributesForExtensionMatchingDictionaries(v11, objc_msgSend(v6, "shouldMatchOnlyUserElectedExtensions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIActivityApplicationExtensionDiscovery extensionPointIdentifiers](self, "extensionPointIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB2A28]);

    +[_UIActivityApplicationExtensionsCache sharedExtensionsCache](_UIActivityApplicationExtensionsCache, "sharedExtensionsCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extensionsResultWithMatchingAttributes:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "extensions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v6;
    if (v17)
      v19 = v17;
    else
      v19 = v9;
    v20 = v18;
    v21 = (void *)MEMORY[0x1E0C99DE8];
    v22 = v19;
    v40 = v17;
    objc_msgSend(v21, "arrayWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "valueForKeyPath:", CFSTR("identifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class sharedConnection](getMCProfileConnectionClass_2(), "sharedConnection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isOpenInRestrictionInEffect"))
    {
      v26 = objc_msgSend(v20, "isContentManaged");
      objc_msgSend(v20, "sourceApplicationIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:", v24, v27, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v20, "shouldExcludeiCloudAddToDriveActivity") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", CFSTR("com.apple.DocumentManagerUICore.SaveToFiles"));

        v28 = v29;
      }

      v24 = v28;
    }
    if (v24)
    {
      if (objc_msgSend(v20, "shouldExcludeiCloudAddToDriveActivity"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeObject:", CFSTR("com.apple.DocumentManagerUICore.SaveToFiles"));

        v24 = v30;
      }
      if (objc_msgSend(v20, "shouldExcludeiCloudSharingActivity"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "removeObject:", CFSTR("com.apple.UIKit.activity.CloudSharing"));

        v24 = v31;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeObject:", CFSTR("com.apple.shortcuts.Run-Workflow"));

    }
    else
    {
      v32 = (void *)MEMORY[0x1E0C9AA60];
    }
    v33 = v32;
    v34 = objc_msgSend(v33, "indexOfObject:", CFSTR("com.ios.uikit.TestingHarness.TestingActionExtension"));
    v35 = v33;
    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v36 = v34;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeObjectAtIndex:", v36);

    }
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = ___UIApplicationExtensionDiscoveryGetAllowedExtensions_block_invoke;
    v42[3] = &unk_1E4002ED0;
    v43 = v35;
    v37 = v35;
    objc_msgSend(v22, "indexesOfObjectsWithOptions:passingTest:", 0, v42);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "removeObjectsAtIndexes:", v38);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_25);

    if (v41)
    {
      objc_msgSend(v16, "error");
      *v41 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

- (id)activitiesForMatchingContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  objc_msgSend(v6, "activityItemValueExtensionMatchingDictionaries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[_UIActivityApplicationExtensionDiscovery _extensionsForMatchingContext:error:](self, "_extensionsForMatchingContext:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityApplicationExtensionDiscovery fetchShortcutsBlock](self, "fetchShortcutsBlock");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "activityItemValueExtensionMatchingDictionaries");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sourceApplicationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v10)[2](v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    v15 = (void *)MEMORY[0x1E0C99DE8];
    v16 = v9;
    v17 = v13;
    objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v17, "count") + objc_msgSend(v16, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke;
    v26[3] = &unk_1E4002F18;
    v20 = v18;
    v27 = v20;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v26);

    v24[0] = v19;
    v24[1] = 3221225472;
    v24[2] = ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke_2;
    v24[3] = &unk_1E4002F40;
    v21 = v20;
    v25 = v21;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v24);

    v22 = v25;
    v14 = v21;

  }
  else
  {
    v14 = (id)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (id)reportExtensionsCacheResult
{
  void *v2;
  void *v3;

  +[_UIActivityApplicationExtensionsCache sharedExtensionsCache](_UIActivityApplicationExtensionsCache, "sharedExtensionsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportExtensionsCacheResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)extensionPointIdentifiers
{
  return self->_extensionPointIdentifiers;
}

- (void)setExtensionPointIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)fetchShortcutsBlock
{
  return self->_fetchShortcutsBlock;
}

- (void)setFetchShortcutsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchShortcutsBlock, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifiers, 0);
}

@end
