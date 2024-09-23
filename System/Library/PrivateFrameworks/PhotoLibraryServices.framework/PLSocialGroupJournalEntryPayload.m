@implementation PLSocialGroupJournalEntryPayload

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withSourceObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  BOOL v25;
  _QWORD v27[4];
  id v28;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  if (objc_msgSend(v13, "isEqualToKey:", CFSTR("keyAsset")))
  {
    if (objc_msgSend(v14, "keyAssetPickSource") != 1
      || (objc_msgSend(v14, "keyAsset"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      objc_msgSend(v13, "key");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v23);

      if (objc_msgSend(v14, "keyAssetPickSource") == 1)
      {
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "updatePayloadAttributes: nil social group key asset but pick source is user", buf, 2u);
        }

      }
      goto LABEL_12;
    }
    objc_msgSend(v14, "keyAsset");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v19);

  }
  else
  {
    if (!objc_msgSend(v13, "isEqualToKey:", CFSTR("members")))
    {
      v25 = 0;
      goto LABEL_14;
    }
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v14, "members");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __113__PLSocialGroupJournalEntryPayload_updatePayloadAttributes_andNilAttributes_withSourceObject_forPayloadProperty___block_invoke;
    v27[3] = &unk_1E3669720;
    v28 = v20;
    v16 = v20;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v27);

    -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringArray:](self, "encodedDataForUUIDStringArray:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:](self, "updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:", v10, v11, v13, v22);

  }
LABEL_12:
  v25 = 1;
LABEL_14:

  return v25;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("keyAsset")))
  {
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)PLSocialGroupJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v14, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v10);
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("members")))
    {
      v12.receiver = self;
      v12.super_class = (Class)PLSocialGroupJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v12, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v9, v10);
      goto LABEL_7;
    }
    -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PLSocialGroupJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v13, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v10);
  }

LABEL_7:
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("keyAsset")))
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToKey:", CFSTR("members")))
    {
      v13.receiver = self;
      v13.super_class = (Class)PLSocialGroupJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v13, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

LABEL_7:
  return v11;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  unsigned __int8 v15;
  objc_super v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isEqualToKey:", CFSTR("members")))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToSet:", v8);

  }
  else
  {
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("keyAsset")))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("keyAssetPickSource"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      if (v14 != 1)
      {
        v12 = v8 == 0;
        goto LABEL_9;
      }
      v15 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v18, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, v17.receiver, v17.super_class, self, PLSocialGroupJournalEntryPayload);
    }
    else
    {
      v15 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v17, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10, self, PLSocialGroupJournalEntryPayload, v18.receiver, v18.super_class);
    }
    v12 = v15;
  }
LABEL_9:

  return v12;
}

- (id)insertSocialGroupInManagedObjectContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  v5 = +[PLSocialGroup newNodeContainerWithManagedObjectContext:](PLSocialGroup, "newNodeContainerWithManagedObjectContext:", v4);
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payloadIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUuid:", v7);

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__38967;
  v18[4] = __Block_byref_object_dispose__38968;
  v19 = 0;
  objc_msgSend((id)objc_opt_class(), "modelProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PLSocialGroupJournalEntryPayload_insertSocialGroupInManagedObjectContext___block_invoke;
  v14[3] = &unk_1E3669770;
  v14[4] = self;
  v9 = v5;
  v15 = v9;
  v17 = v18;
  v10 = v4;
  v16 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  _Block_object_dispose(v18, 8);
  return v12;
}

