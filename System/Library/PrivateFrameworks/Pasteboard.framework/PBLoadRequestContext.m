@implementation PBLoadRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteSharingToken, 0);
}

- (PBLoadRequestContext)initWithOptions:(unsigned int)a3 pasteSharingToken:(id)a4
{
  id v6;
  PBLoadRequestContext *v7;
  PBLoadRequestContext *v8;
  uint64_t v9;
  UISPasteSharingToken *pasteSharingToken;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PBLoadRequestContext;
  v7 = -[PBLoadRequestContext init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_options = a3;
    v9 = objc_msgSend(v6, "copy");
    pasteSharingToken = v8->_pasteSharingToken;
    v8->_pasteSharingToken = (UISPasteSharingToken *)v9;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBLoadRequestContext)initWithCoder:(id)a3
{
  id v4;
  PBLoadRequestContext *v5;
  uint64_t v6;
  UISPasteSharingToken *pasteSharingToken;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBLoadRequestContext;
  v5 = -[PBLoadRequestContext init](&v9, sel_init);
  if (v5)
  {
    v5->_options = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("requestOptions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pasteSharingToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    pasteSharingToken = v5->_pasteSharingToken;
    v5->_pasteSharingToken = (UISPasteSharingToken *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t options;
  id v5;

  options = self->_options;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", options, CFSTR("requestOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pasteSharingToken, CFSTR("pasteSharingToken"));

}

- (BOOL)isFromUIFramework
{
  return self->_options & 1;
}

- (BOOL)isBlockingMainThread
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)clientHasFinishedLaunching
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (UISPasteSharingToken)pasteSharingToken
{
  return (UISPasteSharingToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPasteSharingToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

@end
