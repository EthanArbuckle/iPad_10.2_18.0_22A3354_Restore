@implementation VIQueryContextImageTypeMapper

- (id)updateBuilder:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.image_type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.image_type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.image_type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && (objc_msgSend(v9, "intValue") & 0x80000000) == 0 && (int)objc_msgSend(v9, "intValue") <= 2)
      {
        v10 = (id)objc_msgSend(v5, "setImageType:", (int)objc_msgSend(v9, "intValue"));
        v7 = 0;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

      v9 = 0;
    }
    _VIQueryContextMapperError((uint64_t)CFSTR("VIQueryContextImageTypeKey"), CFSTR("NSNumber(VIQueryContextImageType)"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

@end
