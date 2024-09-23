@implementation PLEditedIPTCAttributes

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PLEditedIPTCAttributes assetAttributes](self, "assetAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PLAssetJournalEntryPayload *v7;

  v4 = a3;
  -[PLEditedIPTCAttributes assetAttributes](self, "assetAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isValidForJournalPersistence"))
    v7 = -[PLAssetJournalEntryPayload initWithEditedIPTCAttributes:changedKeys:]([PLAssetJournalEntryPayload alloc], "initWithEditedIPTCAttributes:changedKeys:", self, v4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)supportsCloudUpload
{
  void *v2;
  char v3;

  -[PLEditedIPTCAttributes assetAttributes](self, "assetAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCloudUpload");

  return v3;
}

- (void)setIPTCData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  PLEditedIPTCAttributes *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Can't read iptc data, error: %@", buf, 0xCu);
    }
  }
  else
  {
    -[PLEditedIPTCAttributes clearEditedIPTCData](self, "clearEditedIPTCData");
    +[PLEditedIPTCAttributes iptcKeyMap](PLEditedIPTCAttributes, "iptcKeyMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__PLEditedIPTCAttributes_setIPTCData___block_invoke;
    v9[3] = &unk_1E3677AF0;
    v10 = v8;
    v11 = self;
    v7 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
    -[PLEditedIPTCAttributes setData:](self, "setData:", v4);

  }
}

- (void)clearEditedIPTCData
{
  id v3;
  _QWORD v4[5];

  +[PLEditedIPTCAttributes iptcKeyMap](PLEditedIPTCAttributes, "iptcKeyMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__PLEditedIPTCAttributes_clearEditedIPTCData__block_invoke;
  v4[3] = &unk_1E36773C8;
  v4[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[PLEditedIPTCAttributes setData:](self, "setData:", 0);

}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLEditedIPTCAttributes;
  -[PLManagedObject willSave](&v14, sel_willSave);
  -[PLEditedIPTCAttributes managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLEditedIPTCAttributes assetAttributes](self, "assetAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDeleted");

    if ((v6 & 1) == 0)
    {
      -[PLEditedIPTCAttributes assetAttributes](self, "assetAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "changedValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("modificationDate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[PLEditedIPTCAttributes assetAttributes](self, "assetAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "asset");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setModificationDate:", v13);

      }
    }
  }

}

uint64_t __45__PLEditedIPTCAttributes_clearEditedIPTCData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", 0, a3);
}

void __38__PLEditedIPTCAttributes_setIPTCData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v6);
  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Skipping iptc property %@, not supported", (uint8_t *)&v8, 0xCu);
    }

  }
}

+ (id)iptcKeyMap
{
  if (iptcKeyMap_once != -1)
    dispatch_once(&iptcKeyMap_once, &__block_literal_global_91922);
  return (id)iptcKeyMap_iptcMap;
}

+ (id)entityName
{
  return CFSTR("EditedIPTCAttributes");
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
  +[PLEditedIPTCAttributes entityName](PLEditedIPTCAttributes, "entityName");
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

void __36__PLEditedIPTCAttributes_iptcKeyMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("caption"), CFSTR("Caption/Abstract"), CFSTR("byLine"), CFSTR("Byline"), CFSTR("copyrightNotice"), CFSTR("CopyrightNotice"), CFSTR("keywords"), CFSTR("Keywords"), CFSTR("urgency"), CFSTR("Urgency"), CFSTR("dateCreated"), CFSTR("DateCreated"), CFSTR("digitalCreationDate"), CFSTR("DigitalCreationDate"), CFSTR("digitalCreationTime"), CFSTR("DigitalCreationTime"), CFSTR("digitalSourceType"),
    CFSTR("DigitalSourceType"),
    CFSTR("expirationDate"),
    CFSTR("ExpirationDate"),
    CFSTR("expirationTime"),
    CFSTR("ExpirationTime"),
    CFSTR("referenceDate"),
    CFSTR("ReferenceDate"),
    CFSTR("releaseDate"),
    CFSTR("ReleaseDate"),
    CFSTR("releaseTime"),
    CFSTR("ReleaseTime"),
    CFSTR("timeCreated"),
    CFSTR("TimeCreated"),
    CFSTR("editStatus"),
    CFSTR("EditStatus"),
    CFSTR("contentLocationCode"),
    CFSTR("ContentLocationCode"),
    CFSTR("contentLocationName"),
    CFSTR("ContentLocationName"),
    CFSTR("countryPrimaryLocationCode"),
    CFSTR("Country/PrimaryLocationCode"),
    CFSTR("objectAttributeReference"),
    CFSTR("ObjectAttributeReference"),
    CFSTR("objectTypeReference"),
    CFSTR("ObjectTypeReference"),
    CFSTR("subjectReference"),
    CFSTR("SubjectReference"),
    CFSTR("subLocation"),
    CFSTR("SubLocation"),
    CFSTR("scene"),
    CFSTR("Scene"),
    CFSTR("creatorContactInfo"),
    CFSTR("CreatorContactInfo"),
    CFSTR("ciAdrCity"),
    CFSTR("CiAdrCity"),
    CFSTR("ciAdrCtry"),
    CFSTR("CiAdrCtry"),
    CFSTR("ciAdrExtadr"),
    CFSTR("CiAdrExtadr"),
    CFSTR("ciAdrPcode"),
    CFSTR("CiAdrPcode"),
    CFSTR("ciAdrRegion"),
    CFSTR("CiAdrRegion"),
    CFSTR("ciEmailWork"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iptcKeyMap_iptcMap;
  iptcKeyMap_iptcMap = v0;

}

@end
