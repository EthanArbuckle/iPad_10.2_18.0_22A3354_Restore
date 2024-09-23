@implementation PLUnintendedChangeChecker

- (PLUnintendedChangeChecker)init
{
  PLUnintendedChangeChecker *v2;
  uint64_t v3;
  NSArray *unexpectedMomentAssetKeys;
  uint64_t v5;
  NSArray *unexpectedMomentAdditionalAssetAttributeKeys;
  uint64_t v7;
  NSArray *unexpectedCPLAssetKeys;
  PLUnintendedChangeChecker *v9;
  objc_super v11;
  const __CFString *v12;
  const __CFString *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PLUnintendedChangeChecker;
  v2 = -[PLUnintendedChangeChecker init](&v11, sel_init);
  if (v2)
  {
    v14[0] = CFSTR("uuid");
    v14[1] = CFSTR("cloudAssetGUID");
    v14[2] = CFSTR("videoCpDurationValue");
    v14[3] = CFSTR("favorite");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
    v3 = objc_claimAutoreleasedReturnValue();
    unexpectedMomentAssetKeys = v2->_unexpectedMomentAssetKeys;
    v2->_unexpectedMomentAssetKeys = (NSArray *)v3;

    v13 = CFSTR("assetDescription");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    unexpectedMomentAdditionalAssetAttributeKeys = v2->_unexpectedMomentAdditionalAssetAttributeKeys;
    v2->_unexpectedMomentAdditionalAssetAttributeKeys = (NSArray *)v5;

    v12 = CFSTR("moment");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    unexpectedCPLAssetKeys = v2->_unexpectedCPLAssetKeys;
    v2->_unexpectedCPLAssetKeys = (NSArray *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)checkForUnintendedChangesDuringeSave:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "updatedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __76__PLUnintendedChangeChecker_checkForUnintendedChangesDuringeSave_withBlock___block_invoke;
        v15[3] = &unk_1E3673150;
        v14 = v6;
        v15[4] = v13;
        v16 = v14;
        -[PLUnintendedChangeChecker _checkForUnintendedChangesOnObject:withBlock:](self, "_checkForUnintendedChangesOnObject:withBlock:", v13, v15);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)checkForUnintendedChangeOnMergeConflicts:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  id obj;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "sourceObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v11;
        v17[1] = 3221225472;
        v17[2] = __80__PLUnintendedChangeChecker_checkForUnintendedChangeOnMergeConflicts_withBlock___block_invoke;
        v17[3] = &unk_1E3673150;
        v15 = v7;
        v17[4] = v13;
        v18 = v15;
        -[PLUnintendedChangeChecker _checkForUnintendedChangesOnObject:withBlock:](self, "_checkForUnintendedChangesOnObject:withBlock:", v14, v17);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (void)_checkForUnintendedChangesOnObject:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v10, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "hasPrefix:", PLDatabaseContextNameMomentLibrary))
  {
    -[PLUnintendedChangeChecker _checkForUnintendedMomentChangesOnObject:withBlock:](self, "_checkForUnintendedMomentChangesOnObject:withBlock:", v10, v6);
  }
  else if (objc_msgSend(v9, "hasPrefix:", PLDatabaseContextNameCPLLibrary))
  {
    -[PLUnintendedChangeChecker _checkForUnintendedCPLChangesOnObject:withBlock:](self, "_checkForUnintendedCPLChangesOnObject:withBlock:", v10, v6);
  }

  objc_autoreleasePoolPop(v7);
}

- (void)_checkForUnintendedMomentChangesOnObject:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[PLManagedAsset entity](PLManagedAsset, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUnintendedChangeChecker _checkForUnintendedChangesOnObject:withEntity:unexpectedKeys:block:](self, "_checkForUnintendedChangesOnObject:withEntity:unexpectedKeys:block:", v7, v8, self->_unexpectedMomentAssetKeys, v6);

  +[PLAdditionalAssetAttributes entity](PLAdditionalAssetAttributes, "entity");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PLUnintendedChangeChecker _checkForUnintendedChangesOnObject:withEntity:unexpectedKeys:block:](self, "_checkForUnintendedChangesOnObject:withEntity:unexpectedKeys:block:", v7, v9, self->_unexpectedMomentAdditionalAssetAttributeKeys, v6);

}

- (void)_checkForUnintendedCPLChangesOnObject:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[PLManagedAsset entity](PLManagedAsset, "entity");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLUnintendedChangeChecker _checkForUnintendedChangesOnObject:withEntity:unexpectedKeys:block:](self, "_checkForUnintendedChangesOnObject:withEntity:unexpectedKeys:block:", v7, v8, self->_unexpectedCPLAssetKeys, v6);

}

- (void)_checkForUnintendedChangesOnObject:(id)a3 withEntity:(id)a4 unexpectedKeys:(id)a5 block:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *, void *);
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *, void *))a6;
  objc_msgSend(v9, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isKindOfEntity:", v10);

  if (v14)
  {
    v29 = v10;
    v31 = v9;
    objc_msgSend(v9, "changedValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E60];
    v30 = v15;
    objc_msgSend(v15, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = v11;
    v19 = v11;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v18, "containsObject:", v24, v28))
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "managedObjectContext");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v12[2](v12, v24, v25, v27);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v21);
    }

    v9 = v31;
    v11 = v28;
    v10 = v29;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unexpectedCPLAssetKeys, 0);
  objc_storeStrong((id *)&self->_unexpectedMomentAdditionalAssetAttributeKeys, 0);
  objc_storeStrong((id *)&self->_unexpectedMomentAssetKeys, 0);
}

uint64_t __80__PLUnintendedChangeChecker_checkForUnintendedChangeOnMergeConflicts_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, a4, *(_QWORD *)(a1 + 32));
}

uint64_t __76__PLUnintendedChangeChecker_checkForUnintendedChangesDuringeSave_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, a4, *(_QWORD *)(a1 + 32));
}

+ (BOOL)shouldCheckForUnintendedChanges
{
  int v2;
  void *v3;
  char v4;

  v2 = MEMORY[0x19AEC04BC](a1, a2);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PLEnableUnintendedChangeChecks"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (void)checkForUnintendedChangesDuringeSave:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  PLUnintendedChangeChecker *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  if (objc_msgSend(a1, "shouldCheckForUnintendedChanges"))
  {
    v8 = objc_alloc_init(PLUnintendedChangeChecker);
    -[PLUnintendedChangeChecker checkForUnintendedChangesDuringeSave:withBlock:](v8, "checkForUnintendedChangesDuringeSave:withBlock:", v9, v6);

  }
  objc_autoreleasePoolPop(v7);

}

+ (void)checkForUnintendedChangeOnMergeConflicts:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  PLUnintendedChangeChecker *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  if (objc_msgSend(a1, "shouldCheckForUnintendedChanges"))
  {
    v8 = objc_alloc_init(PLUnintendedChangeChecker);
    -[PLUnintendedChangeChecker checkForUnintendedChangeOnMergeConflicts:withBlock:](v8, "checkForUnintendedChangeOnMergeConflicts:withBlock:", v9, v6);

  }
  objc_autoreleasePoolPop(v7);

}

@end
