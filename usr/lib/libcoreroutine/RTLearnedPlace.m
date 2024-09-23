@implementation RTLearnedPlace

+ (unint64_t)placeTypeFromType:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

+ (id)placeTypeToString:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_1E92A0310[a3];
}

+ (id)createWithManagedObject:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "createWithLearnedLocationOfInterestMO:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412802;
      v9 = v3;
      v10 = 2080;
      v11 = "+[RTLearnedPlace(RTCoreDataTransformable) createWithManagedObject:]";
      v12 = 1024;
      v13 = 36;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedPlace+CoreDataTransformable (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
    }

LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  objc_msgSend((id)objc_opt_class(), "createWithLearnedPlaceMO:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v5 = (void *)v4;
LABEL_11:

  return v5;
}

+ (id)createWithLearnedPlaceMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  RTLearnedPlace *v18;
  const char *v19;
  uint8_t *v20;
  RTLearnedPlace *v22;
  void *v23;
  uint8_t buf[2];
  __int16 v25;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v25 = 0;
    v19 = "Invalid parameter not satisfying: learnedPlaceMO";
    v20 = (uint8_t *)&v25;
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, v19, v20, 2u);
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
    v19 = "Invalid parameter not satisfying: learnedPlaceMO.identifier";
    v20 = buf;
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

    v18 = 0;
    goto LABEL_16;
  }
LABEL_7:
  v22 = [RTLearnedPlace alloc];
  objc_msgSend(v4, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  objc_msgSend(v4, "typeSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0D183E8], "createWithManagedObject:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "expirationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v22, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v23, v10, v12, v13, v14, v16, v17);

  if (!v15)
LABEL_16:

  return v18;
}

+ (id)createWithLearnedLocationOfInterestMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  RTLearnedPlace *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RTLearnedPlace *v16;
  void *v17;
  RTLearnedPlace *v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  uint64_t v23;
  void *v24;
  uint8_t buf[2];
  __int16 v26;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v18 = 0;
      goto LABEL_8;
    }
    v26 = 0;
    v20 = "Invalid parameter not satisfying: learnedLocationOfInterestMO";
    v21 = (uint8_t *)&v26;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v20, v21, 2u);
    goto LABEL_7;
  }
  objc_msgSend(v3, "placeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: learnedLocationOfInterestMO.placeIdentifier";
    v21 = buf;
    goto LABEL_10;
  }
  v6 = [RTLearnedPlace alloc];
  objc_msgSend(v4, "placeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v24, "unsignedIntegerValue");
  objc_msgSend(v4, "placeTypeSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = (void *)MEMORY[0x1E0D183E8];
  objc_msgSend(v4, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createWithManagedObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeCustomLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeCreationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeExpirationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  v17 = (void *)v7;
  v18 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v16, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v7, v23, v9, v12, v13, v14, v15);

LABEL_8:
  return v18;
}

- (id)managedObjectWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTLearnedPlaceMO managedObjectWithPlace:inManagedObjectContext:](RTLearnedPlaceMO, "managedObjectWithPlace:inManagedObjectContext:", self, a3);
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
  v5 = +[RTLearnedPlaceMO managedObjectWithPlace:managedObject:inManagedObjectContext:](RTLearnedPlaceMO, "managedObjectWithPlace:managedObject:inManagedObjectContext:", self, v6, v4);

}

+ (unint64_t)placeTypeSourceFromTypeSource:(unint64_t)a3
{
  return (a3 >> 2) & 0xC | (2 * (a3 & 1)) | ((a3 & 0xE) != 0);
}

+ (BOOL)learnedPlaceTypeIsValid:(unint64_t)a3
{
  return a3 < 5;
}

+ (BOOL)isTypeSourceValid:(unint64_t)a3
{
  return a3 < 0x10;
}

+ (id)placeTypeSourceToString:(unint64_t)a3
{
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = +[RTLearnedPlace isTypeSourceValid:](RTLearnedPlace, "isTypeSourceValid:");
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413058;
      v14 = v12;
      v15 = 2048;
      v17 = 2080;
      v16 = a3;
      v18 = "+[RTLearnedPlace placeTypeSourceToString:]";
      v19 = 1024;
      v20 = 67;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@ does not handle RTLearnedPlaceTypeSource, %lu (in %s:%d)", (uint8_t *)&v13, 0x26u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a3)
  {
    v10 = CFSTR("Unknown");
    goto LABEL_17;
  }
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v7, "addObject:", CFSTR("Inferred"));
    if ((a3 & 2) == 0)
    {
LABEL_8:
      if ((a3 & 4) == 0)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(v8, "addObject:", CFSTR("MeCard"));
  if ((a3 & 4) == 0)
  {
LABEL_9:
    if ((a3 & 8) == 0)
      goto LABEL_10;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v8, "addObject:", CFSTR("User"));
  if ((a3 & 8) != 0)
  {
LABEL_16:
    v10 = CFSTR("Fallback");
LABEL_17:
    objc_msgSend(v8, "addObject:", v10);
    if (v5)
      goto LABEL_11;
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
LABEL_10:
  if (!v5)
    goto LABEL_18;
LABEL_11:
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v9;
}

+ (unint64_t)placeTypeFromLocationOfInterestType:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

- (RTLearnedPlace)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_type_typeSource_mapItem_customLabel_creationDate_expirationDate_);
}

