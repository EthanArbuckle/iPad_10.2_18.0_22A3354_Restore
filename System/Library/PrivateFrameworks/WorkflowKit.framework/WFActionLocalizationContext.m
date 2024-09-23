@implementation WFActionLocalizationContext

- (WFActionLocalizationContext)initWithLocale:(id)a3 stringLocalizer:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFActionLocalizationContext *v11;
  WFActionLocalizationContext *v12;
  WFActionLocalizationContext *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction+Definition.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction+Definition.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stringLocalizer"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFActionLocalizationContext;
  v11 = -[WFActionLocalizationContext init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locale, a3);
    objc_storeStrong((id *)&v12->_stringLocalizer, a4);
    v13 = v12;
  }

  return v12;
}

- (id)localize:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFActionLocalizationContext locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "localize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (INStringLocalizer)stringLocalizer
{
  return self->_stringLocalizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (WFActionLocalizationContext)defaultContext
{
  if (defaultContext_onceToken != -1)
    dispatch_once(&defaultContext_onceToken, &__block_literal_global_31919);
  return (WFActionLocalizationContext *)(id)defaultContext_context;
}

void __45__WFActionLocalizationContext_defaultContext__block_invoke()
{
  WFActionLocalizationContext *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [WFActionLocalizationContext alloc];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC38]), "initWithLanguageCode:", 0);
  v2 = -[WFActionLocalizationContext initWithLocale:stringLocalizer:](v0, "initWithLocale:stringLocalizer:", v4, v1);
  v3 = (void *)defaultContext_context;
  defaultContext_context = v2;

}

@end
