@implementation ICLightweightMusicSubscriptionStatusResponse

- (id)_initWithExtendedSubscriptionStatusResponse:(id)a3
{
  id v4;
  ICLightweightMusicSubscriptionStatusResponse *v5;
  void *v6;
  ICLightweightMusicSubscriptionStatus *v7;
  ICLightweightMusicSubscriptionStatus *lightweightSubscriptionStatus;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLightweightMusicSubscriptionStatusResponse;
  v5 = -[ICLightweightMusicSubscriptionStatusResponse init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "subscriptionStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICLightweightMusicSubscriptionStatus _initWithExtendedSubscriptionStatus:]([ICLightweightMusicSubscriptionStatus alloc], "_initWithExtendedSubscriptionStatus:", v6);
    lightweightSubscriptionStatus = v5->_lightweightSubscriptionStatus;
    v5->_lightweightSubscriptionStatus = v7;

  }
  return v5;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  objc_msgSend(v6, "appendFormat:", CFSTR("; lightweightSubscriptionStatus = %@"), self->_lightweightSubscriptionStatus);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (ICLightweightMusicSubscriptionStatusResponse)initWithCoder:(id)a3
{
  id v4;
  ICLightweightMusicSubscriptionStatusResponse *v5;
  uint64_t v6;
  ICLightweightMusicSubscriptionStatus *lightweightSubscriptionStatus;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLightweightMusicSubscriptionStatusResponse;
  v5 = -[ICLightweightMusicSubscriptionStatusResponse init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightweightSubscriptionStatus"));
    v6 = objc_claimAutoreleasedReturnValue();
    lightweightSubscriptionStatus = v5->_lightweightSubscriptionStatus;
    v5->_lightweightSubscriptionStatus = (ICLightweightMusicSubscriptionStatus *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_lightweightSubscriptionStatus, CFSTR("lightweightSubscriptionStatus"));
}

- (ICLightweightMusicSubscriptionStatus)lightweightSubscriptionStatus
{
  return self->_lightweightSubscriptionStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightweightSubscriptionStatus, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
