@implementation RTPersistenceStoreImporter

- (RTPersistenceStoreImporter)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithManagedObjectModel_configuration_sourceStore_sourceCoordinator_destinationStore_destinationCoordinator_);
}

- (RTPersistenceStoreImporter)initWithManagedObjectModel:(id)a3 configuration:(id)a4 sourceStore:(id)a5 sourceCoordinator:(id)a6 destinationStore:(id)a7 destinationCoordinator:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTPersistenceStoreImporter *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  const char *v30;
  RTPersistenceStoreImporter *v31;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  uint8_t buf[16];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v38 = a6;
  v37 = a7;
  v18 = a8;
  v36 = v18;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: managedObjectModel";
LABEL_26:
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_27;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: sourceStore";
    goto LABEL_26;
  }
  if (!v38)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: sourceCoordinator";
    goto LABEL_26;
  }
  if (!v37)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: destinationStore";
    goto LABEL_26;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: destinationCoordinator";
      goto LABEL_26;
    }
LABEL_27:

    goto LABEL_28;
  }
  v43.receiver = self;
  v43.super_class = (Class)RTPersistenceStoreImporter;
  v19 = -[RTPersistenceStoreImporter init](&v43, sel_init);
  self = v19;
  if (!v19)
    goto LABEL_32;
  v33 = v17;
  v34 = v16;
  v35 = v15;
  objc_storeStrong((id *)&v19->_model, a3);
  objc_storeStrong((id *)&self->_configuration, a4);
  objc_storeStrong((id *)&self->_sourceStore, a5);
  objc_storeStrong((id *)&self->_sourceCoordinator, a6);
  objc_storeStrong((id *)&self->_destinationStore, a7);
  objc_storeStrong((id *)&self->_destinationCoordinator, a8);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NSPersistentStoreCoordinator persistentStores](self->_destinationCoordinator, "persistentStores");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v25, "URL", v33, v34, v35, v36);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPersistenceStore URL](self->_destinationStore, "URL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqual:", v27);

        if (v28)
        {
          objc_storeStrong((id *)&self->_affectedStore, v25);
          goto LABEL_31;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_31:

  v16 = v34;
  v15 = v35;
  v17 = v33;
  if (self->_affectedStore)
  {
LABEL_32:
    self = self;
    v31 = self;
    goto LABEL_29;
  }
LABEL_28:
  v31 = 0;
LABEL_29:

  return v31;
}

- (id)managedObjectContextTargetingType:(int64_t)a3
{
  void *v5;
  void *v6;
  id result;
  uint64_t v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%ld"), CFSTR("RTPersistenceStoreImporter"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransactionAuthor:", v6);

  if (!a3)
  {
    v8 = 24;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v8 = 40;
LABEL_5:
    objc_msgSend(v5, "setPersistentStoreCoordinator:", *(Class *)((char *)&self->super.isa + v8));
    return v5;
  }
  __break(1u);
  return result;
}

- (id)entityDescriptions
{
  NSUInteger v3;
  NSManagedObjectModel *model;

  v3 = -[NSString length](self->_configuration, "length");
  model = self->_model;
  if (v3)
    -[NSManagedObjectModel entitiesForConfiguration:](model, "entitiesForConfiguration:", self->_configuration);
  else
    -[NSManagedObjectModel entities](model, "entities");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)importEntityRowsAndAttributes:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  -[RTPersistenceStoreImporter managedObjectContextTargetingType:](self, "managedObjectContextTargetingType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceStoreImporter managedObjectContextTargetingType:](self, "managedObjectContextTargetingType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke;
  v18[3] = &unk_1E929E650;
  v18[4] = self;
  v9 = v5;
  v19 = v9;
  v10 = v7;
  v20 = v10;
  v11 = v6;
  v21 = v11;
  objc_msgSend(v9, "performBlockAndWait:", v18);
  if (-[NSString isEqual:](self->_configuration, "isEqual:", CFSTR("Cloud")))
  {
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke_60;
    v15[3] = &unk_1E9299D78;
    v15[4] = self;
    v16 = v11;
    v17 = v10;
    objc_msgSend(v16, "performBlockAndWait:", v15);

  }
  _RTSafeArray();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v13);

  return v13 == 0;
}

