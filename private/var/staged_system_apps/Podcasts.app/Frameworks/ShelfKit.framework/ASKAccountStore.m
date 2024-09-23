@implementation ASKAccountStore

+ (ACAccount)activeAccountFromDefaultStore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return (ACAccount *)v3;
}

+ (NSNumber)uniqueIdentifierFromActiveAccountInDefaultStore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "activeAccountFromDefaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_DSID"));

  return (NSNumber *)v3;
}

@end
