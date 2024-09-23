@implementation TLTransliteratorInitParameters

- (TLTransliteratorInitParameters)initWithLocale:(id)a3
{
  id v4;
  TLTransliteratorInitParameters *v5;
  uint64_t v6;
  NSLocale *locale;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLTransliteratorInitParameters;
  v5 = -[TLTransliteratorInitParameters init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    *(_WORD *)&v5->_useLanguageModel = 257;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TLTransliteratorInitParameters *v4;
  void *v5;
  TLTransliteratorInitParameters *v6;
  void *v7;

  v4 = +[TLTransliteratorInitParameters allocWithZone:](TLTransliteratorInitParameters, "allocWithZone:", a3);
  -[TLTransliteratorInitParameters locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TLTransliteratorInitParameters initWithLocale:](v4, "initWithLocale:", v5);

  -[TLTransliteratorInitParameters modelURL](self, "modelURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTransliteratorInitParameters setModelURL:](v6, "setModelURL:", v7);

  -[TLTransliteratorInitParameters setUseLanguageModel:](v6, "setUseLanguageModel:", -[TLTransliteratorInitParameters useLanguageModel](self, "useLanguageModel"));
  -[TLTransliteratorInitParameters setUseSeq2SeqModel:](v6, "setUseSeq2SeqModel:", -[TLTransliteratorInitParameters useSeq2SeqModel](self, "useSeq2SeqModel"));
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TLMutableTransliteratorInitParameters *v4;
  void *v5;
  TLMutableTransliteratorInitParameters *v6;
  void *v7;

  v4 = [TLMutableTransliteratorInitParameters alloc];
  -[TLTransliteratorInitParameters locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TLTransliteratorInitParameters initWithLocale:](v4, "initWithLocale:", v5);

  -[TLTransliteratorInitParameters modelURL](self, "modelURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTransliteratorInitParameters setModelURL:](v6, "setModelURL:", v7);

  -[TLTransliteratorInitParameters setUseLanguageModel:](v6, "setUseLanguageModel:", -[TLTransliteratorInitParameters useLanguageModel](self, "useLanguageModel"));
  -[TLTransliteratorInitParameters setUseSeq2SeqModel:](v6, "setUseSeq2SeqModel:", -[TLTransliteratorInitParameters useSeq2SeqModel](self, "useSeq2SeqModel"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  _BOOL4 v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  if (!v8)
  {
    v11 = 0;
    v10 = 0;
    goto LABEL_10;
  }
  -[TLTransliteratorInitParameters locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqual:", v4))
  {
    v11 = 0;
    v10 = 0;
    goto LABEL_10;
  }
  -[TLTransliteratorInitParameters modelURL](self, "modelURL");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v21 = (void *)v9;
    v10 = 0;
    v11 = 1;
LABEL_10:
    -[TLTransliteratorInitParameters modelURL](self, "modelURL", v19);
    goto LABEL_11;
  }
  objc_msgSend(v8, "modelURL");
  v18 = objc_claimAutoreleasedReturnValue();
  v11 = 1;
  if (!v18)
  {
    LOBYTE(v15) = 1;
    goto LABEL_21;
  }
  v21 = 0;
  v10 = 1;
  -[TLTransliteratorInitParameters modelURL](self, "modelURL", v18);
LABEL_11:
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqual:", v13)
    && (v14 = -[TLTransliteratorInitParameters useLanguageModel](self, "useLanguageModel"),
        v14 == objc_msgSend(v8, "useLanguageModel")))
  {
    v16 = -[TLTransliteratorInitParameters useSeq2SeqModel](self, "useSeq2SeqModel");
    v15 = v16 ^ objc_msgSend(v8, "useSeq2SeqModel") ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  if (!v10)
  {
    if (!v11)
      goto LABEL_20;
    goto LABEL_19;
  }

  if ((v11 & 1) != 0)
LABEL_19:

LABEL_20:
  if (v8)
  {
LABEL_21:

  }
  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  -[TLTransliteratorInitParameters locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TLTransliteratorInitParameters modelURL](self, "modelURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  v7 = v6 ^ -[TLTransliteratorInitParameters useLanguageModel](self, "useLanguageModel");
  return v7 ^ -[TLTransliteratorInitParameters useSeq2SeqModel](self, "useSeq2SeqModel");
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)useLanguageModel
{
  return self->_useLanguageModel;
}

- (void)setUseLanguageModel:(BOOL)a3
{
  self->_useLanguageModel = a3;
}

- (BOOL)useSeq2SeqModel
{
  return self->_useSeq2SeqModel;
}

- (void)setUseSeq2SeqModel:(BOOL)a3
{
  self->_useSeq2SeqModel = a3;
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModelURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
