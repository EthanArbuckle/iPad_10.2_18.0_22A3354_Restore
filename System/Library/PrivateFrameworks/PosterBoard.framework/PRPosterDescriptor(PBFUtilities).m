@implementation PRPosterDescriptor(PBFUtilities)

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

- (uint64_t)pbf_isInitialPosterDescriptor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v8;

  objc_msgSend(a1, "descriptorIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "pbf_posterProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(a1, "role");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      +[PBFInitialPosterHelper initialPosterProviderForRole:descriptorIdentifier:](PBFInitialPosterHelper, "initialPosterProviderForRole:descriptorIdentifier:", v4, &v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v2))
        v6 = objc_msgSend(v3, "isEqual:", v5);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
