@implementation VIACacheHitContextCachedResultQueryIDMapper

- (id)updateBuilder:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.cache_hit_context_key.cached_result_query_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.cache_hit_context_key.cached_result_query_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_5:
    VIACacheHitContextMapperError((uint64_t)CFSTR("com.apple.argos.cache_hit_context_key.cached_result_query_id"), CFSTR("NSNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = (id)objc_msgSend(v5, "setCachedResultQueryID:", objc_msgSend(v8, "unsignedLongLongValue"));

  v10 = 0;
LABEL_6:

  return v10;
}

@end
