@implementation PLLegacyChangeEvent

+ (id)localChangeEventFromChangeHubEvent:(id)a3 withLibraryBundle:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke;
  v11[3] = &unk_1E366DB28;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  +[PLLocalChangeEventBuilder localEventWithBuilderBlock:](PLLocalChangeEventBuilder, "localEventWithBuilderBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_descriptionForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleForLibraryURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "persistentContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharedPersistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_descriptionForEvent:withPersistentStoreCoordinator:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_descriptionForEvent:(id)a3 withPersistentStoreCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int uint64;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  size_t count;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  const unsigned __int8 *uuid;
  void *v23;
  _xpc_connection_s *v24;
  _xpc_connection_s *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  size_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  size_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  size_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  const unsigned __int8 *bytes;
  void *v66;
  size_t v68;
  size_t v69;
  void *v70;
  void *v71;
  void *v72;
  _xpc_connection_s *v73;
  __CFString *v74;
  void *v75;
  id v76;
  void *v77;
  xpc_object_t xdict;
  _QWORD v79[5];
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD applier[4];
  id v87;
  id v88;
  id v89;
  char v90[128];
  char out[40];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    uint64 = xpc_dictionary_get_uint64(v6, "eventKind");
    xdict = v10;
    if (uint64 == 5)
    {
      objc_msgSend(v9, "addObject:", CFSTR("kind: PendingEvents"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("last index: %llu"), xpc_dictionary_get_uint64(v10, "eventLastIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      xpc_dictionary_get_value(v10, "events");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __75__PLLegacyChangeEvent__descriptionForEvent_withPersistentStoreCoordinator___block_invoke;
        applier[3] = &unk_1E366DB60;
        v87 = v14;
        v89 = a1;
        v88 = v7;
        v15 = v14;
        xpc_array_apply(v13, applier);
        v16 = (void *)MEMORY[0x1E0CB3940];
        count = xpc_array_get_count(v13);
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = count;
        v6 = v10;
        objc_msgSend(v16, "stringWithFormat:", CFSTR("events: %zu (\n%@\n)"), v68, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v19);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("index: #%llu"), xpc_dictionary_get_uint64(v10, "eventIndex"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v21);

      if (xpc_dictionary_get_uuid(v10, "eventUUID"))
      {
        memset(out, 0, 37);
        uuid = xpc_dictionary_get_uuid(v10, "eventUUID");
        uuid_unparse(uuid, out);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "substringToIndex:", 8);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = CFSTR("assetsd");
      }
      xpc_dictionary_get_remote_connection(v10);
      v24 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        -[__CFString stringByAppendingFormat:](v13, "stringByAppendingFormat:", CFSTR(" (pid %d)"), xpc_connection_get_pid(v24));
        v26 = objc_claimAutoreleasedReturnValue();

        v13 = (__CFString *)v26;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("origin: %@"), v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v27);

      switch(uint64)
      {
        case 4u:
          objc_msgSend(v9, "addObject:", CFSTR("kind: GetPendingEvents"));
          v6 = xdict;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("last index: %llu"), xpc_dictionary_get_uint64(xdict, "eventLastIndex"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v63);
          break;
        case 3u:
          objc_msgSend(v9, "addObject:", CFSTR("kind: SetConnectionUUID"));
          v6 = xdict;
          xpc_dictionary_get_value(xdict, "eventUUID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v64;
          if (v64)
          {
            memset(out, 0, 37);
            bytes = xpc_uuid_get_bytes(v64);
            uuid_unparse(bytes, out);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UUID: %s"), out);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v66);

          }
          break;
        case 1u:
          v74 = v13;
          objc_msgSend(v9, "addObject:", CFSTR("kind: ContextDidSave"));
          v6 = xdict;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("change source: %lld"), xpc_dictionary_get_int64(xdict, "changeSource"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v28);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sync change marker: %d"), xpc_dictionary_get_BOOL(xdict, "syncChangeMarker"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v29);

          xpc_dictionary_get_value(xdict, (const char *)objc_msgSend((id)*MEMORY[0x1E0C97870], "UTF8String"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            v32 = (void *)MEMORY[0x1E0CB3940];
            v33 = xpc_array_get_count(v30);
            _descriptionOfManagedObjectIDArray(v31, 0, 0, v7);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%lu inserts: {%@}"), v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v35);

          }
          v72 = v31;
          v73 = v25;
          v77 = v9;
          v75 = v8;
          xpc_dictionary_get_value(xdict, (const char *)objc_msgSend((id)*MEMORY[0x1E0C97A18], "UTF8String"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v36)
          {
            v38 = (void *)MEMORY[0x1E0CB3940];
            v39 = xpc_array_get_count(v36);
            xpc_dictionary_get_value(xdict, "PLUpdatedAttributesKey");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            xpc_dictionary_get_value(xdict, "PLUpdatedRelationshipsKey");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            _descriptionOfManagedObjectIDArray(v37, v40, v41, v7);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", CFSTR("%lu updates: {%@}"), v39, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v43);

          }
          v71 = v37;
          xpc_dictionary_get_value(xdict, (const char *)objc_msgSend((id)*MEMORY[0x1E0C97838], "UTF8String"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if (v44)
          {
            v46 = (void *)MEMORY[0x1E0CB3940];
            v47 = xpc_array_get_count(v44);
            _descriptionOfManagedObjectIDArray(v45, 0, 0, v7);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "stringWithFormat:", CFSTR("%lu deletes: {%@}"), v47, v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v49);

          }
          v70 = v45;
          v76 = v7;
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          PLAllCloudDeletionKeys();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v52; ++i)
              {
                if (*(_QWORD *)v83 != v53)
                  objc_enumerationMutation(v50);
                v55 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i));
                xpc_dictionary_get_value(v6, (const char *)objc_msgSend(v55, "UTF8String"));
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v56;
                if (v56)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", xpc_array_get_count(v56));
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v79[0] = MEMORY[0x1E0C809B0];
                  v79[1] = 3221225472;
                  v79[2] = __75__PLLegacyChangeEvent__descriptionForEvent_withPersistentStoreCoordinator___block_invoke_2;
                  v79[3] = &unk_1E366E410;
                  v79[4] = v55;
                  v80 = v6;
                  v81 = v58;
                  v59 = v58;
                  xpc_array_apply(v57, v79);
                  v60 = (void *)MEMORY[0x1E0CB3940];
                  v69 = xpc_array_get_count(v57);
                  v61 = v60;
                  v6 = xdict;
                  objc_msgSend(v61, "stringWithFormat:", CFSTR("%lu %@: {%@}"), v69, v55, v59);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "addObject:", v62);

                }
              }
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
            }
            while (v52);
          }

          v9 = v77;
          +[PLDelayedFiledSystemDeletions appendDescriptionForEvent:toComponents:](PLDelayedFiledSystemDeletions, "appendDescriptionForEvent:toComponents:", v6, v77);

          v8 = v75;
          v7 = v76;
          v25 = v73;
          v13 = v74;
          v63 = v72;
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kind: invalid (%lu)"), uint64);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v63);
          v6 = xdict;
          break;
      }

    }
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v20 = CFSTR("<empty>");
  }

  return v20;
}

