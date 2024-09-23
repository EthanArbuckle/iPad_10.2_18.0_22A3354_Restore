@implementation SMSessionStateEnumerationOptions

- (SMSessionStateEnumerationOptions)init
{
  return -[SMSessionStateEnumerationOptions initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:sessionState:locationBoundingBox:boundingBoxRadius:sessionIdentifier:](self, "initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:sessionState:locationBoundingBox:boundingBoxRadius:sessionIdentifier:", 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (SMSessionStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByCreationDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7
{
  return -[SMSessionStateEnumerationOptions initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:sessionState:locationBoundingBox:boundingBoxRadius:sessionIdentifier:](self, "initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:sessionState:locationBoundingBox:boundingBoxRadius:sessionIdentifier:", a3, a4, a5, a6, a7, 0, 0, 0, 0);
}

- (SMSessionStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByCreationDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7 sessionState:(unint64_t)a8 locationBoundingBox:(id)a9 boundingBoxRadius:(id)a10 sessionIdentifier:(id)a11
{
  id v16;
  id v17;
  SMSessionStateEnumerationOptions *v18;
  SMSessionStateEnumerationOptions *v19;
  NSObject *v20;
  SMSessionStateEnumerationOptions *v21;
  id v25;
  id v26;
  uint8_t buf[16];
  objc_super v28;

  v16 = a7;
  v17 = a9;
  v26 = a10;
  v25 = a11;
  v28.receiver = self;
  v28.super_class = (Class)SMSessionStateEnumerationOptions;
  v18 = -[SMSessionStateEnumerationOptions init](&v28, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_7;
  v18->_batchSize = a3;
  v18->_fetchLimit = a4;
  v18->_sortByCreationDate = a5;
  v18->_ascending = a6;
  objc_storeStrong((id *)&v18->_dateInterval, a7);
  v19->_sessionState = a8;
  objc_storeStrong((id *)&v19->_locationBoundingBox, a9);
  objc_storeStrong((id *)&v19->_sessionIdentifier, a11);
  objc_storeStrong((id *)&v19->_boundingBoxRadius, a10);
  if (v26)
    goto LABEL_7;
  if (v19->_locationBoundingBox)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: boundingBoxRadius != nil", buf, 2u);
    }

    v21 = 0;
  }
  else
  {
LABEL_7:
    v21 = v19;
  }

  return v21;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  unint64_t batchSize;
  unint64_t fetchLimit;
  _BOOL8 sortByCreationDate;
  void *v6;
  _BOOL8 ascending;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  batchSize = self->_batchSize;
  fetchLimit = self->_fetchLimit;
  sortByCreationDate = self->_sortByCreationDate;
  v6 = (void *)MEMORY[0x24BDD17C8];
  ascending = self->_ascending;
  -[NSDateInterval description](self->_dateInterval, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionManagerState convertSessionStateToString:](SMSessionManagerState, "convertSessionStateToString:", self->_sessionState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLLocation coordinate](self->_locationBoundingBox, "coordinate");
  v11 = v10;
  -[CLLocation coordinate](self->_locationBoundingBox, "coordinate");
  v13 = v12;
  -[NSNumber doubleValue](self->_boundingBoxRadius, "doubleValue");
  v15 = v14;
  -[NSUUID description](self->_sessionIdentifier, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("{batchSize:%lu, fetchLimit:%lu, sortByCreationDate:%d, ascending:%d, dateInterval:%@, sessionState:%@, locationBoundingBox.latitude:%f, locationBoundingBox.longitude:%f, boundingBoxRadius:%.3f, sessionIdentifier:%@}"), batchSize, fetchLimit, sortByCreationDate, ascending, v8, v9, v11, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:sessionState:locationBoundingBox:boundingBoxRadius:sessionIdentifier:", self->_batchSize, self->_fetchLimit, self->_sortByCreationDate, self->_ascending, self->_dateInterval, self->_sessionState, self->_locationBoundingBox, self->_boundingBoxRadius, self->_sessionIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t batchSize;
  id v5;

  batchSize = self->_batchSize;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", batchSize, CFSTR("batchSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fetchLimit, CFSTR("fetchLimit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sortByCreationDate, CFSTR("sortByCreationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ascending, CFSTR("ascending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sessionState, CFSTR("sessionState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationBoundingBox, CFSTR("locationBoundingBox"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_boundingBoxRadius, CFSTR("boundingBoxRadius"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));

}

- (SMSessionStateEnumerationOptions)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  SMSessionStateEnumerationOptions *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("batchSize"));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("fetchLimit"));
  v6 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("sortByCreationDate"));
  v7 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("ascending"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("dateInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sessionState"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("locationBoundingBox"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("boundingBoxRadius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("sessionIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SMSessionStateEnumerationOptions initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:sessionState:locationBoundingBox:boundingBoxRadius:sessionIdentifier:](self, "initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:sessionState:locationBoundingBox:boundingBoxRadius:sessionIdentifier:", v4, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)sortByCreationDate
{
  return self->_sortByCreationDate;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (CLLocation)locationBoundingBox
{
  return self->_locationBoundingBox;
}

- (NSNumber)boundingBoxRadius
{
  return self->_boundingBoxRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxRadius, 0);
  objc_storeStrong((id *)&self->_locationBoundingBox, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
