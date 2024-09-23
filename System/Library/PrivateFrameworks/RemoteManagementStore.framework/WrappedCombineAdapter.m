@implementation WrappedCombineAdapter

- (WrappedCombineAdapter)initWithAdapter:(id)a3
{
  id v5;
  WrappedCombineAdapter *v6;
  WrappedCombineAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WrappedCombineAdapter;
  v6 = -[WrappedCombineAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedAdapter, a3);

  return v7;
}

- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  id v14;

  v6 = (void (**)(id, id))a4;
  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "beginProcessingConfigurationsForScope:completionHandler:", a3, v6);

  }
  else
  {
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v12, "beginProcessingConfigurationsForScope:error:", a3, &v14);
      v13 = v14;

      v6[2](v6, v13);
    }
    else
    {
      v6[2](v6, 0);
    }
  }

}

- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, id);
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v8 = (void (**)(id, id))a5;
  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v11, "endProcessingConfigurations:scope:completionHandler:", v6, a4, v8);

  }
  else
  {
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v14, "endProcessingConfigurations:scope:error:", v6, a4, &v16);
      v15 = v16;

      v8[2](v8, v15);
    }
    else
    {
      v8[2](v8, 0);
    }
  }

}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v6 = (void (**)(id, void *, id))a4;
  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "allDeclarationKeysForScope:completionHandler:", a3, v6);

  }
  else
  {
    v11 = objc_opt_respondsToSelector();

    -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      v19 = 0;
      objc_msgSend(v12, "allDeclarationKeysForScope:error:", a3, &v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;

      v6[2](v6, v14, v15);
    }
    else
    {
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "allDeclarationKeys");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v6[2](v6, v18, 0);
      }
    }
  }

}

- (void)applyCombinedConfiguration:(id)a3 declarationKeys:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id, id);
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id, id))a6;
  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 & 1) != 0)
  {
    objc_msgSend(v15, "applyCombinedConfiguration:declarationKeys:scope:completionHandler:", v10, v11, a5, v12);

  }
  else
  {
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v22 = 0;
      objc_msgSend(v18, "applyCombinedConfiguration:declarationKeys:scope:returningReasons:error:", v10, v11, a5, &v22, &v21);
      v19 = v22;
      v20 = v21;

      v12[2](v12, v19, v20);
    }
  }

}

- (void)removeCombinedConfigurationForScope:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  id v14;

  v6 = (void (**)(id, id))a4;
  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "removeCombinedConfigurationForScope:completionHandler:", a3, v6);

  }
  else
  {
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[WrappedCombineAdapter wrappedAdapter](self, "wrappedAdapter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v12, "removeCombinedConfigurationForScope:error:", a3, &v14);
      v13 = v14;

      v6[2](v6, v13);
    }
  }

}

- (RMConfigurationCombineAdapter)wrappedAdapter
{
  return self->_wrappedAdapter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedAdapter, 0);
}

@end
