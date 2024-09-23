@implementation RTPersistenceMirroringPolicy

- (RTPersistenceMirroringPolicy)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQualityOfService_tokenBucket_);
}

- (RTPersistenceMirroringPolicy)initWithQualityOfService:(int64_t)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  RTPersistenceMirroringPolicy *v11;

  if (a3 == 3)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18520]), "initWithFillRate:capacity:", INFINITY, INFINITY);
  }
  else
  {
    if (a3 == 2)
    {
      v5 = objc_alloc(MEMORY[0x1E0D18520]);
      v6 = 0.0166666667;
      v7 = 1.0;
      v8 = 1.0;
    }
    else
    {
      if (a3 != 1)
      {
        v10 = 0;
        goto LABEL_10;
      }
      v5 = objc_alloc(MEMORY[0x1E0D18520]);
      v6 = 155520000.0;
      v7 = 2.0;
      v8 = 0.0;
    }
    v9 = objc_msgSend(v5, "initWithFillRate:capacity:initialAllocation:", v6, v7, v8);
  }
  v10 = (void *)v9;
LABEL_10:
  v11 = -[RTPersistenceMirroringPolicy initWithQualityOfService:tokenBucket:](self, "initWithQualityOfService:tokenBucket:", a3, v10);

  return v11;
}

- (RTPersistenceMirroringPolicy)initWithQualityOfService:(int64_t)a3 tokenBucket:(id)a4
{
  id v6;
  RTPersistenceMirroringPolicy *v7;
  RTPersistenceMirroringPolicy *v8;
  RTTokenBucket *v9;
  RTTokenBucket *tokenBucket;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTPersistenceMirroringPolicy;
  v7 = -[RTPersistenceMirroringPolicy init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_qualityOfService = a3;
    if (v6)
      v9 = (RTTokenBucket *)v6;
    else
      v9 = (RTTokenBucket *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18520]), "initWithFillRate:capacity:", INFINITY, INFINITY);
    tokenBucket = v8->_tokenBucket;
    v8->_tokenBucket = v9;

  }
  return v8;
}

- (BOOL)allowsMirroringViaCellular
{
  return self->_qualityOfService == 3;
}

- (BOOL)mirroringOperationAllowed
{
  return -[RTTokenBucket operationAllowed](self->_tokenBucket, "operationAllowed");
}

- (double)timeIntervalUntilOperationAllowed
{
  double result;

  -[RTTokenBucket timeIntervalUntilOperationAllowed](self->_tokenBucket, "timeIntervalUntilOperationAllowed");
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[RTPersistenceMirroringPolicy qualityOfService](self, "qualityOfService");
  -[RTPersistenceMirroringPolicy tokenBucket](self, "tokenBucket");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithQualityOfService:tokenBucket:", v5, v6);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTPersistenceMirroringPolicy qualityOfServiceToString:](self, "qualityOfServiceToString:", self->_qualityOfService);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceMirroringPolicy timeIntervalUntilOperationAllowed](self, "timeIntervalUntilOperationAllowed");
  v6 = v5;
  v7 = -[RTPersistenceMirroringPolicy allowsMirroringViaCellular](self, "allowsMirroringViaCellular");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("QoS, %@, time until operation allowed, %f, cellular, %@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)qualityOfServiceToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E92A33E0[a3];
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (RTTokenBucket)tokenBucket
{
  return self->_tokenBucket;
}

- (void)setTokenBucket:(id)a3
{
  objc_storeStrong((id *)&self->_tokenBucket, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenBucket, 0);
}

@end
