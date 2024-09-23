@implementation ICMusicSubscriptionStatusResponse

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (self->_expirationDate)
    objc_msgSend(v6, "appendFormat:", CFSTR("; expirationDate = %@"), self->_expirationDate);
  if (self->_finalResponse)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("; isFinalResponse = %@"), v7);
  if (self->_needsReload)
    objc_msgSend(v6, "appendString:", CFSTR("; needsReload = YES"));
  objc_msgSend(v6, "appendFormat:", CFSTR("; subscriptionStatus = %@"), self->_subscriptionStatus);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isFinalResponse
{
  return self->_finalResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *expirationDate;
  id v5;

  expirationDate = self->_expirationDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_finalResponse, CFSTR("isFinalResponse"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsReload, CFSTR("needsReload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subscriptionStatus, CFSTR("subscriptionStatus"));

}

- (void)setFinalResponse:(BOOL)a3
{
  self->_finalResponse = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = -[ICMusicSubscriptionStatusResponse _init]([ICMusicSubscriptionStatusResponse alloc], "_init");
  if (v4)
  {
    v5 = -[NSDate copy](self->_expirationDate, "copy");
    v6 = (void *)v4[3];
    v4[3] = v5;

    *((_BYTE *)v4 + 8) = self->_finalResponse;
    *((_BYTE *)v4 + 9) = self->_needsReload;
    v7 = -[ICMusicSubscriptionStatus copy](self->_subscriptionStatus, "copy");
    v8 = (void *)v4[2];
    v4[2] = v7;

  }
  return v4;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICMusicSubscriptionStatusResponse;
  return -[ICMusicSubscriptionStatusResponse init](&v3, sel_init);
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (BOOL)isExpired
{
  NSDate *expirationDate;
  double v3;

  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    -[NSDate timeIntervalSinceNow](expirationDate, "timeIntervalSinceNow");
    LOBYTE(expirationDate) = v3 < 0.00000011920929;
  }
  return (char)expirationDate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (ICMusicSubscriptionStatusResponse)initWithCoder:(id)a3
{
  id v4;
  ICMusicSubscriptionStatusResponse *v5;
  uint64_t v6;
  NSDate *expirationDate;
  uint64_t v8;
  ICMusicSubscriptionStatus *subscriptionStatus;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionStatusResponse;
  v5 = -[ICMusicSubscriptionStatusResponse init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    v5->_finalResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinalResponse"));
    v5->_needsReload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsReload"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    subscriptionStatus = v5->_subscriptionStatus;
    v5->_subscriptionStatus = (ICMusicSubscriptionStatus *)v8;

  }
  return v5;
}

- (ICMusicSubscriptionStatusResponse)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  ICMusicSubscriptionStatusResponse *v5;
  void *v6;
  ICMusicSubscriptionStatus *v7;
  ICMusicSubscriptionStatus *subscriptionStatus;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDate *expirationDate;
  void *v13;

  v4 = a3;
  v5 = -[ICMusicSubscriptionStatusResponse _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSDictionary() & 1) != 0)
    {
      v7 = -[ICMusicSubscriptionStatus initWithResponseDictionary:]([ICMusicSubscriptionStatus alloc], "initWithResponseDictionary:", v6);
      subscriptionStatus = v5->_subscriptionStatus;
      v5->_subscriptionStatus = v7;
    }
    else
    {
      subscriptionStatus = v5->_subscriptionStatus;
      v5->_subscriptionStatus = 0;
    }

    objc_msgSend(v4, "objectForKey:", CFSTR("expiration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
      v11 = objc_claimAutoreleasedReturnValue();
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v11;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("valid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_needsReload = objc_msgSend(v13, "BOOLValue") ^ 1;
    v5->_finalResponse = 1;

  }
  return v5;
}

- (ICMusicSubscriptionStatusResponse)initWithResponseDictionary:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  ICMusicSubscriptionStatusResponse *v8;
  ICMusicSubscriptionStatusResponse *v9;
  ICMusicSubscriptionStatus *v10;
  ICMusicSubscriptionStatus *subscriptionStatus;
  uint64_t v12;
  NSDate *expirationDate;

  v6 = a3;
  v7 = a4;
  v8 = -[ICMusicSubscriptionStatusResponse _init](self, "_init");
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = -[ICMusicSubscriptionStatus initWithResponseDictionary:]([ICMusicSubscriptionStatus alloc], "initWithResponseDictionary:", v6);
      subscriptionStatus = v9->_subscriptionStatus;
      v9->_subscriptionStatus = v10;
    }
    else
    {
      subscriptionStatus = v8->_subscriptionStatus;
      v8->_subscriptionStatus = 0;
    }

    v12 = objc_msgSend(v7, "copy");
    expirationDate = v9->_expirationDate;
    v9->_expirationDate = (NSDate *)v12;

  }
  return v9;
}

- (NSDictionary)propertyListRepresentation
{
  void *v3;
  void *v4;
  NSDate *expirationDate;
  void *v6;
  void *v7;
  ICMusicSubscriptionStatus *subscriptionStatus;
  void *v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !self->_needsReload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("valid"));

  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceReferenceDate](expirationDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("expiration"));

  }
  subscriptionStatus = self->_subscriptionStatus;
  if (subscriptionStatus)
  {
    -[ICMusicSubscriptionStatus dictionaryRepresentation](subscriptionStatus, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("status"));

  }
  return (NSDictionary *)v3;
}

- (void)setSubscriptionStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

+ (BOOL)isValidSubscriptionStatusPropertyListRepresentation:(id)a3 error:(id *)a4
{
  void *v6;
  char v7;
  id v8;
  id v10;

  objc_msgSend(a3, "objectForKey:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v10 = 0;
    v7 = objc_msgSend(a1, "isValidSubscriptionStatusResponseDictionary:error:", v6, &v10);
    v8 = v10;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7102, CFSTR("Invalid subscription status value: %@"), v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v8);
LABEL_6:

  return v7;
}

+ (BOOL)isValidSubscriptionStatusResponseDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;
  objc_msgSend(v5, "objectForKey:", CFSTR("errorMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v9 = v8;
    v10 = v9;
    v11 = 0;
    if (v7 && v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7102, CFSTR("Subscription status error: %@"), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v11 == 0;
}

@end
