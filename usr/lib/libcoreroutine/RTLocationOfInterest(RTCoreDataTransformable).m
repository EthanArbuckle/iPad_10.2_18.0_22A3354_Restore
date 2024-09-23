@implementation RTLocationOfInterest(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    LOWORD(v12) = 0;
    v7 = "Invalid parameter not satisfying: managedObject";
    v8 = v6;
    v9 = 2;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend((id)objc_opt_class(), "createWithLearnedLocationOfInterestVisitMO:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v10 = 0;
      goto LABEL_11;
    }
    v12 = 138412802;
    v13 = v3;
    v14 = 2080;
    v15 = "+[RTLocationOfInterest(RTCoreDataTransformable) createWithManagedObject:]";
    v16 = 1024;
    v17 = 40;
    v7 = "managedObject, %@, is not supported by RTLearnedLocationOfInterest+CoreDataReadable (in %s:%d)";
    v8 = v6;
    v9 = 28;
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v12, v9);
    goto LABEL_10;
  }
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "createWithLearnedLocationOfInterestMO:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = (void *)v5;

LABEL_11:
  return v10;
}

+ (id)createWithLearnedLocationOfInterestMO:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  void *v5;
  _RTMap *v6;
  void *v7;
  void *v8;
  _RTMap *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  uint8_t buf[16];
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v49 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: learnedLocationOfInterestMO.identifier";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v50, buf, 2u);
    goto LABEL_8;
  }
  objc_msgSend(v3, "placeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v50 = "Invalid parameter not satisfying: learnedLocationOfInterestMO.placeIdentifier";
    goto LABEL_15;
  }
  v6 = [_RTMap alloc];
  objc_msgSend(v3, "visits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_RTMap initWithInput:](v6, "initWithInput:", v8);
  -[_RTMap withBlock:](v9, "withBlock:", &__block_literal_global_29);
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)-[NSObject sortedArrayUsingDescriptors:](v10, "sortedArrayUsingDescriptors:", v12);

  v14 = (void *)MEMORY[0x1E0D183E8];
  objc_msgSend(v3, "mapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createWithManagedObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v3, "locationLatitude");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "doubleValue");
    v19 = v18;
    objc_msgSend(v3, "locationLongitude");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;
    objc_msgSend(v3, "locationHorizontalUncertainty");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;
    objc_msgSend(v3, "locationAltitude");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;
    objc_msgSend(v3, "locationVerticalUncertainty");
    v52 = v10;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v54 = v11;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationReferenceFrame");
    v55 = v16;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "intValue");
    objc_msgSend(v3, "locationSourceAccuracy");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v17, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v32, v34, (int)objc_msgSend(v35, "intValue"), v19, v22, v25, v28, v31, 0.0);

    v37 = objc_alloc(MEMORY[0x1E0D183C0]);
    objc_msgSend(v3, "confidence");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    v40 = v39;
    objc_msgSend(v3, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "unsignedIntValue");
    objc_msgSend(v3, "placeTypeSource");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "unsignedIntegerValue");
    objc_msgSend(v3, "placeCustomLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v37;
    v11 = v54;
    v48 = v45;
    v10 = v52;
    v49 = (void *)objc_msgSend(v47, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v36, v41, v43, v48, v52, v46, v40, v55);

    v16 = v55;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", buf, 2u);
    }
    v49 = 0;
  }

LABEL_13:
  return v49;
}

+ (id)createWithLearnedLocationOfInterestVisitMO:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint8_t buf[16];
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      v40 = 0;
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: learnedLocationOfInterestVisitMO";
LABEL_25:
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, v41, buf, 2u);
    goto LABEL_10;
  }
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: learnedLocationOfInterestVisitMO.identifier";
    goto LABEL_25;
  }
  objc_msgSend(v4, "locationOfInterest");
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSObject identifier](v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D183D8], "createWithManagedObject:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0D183E8];
      -[NSObject mapItem](v6, "mapItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createWithManagedObject:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v43 = objc_alloc(MEMORY[0x1E0D183B0]);
        -[NSObject locationLatitude](v6, "locationLatitude");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "doubleValue");
        v13 = v12;
        -[NSObject locationLongitude](v6, "locationLongitude");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "doubleValue");
        v15 = v14;
        -[NSObject locationHorizontalUncertainty](v6, "locationHorizontalUncertainty");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;
        -[NSObject locationAltitude](v6, "locationAltitude");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;
        -[NSObject locationVerticalUncertainty](v6, "locationVerticalUncertainty");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject locationReferenceFrame](v6, "locationReferenceFrame");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "intValue");
        -[NSObject locationSourceAccuracy](v6, "locationSourceAccuracy");
        v49 = v11;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v25, v27, (int)objc_msgSend(v28, "intValue"), v13, v15, v18, v21, v24, 0.0);

        v29 = objc_alloc(MEMORY[0x1E0D183C0]);
        -[NSObject confidence](v6, "confidence");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "doubleValue");
        v31 = v30;
        -[NSObject identifier](v6, "identifier");
        v32 = objc_claimAutoreleasedReturnValue();
        -[NSObject placeType](v6, "placeType");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "unsignedIntValue");
        -[NSObject placeTypeSource](v6, "placeTypeSource");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "unsignedIntegerValue");
        v51[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject placeCustomLabel](v6, "placeCustomLabel");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v29;
        v37 = v8;
        v38 = (void *)v32;
        v11 = v49;
        v39 = v44;
        v40 = (void *)objc_msgSend(v36, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v31, v49);

        v8 = v37;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", buf, 2u);
        }
        v40 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
      }
      v40 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationOfInterestMO.identifier", buf, 2u);
    }
    v40 = 0;
  }

LABEL_23:
  return v40;
}

@end
