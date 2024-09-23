@implementation RTLearnedTransition

- (RTLearnedTransition)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_startDate_stopDate_visitIdentifierOrigin_visitIdentifierDestination_creationDate_expirationDate_predominantMotionActivityType_);
}

- (RTLearnedTransition)initWithIdentifier:(id)a3 startDate:(id)a4 stopDate:(id)a5 visitIdentifierOrigin:(id)a6 visitIdentifierDestination:(id)a7 creationDate:(id)a8 expirationDate:(id)a9 predominantMotionActivityType:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RTLearnedTransition *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  RTLearnedTransition *v33;
  uint64_t v34;
  NSUUID *identifier;
  uint64_t v36;
  NSDate *startDate;
  uint64_t v38;
  NSDate *stopDate;
  uint64_t v40;
  NSUUID *visitIdentifierOrigin;
  uint64_t v42;
  NSUUID *visitIdentifierDestination;
  uint64_t v44;
  NSDate *creationDate;
  uint64_t v46;
  NSDate *expirationDate;
  char *v49;
  objc_super v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination"
            ":creationDate:expirationDate:predominantMotionActivityType:]";
      v53 = 1024;
      LODWORD(v54) = 34;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v17)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    v53 = 1024;
    LODWORD(v54) = 35;
    _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
  }

  if (v18)
  {
LABEL_4:
    if (v19)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_23:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    v53 = 1024;
    LODWORD(v54) = 36;
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stopDate (in %s:%d)", buf, 0x12u);
  }

  if (v19)
  {
LABEL_5:
    if (v20)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_26:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    v53 = 1024;
    LODWORD(v54) = 37;
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifierOrigin (in %s:%d)", buf, 0x12u);
  }

  if (v20)
  {
LABEL_6:
    if (v21)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_29:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    v53 = 1024;
    LODWORD(v54) = 38;
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifierDestination (in %s:%d)", buf, 0x12u);
  }

  if (v21)
  {
LABEL_7:
    if (v22)
      goto LABEL_8;
LABEL_35:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination"
            ":creationDate:expirationDate:predominantMotionActivityType:]";
      v53 = 1024;
      LODWORD(v54) = 40;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expirationDate (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_37;
  }
LABEL_32:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:c"
          "reationDate:expirationDate:predominantMotionActivityType:]";
    v53 = 1024;
    LODWORD(v54) = 39;
    _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate (in %s:%d)", buf, 0x12u);
  }

  if (!v22)
    goto LABEL_35;
LABEL_8:
  v23 = 0;
  if (v16 && v17 && v18 && v19 && v20 && v21)
  {
    if (objc_msgSend(v17, "compare:", v18) == 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "stringFromDate");
        v49 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringFromDate");
        v25 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v52 = v49;
        v53 = 2112;
        v55 = 2080;
        v54 = v25;
        v26 = (void *)v25;
        v56 = "-[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestinati"
              "on:creationDate:expirationDate:predominantMotionActivityType:]";
        v57 = 1024;
        v58 = 56;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "start, %@, postdates stop, %@ (in %s:%d)", buf, 0x26u);

      }
LABEL_37:

      v23 = 0;
      goto LABEL_41;
    }
    v50.receiver = self;
    v50.super_class = (Class)RTLearnedTransition;
    v33 = -[RTLearnedTransition init](&v50, sel_init);
    if (v33)
    {
      v34 = objc_msgSend(v16, "copy");
      identifier = v33->_identifier;
      v33->_identifier = (NSUUID *)v34;

      v36 = objc_msgSend(v17, "copy");
      startDate = v33->_startDate;
      v33->_startDate = (NSDate *)v36;

      v38 = objc_msgSend(v18, "copy");
      stopDate = v33->_stopDate;
      v33->_stopDate = (NSDate *)v38;

      v40 = objc_msgSend(v19, "copy");
      visitIdentifierOrigin = v33->_visitIdentifierOrigin;
      v33->_visitIdentifierOrigin = (NSUUID *)v40;

      v42 = objc_msgSend(v20, "copy");
      visitIdentifierDestination = v33->_visitIdentifierDestination;
      v33->_visitIdentifierDestination = (NSUUID *)v42;

      v44 = objc_msgSend(v21, "copy");
      creationDate = v33->_creationDate;
      v33->_creationDate = (NSDate *)v44;

      v46 = objc_msgSend(v22, "copy");
      expirationDate = v33->_expirationDate;
      v33->_expirationDate = (NSDate *)v46;

      v33->_predominantMotionActivityType = a10;
    }
    self = v33;
    v23 = self;
  }