+ (BOOL)isEmptyEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && xpc_dictionary_get_count(v3))
  {
    if (xpc_dictionary_get_uint64(v4, "eventKind") == 1)
    {
      xpc_dictionary_get_value(v4, (const char *)objc_msgSend((id)*MEMORY[0x1E0C97870], "UTF8String"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 && xpc_array_get_count(v5))
      {
        v7 = 0;
      }
      else
      {
        xpc_dictionary_get_value(v4, (const char *)objc_msgSend((id)*MEMORY[0x1E0C97A18], "UTF8String"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8 && xpc_array_get_count(v8))
        {
          v7 = 0;
        }
        else
        {
          xpc_dictionary_get_value(v4, (const char *)objc_msgSend((id)*MEMORY[0x1E0C97838], "UTF8String"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && xpc_array_get_count(v10))
          {
            v7 = 0;
          }
          else
          {
            v23 = 0u;
            v24 = 0u;
            v21 = 0u;
            v22 = 0u;
            PLAllCloudDeletionKeys();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v22;
              while (2)
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v22 != v15)
                    objc_enumerationMutation(v12);
                  v17 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i));
                  xpc_dictionary_get_value(v4, (const char *)objc_msgSend(v17, "UTF8String", (_QWORD)v21));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = v18;
                  if (v18 && xpc_array_get_count(v18))
                  {

                    v7 = 0;
                    goto LABEL_26;
                  }

                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
                if (v14)
                  continue;
                break;
              }
            }
            v7 = 1;
LABEL_26:

          }
        }

      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __75__PLLegacyChangeEvent__descriptionForEvent_withPersistentStoreCoordinator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "_descriptionForEvent:withPersistentStoreCoordinator:", a3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

uint64_t __75__PLLegacyChangeEvent__descriptionForEvent_withPersistentStoreCoordinator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  const char *string_ptr;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  string_ptr = xpc_string_get_string_ptr(v5);
  if (string_ptr)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

  }
  else
  {
    PLChangeHandlingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138413058;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      v16 = 2048;
      v17 = a2;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "xpc_string_get_string_ptr returns nil while processing %@ for value = %@, index = %zu, event = %@", (uint8_t *)&v12, 0x2Au);
    }

  }
  return 1;
}

