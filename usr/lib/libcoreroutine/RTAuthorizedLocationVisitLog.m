@implementation RTAuthorizedLocationVisitLog

+ (id)createWithManagedObject:(id)a3
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
      v15 = "+[RTAuthorizedLocationVisitLog(RTCoreDataTransformable) createWithManagedObject:]";
      v16 = 1024;
      v17 = 31;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTAuthorizedLocationVisitLog+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);

    }
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "createWithAuthorizedLocationVisitLogMO:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

+ (id)createWithAuthorizedLocationVisitLogMO:(id)a3
{
  id v3;
  uint64_t v4;
  RTAuthorizedLocationVisitLog *v5;
  void *v6;
  void *v7;
  RTAuthorizedLocationVisitLog *v8;

  v3 = a3;
  if (objc_msgSend(v3, "locationTechnologyAvailability"))
    v4 = objc_msgSend(v3, "locationTechnologyAvailability");
  else
    v4 = 0;
  v5 = [RTAuthorizedLocationVisitLog alloc];
  objc_msgSend(v3, "visitIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registrationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RTAuthorizedLocationVisitLog initWithVisitIdentifier:registrationDate:locationTechnologyAvailability:](v5, "initWithVisitIdentifier:registrationDate:locationTechnologyAvailability:", v6, v7, v4);

  return v8;
}

- (id)managedObjectWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTAuthorizedLocationVisitLogMO managedObjectWithAuthorizedLocationVisitLog:inManagedObjectContext:](RTAuthorizedLocationVisitLogMO, "managedObjectWithAuthorizedLocationVisitLog:inManagedObjectContext:", self, a3);
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

- (RTAuthorizedLocationVisitLog)initWithVisitIdentifier:(id)a3 registrationDate:(id)a4 locationTechnologyAvailability:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  RTAuthorizedLocationVisitLog *v12;
  RTAuthorizedLocationVisitLog *v13;
  RTAuthorizedLocationVisitLog *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: visitIdentifier";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: registrationDate";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTAuthorizedLocationVisitLog;
  v12 = -[RTAuthorizedLocationVisitLog init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_visitIdentifier, a3);
    objc_storeStrong((id *)&v13->_registrationDate, a4);
    v13->_locationTechnologyAvailability = a5;
  }
  self = v13;
  v14 = self;
LABEL_10:

  return v14;
}

+ (id)encodeTimeSourceWithValue:(id)a3 isTrusted:(BOOL)a4 isRetroRegistration:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;

  v5 = a5;
  v6 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v8 = floor(v7);
  v9 = 0.5;
  if (v6)
    v9 = 0.0;
  if (v5)
    v9 = 0.25;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v9 + v8);
}

+ (BOOL)decodeTimeSourceWithValue:(id)a3 isRetroRegistration:(BOOL *)a4 isTrusted:(BOOL *)a5
{
  id v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;

  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (a4 && a5)
  {
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v13 = v11 - floor(v12);
    if (fabs(v13 + -0.25) < 0.001)
    {
      v14 = 0;
      v15 = 1;
LABEL_9:
      *a4 = v15;
      *a5 = v14;
      v9 = 1;
      goto LABEL_10;
    }
    if (fabs(v13 + -0.5) < 0.001)
    {
      v15 = 0;
      v14 = 0;
      goto LABEL_9;
    }
    v9 = 0;
    if (fabs(v13) < 0.001)
    {
      v15 = 0;
      v14 = 1;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *visitIdentifier;
  id v5;

  visitIdentifier = self->_visitIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", visitIdentifier, CFSTR("visitIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_registrationDate, CFSTR("registrationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_locationTechnologyAvailability, CFSTR("locationTechnologyAvailability"));

}

- (RTAuthorizedLocationVisitLog)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  RTAuthorizedLocationVisitLog *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visitIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registrationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationTechnologyAvailability"));

  v8 = -[RTAuthorizedLocationVisitLog initWithVisitIdentifier:registrationDate:locationTechnologyAvailability:](self, "initWithVisitIdentifier:registrationDate:locationTechnologyAvailability:", v5, v6, v7);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSUUID *visitIdentifier;
  void *v7;
  int v8;
  NSDate *registrationDate;
  void *v10;
  char v11;
  unint64_t locationTechnologyAvailability;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  visitIdentifier = self->_visitIdentifier;
  objc_msgSend(v4, "visitIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSUUID isEqual:](visitIdentifier, "isEqual:", v7);

  registrationDate = self->_registrationDate;
  objc_msgSend(v4, "registrationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSDate isEqual:](registrationDate, "isEqual:", v10);

  locationTechnologyAvailability = self->_locationTechnologyAvailability;
  v13 = objc_msgSend(v4, "locationTechnologyAvailability");

  if (locationTechnologyAvailability == v13)
    v14 = v11;
  else
    v14 = 0;
  if (!v8)
    v14 = 0;
  return v5 && v14;
}

- (NSString)description
{
  _BOOL4 v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t locationTechnologyAvailability;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;

  v14 = 0;
  v3 = +[RTAuthorizedLocationVisitLog decodeTimeSourceWithValue:isRetroRegistration:isTrusted:](RTAuthorizedLocationVisitLog, "decodeTimeSourceWithValue:isRetroRegistration:isTrusted:", self->_registrationDate, (char *)&v14 + 1, &v14);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_visitIdentifier, "UUIDString");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "UTF8String");
  -[NSDate stringFromDate](self->_registrationDate, "stringFromDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  locationTechnologyAvailability = self->_locationTechnologyAvailability;
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Visit UUID, %s, registrationDate, %@, locationTechnologyAvailability, %lu, isRetroRegistration, %d, isTrustedTime, %d"), v6, v7, locationTechnologyAvailability, HIBYTE(v14), v14);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Visit UUID, %s, registrationDate, %@, locationTechnologyAvailability, %lu"), v6, v7, locationTechnologyAvailability, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSUUID)visitIdentifier
{
  return self->_visitIdentifier;
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (unint64_t)locationTechnologyAvailability
{
  return self->_locationTechnologyAvailability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_visitIdentifier, 0);
}

@end