LABEL_41:

  return v23;
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v15 = (id)MEMORY[0x1E0CB3940];
  -[RTLearnedTransition identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedTransition startDate](self, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedTransition stopDate](self, "stopDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedTransition visitIdentifierOrigin](self, "visitIdentifierOrigin");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedTransition visitIdentifierDestination](self, "visitIdentifierDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedTransition creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedTransition expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D18400], "motionActivityTypeToString:", -[RTLearnedTransition predominantMotionActivityType](self, "predominantMotionActivityType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("identifier, %@, startDate, %@, stopDate, %@, visitIdentifierOrigin, %@, visitIdentifierDestination, %@, creationDate, %@, expirationDate, %@, predominantMotionActivityType, %@"), v14, v13, v12, v3, v5, v7, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RTLearnedTransition *v6;
  RTLearnedTransition *v7;
  RTLearnedTransition *v8;
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

  v6 = (RTLearnedTransition *)a3;
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
        -[RTLearnedTransition identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || (-[RTLearnedTransition identifier](v8, "identifier"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[RTLearnedTransition identifier](self, "identifier");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedTransition identifier](v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v4, "isEqual:", v10);

          if (v9)
          {
LABEL_12:

            -[RTLearnedTransition expirationDate](self, "expirationDate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13
              || (-[RTLearnedTransition expirationDate](v8, "expirationDate"),
                  (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[RTLearnedTransition expirationDate](self, "expirationDate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTLearnedTransition expirationDate](v8, "expirationDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if (v13)
              {
LABEL_18:

                -[RTLearnedTransition creationDate](self, "creationDate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17
                  || (-[RTLearnedTransition creationDate](v8, "creationDate"),
                      (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[RTLearnedTransition creationDate](self, "creationDate");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTLearnedTransition creationDate](v8, "creationDate");
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

  -[RTLearnedTransition identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RTLearnedTransition expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RTLearnedTransition creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)stopDate
{
  return self->_stopDate;
}

- (NSUUID)visitIdentifierOrigin
{
  return self->_visitIdentifierOrigin;
}

- (NSUUID)visitIdentifierDestination
{
  return self->_visitIdentifierDestination;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (unint64_t)predominantMotionActivityType
{
  return self->_predominantMotionActivityType;
}

- (void)setPredominantMotionActivityType:(unint64_t)a3
{
  self->_predominantMotionActivityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_visitIdentifierDestination, 0);
  objc_storeStrong((id *)&self->_visitIdentifierOrigin, 0);
  objc_storeStrong((id *)&self->_stopDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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
      objc_msgSend((id)objc_opt_class(), "createWithLearnedLocationOfInterestTransitionMO:", v3);
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
      v11 = "+[RTLearnedTransition(RTCoreDataTransformable) createWithManagedObject:]";
      v12 = 1024;
      v13 = 39;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedTransition+CoreDataTransformable (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
    }

LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  objc_msgSend((id)objc_opt_class(), "createWithLearnedTransitionMO:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v5 = (void *)v4;
LABEL_11:

  return v5;
}

+ (id)createWithLearnedTransitionMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  RTLearnedTransition *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  RTLearnedTransition *v18;
  const char *v19;
  uint8_t *v20;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[2];
  __int16 v26;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v26 = 0;
    v19 = "Invalid parameter not satisfying: learnedTransitionMO";
    v20 = (uint8_t *)&v26;
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
    v19 = "Invalid parameter not satisfying: learnedTransitionMO.identifier";
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
  v9 = [RTLearnedTransition alloc];
  objc_msgSend(v4, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "origin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "expirationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predominantMotionActivityType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v9, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v24, v23, v22, v11, v13, v15, v16, objc_msgSend(v17, "integerValue"));

  if (!v14)
LABEL_16:

  return v18;
}

+ (id)createWithLearnedLocationOfInterestTransitionMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  RTLearnedTransition *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RTLearnedTransition *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  uint8_t buf[2];
  __int16 v21;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v15 = 0;
      goto LABEL_8;
    }
    v21 = 0;
    v17 = "Invalid parameter not satisfying: learnedLocationOfInterestTransitionMO";
    v18 = (uint8_t *)&v21;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_7;
  }
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: learnedLocationOfInterestTransitionMO.identifier";
    v18 = buf;
    goto LABEL_10;
  }
  v6 = [RTLearnedTransition alloc];
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visitIdentifierOrigin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visitIdentifierDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predominantMotionActivityType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v6, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v7, v8, v9, v10, v11, v12, v13, objc_msgSend(v14, "integerValue"));

LABEL_8:
  return v15;
}

- (id)managedObjectWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTLearnedTransitionMO managedObjectWithTransition:inManagedObjectContext:](RTLearnedTransitionMO, "managedObjectWithTransition:inManagedObjectContext:", self, a3);
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
  v5 = +[RTLearnedTransitionMO managedObjectWithTransition:managedObject:inManagedObjectContext:](RTLearnedTransitionMO, "managedObjectWithTransition:managedObject:inManagedObjectContext:", self, v6, v4);

}

@end
