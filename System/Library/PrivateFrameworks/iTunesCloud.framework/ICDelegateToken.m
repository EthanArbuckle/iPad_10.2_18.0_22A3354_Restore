@implementation ICDelegateToken

- (ICDelegateToken)initWithType:(int64_t)a3 data:(id)a4
{
  return -[ICDelegateToken initWithType:data:expirationDate:](self, "initWithType:data:expirationDate:", a3, a4, 0);
}

- (ICDelegateToken)initWithType:(int64_t)a3 data:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ICDelegateToken *v11;
  uint64_t v12;
  NSData *data;
  uint64_t v14;
  NSDate *expirationDate;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3 != 1 || v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)ICDelegateToken;
    v11 = -[ICDelegateToken init](&v17, sel_init);
    if (v11)
    {
      v12 = objc_msgSend(v8, "copy");
      data = v11->_data;
      v11->_data = (NSData *)v12;

      v14 = objc_msgSend(v10, "copy");
      expirationDate = v11->_expirationDate;
      v11->_expirationDate = (NSDate *)v14;

      v11->_type = a3;
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Missing required expirationDate"));
    v11 = 0;
  }

  return v11;
}

- (BOOL)expiresBeforeDate:(id)a3
{
  NSDate *expirationDate;

  expirationDate = self->_expirationDate;
  if (expirationDate)
    LOBYTE(expirationDate) = -[NSDate compare:](expirationDate, "compare:", a3) == NSOrderedAscending;
  return (char)expirationDate;
}

- (BOOL)isExpired
{
  id v3;
  BOOL v4;

  if (!self->_expirationDate)
    return 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v4 = -[NSDate compare:](self->_expirationDate, "compare:", v3) == NSOrderedAscending;

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  int64_t type;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  type = self->_type;
  if (type == 1)
  {
    v6 = CFSTR("Type: CloudCredentials");
  }
  else
  {
    if (type)
      goto LABEL_6;
    v6 = CFSTR("Type: PICRequest");
  }
  objc_msgSend(v3, "addObject:", v6);
LABEL_6:
  if (self->_expirationDate)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expires: %@"), self->_expirationDate);
    objc_msgSend(v4, "addObject:", v7);

  }
  if (self->_data)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Data: %ld Bytes"), -[NSData length](self->_data, "length"));
    objc_msgSend(v4, "addObject:", v8);

  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)ICDelegateToken;
  -[ICDelegateToken description](&v14, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("; "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ [%@]"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_data, "hash");
  v4 = -[NSDate hash](self->_expirationDate, "hash");
  v5 = 1;
  if (self->_type == 1)
    v5 = 2;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *expirationDate;
  NSDate *v6;
  char v7;
  NSData *data;
  NSData *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_type != v4[2])
    goto LABEL_11;
  expirationDate = self->_expirationDate;
  v6 = (NSDate *)v4[3];
  if (expirationDate != v6)
  {
    v7 = 0;
    if (!expirationDate || !v6)
      goto LABEL_12;
    if (!-[NSDate isEqualToDate:](expirationDate, "isEqualToDate:"))
    {
LABEL_11:
      v7 = 0;
      goto LABEL_12;
    }
  }
  data = self->_data;
  v9 = (NSData *)v4[1];
  if (data == v9)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (data && v9)
      v7 = -[NSData isEqualToData:](data, "isEqualToData:");
  }
LABEL_12:

  return v7;
}

- (ICDelegateToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICDelegateToken *v6;
  ICDelegateToken *v7;
  uint64_t v8;
  NSDate *expirationDate;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICDelegateToken;
    v6 = -[ICDelegateToken init](&v11, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_data, v5);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e"));
      v8 = objc_claimAutoreleasedReturnValue();
      expirationDate = v7->_expirationDate;
      v7->_expirationDate = (NSDate *)v8;

      v7->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t"));
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("d"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("e"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("t"));

}

- (NSData)data
{
  return self->_data;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
