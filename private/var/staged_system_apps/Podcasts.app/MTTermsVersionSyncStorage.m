@implementation MTTermsVersionSyncStorage

- (BOOL)cloudSyncIsDirty
{
  return +[MTPrivacyUtil cloudSyncIsDirty](MTPrivacyUtil, "cloudSyncIsDirty");
}

- (void)setCloudSyncIsDirty:(BOOL)a3
{
  +[MTPrivacyUtil setCloudSyncIsDirty:](MTPrivacyUtil, "setCloudSyncIsDirty:", a3);
}

- (NSString)cloudSyncVersion
{
  return +[MTPrivacyUtil cloudSyncVersion](MTPrivacyUtil, "cloudSyncVersion");
}

- (void)setCloudSyncVersion:(id)a3
{
  +[MTPrivacyUtil setCloudSyncVersion:](MTPrivacyUtil, "setCloudSyncVersion:", a3);
}

- (NSNumber)deviceAgreedTermsVersion
{
  return +[MTPrivacyUtil deviceAgreedTermsVersion](MTPrivacyUtil, "deviceAgreedTermsVersion");
}

- (void)setDeviceAgreedTermsVersion:(id)a3
{
  +[MTPrivacyUtil setDeviceAgreedTermsVersion:](MTPrivacyUtil, "setDeviceAgreedTermsVersion:", a3);
}

- (NSNumber)accountAgreedTermsVersion
{
  return +[MTPrivacyUtil accountAgreedTermsVersion](MTPrivacyUtil, "accountAgreedTermsVersion");
}

- (void)setAccountAgreedTermsVersion:(id)a3
{
  +[MTPrivacyUtil setAccountAgreedTermsVersion:](MTPrivacyUtil, "setAccountAgreedTermsVersion:", a3);
}

- (NSString)podcastsDomainVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "podcastsDomainVersion"));

  return (NSString *)v3;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  objc_msgSend(v4, "setPodcastsDomainVersion:", v3);

}

@end
