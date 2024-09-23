@implementation RTPeopleDensity(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138413058;
      v11 = v9;
      v12 = 2112;
      v14 = 2080;
      v13 = v4;
      v15 = "+[RTPeopleDensity(RTCoreDataTransformable) createWithManagedObject:]";
      v16 = 1024;
      v17 = 35;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTPeopleDensity+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);

    }
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "createWithPeopleDensityMO:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

+ (id)createWithPeopleDensityMO:()RTCoreDataTransformable
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
    v15 = __Block_byref_object_copy__105;
    v16 = __Block_byref_object_dispose__105;
    v17 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__RTPeopleDensity_RTCoreDataTransformable__createWithPeopleDensityMO___block_invoke;
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
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventMO", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTPeopleDensityMO managedObjectWithPeopleDensity:inManagedObjectContext:](RTPeopleDensityMO, "managedObjectWithPeopleDensity:inManagedObjectContext:", a1, a3);
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
