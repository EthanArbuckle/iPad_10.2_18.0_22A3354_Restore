@implementation _PUPassiveContentContextDataSource

- (_PUPassiveContentContextDataSource)initWithContext:(id)a3 suggestions:(id)a4
{
  id v6;
  id v7;
  _PUPassiveContentContextDataSource *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *context;
  id v24;
  uint64_t v25;
  NSArray *suggestions;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_PUPassiveContentContextDataSource;
  v8 = -[_PUPassiveContentContextDataSource init](&v28, sel_init);
  if (v8)
  {
    v9 = v6;
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    if (v9 && (v11 == 8 || v11 == 6))
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "librarySpecificFetchOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIncludedDetectionTypes:", v14);

      v15 = (void *)MEMORY[0x1E0CD16C0];
      v29[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fetchPersonsWithLocalIdentifiers:options:", v16, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "displayName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "length"))
      {
        objc_msgSend(v18, "displayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v18, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length"))
        {
          objc_msgSend(v18, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v18, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "substringToIndex:", 8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v22;
        }

        v9 = v21;
      }

      objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" (%lu)"), objc_msgSend(v7, "count"));
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    context = v8->_context;
    v8->_context = (NSString *)v9;
    v24 = v9;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
    suggestions = v8->_suggestions;
    v8->_suggestions = (NSArray *)v25;

  }
  return v8;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
