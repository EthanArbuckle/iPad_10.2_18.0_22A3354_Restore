@implementation ICMutableClientInfo

- (id)copyWithZone:(_NSZone *)a3
{
  -[ICClientInfo _clientInfoCopyWithClass:](self, "_clientInfoCopyWithClass:", objc_opt_class());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setClientVersion:(id)a3
{
  NSString *v4;
  NSString *clientVersion;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  clientVersion = self->super._clientVersion;
  self->super._clientVersion = v4;

}

- (void)setClientIdentifier:(id)a3
{
  NSString *v4;
  NSString *clientIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  clientIdentifier = self->super._clientIdentifier;
  self->super._clientIdentifier = v4;

  -[ICClientInfo _setDefaultBagProfileForClientIdentifier:](self, "_setDefaultBagProfileForClientIdentifier:", self->super._clientIdentifier);
}

- (void)setRequestingBundleVersion:(id)a3
{
  NSString *v4;
  NSString *requestingBundleVersion;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  requestingBundleVersion = self->super._requestingBundleVersion;
  self->super._requestingBundleVersion = v4;

}

- (void)setRequestingBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *requestingBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  requestingBundleIdentifier = self->super._requestingBundleIdentifier;
  self->super._requestingBundleIdentifier = v4;

}

- (void)setBagProfileVersion:(id)a3
{
  NSString *v4;
  NSString *bagProfileVersion;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bagProfileVersion = self->super._bagProfileVersion;
  self->super._bagProfileVersion = v4;

}

- (void)setBagProfile:(id)a3
{
  NSString *v4;
  NSString *bagProfile;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bagProfile = self->super._bagProfile;
  self->super._bagProfile = v4;

}

- (void)setProcessName:(id)a3
{
  NSString *v4;
  NSString *processName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  processName = self->super._processName;
  self->super._processName = v4;

}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleIdentifier = self->super._bundleIdentifier;
  self->super._bundleIdentifier = v4;

}

@end
