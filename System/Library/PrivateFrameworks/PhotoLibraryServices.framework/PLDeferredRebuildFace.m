@implementation PLDeferredRebuildFace

- (id)additionalDescription
{
  return 0;
}

- (id)payloadID
{
  void *v2;
  void *v3;

  -[PLDeferredRebuildFace uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  void *v5;
  PLDeferredRebuildFaceJournalEntryPayload *v6;

  v4 = a3;
  -[PLDeferredRebuildFace uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLDeferredRebuildFaceJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);
  else
    v6 = 0;

  return v6;
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloadIDsByPayloadClassIDToDeleteOnInsert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[PLDeferredRebuildFace faceUUID](self, "faceUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[PLDetectedFaceJournalEntryPayload payloadClassID](PLDetectedFaceJournalEntryPayload, "payloadClassID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)entityName
{
  return CFSTR("DeferredRebuildFace");
}

+ (id)deferredFacesWithAssetCloudGUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v9 = v5;
    v10 = v6;
    pl_result_with_autoreleasepool();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

id __80__PLDeferredRebuildFace_deferredFacesWithAssetCloudGUID_inManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 48), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("assetCloudGUID"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  v6 = *(void **)(a1 + 40);
  v11 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (!v7)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error fetching rebuild faces: %@", buf, 0xCu);
      }

    }
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

@end
