@implementation RTPeopleDensitySingleRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)startDatetime
{
  return self->_startDatetime;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t advertisementsCount;
  id v5;

  advertisementsCount = self->_advertisementsCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", advertisementsCount, CFSTR("numOfAdvs"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->_scanDuration);
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDatetime, CFSTR("startDatetime"));

}

- (void)setStartDatetime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RTPeopleDensitySingleRecord)initWithStats:(unint64_t)a3 scanDuration:(double)a4
{
  RTPeopleDensitySingleRecord *v6;
  RTPeopleDensitySingleRecord *v7;
  NSDate *startDatetime;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RTPeopleDensitySingleRecord;
  v6 = -[RTPeopleDensitySingleRecord init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_advertisementsCount = a3;
    v6->_scanDuration = a4;
    startDatetime = v6->_startDatetime;
    v6->_startDatetime = 0;

  }
  return v7;
}

- (RTPeopleDensitySingleRecord)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStats_scanDuration_);
}

- (id)descriptionDictionary
{
  void *v3;
  void *v4;
  NSDate *startDatetime;
  __CFString *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("numOfAdvs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_advertisementsCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scanDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("startDatetime");
  startDatetime = self->_startDatetime;
  if (startDatetime)
  {
    -[NSDate getFormattedDateString](startDatetime, "getFormattedDateString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("-");
  }
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (startDatetime)

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTPeopleDensitySingleRecord descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v2, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStats:scanDuration:", self->_advertisementsCount, self->_scanDuration);
}

- (RTPeopleDensitySingleRecord)initWithCoder:(id)a3
{
  id v4;
  RTPeopleDensitySingleRecord *v5;
  double v6;
  uint64_t v7;
  NSDate *startDatetime;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTPeopleDensitySingleRecord;
  v5 = -[RTPeopleDensitySingleRecord init](&v10, sel_init);
  if (v5)
  {
    v5->_advertisementsCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numOfAdvs"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_scanDuration = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDatetime"));
    v7 = objc_claimAutoreleasedReturnValue();
    startDatetime = v5->_startDatetime;
    v5->_startDatetime = (NSDate *)v7;

  }
  return v5;
}

- (unint64_t)advertisementsCount
{
  return self->_advertisementsCount;
}

- (double)scanDuration
{
  return self->_scanDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDatetime, 0);
}

@end
