@implementation SMSessionConfigurationEnumerationOptions

- (SMSessionConfigurationEnumerationOptions)init
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return -[SMSessionConfigurationEnumerationOptions initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:](self, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", 0, 0, 0, 0, 0, 0, v3, 0, 0, 0, 0, 0);
}

- (SMSessionConfigurationEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortBySessionStartDate:(BOOL)a5 ascending:(BOOL)a6 sessionTypes:(id)a7 timeInADayInterval:(id)a8 pickOneConfigInTimeInADayInterval:(BOOL)a9 dateInterval:(id)a10 startBoundingBoxLocation:(id)a11 destinationBoundingBoxLocation:(id)a12 boundingBoxRadius:(id)a13 sessionIdentifier:(id)a14
{
  id v17;
  id v18;
  void *v19;
  SMSessionConfigurationEnumerationOptions *v20;
  SMSessionConfigurationEnumerationOptions *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  int v27;
  SMSessionConfigurationEnumerationOptions *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v36;
  id obj;
  id v38;
  id v39;
  id v40;
  id v41;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[16];
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v17 = a7;
  v18 = a8;
  obj = a10;
  v49 = a10;
  v38 = a11;
  v48 = a11;
  v39 = a12;
  v47 = a12;
  v40 = a13;
  v19 = v17;
  v50 = a13;
  v36 = a14;
  v46 = a14;
  v56.receiver = self;
  v56.super_class = (Class)SMSessionConfigurationEnumerationOptions;
  v20 = -[SMSessionConfigurationEnumerationOptions init](&v56, sel_init);
  v21 = v20;
  if (!v20)
    goto LABEL_16;
  v41 = v17;
  v20->_batchSize = a3;
  v20->_fetchLimit = a4;
  v20->_sortBySessionStartDate = a5;
  v20->_ascending = a6;
  objc_storeStrong((id *)&v20->_sessionTypes, a7);
  objc_storeStrong((id *)&v21->_timeInADayInterval, a8);
  v21->_pickOneConfigInTimeInADayInterval = a9;
  if (!a9 || v21->_timeInADayInterval)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v19 = v17;
    v22 = v17;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v52 != v25)
            objc_enumerationMutation(v22);
          v27 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "unsignedIntValue", v36, obj, v38, v39, v40);
          if (v18 && v27 != 2)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_245521000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timeInADayInterval == nil", buf, 2u);
            }

            goto LABEL_28;
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        if (v24)
          continue;
        break;
      }
    }

    objc_storeStrong((id *)&v21->_dateInterval, obj);
    objc_storeStrong((id *)&v21->_startBoundingBoxLocation, v38);
    objc_storeStrong((id *)&v21->_destinationBoundingBoxLocation, v39);
    objc_storeStrong((id *)&v21->_boundingBoxRadius, v40);
    if (v21->_startBoundingBoxLocation)
    {
      v19 = v41;
      if (v50)
      {
LABEL_15:
        objc_storeStrong((id *)&v21->_sessionIdentifier, v36);
LABEL_16:
        v28 = v21;
LABEL_29:
        v33 = v48;
        v32 = v49;
        v31 = v47;
        goto LABEL_30;
      }
    }
    else
    {
      v19 = v41;
      if (v50 || !v21->_destinationBoundingBoxLocation)
        goto LABEL_15;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: boundingBoxRadius != nil", buf, 2u);
    }

LABEL_28:
    v28 = 0;
    goto LABEL_29;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  v19 = v41;
  v31 = v47;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_245521000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _timeInADayInterval", buf, 2u);
  }

  v28 = 0;
  v33 = v48;
  v32 = v49;
