@implementation SWTransparencyExpiringVerificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SWTransparencyExpiringVerificationResult result](self, "result");
  -[SWTransparencyExpiringVerificationResult expiry](self, "expiry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SWTransparencyVerificationResult: %d expire: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SWTransparencyExpiringVerificationResult)initWithResult:(unint64_t)a3 expiry:(id)a4
{
  id v7;
  SWTransparencyExpiringVerificationResult *v8;
  SWTransparencyExpiringVerificationResult *v9;
  SWTransparencyExpiringVerificationResult *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWTransparencyExpiringVerificationResult;
  v8 = -[SWTransparencyExpiringVerificationResult init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_result = a3;
    objc_storeStrong((id *)&v8->_expiry, a4);
    v10 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t result;
  id v5;

  result = self->_result;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", result, CFSTR("result"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiry, CFSTR("expiry"));

}

- (SWTransparencyExpiringVerificationResult)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  SWTransparencyExpiringVerificationResult *v7;
  SWTransparencyExpiringVerificationResult *v8;
  BOOL v9;
  SWTransparencyExpiringVerificationResult *v10;
  objc_super v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("result"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)SWTransparencyExpiringVerificationResult;
  v7 = -[SWTransparencyExpiringVerificationResult init](&v12, sel_init);
  v8 = v7;
  if (v7)
    v9 = v5 > 1;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v7->_result = v5;
    objc_storeStrong((id *)&v7->_expiry, v6);
    v10 = v8;
  }

  return v10;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSDate)expiry
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiry, 0);
}

@end
