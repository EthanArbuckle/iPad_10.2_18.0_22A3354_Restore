@implementation PACompleteAccessRecord

- (PACompleteAccessRecord)initWithAccess:(id)a3 startTime:(double)a4 endTime:(double)a5
{
  id v9;
  PACompleteAccessRecord *v10;
  PACompleteAccessRecord *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PACompleteAccessRecord;
  v10 = -[PACompleteAccessRecord init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_access, a3);
    v11->_startTime = a4;
    v11->_endTime = a5;
  }

  return v11;
}

- (double)duration
{
  return self->_endTime - self->_startTime;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  PAAccess *access;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  access = self->_access;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ access:<%@> startTime:%@ endTime:%@>"), v4, access, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[PAAccess hash](self->_access, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PACompleteAccessRecord *v4;
  BOOL v5;

  v4 = (PACompleteAccessRecord *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else if (-[PACompleteAccessRecord isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[PACompleteAccessRecord isEqualToAccessRecord:](self, "isEqualToAccessRecord:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToAccessRecord:(id)a3
{
  id v4;
  PAAccess *access;
  void *v6;
  double startTime;
  double v8;
  double endTime;
  double v10;
  BOOL v11;

  v4 = a3;
  access = self->_access;
  objc_msgSend(v4, "access");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PAAccess isEqual:](access, "isEqual:", v6)
    && (startTime = self->_startTime, objc_msgSend(v4, "startTime"), startTime == v8))
  {
    endTime = self->_endTime;
    objc_msgSend(v4, "endTime");
    v11 = endTime == v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("endTime"), self->_endTime);

}

- (PACompleteAccessRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PACompleteAccessRecord *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("access"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endTime"));
  v9 = v8;

  v10 = -[PACompleteAccessRecord initWithAccess:startTime:endTime:](self, "initWithAccess:startTime:endTime:", v5, v7, v9);
  return v10;
}

- (PAAccess)access
{
  return self->_access;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
}

@end
