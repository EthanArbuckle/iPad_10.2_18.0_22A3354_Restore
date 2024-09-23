@implementation NSManagedObjectContext(RTExtensions)

- (id)fetchAllWithEntityName:()RTExtensions predicate:sortDescriptors:error:
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;

  if (a3)
  {
    v10 = (void *)MEMORY[0x1E0C97B48];
    v11 = a5;
    v12 = a4;
    objc_msgSend(v10, "fetchRequestWithEntityName:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v12);

    objc_msgSend(v13, "setSortDescriptors:", v11);
    objc_msgSend(v13, "setReturnsObjectsAsFaults:", 0);
    v18 = 0;
    objc_msgSend(a1, "executeFetchRequest:error:", v13, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    v16 = v15;
    if (a6)
      *a6 = objc_retainAutorelease(v15);

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (BOOL)deleteAllWithEntityName:()RTExtensions predicate:error:
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL8 v16;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v9 = (void *)MEMORY[0x1E0C97B48];
  v10 = a4;
  objc_msgSend(v9, "fetchRequestWithEntityName:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v10);

  objc_msgSend(v11, "setIncludesSubentities:", 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v11);
  objc_msgSend(v12, "setResultType:", 2);
  v20 = 0;
  objc_msgSend(a1, "executeRequest:error:", v12, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "result");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v18;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v19;
    v27 = 2112;
    v28 = v14;
    _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

  }
  if (a5 && v14)
    *a5 = objc_retainAutorelease(v14);
  v16 = v14 == 0;

  return v16;
}

@end
