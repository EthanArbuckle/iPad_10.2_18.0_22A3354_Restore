@implementation RTLearnedLocationOfInterest

+ (id)createWithManagedObject:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend((id)objc_opt_class(), "createWithLearnedLocationOfInterestVisitMO:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412802;
      v10 = v3;
      v11 = 2080;
      v12 = "+[RTLearnedLocationOfInterest(RTCoreDataTransformable) createWithManagedObject:]";
      v13 = 1024;
      v14 = 49;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedLocationOfInterest+CoreDataReadable (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
    }

LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "createWithLearnedLocationOfInterestMO:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (void *)v5;

LABEL_11:
  return v6;
}

+ (id)createWithLearnedLocationOfInterestMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  RTLearnedLocationOfInterest *v72;
  void *v73;
  NSObject *v74;
  RTLearnedLocationOfInterest *v75;
  const char *v76;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  RTLearnedLocation *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  void *v95;
  _BYTE v96[128];
  void *v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  int v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v74 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
LABEL_37:
      v75 = 0;
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    v76 = "Invalid parameter not satisfying: learnedLocationOfInterestMO.identifier";
LABEL_40:
    _os_log_error_impl(&dword_1D1A22000, v74, OS_LOG_TYPE_ERROR, v76, buf, 2u);
    goto LABEL_37;
  }
  objc_msgSend(v3, "placeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v74 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v76 = "Invalid parameter not satisfying: learnedLocationOfInterestMO.placeIdentifier";
    goto LABEL_40;
  }
  v82 = [RTLearnedLocation alloc];
  v6 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v3, "locationLatitude");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "doubleValue");
  v8 = v7;
  objc_msgSend(v3, "locationLongitude");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "doubleValue");
  v10 = v9;
  objc_msgSend(v3, "locationHorizontalUncertainty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v3, "locationAltitude");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(v3, "locationVerticalUncertainty");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;
  objc_msgSend(v3, "locationReferenceFrame");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "intValue");
  objc_msgSend(v3, "locationSourceAccuracy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v6, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v21, (int)objc_msgSend(v22, "intValue"), v8, v10, v13, v16, v19, 0.0);
  objc_msgSend(v3, "dataPointCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntegerValue");
  objc_msgSend(v3, "confidence");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  v80 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v82, "initWithLocation:dataPointCount:confidence:", v23, v25);

  +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", v3);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "visits");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "arrayWithCapacity:", objc_msgSend(v28, "count"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v81 = v3;
  objc_msgSend(v3, "visits");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
  if (!v30)
    goto LABEL_18;
  v31 = v30;
  v32 = *(_QWORD *)v92;
  do
  {
    for (i = 0; i != v31; ++i)
    {
      if (*(_QWORD *)v92 != v32)
        objc_enumerationMutation(v29);
      v34 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
      objc_msgSend(v34, "entryDate");
      v35 = objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v36 = (void *)v35;
        objc_msgSend(v34, "exitDate");
        v37 = objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v38 = (void *)v37;
          objc_msgSend(v34, "entryDate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "exitDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v39, "compare:", v40);

          if (v41 != 1)
          {
            +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", v34);
            v42 = objc_claimAutoreleasedReturnValue();
            if (v42)
              objc_msgSend(v86, "addObject:", v42);
            goto LABEL_16;
          }
        }
        else
        {

        }
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v34, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "entryDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringFromDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "exitDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringFromDate");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v99 = v43;
        v100 = 2112;
        v101 = v45;
        v102 = 2112;
        v103 = v47;
        v104 = 2080;
        v105 = "+[RTLearnedLocationOfInterest(RTCoreDataTransformable) createWithLearnedLocationOfInterestMO:]";
        v106 = 1024;
        v107 = 81;
        _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "location of interest visit, %@, has one or more malformed dates, entry, %@, exit, %@ (in %s:%d)", buf, 0x30u);

      }
LABEL_16:

    }
    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
  }
  while (v31);
