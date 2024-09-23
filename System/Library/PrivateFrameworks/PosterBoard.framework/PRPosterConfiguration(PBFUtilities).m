@implementation PRPosterConfiguration(PBFUtilities)

- (id)pbf_posterUUID
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serverIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pbf_posterProvider
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serverIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
