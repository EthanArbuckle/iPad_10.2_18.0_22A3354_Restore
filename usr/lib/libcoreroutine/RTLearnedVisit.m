@implementation RTLearnedVisit

- (RTLearnedVisit)initWithVisit:(id)a3 locationOfInterest:(id)a4 creationDate:(id)a5 expirationDate:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  RTLearnedLocation *v13;
  void *v14;
  RTLearnedLocation *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  RTLearnedVisit *v21;

  v8 = a6;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = [RTLearnedLocation alloc];
  objc_msgSend(v10, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v13, "initWithLocation:dataPointCount:type:", v14, 30, 1);
  objc_msgSend(v10, "entryDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exitDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationOfInterestConfidence");
  v19 = v18;
  v20 = objc_msgSend(v10, "locationOfInterestSource");

  v21 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](self, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v12, v15, v16, v17, v9, v8, v19, v20);
  if (!v11)

  return v21;
}

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
      v12 = "+[RTLearnedVisit(RTCoreDataTransformable) createWithManagedObject:]";
      v13 = 1024;
      v14 = 40;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedVisit+CoreDataTransformable (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
    }

LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "createWithLearnedVisitMO:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (void *)v5;

LABEL_11:
  return v6;
}

+ (id)createWithLearnedVisitMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  RTLearnedVisit *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  RTLearnedVisit *v41;
  const char *v42;
  uint8_t *v43;
  void *v45;
  void *v46;
  RTLearnedLocation *v47;
  RTLearnedLocation *v48;
  uint8_t buf[2];
  __int16 v50;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v50 = 0;
    v42 = "Invalid parameter not satisfying: learnedVisitMO";
    v43 = (uint8_t *)&v50;
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, v42, v43, 2u);
    goto LABEL_15;
  }
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: learnedVisitMO.identifier";
    v43 = buf;
    goto LABEL_18;
  }
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "managedObjectContext");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject allowTombstones](v8, "allowTombstones") & 1) != 0 || (objc_msgSend(v4, "flags") & 1) == 0)
    {

      goto LABEL_7;
    }
LABEL_15:

    v41 = 0;
    goto LABEL_16;
  }
LABEL_7:
  v47 = [RTLearnedLocation alloc];
  v9 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v4, "locationLatitude");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "doubleValue");
  v11 = v10;
  objc_msgSend(v4, "locationLongitude");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "doubleValue");
  v13 = v12;
  objc_msgSend(v4, "locationHorizontalUncertainty");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(v4, "locationAltitude");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;
  objc_msgSend(v4, "locationVerticalUncertainty");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;
  objc_msgSend(v4, "locationReferenceFrame");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "intValue");
  objc_msgSend(v4, "locationSourceAccuracy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v9, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v24, (int)objc_msgSend(v25, "intValue"), v11, v13, v16, v19, v22, 0.0);
  objc_msgSend(v4, "dataPointCount");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedIntegerValue");
  objc_msgSend(v4, "confidence");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValue");
  v48 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v47, "initWithLocation:dataPointCount:confidence:", v26, v28);

  v30 = [RTLearnedVisit alloc];
  objc_msgSend(v4, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exitDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "expirationDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeConfidence");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  v39 = v38;
  objc_msgSend(v4, "placeSource");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v30, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v31, v48, v32, v33, v35, v36, v39, objc_msgSend(v40, "unsignedIntegerValue"));

  if (!v34)
LABEL_16:

  return v41;
}

