@implementation RTPlaceInferenceQuery(RTCoreDataTransformable)

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
      v15 = "+[RTPlaceInferenceQuery(RTCoreDataTransformable) createWithManagedObject:]";
      v16 = 1024;
      v17 = 36;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTPlaceInferenceQuery+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);

    }
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "createWithPlaceInferenceQueryMO:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

+ (id)createWithPlaceInferenceQueryMO:()RTCoreDataTransformable
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v3, "locationLatitude");
  v6 = v5;
  objc_msgSend(v3, "locationLongitude");
  v8 = v7;
  objc_msgSend(v3, "locationUncertainty");
  v10 = v9;
  objc_msgSend(v3, "locationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationReferenceFrame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v11, objc_msgSend(v12, "intValue"), v6, v8, v10);

  objc_msgSend(v3, "mapItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0D183E8];
    objc_msgSend(v3, "mapItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createWithManagedObject:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = objc_alloc(MEMORY[0x1E0D18420]);
  objc_msgSend(v3, "userType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");
  objc_msgSend(v3, "userTypeSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");
  objc_msgSend(v3, "placeType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");
  objc_msgSend(v3, "confidence");
  v36 = (void *)objc_msgSend(v17, "initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:", v14, v19, v21, v23, v13, 0);

  v24 = objc_alloc(MEMORY[0x1E0D18430]);
  objc_msgSend(v3, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "integerValue");
  objc_msgSend(v3, "fidelityPolicyMask");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v13;
  v30 = objc_msgSend(v29, "unsignedIntegerValue");
  objc_msgSend(v3, "sourceIdentifier");
  v31 = v14;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v24, "initWithIdentifier:date:errorCode:fidelityPolicyMask:placeInference:sourceIdentifier:", v25, v26, v28, v30, v36, v32);

  return v33;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTPlaceInferenceQueryMO managedObjectWithPlaceInferenceQuery:inManagedObjectContext:](RTPlaceInferenceQueryMO, "managedObjectWithPlaceInferenceQuery:inManagedObjectContext:", a1, a3);
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
