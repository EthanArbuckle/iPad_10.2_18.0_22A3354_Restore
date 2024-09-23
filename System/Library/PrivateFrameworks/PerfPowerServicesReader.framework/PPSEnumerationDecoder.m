@implementation PPSEnumerationDecoder

+ (id)decodeValue:(id)a3 withMetric:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(a4, "enumMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "valueForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "stringValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isDecodableMetric:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "enumMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

@end
