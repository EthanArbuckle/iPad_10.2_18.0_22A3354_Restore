@implementation WCAFetchSQLiteResponse

- (WCAFetchSQLiteResponse)initWithRecords:(id)a3
{
  id v3;
  WCAFetchSQLiteResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCAFetchSQLiteResponse;
  v3 = a3;
  v4 = -[WCAFetchSQLiteResponse init](&v6, sel_init);
  -[WCAFetchSQLiteResponse setRecords:](v4, "setRecords:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("records: %@"), self->_records);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCAFetchSQLiteResponse;
  v4 = a3;
  -[WCAFetchResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_records, CFSTR("_records"), v5.receiver, v5.super_class);

}

- (WCAFetchSQLiteResponse)initWithCoder:(id)a3
{
  id v4;
  WCAFetchSQLiteResponse *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *records;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WCAFetchSQLiteResponse;
  v5 = -[WCAFetchResponse initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_records"));
    v11 = objc_claimAutoreleasedReturnValue();
    records = v5->_records;
    v5->_records = (NSArray *)v11;

  }
  return v5;
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
}

@end
