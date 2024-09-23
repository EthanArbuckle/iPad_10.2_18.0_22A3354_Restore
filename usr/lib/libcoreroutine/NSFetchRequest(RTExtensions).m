@implementation NSFetchRequest(RTExtensions)

+ (id)locationPropertiesForEntityName:()RTExtensions
{
  id v3;
  void *v4;
  objc_class *v5;
  RTManagedObjectLocationProperties *v6;
  objc_class *v7;
  RTManagedObjectLocationProperties *v8;
  objc_class *v9;
  RTManagedObjectLocationProperties *v10;
  objc_class *v11;
  RTManagedObjectLocationProperties *v12;
  objc_class *v13;
  RTManagedObjectLocationProperties *v14;
  objc_class *v15;
  RTManagedObjectLocationProperties *v16;
  objc_class *v17;
  void *v18;
  RTManagedObjectLocationProperties *v19;
  void *v20;
  void *v21;
  void *v22;
  RTManagedObjectLocationProperties *v23;
  objc_class *v24;
  void *v25;
  RTManagedObjectLocationProperties *v26;
  void *v27;
  void *v28;
  void *v29;
  RTManagedObjectLocationProperties *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  RTManagedObjectLocationProperties *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  RTManagedObjectLocationProperties *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  RTManagedObjectLocationProperties *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  RTManagedObjectLocationProperties *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  RTManagedObjectLocationProperties *v55;
  void *v56;
  void *v57;
  void *v58;
  RTManagedObjectLocationProperties *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  _QWORD v86[8];
  _QWORD v87[10];

  v87[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)locationPropertiesForEntityName__entityNameToLocationPropertiesDic;
  if (!locationPropertiesForEntityName__entityNameToLocationPropertiesDic)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v62;
    v6 = [RTManagedObjectLocationProperties alloc];
    v85 = CFSTR("latitude");
    v63 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = CFSTR("longitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[RTManagedObjectLocationProperties initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:](v6, "initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:", v61, v60, 0);
    v87[0] = v59;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v58;
    v8 = [RTManagedObjectLocationProperties alloc];
    v83 = CFSTR("latitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = CFSTR("longitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[RTManagedObjectLocationProperties initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:](v8, "initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:", v57, v56, 0);
    v87[1] = v55;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v54;
    v10 = [RTManagedObjectLocationProperties alloc];
    v81 = CFSTR("locationLatitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = CFSTR("locationLongitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = CFSTR("locationReferenceFrame");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[RTManagedObjectLocationProperties initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:](v10, "initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:", v53, v52, v51);
    v87[2] = v50;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v86[3] = v49;
    v12 = [RTManagedObjectLocationProperties alloc];
    v78 = CFSTR("locationLatitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = CFSTR("locationLongitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = CFSTR("locationReferenceFrame");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[RTManagedObjectLocationProperties initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:](v12, "initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:", v48, v47, v46);
    v87[3] = v45;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v86[4] = v44;
    v14 = [RTManagedObjectLocationProperties alloc];
    v75[0] = CFSTR("mapItem");
    v75[1] = CFSTR("latitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = CFSTR("mapItem");
    v74[1] = CFSTR("longitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = CFSTR("mapItem");
    v73[1] = CFSTR("referenceFrame");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[RTManagedObjectLocationProperties initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:](v14, "initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:", v43, v42, v41);
    v87[4] = v40;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v86[5] = v39;
    v16 = [RTManagedObjectLocationProperties alloc];
    v72 = CFSTR("locationLatitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = CFSTR("locationLongitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = CFSTR("locationReferenceFrame");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[RTManagedObjectLocationProperties initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:](v16, "initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:", v38, v37, v36);
    v87[5] = v35;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v86[6] = v18;
    v19 = [RTManagedObjectLocationProperties alloc];
    v69 = CFSTR("latitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = CFSTR("longitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = CFSTR("referenceFrame");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[RTManagedObjectLocationProperties initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:](v19, "initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:", v20, v21, v22);
    v87[6] = v23;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v86[7] = v25;
    v26 = [RTManagedObjectLocationProperties alloc];
    v66 = CFSTR("locationLatitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = CFSTR("locationLongitude");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = CFSTR("locationReferenceFrame");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[RTManagedObjectLocationProperties initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:](v26, "initWithLatitudePropertyPath:longitudePropertyPath:referenceFramePropertyPath:", v27, v28, v29);
    v87[7] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 8);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)locationPropertiesForEntityName__entityNameToLocationPropertiesDic;
    locationPropertiesForEntityName__entityNameToLocationPropertiesDic = v31;

    v3 = v63;
    v4 = (void *)locationPropertiesForEntityName__entityNameToLocationPropertiesDic;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v3, v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)formatStringForPropertyPath:()RTExtensions
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("%K"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      v5 = 1;
      do
      {
        objc_msgSend(v4, "appendString:", CFSTR(".%K"));
        ++v5;
      }
      while (v5 < objc_msgSend(v3, "count"));
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: propertyPath.count > 0", v8, 2u);
    }

    v4 = 0;
  }

  return v4;
}

+ (id)boundingBoxPredicatesForLocation:()RTExtensions distance:locationProperties:error:
{
  id v9;
  id v10;
  void *v11;
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
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  const __CFString *v35;
  NSObject *v36;
  NSObject *v37;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint8_t buf[8];
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (a6)
  {
    if (v9)
    {
      if (a1 <= 0.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distance > 0", buf, 2u);
        }

        v35 = CFSTR("distance > 0");
      }
      else
      {
        if (v10)
        {
          *(_QWORD *)buf = 0;
          objc_msgSend(v9, "latitude");
          objc_msgSend(v9, "longitude");
          RTCommonCalculateBoundingBox();
          v12 = (void *)MEMORY[0x1E0C97B48];
          objc_msgSend(v11, "latitudePropertyPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "formatStringForPropertyPath:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (void *)MEMORY[0x1E0C97B48];
          objc_msgSend(v11, "longitudePropertyPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "formatStringForPropertyPath:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 && v17)
          {
            objc_msgSend(v11, "latitudePropertyPath");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v18, "copy");

            objc_msgSend(v11, "longitudePropertyPath");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)objc_msgSend(v20, "copy");

            v50 = (void *)MEMORY[0x1E0C99DE8];
            v21 = (void *)MEMORY[0x1E0CB3880];
            objc_msgSend(v14, "stringByAppendingString:", CFSTR(">= %@"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)buf);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v19;
            objc_msgSend(v19, "arrayByAddingObject:", v54);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "predicateWithFormat:argumentArray:", v53, v52);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)MEMORY[0x1E0CB3880];
            objc_msgSend(v14, "stringByAppendingString:", CFSTR("<= %@"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "arrayByAddingObject:", v49);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "predicateWithFormat:argumentArray:", v48, v47);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)MEMORY[0x1E0CB3880];
            objc_msgSend(v17, "stringByAppendingString:", CFSTR(">= %@"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
            v55 = v14;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "arrayByAddingObject:", v45);
            v57 = v17;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "predicateWithFormat:argumentArray:", v44, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)MEMORY[0x1E0CB3880];
            objc_msgSend(v17, "stringByAppendingString:", CFSTR("<= %@"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "arrayByAddingObject:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "predicateWithFormat:argumentArray:", v27, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "arrayWithObjects:", v46, v43, v25, v30, 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = v57;
            v14 = v55;

            v32 = v51;
          }
          else
          {
            v39 = (void *)MEMORY[0x1E0CB35C8];
            v40 = *MEMORY[0x1E0D18598];
            v59 = *MEMORY[0x1E0CB2D50];
            v60[0] = CFSTR("latitudePropertyString or longitudePropertyString is nil");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 0, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = objc_retainAutorelease(v42);
            v31 = 0;
            *a6 = v32;
          }

          goto LABEL_21;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationProperties", buf, 2u);
        }

        v35 = CFSTR("locationProperties");
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
      }

      v35 = CFSTR("location");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v35);
    v31 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v31 = 0;
LABEL_21:

  return v31;
}

- (uint64_t)setupBoundingBoxFetchRequestForLocation:()RTExtensions distance:entityCanBeLocationShifted:locationShifter:resultExpansionPredicates:resultFilteringPredicates:error:
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  void *v49;
  id v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  uint8_t buf[16];
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  const __CFString *v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  _QWORD v108[3];

  v108[1] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (a9)
  {
    v20 = (void *)objc_opt_class();
    objc_msgSend(a1, "entityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "locationPropertiesForEntityName:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a5 & 1) == 0)
      {
        v37 = objc_msgSend(v16, "referenceFrame");
        v38 = (void *)objc_opt_class();
        if (v37 == 2)
        {
          v98 = 0;
          objc_msgSend(v38, "boundingBoxPredicatesForLocation:distance:locationProperties:error:", v16, v22, &v98, a2 + 1000.0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v98;
        }
        else
        {
          v99 = 0;
          objc_msgSend(v38, "boundingBoxPredicatesForLocation:distance:locationProperties:error:", v16, v22, &v99, a2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v99;
        }
        v40 = v39;
        v31 = v93;
        if (!v40)
          goto LABEL_19;
        v41 = objc_retainAutorelease(v40);
        *a9 = v41;

        v28 = 0;
LABEL_35:

        goto LABEL_36;
      }
      -[NSObject referenceFramePropertyPath](v22, "referenceFramePropertyPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (!v25)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationProperties.referenceFramePropertyPath.count > 0", buf, 2u);
        }

        _RTErrorInvalidParameterCreate((uint64_t)CFSTR("locationProperties.referenceFramePropertyPath.count > 0"));
        v28 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if (v17)
      {
        if (objc_msgSend(v16, "referenceFrame") == 2)
        {
          v94 = 0;
          objc_msgSend((id)objc_opt_class(), "boundingBoxPredicatesForLocation:distance:locationProperties:error:", v16, v22, &v94, a2 + 1000.0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v94;
          if (!v27)
          {
LABEL_19:
            objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v26);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v42);

LABEL_20:
            if (v18)
              objc_msgSend(v23, "addObjectsFromArray:", v18);
            objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v23);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "addObject:", v43);

            if (v19)
              objc_msgSend(v93, "addObjectsFromArray:", v19);
            objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v93);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "setPredicate:", v44);

            v31 = v93;
            v28 = 1;
            goto LABEL_35;
          }
        }
        else
        {
          v97 = 0;
          objc_msgSend(v17, "shiftedLocation:allowNetwork:error:", v16, 1, &v97);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v97;
          if (!v27)
          {
            v92 = v26;
            v96 = 0;
            objc_msgSend((id)objc_opt_class(), "boundingBoxPredicatesForLocation:distance:locationProperties:error:", v16, v22, &v96, a2);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v96;
            if (v50)
            {
              v51 = v50;
              *a9 = objc_retainAutorelease(v50);
              v52 = 1;
            }
            else
            {
              v91 = v49;
              v53 = (void *)objc_opt_class();
              -[NSObject referenceFramePropertyPath](v22, "referenceFramePropertyPath");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "formatStringForPropertyPath:", v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSObject referenceFramePropertyPath](v22, "referenceFramePropertyPath");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = v55;
              if (v55)
              {
                v85 = (void *)MEMORY[0x1E0CB3880];
                objc_msgSend(v55, "stringByAppendingString:", CFSTR("!= %@"));
                v57 = objc_claimAutoreleasedReturnValue();
                v58 = v56;
                v59 = (void *)v57;
                v80 = v58;
                objc_msgSend(v58, "arrayByAddingObject:", &unk_1E9327278);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "predicateWithFormat:argumentArray:", v59, v60);
                v82 = (id)objc_claimAutoreleasedReturnValue();

                if (v82)
                {
                  objc_msgSend(v91, "addObject:");
                  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v91);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "addObject:", v61);

                  v95 = 0;
                  objc_msgSend((id)objc_opt_class(), "boundingBoxPredicatesForLocation:distance:locationProperties:error:", v92, v22, &v95, a2);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = v95;
                  v79 = v62;
                  if (v62)
                  {
                    *a9 = objc_retainAutorelease(v62);
                    v86 = 1;
                    v49 = v91;
                    v56 = v80;
                    v63 = v78;
                  }
                  else
                  {
                    v88 = (void *)MEMORY[0x1E0CB3880];
                    objc_msgSend(v90, "stringByAppendingString:", CFSTR("== %@"));
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "arrayByAddingObject:", &unk_1E9327278);
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "predicateWithFormat:argumentArray:", v77, v70);
                    v71 = objc_claimAutoreleasedReturnValue();

                    v72 = (void *)v71;
                    if (v71)
                    {
                      v63 = v78;
                      objc_msgSend(v78, "addObject:", v71);
                      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v78);
                      v73 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v23, "addObject:", v73);
                      v86 = 0;
                    }
                    else
                    {
                      v89 = (void *)MEMORY[0x1E0CB35C8];
                      v74 = *MEMORY[0x1E0D18598];
                      v101 = *MEMORY[0x1E0CB2D50];
                      v102 = CFSTR("chinaShiftedPredicate is nil");
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v89, "errorWithDomain:code:userInfo:", v74, 0, v75);
                      v76 = (void *)objc_claimAutoreleasedReturnValue();

                      v72 = 0;
                      v73 = objc_retainAutorelease(v76);
                      *a9 = v73;
                      v86 = 1;
                      v63 = v78;
                    }

                    v49 = v91;
                    v56 = v80;
                  }

                  v69 = v79;
                }
                else
                {
                  v87 = (void *)MEMORY[0x1E0CB35C8];
                  v66 = *MEMORY[0x1E0D18598];
                  v103 = *MEMORY[0x1E0CB2D50];
                  v104 = CFSTR("notChinaShiftedPredicate is nil");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "errorWithDomain:code:userInfo:", v66, 0, v67);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();

                  v69 = objc_retainAutorelease(v68);
                  *a9 = v69;
                  v86 = 1;
                  v49 = v91;
                  v56 = v80;
                }

                v65 = v82;
              }
              else
              {
                v83 = (id)MEMORY[0x1E0CB35C8];
                v81 = *MEMORY[0x1E0D18598];
                v105 = *MEMORY[0x1E0CB2D50];
                v106 = CFSTR("referenceFrameFormatString is nil");
                v86 = 1;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "errorWithDomain:code:userInfo:", v81, 0, v64);
                v84 = (id)objc_claimAutoreleasedReturnValue();

                v65 = objc_retainAutorelease(v84);
                *a9 = v65;
                v49 = v91;
              }

              v52 = v86;
              v51 = 0;
            }

            if (!v52)
              goto LABEL_20;
            goto LABEL_33;
          }
        }
        v47 = objc_retainAutorelease(v27);
        *a9 = v47;

LABEL_33:
        v28 = 0;
LABEL_34:
        v31 = v93;
        goto LABEL_35;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v46 = objc_claimAutoreleasedReturnValue();
      v31 = v93;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationShifter", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("locationShifter"));
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "entityName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("entityName, %@, not supported"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0D18598];
      v107 = *MEMORY[0x1E0CB2D50];
      v108[0] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 7, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_retainAutorelease(v35);
      v23 = v36;
    }
    v28 = 0;
    *a9 = v36;
    goto LABEL_35;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }
  v28 = 0;
LABEL_36:

  return v28;
}

@end