void __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  NSString *v4;
  char v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  void *v29;
  id v30;
  id v31;
  __int128 *p_buf;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[4];
  void *v39;
  __int16 v40;
  id v41;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "entityDescriptions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v35;
    v23 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v3, "managedObjectClassName");
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        v5 = -[objc_class conformsToProtocol:](NSClassFromString(v4), "conformsToProtocol:", &unk_1EFCAEFD0);

        if ((v5 & 1) != 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v3, "name");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "starting import for entity type, %@", (uint8_t *)&buf, 0xCu);

          }
          v8 = objc_alloc(MEMORY[0x1E0C97B48]);
          objc_msgSend(v3, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v8, "initWithEntityName:", v9);

          objc_msgSend(v10, "setResultType:", 2);
          objc_msgSend(v10, "setFetchLimit:", 100);
          v11 = 0;
          v12 = 0;
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v43 = 0x3032000000;
          v44 = __Block_byref_object_copy__153;
          v45 = __Block_byref_object_dispose__153;
          v46 = 0;
          do
          {
            v13 = *(void **)(a1 + 40);
            v33 = v11;
            objc_msgSend(v13, "executeFetchRequest:error:", v10, &v33);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v33;

            if (v15)
            {
              _rt_log_facility_get_os_log(RTLogFacilityDatabase);
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v3, "name");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v38 = 138412546;
                v39 = v18;
                v40 = 2112;
                v41 = v15;
                _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "error while fetching entities with type %@, to import, %@", v38, 0x16u);

              }
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
            }
            else if (objc_msgSend(v14, "count"))
            {
              v17 = *(void **)(a1 + 56);
              v27[0] = MEMORY[0x1E0C809B0];
              v27[1] = 3221225472;
              v27[2] = __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke_57;
              v27[3] = &unk_1E92A0FF8;
              v28 = v14;
              v29 = v3;
              v30 = *(id *)(a1 + 56);
              p_buf = &buf;
              v31 = *(id *)(a1 + 48);
              objc_msgSend(v17, "performBlockAndWait:", v27);

            }
            objc_msgSend(v10, "setFetchOffset:", objc_msgSend(v10, "fetchOffset") + objc_msgSend(v14, "count"));
            v11 = v15;
            v12 = v14;
          }
          while (objc_msgSend(v14, "count"));

          _Block_object_dispose(&buf, 8);
        }
        else
        {
          v47 = v23;
          v19 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v3, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("Unable to import type %@ because it doesn't conform to RTPersistenceImportable."), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceStoreImporterErrorDomain"), 1, v10);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v15;
            _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
          }

        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
    }
    while (v26);
  }

}

void __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke_57(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v13 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "inserting %lu entities", buf, 0xCu);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97AA0]), "initWithEntity:objects:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v6 + 40);
  v7 = (id)objc_msgSend(v5, "executeRequest:error:", v4, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v13 = (uint64_t)v9;
      v14 = 2112;
      v15 = v10;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "error while inserting entities with type %@, to import, %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }

}

void __60__RTPersistenceStoreImporter_importEntityRowsAndAttributes___block_invoke_60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id obj;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "entityDescriptions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    v5 = *MEMORY[0x1E0C97810];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97AB0]), "initWithEntity:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6));
        v19 = v5;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setPropertiesToUpdate:", v9);

        v10 = *(void **)(a1 + 40);
        v14 = 0;
        v11 = (id)objc_msgSend(v10, "executeRequest:error:", v7, &v14);
        v12 = v14;
        if (v12)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v3);
  }

}

- (BOOL)enumerateRelationshipsInEntityDescription:(id)a3 sourceObject:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  const __CFString *v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  RTPersistenceStoreImporter *v27;
  id v28;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityDescription", buf, 2u);
    }

    if (a5)
    {
      v20 = CFSTR("entityDescription");
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v20);
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    v18 = 0;
    goto LABEL_16;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sourceManagedObject", buf, 2u);
    }

    if (a5)
    {
      v20 = CFSTR("sourceManagedObject");
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  -[RTPersistenceStoreImporter managedObjectContextTargetingType:](self, "managedObjectContextTargetingType:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceStoreImporter managedObjectContextTargetingType:](self, "managedObjectContextTargetingType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke;
  v23[3] = &unk_1E929BF50;
  v24 = v10;
  v25 = v8;
  v26 = v12;
  v27 = self;
  v14 = v13;
  v28 = v14;
  v15 = v12;
  objc_msgSend(v11, "performBlockAndWait:", v23);
  _RTSafeArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v17);
  v18 = v17 == 0;

LABEL_16:
  return v18;
}