+ (id)createWithLearnedLocationOfInterestVisitMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  RTLearnedLocation *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  RTLearnedVisit *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  RTLearnedVisit *v41;
  NSObject *v42;
  const char *v43;
  uint8_t *v44;
  void *v46;
  RTLearnedLocation *v47;
  uint8_t buf[2];
  __int16 v49;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v41 = 0;
      goto LABEL_12;
    }
    v49 = 0;
    v43 = "Invalid parameter not satisfying: learnedLocationOfInterestVisitMO";
    v44 = (uint8_t *)&v49;
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, v43, v44, 2u);
    goto LABEL_11;
  }
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v43 = "Invalid parameter not satisfying: learnedLocationOfInterestVisitMO.identifier";
    v44 = buf;
    goto LABEL_14;
  }
  v6 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v4, "locationLatitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  objc_msgSend(v4, "locationLongitude");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  objc_msgSend(v4, "locationHorizontalUncertainty");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;
  objc_msgSend(v4, "locationAltitude");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;
  objc_msgSend(v4, "locationVerticalUncertainty");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;
  objc_msgSend(v4, "locationReferenceFrame");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "intValue");
  objc_msgSend(v4, "locationSourceAccuracy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v6, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v23, (int)objc_msgSend(v24, "intValue"), v9, v12, v15, v18, v21, 0.0);

  v26 = [RTLearnedLocation alloc];
  objc_msgSend(v4, "dataPointCount");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedIntegerValue");
  objc_msgSend(v4, "confidence");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValue");
  v46 = (void *)v25;
  v47 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v26, "initWithLocation:dataPointCount:confidence:", v25, v28);

  v30 = [RTLearnedVisit alloc];
  objc_msgSend(v4, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exitDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "expirationDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfInterestConfidence");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  v39 = v38;
  objc_msgSend(v4, "locationOfInterestSource");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v30, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v31, v47, v32, v33, v35, v36, v39, objc_msgSend(v40, "unsignedIntegerValue"));

  if (!v34)
LABEL_12:

  return v41;
}

- (id)managedObjectWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTLearnedVisitMO managedObjectWithVisit:inManagedObjectContext:](RTLearnedVisitMO, "managedObjectWithVisit:inManagedObjectContext:", self, a3);
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
  v5 = +[RTLearnedVisitMO managedObjectWithVisit:finerGranularityInferredMapItem:place:managedObject:inManagedObjectContext:](RTLearnedVisitMO, "managedObjectWithVisit:finerGranularityInferredMapItem:place:managedObject:inManagedObjectContext:", self, 0, 0, v6, v4);

}

- (RTLearnedVisit)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_location_entryDate_exitDate_creationDate_expirationDate_placeConfidence_placeSource_);
}

- (RTLearnedVisit)initWithIdentifier:(id)a3 location:(id)a4 entryDate:(id)a5 exitDate:(id)a6 creationDate:(id)a7 expirationDate:(id)a8
{
  return -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](self, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", a3, a4, a5, a6, a7, a8, 0.0, 0);
}

- (RTLearnedVisit)initWithIdentifier:(id)a3 location:(id)a4 entryDate:(id)a5 exitDate:(id)a6 creationDate:(id)a7 expirationDate:(id)a8 placeConfidence:(double)a9 placeSource:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  RTLearnedVisit *v30;
  NSObject *v31;
  RTLearnedVisit *v32;
  uint64_t v33;
  NSUUID *identifier;
  uint64_t v35;
  NSDate *entryDate;
  uint64_t v37;
  NSDate *exitDate;
  uint64_t v39;
  NSDate *creationDate;
  uint64_t v41;
  NSDate *expirationDate;
  char *v44;
  void *v45;
  objc_super v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
      v49 = 1024;
      LODWORD(v50) = 53;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v18)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
    v49 = 1024;
    LODWORD(v50) = 54;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
  }

  if (v19)
  {
LABEL_4:
    if (v20)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_14:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
    v49 = 1024;
    LODWORD(v50) = 55;
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entryDate (in %s:%d)", buf, 0x12u);
  }

  if (v20)
  {
LABEL_5:
    if (v21)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_17:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
    v49 = 1024;
    LODWORD(v50) = 56;
    _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: exitDate (in %s:%d)", buf, 0x12u);
  }

  if (v21)
  {
LABEL_6:
    if (v22)
      goto LABEL_26;
    goto LABEL_23;
  }