LABEL_30:

  return v28;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOBYTE(v6) = self->_pickOneConfigInTimeInADayInterval;
  return (id)objc_msgSend(v4, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", self->_batchSize, self->_fetchLimit, self->_sortBySessionStartDate, self->_ascending, self->_sessionTypes, self->_timeInADayInterval, v6, self->_dateInterval, self->_startBoundingBoxLocation, self->_destinationBoundingBoxLocation, self->_boundingBoxRadius, self->_sessionIdentifier);
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
  objc_msgSend(v5, "encodeBool:forKey:", self->_sortBySessionStartDate, CFSTR("sortBySessionStartDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ascending, CFSTR("ascending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionTypes, CFSTR("sessionTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeInADayInterval, CFSTR("timeInADayInterval"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pickOneConfigInTimeInADayInterval, CFSTR("pickOneConfigInTimeInADayInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startBoundingBoxLocation, CFSTR("startBoundingBoxLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationBoundingBoxLocation, CFSTR("destinationBoundingBoxLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_boundingBoxRadius, CFSTR("boundingBoxRadius"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));

}

- (SMSessionConfigurationEnumerationOptions)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SMSessionConfigurationEnumerationOptions *v13;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("batchSize"));
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("fetchLimit"));
  v16 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("sortBySessionStartDate"));
  v4 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("ascending"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("sessionTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("timeInADayInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("pickOneConfigInTimeInADayInterval"));
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("dateInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("startBoundingBoxLocation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("destinationBoundingBoxLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("boundingBoxRadius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("sessionIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = v7;
  v13 = -[SMSessionConfigurationEnumerationOptions initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:](self, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", v18, v17, v16, v4, v5, v6, v15, v8, v9, v10, v11, v12);

  return v13;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;

  v21 = (void *)MEMORY[0x24BDD17C8];
  v20 = -[SMSessionConfigurationEnumerationOptions batchSize](self, "batchSize");
  v19 = -[SMSessionConfigurationEnumerationOptions fetchLimit](self, "fetchLimit");
  if (-[SMSessionConfigurationEnumerationOptions sortBySessionStartDate](self, "sortBySessionStartDate"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v18 = v3;
  if (-[SMSessionConfigurationEnumerationOptions ascending](self, "ascending"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[SMSessionConfigurationEnumerationOptions sessionTypes](self, "sessionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[SMSessionConfigurationEnumerationOptions timeInADayInterval](self, "timeInADayInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SMSessionConfigurationEnumerationOptions pickOneConfigInTimeInADayInterval](self, "pickOneConfigInTimeInADayInterval"))
  {
    v8 = CFSTR("YES");
  }
  else
  {
    v8 = CFSTR("NO");
  }
  -[SMSessionConfigurationEnumerationOptions dateInterval](self, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfigurationEnumerationOptions startBoundingBoxLocation](self, "startBoundingBoxLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfigurationEnumerationOptions destinationBoundingBoxLocation](self, "destinationBoundingBoxLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionConfigurationEnumerationOptions boundingBoxRadius](self, "boundingBoxRadius");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;
  -[SMSessionConfigurationEnumerationOptions sessionIdentifier](self, "sessionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("batchSize, %lu, fetchLimit, %lu, sortBySessionStartDate, %@, ascending, %@, session types count, %lu, timeInADayInterval, %@, pickOneConfigInTimeInADayInterval, %@, dateInterval, %@, startBoundingBoxLocation, %@, destinationBoundingBoxLocation, %@, boundingBoxRadius, %.3f, sessionIdentifier, %@"), v20, v19, v18, v4, v6, v7, v8, v9, v10, v11, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)sortBySessionStartDate
{
  return self->_sortBySessionStartDate;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSArray)sessionTypes
{
  return self->_sessionTypes;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (NSDateComponents)endDateComponents
{
  return self->_endDateComponents;
}

- (NSDateInterval)timeInADayInterval
{
  return self->_timeInADayInterval;
}

- (BOOL)pickOneConfigInTimeInADayInterval
{
  return self->_pickOneConfigInTimeInADayInterval;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (CLLocation)startBoundingBoxLocation
{
  return self->_startBoundingBoxLocation;
}

- (void)setStartBoundingBoxLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLLocation)destinationBoundingBoxLocation
{
  return self->_destinationBoundingBoxLocation;
}

- (void)setDestinationBoundingBoxLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)boundingBoxRadius
{
  return self->_boundingBoxRadius;
}

- (void)setBoundingBoxRadius:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxRadius, 0);
  objc_storeStrong((id *)&self->_destinationBoundingBoxLocation, 0);
  objc_storeStrong((id *)&self->_startBoundingBoxLocation, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_timeInADayInterval, 0);
  objc_storeStrong((id *)&self->_endDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionTypes, 0);
}

@end
