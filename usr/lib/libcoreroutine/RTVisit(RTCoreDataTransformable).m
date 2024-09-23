@implementation RTVisit(RTCoreDataTransformable)

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
      v15 = "+[RTVisit(RTCoreDataTransformable) createWithManagedObject:]";
      v16 = 1024;
      v17 = 38;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTVisit+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);

    }
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "createWithVisitMO:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

+ (id)createWithVisitMO:()RTCoreDataTransformable
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v3, "locationLatitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v3, "locationLongitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(v3, "locationUncertainty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v3, "locationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationReferenceFrame");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v14, objc_msgSend(v15, "unsignedIntValue"), v7, v10, v13);

  objc_msgSend(v3, "mapItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)v16;
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0D183E8];
    objc_msgSend(v3, "mapItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createWithManagedObject:", v19);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "finerGranularityMapItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0D183E8];
      objc_msgSend(v3, "finerGranularityMapItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "createWithManagedObject:", v22);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v55 = 0;
    }
    v23 = objc_alloc(MEMORY[0x1E0D18420]);
    objc_msgSend(v3, "placeInferenceUserType");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v54, "unsignedIntValue");
    objc_msgSend(v3, "placeInferenceUserTypeSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntValue");
    objc_msgSend(v3, "placeInferencePlaceType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntValue");
    objc_msgSend(v3, "placeInferenceConfidence");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;
    objc_msgSend(v3, "placeInferenceFinerGranularityMapItemConfidence");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = v32;
    objc_msgSend(v3, "placeInferenceLoiIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v23, "initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:", v57, v55, v60, v25, v27, v61, v30, v33, v34);

  }
  else
  {
    v59 = 0;
  }
  v35 = objc_alloc(MEMORY[0x1E0D18578]);
  objc_msgSend(v3, "detectionDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v36, "unsignedIntValue");
  objc_msgSend(v3, "entryDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exitDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataPointCount");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "unsignedIntValue");
  objc_msgSend(v3, "confidence");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "doubleValue");
  v43 = v42;
  objc_msgSend(v3, "source");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v35, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:source:", v58, v56, v61, v37, v38, v40, v43, v59, objc_msgSend(v44, "unsignedIntValue"));

  if (v59)
  {
    objc_msgSend(v59, "mapItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "mapItem");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v48;
        _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "Corrupted RTAddressMO, %@", buf, 0xCu);

      }
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "mapItem");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "address");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v51;
        _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, "Corrupted RTMapItemMO, %@", buf, 0xCu);

      }
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v63 = v3;
        v64 = 2112;
        v65 = v45;
        _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "Corrupted RTVisitMO, %@, was converted to RTVisit, %@", buf, 0x16u);
      }

    }
  }

  return v45;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTVisitMO managedObjectWithVisit:inManagedObjectContext:](RTVisitMO, "managedObjectWithVisit:inManagedObjectContext:", a1, a3);
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
