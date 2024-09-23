@implementation PKPassShareTimeConfiguration

- (PKPassShareTimeConfiguration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  NSDate *v6;
  NSDate *startDate;
  NSDate *v8;
  NSDate *expirationDate;
  void *v10;
  NSArray *v11;
  NSArray *schedules;
  uint64_t v13;
  void *v14;
  PKPassShareTimeSchedule *v15;
  PKPassShareTimeSchedule *v16;
  NSArray *v17;
  NSArray *v18;
  PKPassShareTimeConfiguration *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_15;
  v21.receiver = self;
  v21.super_class = (Class)PKPassShareTimeConfiguration;
  self = -[PKPassShareTimeConfiguration init](&v21, sel_init);
  if (self)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("timeSupport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_support = PKPassShareTimeConfigurationSupportFromString(v5);

    objc_msgSend(v4, "PKDateForKey:", CFSTR("startDate"));
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startDate = self->_startDate;
    self->_startDate = v6;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("expirationDate"));
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    expirationDate = self->_expirationDate;
    self->_expirationDate = v8;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("schedules"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_103);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    schedules = self->_schedules;
    self->_schedules = v11;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("schedule"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (!self->_schedules && v13)
    {
      v15 = -[PKPassShareTimeSchedule initWithDictionary:]([PKPassShareTimeSchedule alloc], "initWithDictionary:", v13);
      v16 = v15;
      if (v15)
      {
        v22[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v18 = self->_schedules;
        self->_schedules = v17;

      }
    }
    if (self->_support || self->_startDate || self->_expirationDate || self->_schedules)
    {

      goto LABEL_13;
    }

LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
LABEL_13:
  self = self;
  v19 = self;
LABEL_16:

  return v19;
}

PKPassShareTimeSchedule *__51__PKPassShareTimeConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPassShareTimeSchedule *v3;

  v2 = a2;
  v3 = -[PKPassShareTimeSchedule initWithDictionary:]([PKPassShareTimeSchedule alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  NSDate *startDate;
  void *v8;
  NSDate *expirationDate;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  v5 = self->_support - 1;
  if (v5 > 2)
    v6 = CFSTR("none");
  else
    v6 = off_1E2ACE2D8[v5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("timeSupport"));
  startDate = self->_startDate;
  if (startDate)
  {
    PKW3CDateStringFromDate(startDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("startDate"));

  }
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    PKW3CDateStringFromDate(expirationDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("expirationDate"));

  }
  -[NSArray pk_arrayByApplyingBlock:](self->_schedules, "pk_arrayByApplyingBlock:", &__block_literal_global_30_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("schedules"));

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

uint64_t __56__PKPassShareTimeConfiguration_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (BOOL)isEmpty
{
  return !self->_startDate && !self->_expirationDate && -[NSArray count](self->_schedules, "count") == 0;
}

- (id)intersect:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;
  PKPassShareTimeConfiguration *v10;
  NSDate *v11;
  NSDate *v12;
  id v13;
  void *v14;
  NSDate *v15;
  NSDate *v16;
  NSDate *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSDate *v25;
  void *v26;
  NSDate *v27;
  NSDate *v28;
  NSDate *v29;
  NSDate *v30;
  void *v31;
  unint64_t support;
  PKPassShareTimeConfiguration *v34;
  void *v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  PKPassShareTimeConfiguration *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self->_startDate;
    v6 = (NSDate *)*((id *)v4 + 2);
    v7 = v6;
    if ((v5 != 0) == (v6 != 0))
    {
      -[NSDate laterDate:](v5, "laterDate:", v6);
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5)
        v8 = v5;
      else
        v8 = v6;
      v9 = v8;
    }
    v11 = v9;
    v12 = self->_expirationDate;
    v13 = *((id *)v4 + 3);
    v14 = v13;
    if ((v12 != 0) == (v13 != 0))
    {
      objc_msgSend(v13, "earlierDate:", v13);
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12)
        v15 = v12;
      else
        v15 = v7;
      v16 = v15;
    }
    v17 = v16;
    if (v11 && v16 && -[NSDate compare:](v11, "compare:", v16) == NSOrderedDescending)
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      v36 = v18;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v39 = self;
        v40 = 2112;
        v41 = v4;
        _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "PKPassShareTimeConfiguration: Intersected time configurations and found start date after expiration date. \n lhs: %@ \n\n rhs: %@", buf, 0x16u);
      }
      v19 = 0;
      v10 = 0;
      goto LABEL_39;
    }
    -[NSArray firstObject](self->_schedules, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v4 + 4), "firstObject");
    v21 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v21;
    v36 = (void *)v20;
    if ((v20 != 0) == (v21 != 0))
    {
      if (v20 | v21)
      {
        objc_msgSend((id)v20, "intersect:", v21);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          PKLogFacilityTypeGetObject(0x20uLL);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v39 = (PKPassShareTimeConfiguration *)v20;
            v40 = 2112;
            v41 = v35;
            _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "PKPassShareTimeConfiguration: Intersected schedules and found no common schedule. \n lhs: %@ \n\n rhs: %@", buf, 0x16u);
          }

          v19 = 0;
          v10 = 0;
          goto LABEL_38;
        }
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      if (v20)
        v22 = (void *)v20;
      else
        v22 = (void *)v21;
      v19 = v22;
    }
    v10 = objc_alloc_init(PKPassShareTimeConfiguration);
    -[PKPassShareTimeConfiguration setStartDate:](v10, "setStartDate:", v11);
    -[PKPassShareTimeConfiguration setExpirationDate:](v10, "setExpirationDate:", v17);
    if (v19)
    {
      v37 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v34 = self;
      v24 = v4;
      v25 = v17;
      v26 = v14;
      v27 = v12;
      v28 = v11;
      v29 = v7;
      v30 = v5;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassShareTimeConfiguration setSchedules:](v10, "setSchedules:", v31);

      v5 = v30;
      v7 = v29;
      v11 = v28;
      v12 = v27;
      v14 = v26;
      v17 = v25;
      v4 = v24;
      self = v34;
    }
    if (self->_support >= *((_QWORD *)v4 + 1))
      support = *((_QWORD *)v4 + 1);
    else
      support = self->_support;
    -[PKPassShareTimeConfiguration setSupport:](v10, "setSupport:", support);
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  v10 = self;
LABEL_40:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShareTimeConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPassShareTimeConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSDate *startDate;
  uint64_t v9;
  NSDate *expirationDate;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *schedules;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassShareTimeConfiguration;
  v5 = -[PKPassShareTimeConfiguration init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("support"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_support = PKPassShareTimeConfigurationSupportFromString(v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v7 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("schedules"));
    v14 = objc_claimAutoreleasedReturnValue();
    schedules = v5->_schedules;
    v5->_schedules = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  id v6;

  v4 = self->_support - 1;
  if (v4 > 2)
    v5 = CFSTR("none");
  else
    v5 = off_1E2ACE2D8[v4];
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("support"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_schedules, CFSTR("schedules"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_support - 1;
  if (v7 > 2)
    v8 = CFSTR("none");
  else
    v8 = off_1E2ACE2D8[v7];
  objc_msgSend(v6, "appendFormat:", CFSTR("support: '%@'; "), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR("startDate: '%@'; "), self->_startDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("expirationDate: '%@'; "), self->_expirationDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("schedules: '%@'; "), self->_schedules);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_startDate)
    objc_msgSend(v3, "addObject:");
  if (self->_expirationDate)
    objc_msgSend(v4, "addObject:");
  if (self->_schedules)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_support - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPassShareTimeConfiguration *v4;
  PKPassShareTimeConfiguration *v5;
  BOOL v6;

  v4 = (PKPassShareTimeConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassShareTimeConfiguration isEqualToPassShareTimeConfiguration:](self, "isEqualToPassShareTimeConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToPassShareTimeConfiguration:(id)a3
{
  _QWORD *v4;
  NSDate *startDate;
  NSDate *v6;
  BOOL v7;
  NSDate *expirationDate;
  NSDate *v9;
  NSArray *schedules;
  NSArray *v11;
  char v12;

  v4 = a3;
  if (!v4)
    goto LABEL_17;
  startDate = self->_startDate;
  v6 = (NSDate *)v4[2];
  if (startDate)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (startDate != v6)
      goto LABEL_17;
  }
  else if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
  {
    goto LABEL_17;
  }
  expirationDate = self->_expirationDate;
  v9 = (NSDate *)v4[3];
  if (!expirationDate || !v9)
  {
    if (expirationDate == v9)
      goto LABEL_13;
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0)
    goto LABEL_17;
LABEL_13:
  schedules = self->_schedules;
  v11 = (NSArray *)v4[4];
  if (schedules && v11)
    v12 = -[NSArray isEqual:](schedules, "isEqual:");
  else
    v12 = schedules == v11;
LABEL_18:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassShareTimeConfiguration *v4;
  uint64_t v5;
  NSDate *startDate;
  uint64_t v7;
  NSDate *expirationDate;
  uint64_t v9;
  NSArray *schedules;

  v4 = -[PKPassShareTimeConfiguration init](+[PKPassShareTimeConfiguration allocWithZone:](PKPassShareTimeConfiguration, "allocWithZone:", a3), "init");
  v4->_support = self->_support;
  v5 = -[NSDate copy](self->_startDate, "copy");
  startDate = v4->_startDate;
  v4->_startDate = (NSDate *)v5;

  v7 = -[NSDate copy](self->_expirationDate, "copy");
  expirationDate = v4->_expirationDate;
  v4->_expirationDate = (NSDate *)v7;

  -[NSArray pk_arrayByApplyingBlock:](self->_schedules, "pk_arrayByApplyingBlock:", &__block_literal_global_51_0);
  v9 = objc_claimAutoreleasedReturnValue();
  schedules = v4->_schedules;
  v4->_schedules = (NSArray *)v9;

  return v4;
}

id __45__PKPassShareTimeConfiguration_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

- (unint64_t)support
{
  return self->_support;
}

- (void)setSupport:(unint64_t)a3
{
  self->_support = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSArray)schedules
{
  return self->_schedules;
}

- (void)setSchedules:(id)a3
{
  objc_storeStrong((id *)&self->_schedules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedules, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
