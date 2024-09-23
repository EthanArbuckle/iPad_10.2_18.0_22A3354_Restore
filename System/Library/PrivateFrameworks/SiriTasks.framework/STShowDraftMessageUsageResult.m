@implementation STShowDraftMessageUsageResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STShowDraftMessageUsageResult;
  -[AFSiriTaskUsageResult description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendString:", CFSTR(" result: "));
  -[STShowDraftMessageUsageResult _resultDescription](self, "_resultDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  return v4;
}

- (id)_resultDescription
{
  unint64_t v2;

  v2 = self->_resultCode - 1;
  if (v2 > 4)
    return CFSTR("NotSet");
  else
    return off_24DB767F8[v2];
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowDraftMessageUsageResult;
  v4 = a3;
  -[AFSiriTaskUsageResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_resultCode, CFSTR("ResultCodeKeyIdentifier"), v5.receiver, v5.super_class);

}

- (STShowDraftMessageUsageResult)initWithCoder:(id)a3
{
  id v4;
  STShowDraftMessageUsageResult *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STShowDraftMessageUsageResult;
  v5 = -[AFSiriTaskUsageResult initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_resultCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ResultCodeKeyIdentifier"));

  return v5;
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
