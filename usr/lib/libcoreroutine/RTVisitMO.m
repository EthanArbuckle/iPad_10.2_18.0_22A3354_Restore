@implementation RTVisitMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTVisitMO"));
}

- (id)mapItem
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[RTVisitMO willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("mapItem"));
  -[RTVisitMO cachedMapItem](self, "cachedMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[RTVisitMO placeInferenceMapItemIdentifier](self, "placeInferenceMapItemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    +[RTMapItemMO mapItemForIdentifier:error:](RTMapItemMO, "mapItemForIdentifier:error:", v5, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    -[RTVisitMO setCachedMapItem:](self, "setCachedMapItem:", v6);

    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitMO placeInferenceMapItemIdentifier](self, "placeInferenceMapItemIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v14 = v10;
        v15 = 2112;
        v16 = v7;
        v17 = 2112;
        v18 = v11;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property mapItem, %@, map item identifier, %@", buf, 0x20u);

      }
    }
  }
  -[RTVisitMO didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("mapItem"));
  -[RTVisitMO cachedMapItem](self, "cachedMapItem");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setMapItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RTVisitMO willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mapItem"));
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setPlaceInferenceMapItemIdentifier:](self, "setPlaceInferenceMapItemIdentifier:", v5);

  -[RTVisitMO setCachedMapItem:](self, "setCachedMapItem:", v4);
  -[RTVisitMO didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mapItem"));
}

- (id)finerGranularityMapItem
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[RTVisitMO willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("finerGranularityMapItem"));
  -[RTVisitMO placeInferenceFinerGranularityMapItemIdentifier](self, "placeInferenceFinerGranularityMapItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTVisitMO cachedFinerGranularityMapItem](self, "cachedFinerGranularityMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[RTVisitMO placeInferenceFinerGranularityMapItemIdentifier](self, "placeInferenceFinerGranularityMapItemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      +[RTMapItemMO mapItemForIdentifier:error:](RTMapItemMO, "mapItemForIdentifier:error:", v6, &v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v13;
      -[RTVisitMO setCachedFinerGranularityMapItem:](self, "setCachedFinerGranularityMapItem:", v7);

      if (v8)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTVisitMO placeInferenceFinerGranularityMapItemIdentifier](self, "placeInferenceFinerGranularityMapItemIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v15 = v11;
          v16 = 2112;
          v17 = v8;
          v18 = 2112;
          v19 = v12;
          _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property finerGranularityMapItem, %@, map item identifier, %@", buf, 0x20u);

        }
      }
    }
  }
  else
  {
    -[RTVisitMO setCachedFinerGranularityMapItem:](self, "setCachedFinerGranularityMapItem:", 0);
  }
  -[RTVisitMO didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("finerGranularityMapItem"));
  -[RTVisitMO cachedFinerGranularityMapItem](self, "cachedFinerGranularityMapItem");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setFinerGranularityMapItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RTVisitMO willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("finerGranularityMapItem"));
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setPlaceInferenceFinerGranularityMapItemIdentifier:](self, "setPlaceInferenceFinerGranularityMapItemIdentifier:", v5);

  -[RTVisitMO setCachedFinerGranularityMapItem:](self, "setCachedFinerGranularityMapItem:", v4);
  -[RTVisitMO didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("finerGranularityMapItem"));
}

- (id)placeInferenceLoiIdentifier
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[RTVisitMO willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("placeInferenceLoiIdentifier"));
  -[RTVisitMO cachedPlaceInferenceLoiIdentifier](self, "cachedPlaceInferenceLoiIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTVisitMO cachedPlaceInferenceLoiIdentifier](self, "cachedPlaceInferenceLoiIdentifier");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v6, "setFetchLimit:", 1);
    v7 = (void *)MEMORY[0x1E0CB3880];
    -[RTVisitMO placeInferenceMapItemIdentifier](self, "placeInferenceMapItemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("placeMapItemIdentifier"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v9);

    v16 = 0;
    objc_msgSend(v6, "execute:", &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v11;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property placeInferenceLoiIdentifier, %@", buf, 0x16u);

      }
    }
    -[RTVisitMO didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("placeInferenceLoiIdentifier"));
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMO setCachedPlaceInferenceLoiIdentifier:](self, "setCachedPlaceInferenceLoiIdentifier:", v14);

    return v14;
  }
}

- (void)setPlaceInferenceLoiIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[RTVisitMO willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("placeInferenceLoiIdentifier"));
  -[RTVisitMO setCachedPlaceInferenceLoiIdentifier:](self, "setCachedPlaceInferenceLoiIdentifier:", v4);

  -[RTVisitMO didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("placeInferenceLoiIdentifier"));
}

+ (id)managedObjectWithVisit:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  RTVisitMO *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  NSObject *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      v21 = 0;
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: visit";
LABEL_33:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_14;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_33;
  }
  objc_msgSend(v6, "placeInference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "placeInference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0;
    +[RTMapItemMO updateDatabaseWithMapItem:managedObjectContext:error:](RTMapItemMO, "updateDatabaseWithMapItem:managedObjectContext:error:", v12, v8, &v73);
    v13 = v73;

    if (v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v75 = v15;
        v76 = 2112;
        v77 = v6;
        v78 = 2112;
        v79 = v13;
LABEL_35:
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, error persisting visit, %@, error, %@", buf, 0x20u);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  objc_msgSend(v6, "placeInference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "finerGranularityMapItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "placeInference");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finerGranularityMapItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    +[RTMapItemMO updateDatabaseWithMapItem:managedObjectContext:error:](RTMapItemMO, "updateDatabaseWithMapItem:managedObjectContext:error:", v20, v8, &v72);
    v13 = v72;

    if (v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v75 = v15;
        v76 = 2112;
        v77 = v6;
        v78 = 2112;
        v79 = v13;
        goto LABEL_35;
      }
LABEL_12:

      goto LABEL_14;
    }
  }
  v21 = -[RTVisitMO initWithContext:]([RTVisitMO alloc], "initWithContext:", v8);
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "confidence");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setConfidence:](v21, "setConfidence:", v24);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "dataPointCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setDataPointCount:](v21, "setDataPointCount:", v25);

  objc_msgSend(v6, "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setDetectionDate:](v21, "setDetectionDate:", v26);

  objc_msgSend(v6, "entry");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setEntryDate:](v21, "setEntryDate:", v27);

  objc_msgSend(v6, "exit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setExitDate:](v21, "setExitDate:", v28);

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "location");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "latitude");
  objc_msgSend(v29, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setLocationLatitude:](v21, "setLocationLatitude:", v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "location");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "longitude");
  objc_msgSend(v32, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setLocationLongitude:](v21, "setLocationLongitude:", v34);

  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "location");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "horizontalUncertainty");
  objc_msgSend(v35, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setLocationUncertainty:](v21, "setLocationUncertainty:", v37);

  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "location");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "numberWithUnsignedInt:", objc_msgSend(v39, "referenceFrame"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setLocationReferenceFrame:](v21, "setLocationReferenceFrame:", v40);

  objc_msgSend(v6, "location");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "date");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setLocationDate:](v21, "setLocationDate:", v42);

  objc_msgSend(v6, "placeInference");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "confidence");
  if (v44 == 0.0)
  {
    -[RTVisitMO setPlaceInferenceConfidence:](v21, "setPlaceInferenceConfidence:", 0);
  }
  else
  {
    v45 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "placeInference");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "confidence");
    objc_msgSend(v45, "numberWithDouble:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMO setPlaceInferenceConfidence:](v21, "setPlaceInferenceConfidence:", v47);

  }
  objc_msgSend(v6, "placeInference");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "mapItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "identifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setPlaceInferenceMapItemIdentifier:](v21, "setPlaceInferenceMapItemIdentifier:", v50);

  objc_msgSend(v6, "placeInference");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "finerGranularityMapItemConfidence");
  if (v52 == 0.0)
  {
    -[RTVisitMO setPlaceInferenceFinerGranularityMapItemConfidence:](v21, "setPlaceInferenceFinerGranularityMapItemConfidence:", 0);
  }
  else
  {
    v53 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "placeInference");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "finerGranularityMapItemConfidence");
    objc_msgSend(v53, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMO setPlaceInferenceFinerGranularityMapItemConfidence:](v21, "setPlaceInferenceFinerGranularityMapItemConfidence:", v55);

  }
  objc_msgSend(v6, "placeInference");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "finerGranularityMapItem");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "identifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setPlaceInferenceFinerGranularityMapItemIdentifier:](v21, "setPlaceInferenceFinerGranularityMapItemIdentifier:", v58);

  objc_msgSend(v6, "placeInference");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v59, "placeType"))
  {
    v60 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "placeInference");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "numberWithUnsignedInteger:", objc_msgSend(v61, "placeType"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMO setPlaceInferencePlaceType:](v21, "setPlaceInferencePlaceType:", v62);

  }
  else
  {
    -[RTVisitMO setPlaceInferencePlaceType:](v21, "setPlaceInferencePlaceType:", 0);
  }

  objc_msgSend(v6, "placeInference");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v63, "userType"))
  {
    v64 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "placeInference");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "numberWithUnsignedInteger:", objc_msgSend(v65, "userType"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMO setPlaceInferenceUserType:](v21, "setPlaceInferenceUserType:", v66);

  }
  else
  {
    -[RTVisitMO setPlaceInferenceUserType:](v21, "setPlaceInferenceUserType:", 0);
  }

  objc_msgSend(v6, "placeInference");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v67, "userTypeSource"))
  {
    v68 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "placeInference");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "numberWithUnsignedInteger:", objc_msgSend(v69, "userTypeSource"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMO setPlaceInferenceUserTypeSource:](v21, "setPlaceInferenceUserTypeSource:", v70);

  }
  else
  {
    -[RTVisitMO setPlaceInferenceUserTypeSource:](v21, "setPlaceInferenceUserTypeSource:", 0);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "source"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setSource:](v21, "setSource:", v71);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "type"));
  v13 = objc_claimAutoreleasedReturnValue();
  -[RTVisitMO setType:](v21, "setType:", v13);
