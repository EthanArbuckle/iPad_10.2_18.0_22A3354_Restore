@implementation NIAlgorithmConvergence

- (NIAlgorithmConvergence)initWithStatus:(int64_t)a3 andReasons:(id)a4
{
  id v7;
  NIAlgorithmConvergence *v8;
  NIAlgorithmConvergence *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NIAlgorithmConvergence;
  v8 = -[NIAlgorithmConvergence init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_reasons, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSArray *v4;
  NIAlgorithmConvergence *v5;

  if (self->_reasons)
    v4 = -[NSArray initWithArray:copyItems:](+[NSArray allocWithZone:](NSArray, "allocWithZone:", a3), "initWithArray:copyItems:", self->_reasons, 1);
  else
    v4 = 0;
  v5 = -[NIAlgorithmConvergence initWithStatus:andReasons:]([NIAlgorithmConvergence alloc], "initWithStatus:andReasons:", self->_status, v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *reasons;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  reasons = self->_reasons;
  if (reasons)
    objc_msgSend(v5, "encodeObject:forKey:", reasons, CFSTR("reasons"));

}

- (NIAlgorithmConvergence)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NIAlgorithmConvergence *v13;
  _QWORD v15[2];

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("reasons")))
  {
    v10 = 0;
    goto LABEL_5;
  }
  v15[0] = objc_opt_class(NSArray, v6);
  v15[1] = objc_opt_class(NSString, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("reasons")));

  v12 = objc_opt_class(NSArray, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
  {
LABEL_5:
    v13 = -[NIAlgorithmConvergence initWithStatus:andReasons:]([NIAlgorithmConvergence alloc], "initWithStatus:andReasons:", v5, v10);
    goto LABEL_6;
  }
  v13 = 0;
LABEL_6:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  int64_t status;
  void *v10;
  BOOL v11;
  char v12;
  void *v13;
  unsigned __int8 v14;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = objc_msgSend(v7, "status");
    status = self->_status;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reasons"));
    if (v10)
      v11 = 0;
    else
      v11 = self->_reasons == 0;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reasons"));
    v14 = objc_msgSend(v13, "isEqualToArray:", self->_reasons);

    if (v8 == (id)status)
      v12 = v11 | v14;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_status));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (unint64_t)-[NSArray hash](self->_reasons, "hash") ^ v4;

  return v5;
}

- (id)reasonsPrivate
{
  return self->_reasons;
}

- (NIAlgorithmConvergenceStatus)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end
