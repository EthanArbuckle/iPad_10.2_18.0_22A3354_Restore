@implementation SPCBPeripheralKeyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralKeyRequest)initWithDate:(id)a3 requestParameters:(id)a4
{
  id v6;
  id v7;
  SPCBPeripheralKeyRequest *v8;
  uint64_t v9;
  NSDate *date;
  uint64_t v11;
  NSArray *requestParameters;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPCBPeripheralKeyRequest;
  v8 = -[SPCBPeripheralKeyRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    v11 = objc_msgSend(v7, "copy");
    requestParameters = v8->_requestParameters;
    v8->_requestParameters = (NSArray *)v11;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SPCBPeripheralKeyRequest date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

  -[SPCBPeripheralKeyRequest requestParameters](self, "requestParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("requestParameters"));

}

- (SPCBPeripheralKeyRequest)initWithCoder:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *date;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *requestParameters;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v5;

  v7 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("requestParameters"));
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

  requestParameters = self->_requestParameters;
  self->_requestParameters = v10;

  return self;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPCBPeripheralKeyRequest date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCBPeripheralKeyRequest requestParameters](self, "requestParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@: date=%@, paramCount=%lu]"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)requestParameters
{
  return self->_requestParameters;
}

- (void)setRequestParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
