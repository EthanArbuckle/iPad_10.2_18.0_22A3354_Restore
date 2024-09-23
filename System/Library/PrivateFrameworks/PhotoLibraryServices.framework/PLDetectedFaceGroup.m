@implementation PLDetectedFaceGroup

+ (id)entityName
{
  return CFSTR("DetectedFaceGroup");
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLDetectedFaceGroup;
  -[PLDetectedFaceGroup awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDetectedFaceGroup setUuid:](self, "setUuid:", v3);

}

- (void)willSave
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLDetectedFaceGroup;
  -[PLManagedObject willSave](&v4, sel_willSave);
  if ((-[PLDetectedFaceGroup isDeleted](self, "isDeleted") & 1) == 0)
  {
    -[PLDetectedFaceGroup associatedPerson](self, "associatedPerson");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      +[PLPerson createAssociatedPersonForFaceGroup:](PLPerson, "createAssociatedPersonForFaceGroup:", self);
  }
}

- (id)mutableDetectedFaces
{
  return (id)-[PLDetectedFaceGroup mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("detectedFaces"));
}

+ (id)detectedFaceGroupWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(a1, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setPredicate:", v9);
    v16 = 0;
    objc_msgSend(v7, "executeFetchRequest:error:", v12, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (void)batchFetchFaceGroupByFaceUUIDWithFaceUUIDs:(id)a3 predicate:(id)a4 library:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__PLDetectedFaceGroup_batchFetchFaceGroupByFaceUUIDWithFaceUUIDs_predicate_library_completion___block_invoke;
  v14[3] = &unk_1E3676290;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v13, "performBlockAndWait:", v14);

}

void __95__PLDetectedFaceGroup_batchFetchFaceGroupByFaceUUIDWithFaceUUIDs_predicate_library_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v1 = a1;
  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", &unk_1E37632F0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), *(_QWORD *)(v1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);
  v30 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v30;
  v9 = v8;
  if (v7)
  {
    v22 = v8;
    v23 = v6;
    v24 = v1;
    v25 = v2;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v16, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "faceGroup");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17)
            v20 = v18 == 0;
          else
            v20 = 1;
          if (!v20)
          {
            objc_msgSend(v18, "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v17);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v13);
    }

    v1 = v24;
    v2 = v25;
    v9 = v22;
    v6 = v23;
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(v1 + 48) + 16))();

}

@end
