@implementation RTLocation(RTCoreDataTransformable)

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
      v10 = "+[RTLocation(RTCoreDataTransformable) createWithManagedObject:]";
      v11 = 1024;
      v12 = 32;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLocation+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_7;
  }
  objc_msgSend((id)objc_opt_class(), "createWithMapItemMO:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

+ (id)createWithMapItemMO:()RTCoreDataTransformable
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t v19[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v3, "latitude");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    objc_msgSend(v3, "longitude");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(v3, "uncertainty");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    objc_msgSend(v3, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "referenceFrame");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v4, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v14, objc_msgSend(v15, "intValue"), v7, v10, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItemMO", v19, 2u);
    }

    v16 = 0;
  }

  return v16;
}

@end