LABEL_18:

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v78;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "sortUsingDescriptors:", v48);

  v49 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v81, "transitions");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "arrayWithCapacity:", objc_msgSend(v50, "count"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v81, "transitions");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  if (!v52)
    goto LABEL_33;
  v53 = v52;
  v54 = *(_QWORD *)v88;
  while (2)
  {
    v55 = 0;
    while (2)
    {
      if (*(_QWORD *)v88 != v54)
        objc_enumerationMutation(v51);
      v56 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v55);
      objc_msgSend(v56, "startDate");
      v57 = objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        v58 = (void *)v57;
        objc_msgSend(v56, "stopDate");
        v59 = objc_claimAutoreleasedReturnValue();
        if (v59)
        {
          v60 = (void *)v59;
          objc_msgSend(v56, "startDate");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "stopDate");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v61, "compare:", v62);

          if (v63 != 1)
          {
            +[RTLearnedTransition createWithManagedObject:](RTLearnedTransition, "createWithManagedObject:", v56);
            v64 = objc_claimAutoreleasedReturnValue();
            if (v64)
              objc_msgSend(v84, "addObject:", v64);
            goto LABEL_31;
          }
        }
        else
        {

        }
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v56, "identifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "startDate");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "stringFromDate");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stopDate");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "stringFromDate");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v99 = v65;
        v100 = 2112;
        v101 = v67;
        v102 = 2112;
        v103 = v69;
        v104 = 2080;
        v105 = "+[RTLearnedLocationOfInterest(RTCoreDataTransformable) createWithLearnedLocationOfInterestMO:]";
        v106 = 1024;
        v107 = 105;
        _os_log_error_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_ERROR, "location of interest transition, %@, has one or more malformed dates, start, %@, stop, %@ (in %s:%d)", buf, 0x30u);

      }
LABEL_31:

      if (v53 != ++v55)
        continue;
      break;
    }
    v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    if (v53)
      continue;
    break;
  }
LABEL_33:

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "sortUsingDescriptors:", v71);

  v72 = [RTLearnedLocationOfInterest alloc];
  v3 = v81;
  objc_msgSend(v81, "identifier");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v80;
  v75 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v72, "initWithIdentifier:location:place:visits:transitions:", v73, v80, v79, v86, v84);

LABEL_38:
  return v75;
}

+ (id)createWithLearnedLocationOfInterestVisitMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  RTLearnedLocationOfInterest *v30;
  NSObject *v31;
  void *v32;
  RTLearnedLocationOfInterest *v33;
  NSObject *v34;
  RTLearnedLocationOfInterest *v35;
  const char *v36;
  RTLearnedLocation *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t buf[16];
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      v35 = 0;
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: visitMO";
LABEL_25:
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, v36, buf, 2u);
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
    v36 = "Invalid parameter not satisfying: visitMO.identifier";
    goto LABEL_25;
  }
  objc_msgSend(v4, "locationOfInterest");
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSObject identifier](v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v38 = [RTLearnedLocation alloc];
    v8 = objc_alloc(MEMORY[0x1E0D183B0]);
    -[NSObject locationLatitude](v6, "locationLatitude");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    v10 = v9;
    -[NSObject locationLongitude](v6, "locationLongitude");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v12 = v11;
    -[NSObject locationHorizontalUncertainty](v6, "locationHorizontalUncertainty");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    v14 = v13;
    -[NSObject locationAltitude](v6, "locationAltitude");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    -[NSObject locationVerticalUncertainty](v6, "locationVerticalUncertainty");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;
    -[NSObject locationReferenceFrame](v6, "locationReferenceFrame");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");
    -[NSObject locationSourceAccuracy](v6, "locationSourceAccuracy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v8, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v22, (int)objc_msgSend(v23, "intValue"), v10, v12, v14, v17, v20, 0.0);
    -[NSObject dataPointCount](v6, "dataPointCount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedIntegerValue");
    -[NSObject confidence](v6, "confidence");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v39 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v38, "initWithLocation:dataPointCount:confidence:", v24, v26);

    +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", v4);
      v29 = objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = [RTLearnedLocationOfInterest alloc];
        -[NSObject identifier](v6, "identifier");
        v31 = objc_claimAutoreleasedReturnValue();
        v44[0] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v30;
        v34 = v39;
        v35 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v33, "initWithIdentifier:location:place:visits:transitions:", v31, v39, v28, v32, 0);

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
        }
        v35 = 0;
        v34 = v39;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlace", buf, 2u);
      }
      v35 = 0;
      v34 = v39;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationOfInterestMO.identifier", buf, 2u);
    }
    v35 = 0;
  }

LABEL_23:
  return v35;
}

- (id)managedObjectWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTLearnedLocationOfInterestMO managedObjectWithLocationOfInterest:inManagedObjectContext:](RTLearnedLocationOfInterestMO, "managedObjectWithLocationOfInterest:inManagedObjectContext:", self, a3);
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

- (void)updateManagedObject:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[RTLearnedLocationOfInterestMO managedObjectWithLocationOfInterest:managedObject:inManagedObjectContext:](RTLearnedLocationOfInterestMO, "managedObjectWithLocationOfInterest:managedObject:inManagedObjectContext:", self, v6, v4);

}

