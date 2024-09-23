@implementation IKImageElement(VSAdditions)

- (id)vs_url
{
  void *v2;
  void *v3;
  VSImageElementHelper *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "srcset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(VSImageElementHelper);
    objc_msgSend(a1, "srcset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSImageElementHelper bestMatchingKeyForSrcset:](v4, "bestMatchingKeyForSrcset:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1, "srcset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v6);
      v8 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v8;
    }

  }
  return v2;
}

@end
