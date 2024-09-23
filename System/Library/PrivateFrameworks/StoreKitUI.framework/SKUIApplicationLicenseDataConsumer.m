@implementation SKUIApplicationLicenseDataConsumer

- (id)applicationLicenseWithDictionary:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIApplicationLicensePage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIApplicationLicenseDataConsumer applicationLicenseWithDictionary:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_alloc_init(SKUIApplicationLicensePage);
  objc_msgSend(v3, "objectForKey:", CFSTR("title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SKUIApplicationLicensePage setTitle:](v12, "setTitle:", v13);
  objc_msgSend(v3, "objectForKey:", CFSTR("item-metadata"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("text"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("type"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v16 = 0;
      }
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 0.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fontName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("body { padding: 10px; background: white; font-family: '%@'; font-size: 13px; color: black; line-height: 18px; }p { margin-top: 0; padding-top: 0 }"),
                      v19);

      if (objc_msgSend(v16, "isEqualToString:", CFSTR("markup")))
      {
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<html><head><style type=\"text/css\">%@</style></head><body><div>%@</div></body></html>"), v20, v15);
      }
      else
      {
        SUCreateHTMLForPlainText();
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v22 = (void *)v21;
      -[SKUIApplicationLicensePage setLicenseAgreementHTML:](v12, "setLicenseAgreementHTML:", v21);

    }
  }

  return v12;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIApplicationLicenseDataConsumer objectForData:response:error:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIApplicationLicenseDataConsumer;
  -[SSVURLProtocolConsumer objectForData:response:error:](&v21, sel_objectForData_response_error_, v8, v9, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SKUIApplicationLicenseDataConsumer applicationLicenseWithDictionary:](self, "applicationLicenseWithDictionary:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)applicationLicenseWithDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)objectForData:(uint64_t)a3 response:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
