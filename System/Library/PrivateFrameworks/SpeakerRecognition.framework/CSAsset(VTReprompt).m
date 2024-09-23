@implementation CSAsset(VTReprompt)

- (id)blobVersion
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "dictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("version"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("version"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)blobName
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "dictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("blobName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("blobName"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