- (RTLearnedPlace)initWithIdentifier:(id)a3 type:(unint64_t)a4 typeSource:(unint64_t)a5 mapItem:(id)a6 customLabel:(id)a7 creationDate:(id)a8 expirationDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  RTLearnedPlace *v20;
  RTLearnedPlace *v21;
  uint64_t v22;
  NSUUID *identifier;
  uint64_t v24;
  NSString *customLabel;
  uint64_t v26;
  NSDate *creationDate;
  uint64_t v28;
  NSDate *expirationDate;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (v15)
  {
    if (v18)
      goto LABEL_3;
LABEL_12:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:]";
      v37 = 1024;
      v38 = 121;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate (in %s:%d)", buf, 0x12u);
    }

    if (v19)
      goto LABEL_4;
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:]";
    v37 = 1024;
    v38 = 120;
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
  }

  if (!v18)
    goto LABEL_12;
LABEL_3:
  if (v19)
  {
LABEL_4:
    v20 = 0;
    if (v15 && v18)
    {
      v34.receiver = self;
      v34.super_class = (Class)RTLearnedPlace;
      v21 = -[RTLearnedPlace init](&v34, sel_init);
      if (v21)
      {
        v22 = objc_msgSend(v15, "copy");
        identifier = v21->_identifier;
        v21->_identifier = (NSUUID *)v22;

        v21->_type = a4;
        v21->_typeSource = a5;
        objc_storeStrong((id *)&v21->_mapItem, a6);
        v24 = objc_msgSend(v17, "copy");
        customLabel = v21->_customLabel;
        v21->_customLabel = (NSString *)v24;

        v26 = objc_msgSend(v18, "copy");
        creationDate = v21->_creationDate;
        v21->_creationDate = (NSDate *)v26;

        v28 = objc_msgSend(v19, "copy");
        expirationDate = v21->_expirationDate;
        v21->_expirationDate = (NSDate *)v28;

      }
      self = v21;
      v20 = self;
    }
    goto LABEL_18;
  }
LABEL_15:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:]";
    v37 = 1024;
    v38 = 122;
    _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate (in %s:%d)", buf, 0x12u);
  }

  v20 = 0;
LABEL_18:

  return v20;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLearnedPlace identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "placeTypeToString:", -[RTLearnedPlace type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "placeTypeSourceToString:", -[RTLearnedPlace typeSource](self, "typeSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlace mapItem](self, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlace customLabel](self, "customLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlace creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlace expirationDate](self, "expirationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, type, %@, typeSource, %@, mapItem, %@, customLabel, %@, creationDate, %@, expirationDate, %@"), v4, v5, v6, v7, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RTLearnedPlace *v6;
  RTLearnedPlace *v7;
  RTLearnedPlace *v8;
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

  v6 = (RTLearnedPlace *)a3;
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
        -[RTLearnedPlace identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || (-[RTLearnedPlace identifier](v8, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[RTLearnedPlace identifier](self, "identifier");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedPlace identifier](v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v4, "isEqual:", v10);

          if (v9)
          {
LABEL_12:

            -[RTLearnedPlace expirationDate](self, "expirationDate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13
              || (-[RTLearnedPlace expirationDate](v8, "expirationDate"),
                  (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[RTLearnedPlace expirationDate](self, "expirationDate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTLearnedPlace expirationDate](v8, "expirationDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if (v13)
              {
LABEL_18:

                -[RTLearnedPlace creationDate](self, "creationDate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17
                  || (-[RTLearnedPlace creationDate](v8, "creationDate"),
                      (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[RTLearnedPlace creationDate](self, "creationDate");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTLearnedPlace creationDate](v8, "creationDate");
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

  -[RTLearnedPlace identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RTLearnedPlace expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RTLearnedPlace creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)typeSource
{
  return self->_typeSource;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (NSString)customLabel
{
  return self->_customLabel;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