- (id)keyAssetUUID
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("keyAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)memberPersonUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("members"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)keyAssetPickSource
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("keyAssetPickSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (signed)socialGroupVerifiedType
{
  void *v2;
  signed __int16 v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("verifiedType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

void __76__PLSocialGroupJournalEntryPayload_insertSocialGroupInManagedObjectContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  id v43;
  id obj;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_29;
  if ((objc_msgSend(v6, "requiresConversion") & 1) == 0
    && (objc_msgSend(v6, "isEqualToKey:", CFSTR("keyAssetPickSource")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToKey:", CFSTR("verifiedType")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v9, v5);
    goto LABEL_29;
  }
  if (!objc_msgSend(v6, "isEqualToKey:", CFSTR("verifiedType")))
  {
    if (!objc_msgSend(v6, "isEqualToKey:", CFSTR("keyAsset")))
    {
      if (objc_msgSend(v6, "isEqualToKey:", CFSTR("members")))
      {
        v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(*(id *)(a1 + 32), "memberPersonUUIDs");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __76__PLSocialGroupJournalEntryPayload_insertSocialGroupInManagedObjectContext___block_invoke_61;
        v38[3] = &unk_1E3669748;
        v39 = *(id *)(a1 + 48);
        v13 = v25;
        v27 = *(_QWORD *)(a1 + 32);
        v40 = v13;
        v41 = v27;
        objc_msgSend(v26, "enumerateObjectsUsingBlock:", v38);

        v28 = *(void **)(a1 + 40);
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v37 = *(id *)(v29 + 40);
        v30 = objc_msgSend(v28, "setMembers:error:", v13, &v37);
        objc_storeStrong((id *)(v29 + 40), v37);
        if ((v30 & 1) == 0)
        {
          PLMigrationGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            *(_DWORD *)buf = 138412290;
            v46 = v32;
            _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "insertSocialGroupInManagedObjectContext: error setting social group members: %@", buf, 0xCu);
          }

        }
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    objc_msgSend(*(id *)(a1 + 32), "keyAssetUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", v15, *(_QWORD *)(a1 + 48));
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "keyAssetUUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "payloadID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v46 = v33;
        v47 = 2114;
        v48 = v34;
        v49 = 2112;
        v50 = v35;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Key asset %{public}@ not found for social group %{public}@ with payload: %@", buf, 0x20u);

      }
      goto LABEL_27;
    }
    v16 = *(void **)(a1 + 40);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v43 = *(id *)(v17 + 40);
    v18 = objc_msgSend(v16, "setKeyAsset:error:", v13, &v43);
    objc_storeStrong((id *)(v17 + 40), v43);
    if ((v18 & 1) != 0)
    {
      v19 = *(void **)(a1 + 40);
      v20 = objc_msgSend(*(id *)(a1 + 32), "keyAssetPickSource");
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v42 = *(id *)(v21 + 40);
      LOBYTE(v19) = objc_msgSend(v19, "setKeyAssetPickSource:error:", v20, &v42);
      objc_storeStrong((id *)(v21 + 40), v42);
      if ((v19 & 1) != 0)
      {
LABEL_28:

        goto LABEL_29;
      }
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v46 = v23;
        v24 = "insertSocialGroupInManagedObjectContext: error setting social group key asset pick source: %@";
LABEL_26:
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
      }
    }
    else
    {
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v46 = v36;
        v24 = "insertSocialGroupInManagedObjectContext: error setting social group key asset: %@";
        goto LABEL_26;
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  v10 = *(void **)(a1 + 40);
  v11 = objc_msgSend(*(id *)(a1 + 32), "socialGroupVerifiedType");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v12 + 40);
  LOBYTE(v10) = objc_msgSend(v10, "setSocialGroupVerifiedType:error:", v11, &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v10 & 1) == 0)
  {
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v46 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "insertSocialGroupInManagedObjectContext: error setting social group verified type: %@", buf, 0xCu);
    }
    goto LABEL_28;
  }
LABEL_29:

}

void __76__PLSocialGroupJournalEntryPayload_insertSocialGroupInManagedObjectContext___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "payloadID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138543874;
      v9 = v3;
      v10 = 2114;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Social group member %{public}@ not found for social group %{public}@ with payload: %@", (uint8_t *)&v8, 0x20u);

    }
  }

}

void __113__PLSocialGroupJournalEntryPayload_updatePayloadAttributes_andNilAttributes_withSourceObject_forPayloadProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "personUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)modelPropertiesDescription
{
  void *v2;
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
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[12];
  _QWORD v19[14];

  v19[12] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("customTitle");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("manualOrder");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = CFSTR("automaticOrder");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v2;
  v18[4] = CFSTR("socialGroupVerifiedType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("verifiedType"), 100, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v3;
  v18[5] = CFSTR("keyAssetPickSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v4;
  v18[6] = CFSTR("keyAsset");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("keyAsset"), v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19[6] = v6;
  v18[7] = CFSTR("members");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("personUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("members"), v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19[7] = v8;
  v18[8] = CFSTR("changeFlag0");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v9;
  v18[9] = CFSTR("changeFlag1");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v10;
  v18[10] = CFSTR("changeFlag2");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v11;
  v18[11] = CFSTR("changeFlag3");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PLSocialGroupJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_39004 != -1)
    dispatch_once(&modelProperties_onceToken_39004, block);
  return (id)modelProperties_modelProperties_39005;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PLSocialGroupJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_39002 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_39002, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_39003;
}

+ (id)entityName
{
  return +[PLGraphNode entityName](PLGraphNode, "entityName");
}

+ (id)payloadClassID
{
  return CFSTR("SocialGroup");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (id)fetchPredicateInContext:(id)a3
{
  return +[PLSocialGroup predicateForAllSocialGroupsInContext:](PLSocialGroup, "predicateForAllSocialGroupsInContext:", a3);
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v3;
  PLSocialGroupPayloadAdapter *v4;

  v3 = a3;
  v4 = -[PLSocialGroupPayloadAdapter initWithManagedObject:]([PLSocialGroupPayloadAdapter alloc], "initWithManagedObject:", v3);

  return v4;
}

void __72__PLSocialGroupJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_39003;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_39003 = v1;

}

uint64_t __51__PLSocialGroupJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_39005;
  modelProperties_modelProperties_39005 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_39005, 0);
}

@end
