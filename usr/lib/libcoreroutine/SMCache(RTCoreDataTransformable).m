@implementation SMCache(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2080;
      v10 = "+[SMCache(RTCoreDataTransformable) createWithManagedObject:]";
      v11 = 1024;
      v12 = 35;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by SMCache+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_7;
  }
  objc_msgSend((id)objc_opt_class(), "createWithSMCacheMO:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

+ (id)createWithSMCacheMO:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__50;
    v16 = __Block_byref_object_dispose__50;
    v17 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__SMCache_RTCoreDataTransformable__createWithSMCacheMO___block_invoke;
    v9[3] = &unk_1E929A690;
    v11 = buf;
    v10 = v4;
    objc_msgSend(v5, "performBlockAndWait:", v9);

    v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cacheMO", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)_getOrCreateManagedLocationsFromLocations:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0D8B998], "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[SMCacheMO managedObjectWithCache:inManagedObjectContext:](SMCacheMO, "managedObjectWithCache:inManagedObjectContext:", a1, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

@end
