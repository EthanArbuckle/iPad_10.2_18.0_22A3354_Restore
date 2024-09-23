@implementation PLExtendedAttributes

- (id)formattedCameraModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D75130];
  -[PLExtendedAttributes cameraModel](self, "cameraModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLExtendedAttributes cameraMake](self, "cameraMake");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedCameraModelFromCameraModel:cameraMake:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setGenerativeAIType:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PLExtendedAttributes_setGenerativeAIType___block_invoke;
  v3[3] = &unk_1E3670DE8;
  v3[4] = self;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", a3, CFSTR("generativeAIType"), v3);
}

- (void)willSave
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PLExtendedAttributes;
  -[PLManagedObject willSave](&v13, sel_willSave);
  -[PLExtendedAttributes managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || MEMORY[0x19AEC0720]())
  {
    -[PLExtendedAttributes asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDeleted");

    if ((v5 & 1) == 0)
    {
      -[PLExtendedAttributes changedValues](self, "changedValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("orientation"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[PLExtendedAttributes correctOrientationIfRequired](self, "correctOrientationIfRequired");
        -[PLExtendedAttributes orientation](self, "orientation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "shortValue");

        -[PLExtendedAttributes asset](self, "asset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "originalOrientation");

        if (v11 != (_DWORD)v9)
        {
          -[PLExtendedAttributes asset](self, "asset");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setOriginalOrientation:", v9);

        }
      }

    }
  }

}

- (void)correctOrientationIfRequired
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[PLExtendedAttributes orientation](self, "orientation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shortValue");

  v5 = +[PLManagedAsset correctedOrientation:](PLManagedAsset, "correctedOrientation:", v4);
  if ((_DWORD)v5 != (_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PLExtendedAttributes setOrientation:](self, "setOrientation:", v6);

  }
}

void __44__PLExtendedAttributes_setGenerativeAIType___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asset");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "additionalAttributes");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "updateAllowedForAnalysis");
}

+ (id)entityName
{
  return CFSTR("ExtendedAttributes");
}

+ (id)distinctValuesForKeyPath:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *context;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x19AEC1554]();
  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLExtendedAttributes entityName](PLExtendedAttributes, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v11);

  objc_msgSend(v10, "setReturnsDistinctResults:", 1);
  objc_msgSend(v10, "setResultType:", 2);
  v26 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v10, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v26;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "objectForKey:", v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v7, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(context);
  return v7;
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;

  -[PLExtendedAttributes asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  PLAssetJournalEntryPayload *v6;

  v4 = a3;
  -[PLExtendedAttributes asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isValidForJournalPersistence"))
    v6 = -[PLAssetJournalEntryPayload initWithExtendedAttributes:changedKeys:]([PLAssetJournalEntryPayload alloc], "initWithExtendedAttributes:changedKeys:", self, v4);
  else
    v6 = 0;

  return v6;
}

@end