LABEL_15:

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[RTVisitMO confidence](self, "confidence");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO dataPointCount](self, "dataPointCount");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO detectionDate](self, "detectionDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO entryDate](self, "entryDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringFromDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO exitDate](self, "exitDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO locationLatitude](self, "locationLatitude");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO locationLongitude](self, "locationLongitude");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO locationUncertainty](self, "locationUncertainty");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO locationReferenceFrame](self, "locationReferenceFrame");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO locationDate](self, "locationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFromDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO placeInferenceConfidence](self, "placeInferenceConfidence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO placeInferenceMapItemIdentifier](self, "placeInferenceMapItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO placeInferenceFinerGranularityMapItemConfidence](self, "placeInferenceFinerGranularityMapItemConfidence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO placeInferenceFinerGranularityMapItemIdentifier](self, "placeInferenceFinerGranularityMapItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO placeInferencePlaceType](self, "placeInferencePlaceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO placeInferenceUserType](self, "placeInferenceUserType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO placeInferenceUserTypeSource](self, "placeInferenceUserTypeSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitMO type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("confidence, %@, dataPointCount, %@, detectionDate, %@, entryDate, %@, exitDate, %@, locationLatitude, %@, locationLongitude, %@, locationUncertainty, %@, locationReferenceFrame, %@, locationDate, %@, placeInferenceConfidence, %@, placeInferenceMapItemIdentifier, %@, placeInferenceFinerGranularityMapItemConfidence, %@, placeInferenceFinerGranularityMapItemIdentifier, %@, placeInferencePlaceType, %@, placeInferenceUserType, %@, placeInferenceUserTypeSource, %@, source, %@, type, %@"), v26, v28, v15, v27, v25, v14, v24, v23, v22, v13, v12, v3, v4, v5, v6, v7,
    v8,
    v9,
    v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (RTMapItemMO)cachedMapItem
{
  return self->cachedMapItem;
}

- (void)setCachedMapItem:(id)a3
{
  objc_storeStrong((id *)&self->cachedMapItem, a3);
}

- (RTMapItemMO)cachedFinerGranularityMapItem
{
  return self->cachedFinerGranularityMapItem;
}

- (void)setCachedFinerGranularityMapItem:(id)a3
{
  objc_storeStrong((id *)&self->cachedFinerGranularityMapItem, a3);
}

- (NSUUID)cachedPlaceInferenceLoiIdentifier
{
  return self->cachedPlaceInferenceLoiIdentifier;
}

- (void)setCachedPlaceInferenceLoiIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->cachedPlaceInferenceLoiIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedPlaceInferenceLoiIdentifier, 0);
  objc_storeStrong((id *)&self->cachedFinerGranularityMapItem, 0);
  objc_storeStrong((id *)&self->cachedMapItem, 0);
}

@end