void __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "enumerating relationships for entity type, %@, entity ID, %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "relationshipsByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_68;
  v9[3] = &unk_1E92A4D10;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v12 = v4;
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 64);
  v8 = v4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v5;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "processing relationship %@ name", buf, 0xCu);
  }

  v8 = objc_msgSend(v6, "isToMany");
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(sel_identifier);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("@distinctUnionOfObjects.%@"), v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "valueForKeyPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_71;
      v34[3] = &unk_1E92A4CE8;
      v15 = *(void **)(a1 + 40);
      v16 = *(id *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(void **)(a1 + 64);
      v35 = v16;
      v36 = v17;
      v37 = v18;
      v38 = *(id *)(a1 + 40);
      v39 = *(id *)(a1 + 72);
      v40 = v6;
      v41 = v14;
      v19 = v14;
      objc_msgSend(v15, "performBlockAndWait:", v34);

LABEL_8:
    }
  }
  else if (v9)
  {
    NSStringFromSelector(sel_identifier);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_2;
    v26[3] = &unk_1E92A4CE8;
    v22 = *(void **)(a1 + 40);
    v23 = *(id *)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 56);
    v25 = *(void **)(a1 + 64);
    v27 = v23;
    v28 = v24;
    v29 = v25;
    v30 = *(id *)(a1 + 40);
    v31 = *(id *)(a1 + 72);
    v32 = v21;
    v33 = v6;
    v13 = v21;
    objc_msgSend(v22, "performBlockAndWait:", v26);

    v19 = v27;
    goto LABEL_8;
  }

}

void __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_71(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v2 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K = %@"), v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v17 = 0;
  objc_msgSend(v5, "fetchDestinationObjectWithEntityDescription:predicate:context:error:", v6, v4, v7, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v8)
  {
    v10 = v9;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v9);
    }
    else
    {
      v11 = *(void **)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 72);
      v13 = *(_QWORD *)(a1 + 80);
      v14 = *(_QWORD *)(a1 + 56);
      v16 = 0;
      objc_msgSend(v11, "updateRelationshipWithEntity:relationshipDescription:relationshipIdentifiers:context:error:", v8, v12, v13, v14, &v16);
      v15 = v16;
      if (v15)
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v15);

    }
  }
  else
  {
    __break(1u);
  }
}

void __91__RTPersistenceStoreImporter_enumerateRelationshipsInEntityDescription_sourceObject_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v2 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K = %@"), v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v17 = 0;
  objc_msgSend(v5, "fetchDestinationObjectWithEntityDescription:predicate:context:error:", v6, v4, v7, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v8)
  {
    v10 = v9;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *(_QWORD *)(a1 + 72), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 80);
      v14 = *(_QWORD *)(a1 + 56);
      v16 = 0;
      objc_msgSend(v12, "updateRelationshipWithEntity:relationshipDescription:relationshipIdentifiers:context:error:", v8, v13, v11, v14, &v16);
      v15 = v16;
      if (v15)
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v15);

    }
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)updateRelationshipWithEntity:(id)a3 relationshipDescription:(id)a4 relationshipIdentifiers:(id)a5 context:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  RTPersistenceStoreImporter *v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entity", buf, 2u);
    }

    if (!a7)
      goto LABEL_25;
    v23 = CFSTR("entity");
    goto LABEL_24;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relationshipDescription", buf, 2u);
    }

    if (!a7)
      goto LABEL_25;
    v23 = CFSTR("relationshipDescription");
    goto LABEL_24;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relationshipIdentifiers", buf, 2u);
    }

    if (!a7)
      goto LABEL_25;
    v23 = CFSTR("relationshipIdentifiers");
LABEL_24:
    _RTErrorInvalidParameterCreate((uint64_t)v23);
    v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a7)
    {
      v23 = CFSTR("context");
      goto LABEL_24;
    }
