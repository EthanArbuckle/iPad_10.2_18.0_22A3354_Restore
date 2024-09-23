@implementation SKUICompletionDataConsumer

- (id)_invalidResponseError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAFA28], 111, 0);
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  SKUICompletionList *v13;
  id v14;
  id v16;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICompletionDataConsumer objectForData:response:error:].cold.1();
  }
  if (objc_msgSend(v9, "statusCode") == 200)
  {
    if (v8)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      v12 = v11;
      if (!v10 || v11)
      {
        if (a5)
        {
          v14 = objc_retainAutorelease(v11);
LABEL_18:
          v13 = 0;
          *a5 = v14;
          goto LABEL_20;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = -[SKUICompletionList initWithCompletionListDictionary:]([SKUICompletionList alloc], "initWithCompletionListDictionary:", v10);
LABEL_20:

          goto LABEL_21;
        }
        if (a5)
        {
          -[SKUICompletionDataConsumer _invalidResponseError](self, "_invalidResponseError");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
      v13 = 0;
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  if (!a5)
  {
LABEL_13:
    v13 = 0;
    goto LABEL_21;
  }
  -[SKUICompletionDataConsumer _invalidResponseError](self, "_invalidResponseError");
  v13 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v13;
}

- (void)objectForData:response:error:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICompletionDataConsumer objectForData:response:error:]";
}

@end
