@implementation PPEventQuery

- (void)encodeWithCoder:(id)a3
{
  NSDate *fromDate;
  id v5;

  fromDate = self->_fromDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fromDate, CFSTR("fdt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_toDate, CFSTR("tdt"));

}

- (PPEventQuery)initWithCoder:(id)a3
{
  id v4;
  PPEventQuery *v5;
  NSDate *v6;
  uint64_t v7;
  NSDate *v8;
  BOOL v9;
  NSObject *v10;
  PPEventQuery *v11;
  NSDate *fromDate;
  NSDate *v13;
  NSDate *toDate;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PPEventQuery;
  v5 = -[PPEventQuery init](&v16, sel_init);
  if (!v5)
    goto LABEL_10;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fdt"));
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tdt"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (NSDate *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    fromDate = v5->_fromDate;
    v5->_fromDate = v6;
    v13 = v6;

    toDate = v5->_toDate;
    v5->_toDate = v8;

LABEL_10:
    v11 = v5;
    goto LABEL_11;
  }
  pp_events_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_error_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_ERROR, "failed to decode fromDate or toDate from %@", buf, 0xCu);
  }

  v11 = 0;
LABEL_11:

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPEventQuery f:%@ t:%@>"), self->_fromDate, self->_toDate);
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setFromDate:(id)a3
{
  objc_storeStrong((id *)&self->_fromDate, a3);
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
  objc_storeStrong((id *)&self->_toDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
