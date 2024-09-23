@implementation SKUIGiftValidationResponse

- (SKUIGiftValidationResponse)initWithValidationDictionary:(id)a3
{
  id v4;
  SKUIGiftValidationResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *totalGiftAmountString;
  void *v11;
  uint64_t v12;
  void *giftKey;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *errorString;
  uint64_t v18;
  NSString *v19;
  objc_super v21;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftValidationResponse initWithValidationDictionary:].cold.1();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIGiftValidationResponse;
  v5 = -[SKUIGiftValidationResponse init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "integerValue");
      v5->_valid = v7 == 0;
      if (!v7)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("amountFormatted"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(v4, "objectForKey:", CFSTR("totalPriceFormatted"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = objc_msgSend(v8, "copy");
          totalGiftAmountString = v5->_totalGiftAmountString;
          v5->_totalGiftAmountString = (NSString *)v9;

        }
        objc_msgSend(v4, "objectForKey:", CFSTR("giftKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_26;
        v12 = objc_msgSend(v11, "copy");
        giftKey = v5->_giftKey;
        v5->_giftKey = (NSString *)v12;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
    }
    else
    {
      v5->_valid = 0;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("errorEntries"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("localizedMessage"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = objc_msgSend(v15, "copy");
          errorString = v5->_errorString;
          v5->_errorString = (NSString *)v16;

        }
      }

    }
    if (v5->_errorString)
      goto LABEL_26;
    objc_msgSend(v4, "objectForKey:", CFSTR("userPresentableErrorMessage"));
    giftKey = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(giftKey, "copy");
      v19 = v5->_errorString;
      v5->_errorString = (NSString *)v18;

    }
    goto LABEL_25;
  }
LABEL_27:

  return v5;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (NSString)giftKey
{
  return self->_giftKey;
}

- (NSString)totalGiftAmountString
{
  return self->_totalGiftAmountString;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalGiftAmountString, 0);
  objc_storeStrong((id *)&self->_giftKey, 0);
  objc_storeStrong((id *)&self->_errorString, 0);
}

- (void)initWithValidationDictionary:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftValidationResponse initWithValidationDictionary:]";
}

@end