+ (unint64_t)mapItemSourceFromGeoMapItemSource:(unint64_t)a3
{
  return a3 & 0x1D9 | (4 * ((a3 >> 1) & 1)) | (a3 >> 1) & 0xF800;
}

- (RTLearnedLocationOfInterest)initWithLocationOfInterest:(id)a3 creationDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  RTLearnedVisit *v20;
  void *v21;
  RTLearnedPlace *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  RTLearnedPlace *v27;
  void *v28;
  RTLearnedLocationOfInterest *v29;
  void *v32;
  RTLearnedLocation *v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v33 = -[RTLearnedLocation initWithLocationOfInterest:]([RTLearnedLocation alloc], "initWithLocationOfInterest:", v5);
  objc_msgSend(v5, "mapItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "visits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v5, "visits");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v5, "visits");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (unint64_t)objc_msgSend(v15, "count") > 1;

        objc_msgSend(v14, "exitDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dateByAddingTimeInterval:", dbl_1D1EED5C0[v16]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11 || objc_msgSend(v11, "compare:", v18) == -1)
        {
          v19 = v18;

          v11 = v19;
        }
        v20 = -[RTLearnedVisit initWithVisit:locationOfInterest:creationDate:expirationDate:]([RTLearnedVisit alloc], "initWithVisit:locationOfInterest:creationDate:expirationDate:", v14, v5, v6, v18);
        if (v20)
          objc_msgSend(v35, "addObject:", v20);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v6, "dateByAddingTimeInterval:", 4838400.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [RTLearnedPlace alloc];
  objc_msgSend(v5, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = +[RTLearnedPlace placeTypeFromType:](RTLearnedPlace, "placeTypeFromType:", objc_msgSend(v5, "type"));
  v25 = +[RTLearnedPlace placeTypeSourceFromTypeSource:](RTLearnedPlace, "placeTypeSourceFromTypeSource:", objc_msgSend(v5, "typeSource"));
  objc_msgSend(v5, "customLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v22, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v23, v24, v25, v32, v26, v6, v21);

  objc_msgSend(v5, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](self, "initWithIdentifier:location:place:visits:transitions:", v28, v33, v27, v35, MEMORY[0x1E0C9AA60]);

  return v29;
}

- (RTLearnedLocationOfInterest)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_location_place_visits_transitions_);
}

- (RTLearnedLocationOfInterest)initWithIdentifier:(id)a3 location:(id)a4 place:(id)a5 visits:(id)a6 transitions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  RTLearnedLocationOfInterest *v16;
  RTLearnedLocationOfInterest *v17;
  uint64_t v18;
  NSUUID *identifier;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v25 = a7;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_13:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:]";
      v29 = 1024;
      v30 = 31;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
    }

    if (v14)
      goto LABEL_4;
    goto LABEL_16;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:]";
    v29 = 1024;
    v30 = 30;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
  }

  if (!v13)
    goto LABEL_13;
LABEL_3:
  if (v14)
  {
LABEL_4:
    v16 = 0;
    if (v12 && v13)
    {
      v26.receiver = self;
      v26.super_class = (Class)RTLearnedLocationOfInterest;
      v17 = -[RTLearnedLocationOfInterest init](&v26, sel_init);
      if (v17)
      {
        v18 = objc_msgSend(v12, "copy");
        identifier = v17->_identifier;
        v17->_identifier = (NSUUID *)v18;

        objc_storeStrong((id *)&v17->_location, a4);
        objc_storeStrong((id *)&v17->_place, a5);
        objc_storeStrong((id *)&v17->_visits, a6);
        objc_storeStrong((id *)&v17->_transitions, a7);
      }
      self = v17;
      v16 = self;
    }
    v20 = v25;
    goto LABEL_19;
  }
LABEL_16:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  v20 = v25;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:]";
    v29 = 1024;
    v30 = 32;
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place (in %s:%d)", buf, 0x12u);
  }

  v16 = 0;
LABEL_19:

  return v16;
}

