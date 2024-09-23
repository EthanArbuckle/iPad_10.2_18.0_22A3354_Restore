@implementation _UISMutableTouchAuthenticationRecord

- (id)copyWithZone:(_NSZone *)a3
{
  _UISTouchAuthenticationRecord *v4;
  _UISMutableTouchAuthenticationRecord *v5;
  _UISTouchAuthenticationRecord *v6;
  uint64_t v7;
  NSString *hostBundleId;
  uint64_t v9;
  NSString *hostSDKVersion;
  uint64_t v11;
  NSString *serviceBundleId;

  v4 = [_UISTouchAuthenticationRecord alloc];
  v5 = self;
  if (v4)
  {
    v6 = (_UISTouchAuthenticationRecord *)-[_UISTouchAuthenticationRecord _init](v4);
    v4 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_securityAnalysis, v5->super._securityAnalysis);
      v7 = -[NSString copy](v5->super._hostBundleId, "copy");
      hostBundleId = v4->_hostBundleId;
      v4->_hostBundleId = (NSString *)v7;

      v9 = -[NSString copy](v5->super._hostSDKVersion, "copy");
      hostSDKVersion = v4->_hostSDKVersion;
      v4->_hostSDKVersion = (NSString *)v9;

      v4->_hostIsInternal = v5->super._hostIsInternal;
      v11 = -[NSString copy](v5->super._serviceBundleId, "copy");
      serviceBundleId = v4->_serviceBundleId;
      v4->_serviceBundleId = (NSString *)v11;

      v4->_serviceInstanceIdentifier = v5->super._serviceInstanceIdentifier;
    }
  }

  return v4;
}

- (void)setSecurityAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->super._securityAnalysis, a3);
}

- (void)setHostBundleId:(id)a3
{
  objc_storeStrong((id *)&self->super._hostBundleId, a3);
}

- (void)setHostSDKVersion:(id)a3
{
  objc_storeStrong((id *)&self->super._hostSDKVersion, a3);
}

- (void)setHostIsInternal:(BOOL)a3
{
  self->super._hostIsInternal = a3;
}

- (void)setServiceBundleId:(id)a3
{
  objc_storeStrong((id *)&self->super._serviceBundleId, a3);
}

- (void)setServiceInstanceIdentifier:(int64_t)a3
{
  self->super._serviceInstanceIdentifier = a3;
}

@end
