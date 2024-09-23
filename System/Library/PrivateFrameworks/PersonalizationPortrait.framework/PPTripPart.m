@implementation PPTripPart

- (PPTripPart)initWithStartDate:(id)a3 endDate:(id)a4 eventIdentifiers:(id)a5 mode:(unsigned __int8)a6 location:(id)a7 fallbackLocationString:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PPTripPart *v18;
  PPTripPart *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PPTripPart;
  v18 = -[PPTripPart init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_eventIdentifiers, a5);
    v19->_tripMode = a6;
    objc_storeStrong((id *)&v19->_mainLocation, a7);
    objc_storeStrong((id *)&v19->_fallbackLocationString, a8);
  }

  return v19;
}

- (PPTripPart)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PPTripPart *v17;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sdt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("edt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("tpm"));
  v10 = (void *)MEMORY[0x18D7805AC]();
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("eid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tploc"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("tpfallloc"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (v7 && v8 && v14)
  {
    self = -[PPTripPart initWithStartDate:endDate:eventIdentifiers:mode:location:fallbackLocationString:](self, "initWithStartDate:endDate:eventIdentifiers:mode:location:fallbackLocationString:", v7, v8, v14, v9, v15, v16);
    v17 = self;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("sdt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("edt"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_tripMode, CFSTR("tpm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventIdentifiers, CFSTR("eid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mainLocation, CFSTR("tploc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fallbackLocationString, CFSTR("tpfallloc"));

}

- (id)destinationString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;

  -[PPTripPart mainLocation](self, "mainLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PPTripPart mainLocation](self, "mainLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locality");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PPTripPart mainLocation](self, "mainLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "country");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && v7)
    {
      v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@, %@"), v5, v7);
LABEL_11:
      v10 = v8;

      return v10;
    }
    if (v5)
    {
      v8 = v5;
      goto LABEL_11;
    }
    if (v7)
    {
      v8 = v7;
      goto LABEL_11;
    }
LABEL_12:
    v10 = &stru_1E226D4B0;
    return v10;
  }
  -[PPTripPart fallbackLocationString](self, "fallbackLocationString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_12;
  -[PPTripPart fallbackLocationString](self, "fallbackLocationString");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDateFormat:", CFSTR("d MMM yyyy"));
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "descriptionForTripMode:", -[PPTripPart tripMode](self, "tripMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPTripPart destinationString](self, "destinationString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPTripPart startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPTripPart endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("[%@] %@, %@ -> %@ "), v5, v6, v8, v10);

  return v11;
}

- (NSArray)eventIdentifiers
{
  return self->_eventIdentifiers;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)startLocation
{
  return self->_startLocation;
}

- (NSString)endLocation
{
  return self->_endLocation;
}

- (CLPlacemark)mainLocation
{
  return self->_mainLocation;
}

- (void)setMainLocation:(id)a3
{
  objc_storeStrong((id *)&self->_mainLocation, a3);
}

- (NSString)fallbackLocationString
{
  return self->_fallbackLocationString;
}

- (void)setFallbackLocationString:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackLocationString, a3);
}

- (unsigned)tripMode
{
  return self->_tripMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackLocationString, 0);
  objc_storeStrong((id *)&self->_mainLocation, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForTripMode:(unsigned __int8)a3
{
  int v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (a3 < 9u)
    return off_1E226C020[a3];
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_fault_impl(&dword_18BE3A000, v5, OS_LOG_TYPE_FAULT, "PPScoredEvent::descriptionForTripMode, unsupported trip mode: %hhu", (uint8_t *)v6, 8u);
  }

  return CFSTR("Unknown");
}

@end
