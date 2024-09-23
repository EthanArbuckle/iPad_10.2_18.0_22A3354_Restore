@implementation PLDetectionTrait

- (void)willSave
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLDetectionTrait;
  -[PLManagedObject willSave](&v4, sel_willSave);
  -[PLDetectionTrait managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    PLPlatformSearchSupported();
    -[PLDetectionTrait _touchPersonForPersistenceIfNeeded](self, "_touchPersonForPersistenceIfNeeded");
  }

}

- (void)_touchPersonForPersistenceIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[PLManagedObject pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDCIM");

  if (v4)
  {
    -[PLDetectionTrait detection](self, "detection");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isInserted") & 1) == 0 && (objc_msgSend(v5, "isUpdated") & 1) == 0)
      objc_msgSend(v5, "setEffectiveVerifiedType:", objc_msgSend(v5, "verifiedType"));

  }
}

- (id)debugLogDescription
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;

  +[PLDescriptionBuilder plainDescriptionBuilder](PLDescriptionBuilder, "plainDescriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLDetectionTrait type](self, "type") - 1;
  if (v4 > 3)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E3668098[v4];
  objc_msgSend(v3, "appendName:object:", CFSTR("type"), v5);
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("value"), (int)-[PLDetectionTrait value](self, "value"));
  -[PLDetectionTrait score](self, "score");
  objc_msgSend(v3, "appendName:doubleValue:", CFSTR("score"));
  -[PLDetectionTrait startTime](self, "startTime");
  objc_msgSend(v3, "appendName:doubleValue:", CFSTR("startTime"));
  -[PLDetectionTrait duration](self, "duration");
  objc_msgSend(v3, "appendName:doubleValue:", CFSTR("duration"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entityName
{
  return CFSTR("DetectionTrait");
}

+ (id)insertIntoManagedObjectContext:(id)a3 type:(signed __int16)a4 value:(signed __int16)a5 score:(double)a6 startTime:(double)a7 duration:(double)a8
{
  uint64_t v11;
  uint64_t v12;
  id v15;
  void *v16;
  void *v17;
  void *v19;

  v11 = a5;
  v12 = a4;
  v15 = a3;
  if (v15)
  {
    objc_msgSend(a1, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", v16, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDetectionTrait.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moc"));

    objc_msgSend(a1, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v16, 0, 0);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setType:", v12);
  objc_msgSend(v17, "setValue:", v11);
  objc_msgSend(v17, "setScore:", a6);
  objc_msgSend(v17, "setStartTime:", a7);
  objc_msgSend(v17, "setDuration:", a8);

  return v17;
}

+ (id)fetchDetectionTraitByFaceUUIDWithFaceUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__30703;
  v31 = __Block_byref_object_dispose__30704;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__30703;
  v25 = __Block_byref_object_dispose__30704;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__PLDetectionTrait_fetchDetectionTraitByFaceUUIDWithFaceUUIDs_library_error___block_invoke;
  v16[3] = &unk_1E3676348;
  v9 = v8;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  v19 = &v21;
  v20 = &v27;
  objc_msgSend(v9, "performBlockAndWait:", v16);
  v11 = v28[5];
  v12 = (id)v22[5];
  v13 = v12;
  if (!v11 && a5)
    *a5 = objc_retainAutorelease(v12);

  v14 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v14;
}

+ (BOOL)isPetDetectionType:(signed __int16)a3
{
  int v3;
  void *v7;

  v3 = a3;
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDetectionTrait.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("detectionType != PLDetectionTypePet"));

  }
  return v3 > 2;
}

void __77__PLDetectionTrait_fetchDetectionTraitByFaceUUIDWithFaceUUIDs_library_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id obj;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = CFSTR("%K");
  v35[1] = CFSTR("detectionTraits");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", v6);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v7);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v11)
    {
      v12 = v11;
      v23 = v7;
      v24 = v2;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "detectionTraits");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "allObjects");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            v19 = v18 == 0;
          else
            v19 = 1;
          if (!v19)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v18, v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v12);
      v7 = v23;
      v2 = v24;
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v31 = "+[PLDetectionTrait fetchDetectionTraitByFaceUUIDWithFaceUUIDs:library:error:]_block_invoke";
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "%s: Failed to execute face fetch: %@", buf, 0x16u);
    }

    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(id *)(v22 + 40);
    *(_QWORD *)(v22 + 40) = 0;
  }

}

@end
