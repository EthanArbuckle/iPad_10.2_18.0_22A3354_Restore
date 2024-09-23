@implementation CDGetAuthTypeResponse

- (CDGetAuthTypeResponse)initWithRapportDictionary:(id)a3
{
  id v4;
  CDGetAuthTypeResponse *v5;
  uint64_t NSNumber;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDGetAuthTypeResponse;
  v5 = -[CDGetAuthTypeResponse init](&v11, "init");
  if (v5)
  {
    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("authType"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_authType = (int64_t)objc_msgSend(v7, "integerValue");

    v5->_sandboxPurchase = CFDictionaryGetInt64(v4, CFSTR("sandboxPurchase"), 0) != 0;
    v8 = NSDictionaryGetNSNumber(v4, CFSTR("authFlags"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_authFlags = (unint64_t)objc_msgSend(v9, "integerValue");

  }
  return v5;
}

- (id)makeRapportDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_authType));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("authType"));

  if (self->_sandboxPurchase)
    v5 = &__kCFBooleanTrue;
  else
    v5 = 0;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sandboxPurchase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_authFlags));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("authFlags"));

  v7 = objc_msgSend(v3, "copy");
  return v7;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  id v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = self->_authType - 1;
  if (v4 >= 0xE)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %ld)"), self->_authType));
  else
    v5 = off_100031148[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("authType"));

  v6 = objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_sandboxPurchase, CFSTR("sandboxPurchase"), 1);
  v7 = objc_msgSend(v3, "appendInteger:withName:", self->_authFlags, CFSTR("authFlags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v8;
}

- (int64_t)authType
{
  return self->_authType;
}

- (void)setAuthType:(int64_t)a3
{
  self->_authType = a3;
}

- (BOOL)isSandboxPurchase
{
  return self->_sandboxPurchase;
}

- (void)setSandboxPurchase:(BOOL)a3
{
  self->_sandboxPurchase = a3;
}

- (unint64_t)authFlags
{
  return self->_authFlags;
}

- (void)setAuthFlags:(unint64_t)a3
{
  self->_authFlags = a3;
}

@end
