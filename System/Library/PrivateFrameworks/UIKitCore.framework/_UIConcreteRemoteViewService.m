@implementation _UIConcreteRemoteViewService

- (_UIConcreteRemoteViewService)initWithExtension:(id)a3 andContextToken:(id)a4
{
  id v7;
  id v8;
  id *v9;
  _UIConcreteRemoteViewService *v10;
  uint64_t v11;
  NSUUID *contextToken;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIConcreteRemoteViewService;
  v9 = -[_UIRemoteViewService _init](&v14, sel__init);
  v10 = (_UIConcreteRemoteViewService *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 3, a3);
    v11 = objc_msgSend(v8, "copy");
    contextToken = v10->_contextToken;
    v10->_contextToken = (NSUUID *)v11;

    -[_UIConcreteRemoteViewService updateOverridesHostAppearance](v10, "updateOverridesHostAppearance");
  }

  return v10;
}

- (void)updateOverridesHostAppearance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIConcreteRemoteViewService plugin](self, "plugin");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleInfoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSExtensionOverridesHostUIAppearance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_overridesHostAppearance = objc_msgSend(v5, "BOOLValue");

}

- (void)setPlugin:(id)a3
{
  -[NSExtension _setPlugIn:](self->_extension, "_setPlugIn:", a3);
  -[_UIConcreteRemoteViewService updateOverridesHostAppearance](self, "updateOverridesHostAppearance");
}

- (PKPlugIn)plugin
{
  return (PKPlugIn *)-[NSExtension _plugIn](self->_extension, "_plugIn");
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[_UIConcreteRemoteViewService plugin](self, "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)xpcServiceNameRoot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UIConcreteRemoteViewService extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_extensionBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[_UIConcreteRemoteViewService plugin](self, "plugin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)multipleInstances
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[_UIConcreteRemoteViewService plugin](self, "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleInfoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("XPCService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MultipleInstances"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (id)multipleInstanceUUID
{
  void *v2;
  void *v3;

  -[_UIConcreteRemoteViewService plugin](self, "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "multipleInstanceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)processIdentifier
{
  void *v3;
  void *v4;
  int v5;

  -[_UIConcreteRemoteViewService extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIConcreteRemoteViewService contextToken](self, "contextToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "pidForRequestIdentifier:", v4);

  return v5;
}

- (id)viewControllerClassName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  -[_UIConcreteRemoteViewService plugin](self, "plugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleInfoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[_UIConcreteRemoteViewService plugin](self, "plugin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleInfoDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClass"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v12, "copy");

  }
  return v9;
}

- (void)beginUsing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIConcreteRemoteViewService extension](self, "extension");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_safelyBeginUsing:", v4);

}

- (void)endUsing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIConcreteRemoteViewService extension](self, "extension");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_safelyEndUsing:", v4);

}

- (id)contextToken
{
  return self->_contextToken;
}

- (BOOL)overridesHostAppearance
{
  return self->_overridesHostAppearance;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_contextToken, 0);
}

@end
