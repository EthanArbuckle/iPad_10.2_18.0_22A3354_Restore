@implementation SKUIItemOffer

- (SKUIItemOffer)initWithButtonText:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIItemOffer *v13;
  uint64_t v14;
  NSString *buttonText;
  NSString *confirmationText;
  objc_super v18;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIItemOffer initWithButtonText:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIItemOffer;
  v13 = -[SKUIItemOffer init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v4, "copy");
    buttonText = v13->_buttonText;
    v13->_buttonText = (NSString *)v14;

    confirmationText = v13->_confirmationText;
    v13->_confirmationText = (NSString *)&stru_1E73A9FB0;

  }
  return v13;
}

- (SKUIItemOffer)initWithLookupDictionary:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIItemOffer *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  float price;
  void *v22;
  uint64_t v23;
  NSString *buttonText;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *offerTypeString;
  void *v31;
  uint64_t v32;
  NSString *variantIdentifier;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIItemOffer initWithLookupDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)SKUIItemOffer;
  v13 = -[SKUIItemOffer init](&v39, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("buyParams"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("action-params"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_actionParameters, v14);
    objc_msgSend(v4, "objectForKey:", CFSTR("actionText"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("medium"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "uppercaseString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      v14 = v16;
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("priceFormatted"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("button_text"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    objc_msgSend(v4, "objectForKey:", CFSTR("price"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      v13->_price = price;
    }
    else
    {
      price = v13->_price;
    }
    v36 = v17;
    v38 = v15;
    if (price == 0.0)
    {
      if (v17)
        v22 = v17;
      else
        v22 = v19;
      v23 = objc_msgSend(v22, "copy", v17, v15);
      buttonText = v13->_buttonText;
      v13->_buttonText = (NSString *)v23;
    }
    else
    {
      objc_storeStrong((id *)&v13->_buttonText, v19);
      v25 = v17;
      buttonText = v13->_confirmationText;
      v13->_confirmationText = v25;
    }

    objc_msgSend(v4, "objectForKey:", CFSTR("assets"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("assetFlavors"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SKUIItemOffer _setFileSizeWithAssets:](v13, "_setFileSizeWithAssets:", v26);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SKUIItemOffer _setFileSizeWithFlavors:](v13, "_setFileSizeWithFlavors:", v27);
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("type"), v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = objc_msgSend(v28, "copy");
      offerTypeString = v13->_offerTypeString;
      v13->_offerTypeString = (NSString *)v29;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("variant"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = objc_msgSend(v31, "copy");
      variantIdentifier = v13->_variantIdentifier;
      v13->_variantIdentifier = (NSString *)v32;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("shouldEnableMessagesExtension"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13->_shouldEnableMessagesExtension = objc_msgSend(v34, "BOOLValue");
    }

  }
  return v13;
}

- (SKUIItemOffer)initWithOfferDictionary:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIItemOffer *v13;
  void *v14;
  uint64_t v15;
  NSString *actionParameters;
  void *v17;
  uint64_t v18;
  NSString *buttonText;
  void *v20;
  uint64_t v21;
  NSString *confirmationText;
  void *v23;
  objc_super v25;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIItemOffer initWithOfferDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIItemOffer;
  v13 = -[SKUIItemOffer init](&v25, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("action-params"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      actionParameters = v13->_actionParameters;
      v13->_actionParameters = (NSString *)v15;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("button_text"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "copy");
      buttonText = v13->_buttonText;
      v13->_buttonText = (NSString *)v18;

      v13->_price = (float)(-[NSString isEqualToString:](v13->_buttonText, "isEqualToString:", CFSTR("FREE")) ^ 1);
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("confirm-text"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = objc_msgSend(v20, "copy");
      confirmationText = v13->_confirmationText;
      v13->_confirmationText = (NSString *)v21;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("assetFlavors"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SKUIItemOffer _setFileSizeWithFlavors:](v13, "_setFileSizeWithFlavors:", v23);

  }
  return v13;
}

- (SKUIItemOffer)initWithRedownloadToken:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIItemOffer *v13;
  uint64_t v14;
  NSString *actionParameters;
  NSString *buttonText;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIItemOffer initWithRedownloadToken:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (!objc_msgSend(v4, "length"))
  {
    v13 = 0;
    goto LABEL_9;
  }
  v13 = -[SKUIItemOffer init](self, "init");
  if (v13)
  {
    v14 = objc_msgSend(v4, "copy");
    actionParameters = v13->_actionParameters;
    v13->_actionParameters = (NSString *)v14;

    buttonText = v13->_buttonText;
    v13->_buttonText = (NSString *)CFSTR("FREE");

    self = (SKUIItemOffer *)v13->_confirmationText;
    v13->_confirmationText = (NSString *)CFSTR("INSTALL APP");
LABEL_9:

  }
  return v13;
}

- (NSString)fileSizeText
{
  NSString *fileSizeText;
  NSString *v4;
  NSString *v5;

  fileSizeText = self->_fileSizeText;
  if (!fileSizeText)
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", self->_fileSize, 1);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fileSizeText;
    self->_fileSizeText = v4;

    fileSizeText = self->_fileSizeText;
  }
  return fileSizeText;
}

- (NSDictionary)lookupDictionary
{
  void *v3;
  void *v4;
  NSString *actionParameters;
  void *v6;
  void *v7;
  NSString *buttonText;
  NSString *offerTypeString;
  NSString *variantIdentifier;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  actionParameters = self->_actionParameters;
  if (actionParameters)
    objc_msgSend(v3, "setObject:forKey:", actionParameters, CFSTR("buyParams"));
  if (self->_price > 0.00000011921)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("price"));

  }
  if (self->_confirmationText)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", self->_confirmationText, CFSTR("medium"), 0);
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("actionText"));

  }
  buttonText = self->_buttonText;
  if (buttonText)
    objc_msgSend(v4, "setObject:forKey:", buttonText, CFSTR("priceFormatted"));
  offerTypeString = self->_offerTypeString;
  if (offerTypeString)
    objc_msgSend(v4, "setObject:forKey:", offerTypeString, CFSTR("type"));
  variantIdentifier = self->_variantIdentifier;
  if (variantIdentifier)
    objc_msgSend(v4, "setObject:forKey:", variantIdentifier, CFSTR("variant"));
  if (self->_shouldEnableMessagesExtension)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("shouldEnableMessagesExtension"));

  }
  return (NSDictionary *)v4;
}

- (int64_t)offerType
{
  if (-[NSString isEqualToString:](self->_offerTypeString, "isEqualToString:", CFSTR("rent")))
    return 3;
  if (-[NSString isEqualToString:](self->_offerTypeString, "isEqualToString:", CFSTR("preorder")))
    return 2;
  if (-[NSString isEqualToString:](self->_offerTypeString, "isEqualToString:", CFSTR("complete")))
    return 1;
  if (-[NSString isEqualToString:](self->_offerTypeString, "isEqualToString:", CFSTR("get")))
    return 4;
  return 0;
}

- (void)_addActionParameterWithName:(id)a3 value:(id)a4
{
  NSString *actionParameters;
  id v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  NSString *v12;

  actionParameters = self->_actionParameters;
  if (actionParameters)
  {
    v7 = a4;
    v8 = a3;
    -[NSString stringByAppendingFormat:](actionParameters, "stringByAppendingFormat:", CFSTR("&%@=%@"), v8, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (objc_class *)MEMORY[0x1E0CB3940];
    v7 = a4;
    v8 = a3;
    v9 = objc_msgSend([v10 alloc], "initWithFormat:", CFSTR("%@=%@"), v8, v7);
  }
  v11 = (NSString *)v9;

  v12 = self->_actionParameters;
  self->_actionParameters = v11;

}

- (void)_setFileSizeWithDeviceSizes:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int64_t v8;
  NSString *fileSizeText;
  id v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0DAF4A0], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thinnedApplicationVariantIdentifier");
  v11[0] = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compatibleProductType");
  v5 = 0;
  v11[1] = (id)objc_claimAutoreleasedReturnValue();
  v11[2] = CFSTR("universal");
  while (1)
  {
    v6 = (id)v11[v5];
    if (v6)
      break;
LABEL_5:

    if (++v5 == 3)
      goto LABEL_8;
  }
  objc_msgSend(v10, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  v8 = objc_msgSend(v7, "longLongValue");
  fileSizeText = self->_fileSizeText;
  self->_fileSize = v8;
  self->_fileSizeText = 0;

LABEL_8:
}

- (SKUIItemOffer)initWithCacheRepresentation:(id)a3
{
  id v4;
  SKUIItemOffer *v5;
  void *v6;
  uint64_t v7;
  NSString *actionParameters;
  void *v9;
  uint64_t v10;
  NSString *buttonText;
  void *v12;
  uint64_t v13;
  NSString *confirmationText;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *fileSizeText;
  void *v19;
  float v20;
  objc_super v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22.receiver = self;
    v22.super_class = (Class)SKUIItemOffer;
    v5 = -[SKUIItemOffer init](&v22, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("action-params"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "copy");
        actionParameters = v5->_actionParameters;
        v5->_actionParameters = (NSString *)v7;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("button_text"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "copy");
        buttonText = v5->_buttonText;
        v5->_buttonText = (NSString *)v10;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("confirm-text"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "copy");
        confirmationText = v5->_confirmationText;
        v5->_confirmationText = (NSString *)v13;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("fileSize"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_fileSize = objc_msgSend(v15, "longLongValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("fileSizeText"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "copy");
        fileSizeText = v5->_fileSizeText;
        v5->_fileSizeText = (NSString *)v17;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("price"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v19, "floatValue");
        v5->_price = v20;
      }

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  NSString *actionParameters;
  NSString *buttonText;
  NSString *confirmationText;
  NSString *fileSizeText;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_fileSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("fileSize"));

  *(float *)&v5 = self->_price;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("price"));

  actionParameters = self->_actionParameters;
  if (actionParameters)
    objc_msgSend(v3, "setObject:forKey:", actionParameters, CFSTR("action-params"));
  buttonText = self->_buttonText;
  if (buttonText)
    objc_msgSend(v3, "setObject:forKey:", buttonText, CFSTR("button_text"));
  confirmationText = self->_confirmationText;
  if (confirmationText)
    objc_msgSend(v3, "setObject:forKey:", confirmationText, CFSTR("confirm-text"));
  fileSizeText = self->_fileSizeText;
  if (fileSizeText)
    objc_msgSend(v3, "setObject:forKey:", fileSizeText, CFSTR("fileSizeText"));
  return (NSMutableDictionary *)v3;
}

- (void)_setFileSizeWithAssets:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "count");
  v5 = v8;
  if (v4)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("size"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->_fileSize = objc_msgSend(v7, "longLongValue");

    }
    v5 = v8;
  }

}

- (void)_setFileSizeWithFlavors:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *fileSizeText;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "count");
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v11, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("fileSize"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->_fileSize = objc_msgSend(v7, "longLongValue");
      objc_msgSend(v6, "objectForKey:", CFSTR("fileSizeText"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (NSString *)objc_msgSend(v8, "copy");
        fileSizeText = self->_fileSizeText;
        self->_fileSizeText = v9;

      }
    }

    v5 = v11;
  }

}

- (NSString)actionParameters
{
  return self->_actionParameters;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (float)price
{
  return self->_price;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (BOOL)shouldEnableMessagesExtension
{
  return self->_shouldEnableMessagesExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_offerTypeString, 0);
  objc_storeStrong((id *)&self->_fileSizeText, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_actionParameters, 0);
}

- (void)initWithButtonText:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithLookupDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithOfferDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithRedownloadToken:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
