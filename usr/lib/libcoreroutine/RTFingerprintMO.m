@implementation RTFingerprintMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("RTFingerprintMO"));
}

+ (id)managedObjectWithFingerprint:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  RTFingerprintMO *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = -[RTFingerprintMO initWithContext:]([RTFingerprintMO alloc], "initWithContext:", v6);
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTFingerprintMO setIdentifier:](v8, "setIdentifier:", v9);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "settledState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTFingerprintMO setSettledState:](v8, "setSettledState:", v10);

      objc_msgSend(v5, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTFingerprintMO setStart:](v8, "setStart:", v11);

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v5, "accessPoints", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            +[RTWiFiAccessPointMO managedObjectWithAccessPoint:inManagedObjectContext:](RTWiFiAccessPointMO, "managedObjectWithAccessPoint:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v7);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTFingerprintMO addWifiAccessPointsObject:](v8, "addWifiAccessPointsObject:", v17);

          }
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }
LABEL_18:

      goto LABEL_19;
    }
LABEL_15:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[RTFingerprintMO managedObjectWithFingerprint:inManagedObjectContext:]";
      v27 = 1024;
      v28 = 24;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext (in %s:%d)", buf, 0x12u);
    }
    v8 = 0;
    goto LABEL_18;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[RTFingerprintMO managedObjectWithFingerprint:inManagedObjectContext:]";
    v27 = 1024;
    v28 = 23;
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprint (in %s:%d)", buf, 0x12u);
  }

  if (!v7)
    goto LABEL_15;
  v8 = 0;
LABEL_19:

  return v8;
}

+ (id)fetchLastByStartDateInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[RTFingerprintMO fetchRequest](RTFingerprintMO, "fetchRequest");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject setReturnsObjectsAsFaults:](v6, "setReturnsObjectsAsFaults:", 0);
    v14 = CFSTR("wifiAccessPoints");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRelationshipKeyPathsForPrefetching:](v6, "setRelationshipKeyPathsForPrefetching:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("start"), 0);
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSortDescriptors:](v6, "setSortDescriptors:", v9);

    -[NSObject setFetchLimit:](v6, "setFetchLimit:", 1);
    objc_msgSend(v5, "executeFetchRequest:error:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "+[RTFingerprintMO fetchLastByStartDateInManagedObjectContext:error:]";
      v17 = 1024;
      v18 = 46;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext (in %s:%d)", buf, 0x12u);
    }
    v11 = 0;
  }

  return v11;
}

@end