void __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD applier[5];
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedPersistentStoreCoordinator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "PLUpdatedAttributesKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "PLUpdatedRelationshipsKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C97A18];
  v41[0] = *MEMORY[0x1E0C97870];
  v41[1] = v5;
  v41[2] = *MEMORY[0x1E0C97838];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLAllCloudDeletionKeys();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(a1 + 40);
        v15 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i));
        xpc_dictionary_get_value(v14, (const char *)objc_msgSend(v15, "UTF8String"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          PLAllCloudDeletionKeys();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsObject:", v15);

          if (v18)
          {
            objc_msgSend(v3, "recordDeletedCloudGUIDBlockForChangeKey:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            applier[0] = MEMORY[0x1E0C809B0];
            applier[1] = 3221225472;
            applier[2] = __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke_2;
            applier[3] = &unk_1E366DAC8;
            applier[4] = v15;
            v35 = v19;
            v20 = v19;
            xpc_array_apply(v16, applier);
            v21 = v35;
          }
          else
          {
            objc_msgSend(v3, "recordChangedObjectIDBlockForChangeKey:", v15);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke_20;
            v27[3] = &unk_1E366DAF0;
            v23 = v26;
            v33 = v22;
            v28 = v23;
            v29 = v15;
            v30 = v25;
            v31 = v24;
            v32 = v3;
            v20 = v22;
            xpc_array_apply(v16, v27);

            v21 = v28;
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "setCoalescedEvent:", xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 40), "coalescedEvent"));
  objc_msgSend(v3, "setSyncChange:", xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 40), "syncChangeMarker"));

}

uint64_t __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const char *string_ptr;
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  string_ptr = xpc_string_get_string_ptr(v4);
  if (string_ptr)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    PLChangeHandlingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "xpc_string_get_string_ptr returns nil for value, changeKey = %@, value = %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return 1;
}

uint64_t __76__PLLegacyChangeEvent_localChangeEventFromChangeHubEvent_withLibraryBundle___block_invoke_20(uint64_t a1, size_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t uint64;

  PLManagedObjectIDFromXPCValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0C97A18]))
    {
      v5 = *(void **)(a1 + 48);
      if (v5)
      {
        if (*(_QWORD *)(a1 + 56))
        {
          v6 = *(void **)(a1 + 64);
          uint64 = xpc_array_get_uint64(v5, a2);
          objc_msgSend(v6, "recordUpdatedAttributes:andRelationships:forObjectID:", uint64, xpc_array_get_uint64(*(xpc_object_t *)(a1 + 56), a2), v4);
        }
      }
    }
  }

  return 1;
}

@end