LABEL_25:
    v21 = 0;
    goto LABEL_26;
  }
  v17 = (void *)objc_opt_new();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __121__RTPersistenceStoreImporter_updateRelationshipWithEntity_relationshipDescription_relationshipIdentifiers_context_error___block_invoke;
  v28[3] = &unk_1E92A4D38;
  v29 = v13;
  v30 = v14;
  v31 = self;
  v32 = v16;
  v18 = v17;
  v33 = v18;
  v34 = v12;
  objc_msgSend(v32, "performBlockAndWait:", v28);
  _RTSafeArray();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7)
    *a7 = objc_retainAutorelease(v20);
  v21 = v20 == 0;

LABEL_26:
  return v21;
}

void __121__RTPersistenceStoreImporter_updateRelationshipWithEntity_relationshipDescription_relationshipIdentifiers_context_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _QWORD v51[4];

  v51[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_msgSend(*(id *)(a1 + 32), "destinationEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntityName:", v4);

  v6 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_identifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K IN (%@)"), v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  v51[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAffectedStores:", v9);

  v10 = *(void **)(a1 + 56);
  v43 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v5, &v43);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v43;
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v12);
LABEL_20:

    return;
  }
  v37 = v5;
  if (objc_msgSend(*(id *)(a1 + 32), "isToMany"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = (void *)v13;
    v15 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v14;
    objc_msgSend(v15, "setValue:forKey:", v14, v16);

    objc_msgSend(*(id *)(a1 + 32), "inverseRelationship");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v36 = v11;
    v19 = v11;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v25 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(*(id *)(a1 + 32), "inverseRelationship");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isToMany");

          if (v27)
          {
            objc_msgSend(v24, "valueForKey:", v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)objc_msgSend(v28, "mutableCopy");
            objc_msgSend(v29, "addObject:", *(_QWORD *)(a1 + 72));
            objc_msgSend(v24, "setValue:forKey:", v29, v18);

          }
          else
          {
            objc_msgSend(v24, "setValue:forKey:", *(_QWORD *)(a1 + 72), v18);
          }
          objc_autoreleasePoolPop(v25);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v21);
    }

    v30 = *(void **)(a1 + 56);
    v38 = 0;
    objc_msgSend(v30, "save:", &v38);
    v31 = v38;
    if (v31)
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v31);

    v12 = 0;
    v5 = v37;
    v11 = v36;
    goto LABEL_20;
  }
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    objc_msgSend(v11, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "entityName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v46 = v33;
    v47 = 2112;
    v48 = v34;
    v49 = 2112;
    v50 = v11;
    _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);

  }
  __break(1u);
}

- (BOOL)establishEntityRelationships:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v5 = (void *)objc_opt_new();
  -[RTPersistenceStoreImporter managedObjectContextTargetingType:](self, "managedObjectContextTargetingType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__RTPersistenceStoreImporter_establishEntityRelationships___block_invoke;
  v12[3] = &unk_1E9299D78;
  v12[4] = self;
  v13 = v6;
  v7 = v5;
  v14 = v7;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  _RTSafeArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v10);

  return v10 == 0;
}

void __59__RTPersistenceStoreImporter_establishEntityRelationships___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSString *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "entityDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v37;
    v29 = *MEMORY[0x1E0CB2D50];
    v27 = *(_QWORD *)v37;
    v28 = v2;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v7, "managedObjectClassName");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = -[objc_class conformsToProtocol:](NSClassFromString(v8), "conformsToProtocol:", &unk_1EFCAEFD0);

        if ((v9 & 1) != 0)
        {
          v10 = objc_alloc(MEMORY[0x1E0C97B48]);
          objc_msgSend(v7, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v10, "initWithEntityName:", v11);

          objc_msgSend(v12, "setFetchBatchSize:", 100);
          v13 = *(void **)(a1 + 40);
          v35 = 0;
          objc_msgSend(v13, "executeFetchRequest:error:", v12, &v35);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v35;
          if (v15)
          {
            v16 = v15;
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
          }
          else
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v14 = v14;
            v20 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v32 != v22)
                    objc_enumerationMutation(v14);
                  v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
                  v25 = *(void **)(a1 + 32);
                  v30 = 0;
                  objc_msgSend(v25, "enumerateRelationshipsInEntityDescription:sourceObject:error:", v7, v24, &v30);
                  v26 = v30;
                  if (v26)
                    objc_msgSend(*(id *)(a1 + 48), "addObject:", v26);

                }
                v21 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
              }
              while (v21);
            }

            v16 = 0;
            v5 = v27;
            v2 = v28;
          }
        }
        else
        {
          v43 = v29;
          v17 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("Unable to re-establish entity relationships for type %@ because it doesn't conform to RTPersistenceImportable."), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceStoreImporterErrorDomain"), 1, v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v16;
            _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v4);
  }

}

