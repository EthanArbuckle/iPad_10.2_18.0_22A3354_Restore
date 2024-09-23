@implementation STGenericIntentResponse

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)STGenericIntentResponse;
  -[STGenericIntentResponse description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ response code: %ld"), v4, self->_responseCode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STGenericIntentResponse;
  v4 = a3;
  -[AFSiriResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_responseCode, CFSTR("_responseCode"), v5.receiver, v5.super_class);

}

- (STGenericIntentResponse)initWithCoder:(id)a3
{
  id v4;
  STGenericIntentResponse *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STGenericIntentResponse;
  v5 = -[AFSiriResponse initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_responseCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_responseCode"));

  return v5;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