LABEL_20:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
    v49 = 1024;
    LODWORD(v50) = 57;
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate (in %s:%d)", buf, 0x12u);
  }

  if (!v22)
  {
LABEL_23:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
      v49 = 1024;
      LODWORD(v50) = 58;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_26:
  if (a9 < 0.0 || a9 > 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
      v49 = 1024;
      LODWORD(v50) = 60;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: kRTLearnedVisitPlaceConfidenceMin <= placeConfidence && placeConfidence <= kRTLearnedVisitPlaceConfidenceMax (in %s:%d)", buf, 0x12u);
    }

  }
  v30 = 0;
  if (v17 && v18 && v19 && v20 && v21 && v22)
  {
    if (objc_msgSend(v19, "compare:", v20) == 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "stringFromDate");
        v44 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringFromDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v48 = v44;
        v49 = 2112;
        v51 = 2080;
        v50 = v45;
        v52 = "-[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:]";
        v53 = 1024;
        v54 = 75;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "entry, %@, postdates exit, %@ (in %s:%d)", buf, 0x26u);

      }
      v30 = 0;
    }
    else
    {
      v30 = 0;
      if (a9 >= 0.0 && a9 <= 1.0)
      {
        v46.receiver = self;
        v46.super_class = (Class)RTLearnedVisit;
        v32 = -[RTLearnedVisit init](&v46, sel_init);
        if (v32)
        {
          v33 = objc_msgSend(v17, "copy");
          identifier = v32->_identifier;
          v32->_identifier = (NSUUID *)v33;

          objc_storeStrong((id *)&v32->_location, a4);
          v35 = objc_msgSend(v19, "copy");
          entryDate = v32->_entryDate;
          v32->_entryDate = (NSDate *)v35;

          v37 = objc_msgSend(v20, "copy");
          exitDate = v32->_exitDate;
          v32->_exitDate = (NSDate *)v37;

          v39 = objc_msgSend(v21, "copy");
          creationDate = v32->_creationDate;
          v32->_creationDate = (NSDate *)v39;

          v41 = objc_msgSend(v22, "copy");
          expirationDate = v32->_expirationDate;
          v32->_expirationDate = (NSDate *)v41;

          v32->_placeConfidence = a9;
          v32->_placeSource = a10;
        }
        self = v32;
        v30 = self;
      }
    }
  }

  return v30;
}

- (double)duration
{
  double result;

  -[NSDate timeIntervalSinceDate:](self->_exitDate, "timeIntervalSinceDate:", self->_entryDate);
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[RTLearnedVisit identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedVisit location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedVisit entryDate](self, "entryDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedVisit exitDate](self, "exitDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedVisit creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedVisit expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedVisit placeConfidence](self, "placeConfidence");
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0D183E8], "sourceToString:", -[RTLearnedVisit placeSource](self, "placeSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("identifier, %@, location, %@, entryDate, %@, exitDate, %@, creationDate, %@, expirationDate, %@, placeConfidence, %.3f, placeSource, %@"), v15, v3, v4, v5, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RTLearnedVisit *v6;
  RTLearnedVisit *v7;
  RTLearnedVisit *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v6 = (RTLearnedVisit *)a3;
  v7 = v6;
  if (v6 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        -[RTLearnedVisit identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || (-[RTLearnedVisit identifier](v8, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[RTLearnedVisit identifier](self, "identifier");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedVisit identifier](v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v4, "isEqual:", v10);

          if (v9)
          {
LABEL_12:

            -[RTLearnedVisit expirationDate](self, "expirationDate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13
              || (-[RTLearnedVisit expirationDate](v8, "expirationDate"),
                  (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[RTLearnedVisit expirationDate](self, "expirationDate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTLearnedVisit expirationDate](v8, "expirationDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if (v13)
              {
LABEL_18:

                -[RTLearnedVisit creationDate](self, "creationDate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17
                  || (-[RTLearnedVisit creationDate](v8, "creationDate"),
                      (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[RTLearnedVisit creationDate](self, "creationDate");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTLearnedVisit creationDate](v8, "creationDate");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v18, "isEqual:", v19);

                  if (v17)
                  {
LABEL_24:

                    v12 = v11 & v16 & v20;
                    goto LABEL_25;
                  }
                }
                else
                {
                  v20 = 1;
                }

                goto LABEL_24;
              }
            }
            else
            {
              v16 = 1;
            }

            goto LABEL_18;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v12 = 0;
  }
LABEL_25:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[RTLearnedVisit identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RTLearnedVisit expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RTLearnedVisit creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (RTLearnedLocation)location
{
  return self->_location;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (double)placeConfidence
{
  return self->_placeConfidence;
}

- (void)setPlaceConfidence:(double)a3
{
  self->_placeConfidence = a3;
}

- (unint64_t)placeSource
{
  return self->_placeSource;
}

- (void)setPlaceSource:(unint64_t)a3
{
  self->_placeSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_exitDate, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
