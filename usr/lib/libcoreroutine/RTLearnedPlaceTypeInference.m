@implementation RTLearnedPlaceTypeInference

- (RTLearnedPlaceTypeInference)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_sessionId_learnedPlaceIdentifier_placeType_metricSource_creationDate_);
}

- (RTLearnedPlaceTypeInference)initWithIdentifier:(id)a3 sessionId:(id)a4 learnedPlaceIdentifier:(id)a5 placeType:(unint64_t)a6 metricSource:(unint64_t)a7 creationDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  RTLearnedPlaceTypeInference *v19;
  RTLearnedPlaceTypeInference *v20;
  RTLearnedPlaceTypeInference *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  NSObject *v26;
  id v27;
  objc_super v28;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v27 = a5;
  v17 = a8;
  v18 = v17;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v21 = 0;
LABEL_11:
      v24 = v27;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: identifier";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_10;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: sessionId";
    goto LABEL_17;
  }
  if (v17)
  {
    v28.receiver = self;
    v28.super_class = (Class)RTLearnedPlaceTypeInference;
    v19 = -[RTLearnedPlaceTypeInference init](&v28, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_identifier, a3);
      objc_storeStrong((id *)&v20->_sessionId, a4);
      objc_storeStrong((id *)&v20->_learnedPlaceIdentifier, a5);
      v20->_placeType = a6;
      v20->_metricSource = a7;
      objc_storeStrong((id *)&v20->_creationDate, a8);
    }
    self = v20;
    v21 = self;
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  v24 = v27;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: creationDate", buf, 2u);
  }

  v21 = 0;
LABEL_12:

  return v21;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLearnedPlaceTypeInference identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInference sessionId](self, "sessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInference learnedPlaceIdentifier](self, "learnedPlaceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", -[RTLearnedPlaceTypeInference placeType](self, "placeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPlaceTypeClassifierMetricsCalculator metricsSourceToString:](RTPlaceTypeClassifierMetricsCalculator, "metricsSourceToString:", -[RTLearnedPlaceTypeInference metricSource](self, "metricSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedPlaceTypeInference creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, sessionId, %@, learnedPlaceIdentifier, %@, placeType, %@, metricSource, %@, creationDate, %@,"), v4, v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  RTLearnedPlaceTypeInference *v4;
  RTLearnedPlaceTypeInference *v5;
  RTLearnedPlaceTypeInference *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  char v16;
  void *v18;

  v4 = (RTLearnedPlaceTypeInference *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[RTLearnedPlaceTypeInference identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedPlaceTypeInference identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[RTLearnedPlaceTypeInference sessionId](self, "sessionId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLearnedPlaceTypeInference sessionId](v6, "sessionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[RTLearnedPlaceTypeInference learnedPlaceIdentifier](self, "learnedPlaceIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLearnedPlaceTypeInference learnedPlaceIdentifier](v6, "learnedPlaceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12)
          && (v13 = -[RTLearnedPlaceTypeInference placeType](self, "placeType"),
              v13 == -[RTLearnedPlaceTypeInference placeType](v6, "placeType"))
          && (v14 = -[RTLearnedPlaceTypeInference metricSource](self, "metricSource"),
              v14 == -[RTLearnedPlaceTypeInference metricSource](v6, "metricSource")))
        {
          -[RTLearnedPlaceTypeInference creationDate](self, "creationDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedPlaceTypeInference creationDate](v6, "creationDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v18, "isEqualToDate:", v15);

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[RTLearnedPlaceTypeInference identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RTLearnedPlaceTypeInference sessionId](self, "sessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RTLearnedPlaceTypeInference learnedPlaceIdentifier](self, "learnedPlaceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedPlaceTypeInference placeType](self, "placeType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedPlaceTypeInference metricSource](self, "metricSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[RTLearnedPlaceTypeInference creationDate](self, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTLearnedPlaceTypeInference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  RTLearnedPlaceTypeInference *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SessionId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LearnedPlaceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PlaceType"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MetricSource"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[RTLearnedPlaceTypeInference initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:](self, "initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionId, CFSTR("SessionId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_learnedPlaceIdentifier, CFSTR("LearnedPlaceIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_metricSource, CFSTR("MetricSource"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_placeType, CFSTR("PlaceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:", self->_identifier, self->_sessionId, self->_learnedPlaceIdentifier, self->_placeType, self->_metricSource, self->_creationDate);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (NSUUID)learnedPlaceIdentifier
{
  return self->_learnedPlaceIdentifier;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (unint64_t)metricSource
{
  return self->_metricSource;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_learnedPlaceIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)createWithManagedObject:(id)a3
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
      v10 = "+[RTLearnedPlaceTypeInference(RTCoreDataTransformable) createWithManagedObject:]";
      v11 = 1024;
      v12 = 34;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLearnedPlaceTypeInferenceMO+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_7;
  }
  objc_msgSend((id)objc_opt_class(), "createWithLearnedPlaceTypeInferenceMO:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

+ (id)createWithLearnedPlaceTypeInferenceMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__128;
    v16 = __Block_byref_object_dispose__128;
    v17 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __94__RTLearnedPlaceTypeInference_RTCoreDataTransformable__createWithLearnedPlaceTypeInferenceMO___block_invoke;
    v9[3] = &unk_1E929A690;
    v11 = buf;
    v10 = v4;
    objc_msgSend(v5, "performBlockAndWait:", v9);

    v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlaceTypeInferenceMO", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

void __94__RTLearnedPlaceTypeInference_RTCoreDataTransformable__createWithLearnedPlaceTypeInferenceMO___block_invoke(uint64_t a1)
{
  RTLearnedPlaceTypeInference *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = [RTLearnedPlaceTypeInference alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "learnedPlaceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(*(id *)(a1 + 32), "placeType");
  v6 = (int)objc_msgSend(*(id *)(a1 + 32), "metricSource");
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RTLearnedPlaceTypeInference initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:](v2, "initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:", v11, v3, v4, v5, v6, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)managedObjectWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTLearnedPlaceTypeInferenceMO initWithLearnedPlaceTypeInference:managedObjectContext:](RTLearnedPlaceTypeInferenceMO, "initWithLearnedPlaceTypeInference:managedObjectContext:", self, a3);
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
