@implementation VUIEventDataSource

+ (VUIEventDataSource)eventDataSourceWithEventDict:(id)a3 appContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("documentDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_documentDataSourceWithDict:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_actionForKey:eventDict:appContext:", CFSTR("actionDataSource"), v5, v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 | v10)
  {
    objc_msgSend((id)objc_opt_class(), "_actionForKey:eventDict:appContext:", CFSTR("preActionDataSource"), v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_class();
    objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("preActionDocumentDataSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_documentDataSourceWithDict:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_actionForKey:eventDict:appContext:", CFSTR("postActionDataSource"), v5, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_class();
    objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("postActionDocumentDataSource"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_documentDataSourceWithDict:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setPreActionDocumentDataSource:", v14);
    objc_msgSend(v19, "setPreAction:", v11);
    objc_msgSend(v19, "setDocumentDataSource:", v9);
    objc_msgSend(v19, "setAction:", v10);
    objc_msgSend(v19, "setPostActionDocumentDataSource:", v18);
    objc_msgSend(v19, "setPostAction:", v15);

  }
  else
  {
    v19 = 0;
  }

  return (VUIEventDataSource *)v19;
}

+ (id)attachPrefetchedDict:(id)a3 eventDict:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("documentDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "setValue:forKey:", v6, CFSTR("prefetchedData"));

  objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("documentDataSource"));
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

+ (id)_documentDataSourceWithDict:(id)a3
{
  return +[VUIDocumentDataSource documentDataSourceWithDictionary:](VUIDocumentDataSource, "documentDataSourceWithDictionary:", a3);
}

+ (id)_actionForKey:(id)a3 eventDict:(id)a4 appContext:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  objc_msgSend(a4, "vui_dictionaryForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[VUIAction actionWithDictionary:appContext:](VUIAction, "actionWithDictionary:appContext:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (VUIDocumentDataSource)preActionDocumentDataSource
{
  return self->_preActionDocumentDataSource;
}

- (void)setPreActionDocumentDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_preActionDocumentDataSource, a3);
}

- (VUIAction)preAction
{
  return self->_preAction;
}

- (void)setPreAction:(id)a3
{
  objc_storeStrong((id *)&self->_preAction, a3);
}

- (VUIDocumentDataSource)documentDataSource
{
  return self->_documentDataSource;
}

- (void)setDocumentDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_documentDataSource, a3);
}

- (VUIAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (VUIDocumentDataSource)postActionDocumentDataSource
{
  return self->_postActionDocumentDataSource;
}

- (void)setPostActionDocumentDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_postActionDocumentDataSource, a3);
}

- (VUIAction)postAction
{
  return self->_postAction;
}

- (void)setPostAction:(id)a3
{
  objc_storeStrong((id *)&self->_postAction, a3);
}

- (VUIMediaEntity)mediaEntity
{
  return self->_mediaEntity;
}

- (void)setMediaEntity:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntity, 0);
  objc_storeStrong((id *)&self->_postAction, 0);
  objc_storeStrong((id *)&self->_postActionDocumentDataSource, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_documentDataSource, 0);
  objc_storeStrong((id *)&self->_preAction, 0);
  objc_storeStrong((id *)&self->_preActionDocumentDataSource, 0);
}

- (id)_initWithLibraryMediaEntity:(id)a3
{
  id v5;
  VUIEventDataSource *v6;
  VUIEventDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIEventDataSource;
  v6 = -[VUIEventDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaEntity, a3);

  return v7;
}

+ (id)selectEventDataSourceWithLibraryMediaEntity:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[VUIEventDataSource _initWithLibraryMediaEntity:]([VUIEventDataSource alloc], "_initWithLibraryMediaEntity:", v3);

  return v4;
}

@end
