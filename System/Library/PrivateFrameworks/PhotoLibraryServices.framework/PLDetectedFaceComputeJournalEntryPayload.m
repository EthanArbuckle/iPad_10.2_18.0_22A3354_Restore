@implementation PLDetectedFaceComputeJournalEntryPayload

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
  objc_super v12;
  _QWORD v13[3];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___PLDetectedFaceComputeJournalEntryPayload;
  objc_msgSendSuper2(&v12, sel_modelPropertiesDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("rejectedPersons"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("clusterRejectedPersons"));
  v14[0] = CFSTR("personUUID");
  v14[1] = CFSTR("verifiedType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("person"), v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("personForFace"));
  v13[0] = CFSTR("uuid");
  v13[1] = CFSTR("cloudAssetGUID");
  v13[2] = CFSTR("trashedState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("asset"), v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("assetForFace"));
  return v4;
}

+ (id)nonPersistedModelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v2 = (void *)MEMORY[0x1E0C99E08];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PLDetectedFaceComputeJournalEntryPayload;
  objc_msgSendSuper2(&v8, sel_nonPersistedModelPropertiesDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("rejectedPersons"));

  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("clusterRejectedPersons"));

  return v4;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PLDetectedFaceComputeJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_43311 != -1)
    dispatch_once(&modelProperties_onceToken_43311, block);
  return (id)modelProperties_modelProperties_43312;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PLDetectedFaceComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_43309 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_43309, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_43310;
}

+ (id)payloadClassID
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Compute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entityName
{
  return +[PLDetectedFace entityName](PLDetectedFace, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v3;
  PLDetectedFaceComputePayloadAdapter *v4;

  v3 = a3;
  v4 = -[PLJournalEntryPayloadUpdateAdapter initWithManagedObject:]([PLDetectedFaceComputePayloadAdapter alloc], "initWithManagedObject:", v3);

  return v4;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    v8 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetForFace.uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("assetForFace.cloudAssetGUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("assetForFace.trashedState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue") == 0;

  if (!v9)
    goto LABEL_8;
LABEL_9:

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("personForFace.personUUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("personForFace.verifiedType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue") != 0;

  }
  else
  {
    v14 = 0;
  }

  v8 = v11 && v14;
LABEL_13:

  return v8;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  unint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  unsigned __int8 v12;
  objc_super v14;

  v8 = (unint64_t)a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v9, "isEqualToKey:", CFSTR("person")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("personUUID"));
    v11 = objc_claimAutoreleasedReturnValue();

    if (v8 | v11)
      v12 = objc_msgSend((id)v11, "isEqualToString:", v8);
    else
      v12 = 1;

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLDetectedFaceComputeJournalEntryPayload;
    v12 = -[PLDetectedFaceJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v14, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v10, v9);

  }
  return v12;
}

- (BOOL)insertWithAssets:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "faceAnalysisVersion");

  v11 = 0;
  if (v8 && v10 <= 1)
  {
    v14.receiver = self;
    v14.super_class = (Class)PLDetectedFaceComputeJournalEntryPayload;
    if (-[PLDetectedFaceJournalEntryPayload insertWithAssets:inManagedObjectContext:](&v14, sel_insertWithAssets_inManagedObjectContext_, v6, v7))
    {
      objc_msgSend(v8, "additionalAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 1;
      objc_msgSend(v12, "setFaceAnalysisVersion:", 1);

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

void __80__PLDetectedFaceComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_43310;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_43310 = v1;

}

uint64_t __59__PLDetectedFaceComputeJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_43312;
  modelProperties_modelProperties_43312 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_43312, 0);
}

@end
