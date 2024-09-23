@implementation NFReaderOperation

- (id)description
{
  NSDateFormatter *v3;
  id v4;
  NSString *operation;
  void *v6;
  id v7;

  v3 = objc_opt_new(NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSS"));
  v4 = objc_alloc((Class)NSString);
  operation = self->_operation;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", self->_date));
  v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ : %@"), operation, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("Date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operation, CFSTR("Operation"));

}

- (NFReaderOperation)initWithCoder:(id)a3
{
  id v4;
  NFReaderOperation *v5;
  id v6;
  uint64_t v7;
  NSDate *date;
  id v9;
  uint64_t v10;
  NSString *operation;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFReaderOperation;
  v5 = -[NFReaderOperation init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("Date"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    date = v5->_date;
    v5->_date = (NSDate *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("Operation"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    operation = v5->_operation;
    v5->_operation = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
