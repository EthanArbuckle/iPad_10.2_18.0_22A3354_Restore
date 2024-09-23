@implementation PPFuzzyContactQuery

- (void)encodeWithCoder:(id)a3
{
  NSSet *sourceBundleIds;
  id v5;
  id v6;

  sourceBundleIds = self->_sourceBundleIds;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceBundleIds, CFSTR("bids"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("sd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("ed"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onlyAddressBook);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("ab"));

}

- (PPFuzzyContactQuery)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  PPFuzzyContactQuery *v25;
  NSObject *v26;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0D81610];
  v7 = (void *)MEMORY[0x18D7805AC]();
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v7);
  pp_contacts_log_handle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("bids"), v4, 0, CFSTR("PPErrorDomain"), 23, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = objc_opt_class();
  pp_contacts_log_handle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("sd"), v4, 0, CFSTR("PPErrorDomain"), 23, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D81610];
  v18 = objc_opt_class();
  pp_contacts_log_handle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("ed"), v4, 0, CFSTR("PPErrorDomain"), 23, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D81610];
  v22 = objc_opt_class();
  pp_contacts_log_handle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("ab"), v4, 1, CFSTR("PPErrorDomain"), 23, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v5, "setSourceBundleIds:", v12);
    objc_msgSend(v5, "setStartDate:", v16);
    objc_msgSend(v5, "setEndDate:", v20);
    objc_msgSend(v5, "setOnlyAddressBook:", objc_msgSend(v24, "BOOLValue"));
    v25 = v5;
  }
  else
  {
    pp_contacts_log_handle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18BE3A000, v26, OS_LOG_TYPE_ERROR, "PPFuzzyContactQuery: decoding failed for address book state", buf, 2u);
    }

    v25 = 0;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PPFuzzyContactQuery *v4;

  v4 = -[PPFuzzyContactQuery init](+[PPFuzzyContactQuery allocWithZone:](PPFuzzyContactQuery, "allocWithZone:", a3), "init");
  -[PPFuzzyContactQuery setSourceBundleIds:](v4, "setSourceBundleIds:", self->_sourceBundleIds);
  -[PPFuzzyContactQuery setStartDate:](v4, "setStartDate:", self->_startDate);
  -[PPFuzzyContactQuery setEndDate:](v4, "setEndDate:", self->_endDate);
  -[PPFuzzyContactQuery setOnlyAddressBook:](v4, "setOnlyAddressBook:", self->_onlyAddressBook);
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSSet hash](self->_sourceBundleIds, "hash");
  v4 = -[NSDate hash](self->_startDate, "hash") - v3 + 32 * v3;
  v5 = -[NSDate hash](self->_endDate, "hash") - v4 + 32 * v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onlyAddressBook);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPFuzzyContactQuery ids:'%@' s:'%@' e:'%@' ab:'%d'>"), self->_sourceBundleIds, self->_startDate, self->_endDate, self->_onlyAddressBook);
}

- (BOOL)isEqual:(id)a3
{
  PPFuzzyContactQuery *v4;
  PPFuzzyContactQuery *v5;
  BOOL v6;

  v4 = (PPFuzzyContactQuery *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPFuzzyContactQuery isEqualToFuzzyContactQuery:](self, "isEqualToFuzzyContactQuery:", v5);

  return v6;
}

- (BOOL)isEqualToFuzzyContactQuery:(id)a3
{
  id *v4;
  id *v5;
  NSSet *sourceBundleIds;
  NSSet *v7;
  NSSet *v8;
  NSSet *v9;
  char v10;
  NSDate *startDate;
  NSDate *v12;
  NSDate *v13;
  NSDate *v14;
  char v15;
  NSDate *endDate;
  NSDate *v17;
  NSDate *v18;
  NSDate *v19;
  char v20;
  BOOL v21;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  sourceBundleIds = self->_sourceBundleIds;
  v7 = (NSSet *)v4[2];
  if (sourceBundleIds == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = sourceBundleIds;
    v10 = -[NSSet isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_12;
  }
  startDate = self->_startDate;
  v12 = (NSDate *)v5[3];
  if (startDate == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = startDate;
    v15 = -[NSDate isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_12;
  }
  endDate = self->_endDate;
  v17 = (NSDate *)v5[4];
  if (endDate == v17)
  {

    goto LABEL_14;
  }
  v18 = v17;
  v19 = endDate;
  v20 = -[NSDate isEqual:](v19, "isEqual:", v18);

  if ((v20 & 1) != 0)
  {
LABEL_14:
    v21 = self->_onlyAddressBook == *((unsigned __int8 *)v5 + 8);
    goto LABEL_15;
  }
LABEL_12:
  v21 = 0;
LABEL_15:

  return v21;
}

- (NSSet)sourceBundleIds
{
  return self->_sourceBundleIds;
}

- (void)setSourceBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleIds, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (BOOL)onlyAddressBook
{
  return self->_onlyAddressBook;
}

- (void)setOnlyAddressBook:(BOOL)a3
{
  self->_onlyAddressBook = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sourceBundleIds, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
