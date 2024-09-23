@implementation VIQueryContextImageURLMapper

- (id)updateBuilder:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.image_url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.image_url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.image_url"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_7:
    _VIQueryContextMapperError((uint64_t)CFSTR("VIQueryContextImageURLKey"), CFSTR("NSURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v10 = (id)objc_msgSend(v5, "setImageURL:", v9);

LABEL_5:
  v11 = 0;
LABEL_8:

  return v11;
}

@end