- (id)filterWithDateInterval:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  RTLearnedLocationOfInterest *v48;
  void *v49;
  void *v50;
  void *v51;
  RTLearnedLocationOfInterest *v52;
  RTLearnedLocationOfInterest *v54;
  void *v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  if (!v57)
  {
    v52 = self;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v54 = self;
  -[RTLearnedLocationOfInterest visits](self, "visits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v63 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v9, "entryDate");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v9, "exitDate");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v9, "exitDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "entryDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isOnOrBefore:", v15);

            if (!v16)
            {
              v17 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v9, "entryDate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "exitDate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);

              if (-[NSObject intersectsDateInterval:](v20, "intersectsDateInterval:", v57))
                objc_msgSend(v56, "addObject:", v9);
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "entryDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringFromDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "exitDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringFromDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v68 = v21;
          v69 = 2112;
          v70 = v23;
          v71 = 2112;
          v72 = v25;
          v73 = 2080;
          v74 = "-[RTLearnedLocationOfInterest filterWithDateInterval:]";
          v75 = 1024;
          v76 = 66;
          _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "location of interest visit, %@, has one or more malformed dates, entry, %@, exit, %@ (in %s:%d)", buf, 0x30u);

        }
LABEL_15:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[RTLearnedLocationOfInterest transitions](v54, "transitions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (!v27)
    goto LABEL_32;
  v28 = v27;
  v29 = *(_QWORD *)v59;
  do
  {
    for (j = 0; j != v28; ++j)
    {
      if (*(_QWORD *)v59 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
      objc_msgSend(v31, "startDate");
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v33 = (void *)v32;
        objc_msgSend(v31, "stopDate");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = (void *)v34;
          objc_msgSend(v31, "stopDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "startDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isOnOrBefore:", v37);

          if (!v38)
          {
            v39 = objc_alloc(MEMORY[0x1E0CB3588]);
            objc_msgSend(v31, "startDate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stopDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v39, "initWithStartDate:endDate:", v40, v41);

            if (-[NSObject intersectsDateInterval:](v42, "intersectsDateInterval:", v57))
              objc_msgSend(v55, "addObject:", v31);
            goto LABEL_30;
          }
        }
        else
        {

        }
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v31, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "startDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringFromDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stopDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringFromDate");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v68 = v43;
        v69 = 2112;
        v70 = v45;
        v71 = 2112;
        v72 = v47;
        v73 = 2080;
        v74 = "-[RTLearnedLocationOfInterest filterWithDateInterval:]";
        v75 = 1024;
        v76 = 88;
        _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "location of interest transition, %@, has one or more malformed dates, start, %@, stop, %@ (in %s:%d)", buf, 0x30u);

      }
LABEL_30:

    }
    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  }
  while (v28);
LABEL_32:

  v48 = [RTLearnedLocationOfInterest alloc];
  -[RTLearnedLocationOfInterest identifier](v54, "identifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationOfInterest location](v54, "location");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationOfInterest place](v54, "place");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v48, "initWithIdentifier:location:place:visits:transitions:", v49, v50, v51, v56, v55);

LABEL_34:
  return v52;
}

- (double)dwellTime
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[RTLearnedLocationOfInterest visits](self, "visits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v27;
    v7 = 0.0;
    *(_QWORD *)&v4 = 138413314;
    v25 = v4;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "entryDate", v25);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v9, "exitDate");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v9, "exitDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "entryDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isOnOrBefore:", v15);

            if (!v16)
            {
              objc_msgSend(v9, "duration");
              v7 = v7 + v17;
              continue;
            }
          }
          else
          {

          }
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "entryDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringFromDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "exitDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringFromDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v25;
          v31 = v19;
          v32 = 2112;
          v33 = v21;
          v34 = 2112;
          v35 = v23;
          v36 = 2080;
          v37 = "-[RTLearnedLocationOfInterest dwellTime]";
          v38 = 1024;
          v39 = 119;
          _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "location of interest visit, %@, has one or more malformed dates, entry, %@, exit, %@ (in %s:%d)", buf, 0x30u);

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      if (!v5)
        goto LABEL_18;
    }
  }
  v7 = 0.0;
LABEL_18:

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLearnedLocationOfInterest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationOfInterest location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationOfInterest place](self, "place");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationOfInterest visits](self, "visits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[RTLearnedLocationOfInterest transitions](self, "transitions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, location, %@, place, %@, visits, %lu, transitions, %lu"), v5, v6, v7, v9, objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTLearnedLocationOfInterest *v5;
  RTLearnedLocationOfInterest *v6;
  RTLearnedLocationOfInterest *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (RTLearnedLocationOfInterest *)a3;
  v6 = v5;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[RTLearnedLocationOfInterest identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[RTLearnedLocationOfInterest identifier](v7, "identifier"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[RTLearnedLocationOfInterest identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedLocationOfInterest identifier](v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RTLearnedLocationOfInterest identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (RTLearnedLocation)location
{
  return self->_location;
}

- (RTLearnedPlace)place
{
  return self->_place;
}

- (NSArray)visits
{
  return self->_visits;
}

- (NSArray)transitions
{
  return self->_transitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
