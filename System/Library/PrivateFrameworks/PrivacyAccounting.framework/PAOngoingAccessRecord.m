@implementation PAOngoingAccessRecord

- (PAOngoingAccessRecord)initWithAccess:(id)a3 startTime:(double)a4
{
  id v7;
  PAOngoingAccessRecord *v8;
  PAOngoingAccessRecord *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PAOngoingAccessRecord;
  v8 = -[PAOngoingAccessRecord init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_access, a3);
    v9->_startTime = a4;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  PAAccess *access;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  access = self->_access;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ access:<%@> startTime:%@>"), v4, access, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[PAAccess hash](self->_access, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PAOngoingAccessRecord *v4;
  PAOngoingAccessRecord *v5;
  PAAccess *access;
  void *v7;
  double startTime;
  double v9;
  BOOL v10;

  v4 = (PAOngoingAccessRecord *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (-[PAOngoingAccessRecord isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    access = self->_access;
    -[PAOngoingAccessRecord access](v5, "access");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PAAccess isEqual:](access, "isEqual:", v7))
    {
      startTime = self->_startTime;
      -[PAOngoingAccessRecord startTime](v5, "startTime");
      v10 = startTime == v9;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  PAAccess *access;
  id v5;

  access = self->_access;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", access, CFSTR("access"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);

}

- (PAOngoingAccessRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  PAOngoingAccessRecord *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("access"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
  v7 = v6;

  v8 = -[PAOngoingAccessRecord initWithAccess:startTime:](self, "initWithAccess:startTime:", v5, v7);
  return v8;
}

- (PAAccess)access
{
  return self->_access;
}

- (double)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
}

@end