- (id)fetchDestinationObjectWithEntityDescription:(id)a3 predicate:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  RTPersistenceStoreImporter *v22;
  id v23;
  uint64_t *v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityDescription", buf, 2u);
    }

    if (a6)
    {
      v16 = CFSTR("entityDescription");
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a6)
    {
      v16 = CFSTR("context");
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  *(_QWORD *)buf = 0;
  v33 = buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__153;
  v36 = __Block_byref_object_dispose__153;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__153;
  v30 = __Block_byref_object_dispose__153;
  v31 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__RTPersistenceStoreImporter_fetchDestinationObjectWithEntityDescription_predicate_context_error___block_invoke;
  v19[3] = &unk_1E929EAE8;
  v20 = v10;
  v21 = v11;
  v22 = self;
  v23 = v13;
  v24 = &v26;
  v25 = buf;
  objc_msgSend(v23, "performBlockAndWait:", v19);
  if (a6)
    *a6 = objc_retainAutorelease((id)v27[5]);
  v14 = *((id *)v33 + 5);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

LABEL_16:
  return v14;
}

void __98__RTPersistenceStoreImporter_fetchDestinationObjectWithEntityDescription_predicate_context_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEntityName:", v3);

  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 40));
  v25[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAffectedStores:", v5);

  v6 = *(void **)(a1 + 56);
  v18 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  v9 = v18;
  if (objc_msgSend(v7, "count") != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = objc_msgSend(v7, "count");
      objc_msgSend(v4, "entityName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "predicate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateFormat");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v17;
      _os_log_fault_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_FAULT, "%lu objects returned for fetch request. type %@, predicate %@", buf, 0x20u);

    }
    __break(1u);
  }
  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
  objc_msgSend(v7, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (BOOL)import:(id *)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v5 = -[RTPersistenceStoreImporter importEntityRowsAndAttributes:](self, "importEntityRowsAndAttributes:", &v17);
  v6 = v17;
  v7 = v6;
  if (!v5 || v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "error while importing entities, %@", buf, 0xCu);
    }
    v10 = 0;
    goto LABEL_10;
  }
  v16 = 0;
  v8 = -[RTPersistenceStoreImporter establishEntityRelationships:](self, "establishEntityRelationships:", &v16);
  v9 = v16;
  v10 = v9;
  if (!v8 || (v11 = 0, v9))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "error while re-establishing relationships during import, %@", buf, 0xCu);
    }
LABEL_10:

    v11 = v10;
  }
  _RTSafeArray();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (RTPersistenceStore)sourceStore
{
  return self->_sourceStore;
}

- (void)setSourceStore:(id)a3
{
  objc_storeStrong((id *)&self->_sourceStore, a3);
}

- (NSPersistentStoreCoordinator)sourceCoordinator
{
  return self->_sourceCoordinator;
}

- (void)setSourceCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_sourceCoordinator, a3);
}

- (RTPersistenceStore)destinationStore
{
  return self->_destinationStore;
}

- (void)setDestinationStore:(id)a3
{
  objc_storeStrong((id *)&self->_destinationStore, a3);
}

- (NSPersistentStoreCoordinator)destinationCoordinator
{
  return self->_destinationCoordinator;
}

- (void)setDestinationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_destinationCoordinator, a3);
}

- (NSManagedObjectModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_destinationCoordinator, 0);
  objc_storeStrong((id *)&self->_destinationStore, 0);
  objc_storeStrong((id *)&self->_sourceCoordinator, 0);
  objc_storeStrong((id *)&self->_sourceStore, 0);
  objc_storeStrong((id *)&self->_affectedStore, 0);
}

@end
