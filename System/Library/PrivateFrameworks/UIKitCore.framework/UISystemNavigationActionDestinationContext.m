@implementation UISystemNavigationActionDestinationContext

+ (id)systemNavigationActionContextWithTitle:(id)a3 andURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(a1, "systemNavigationActionContextWithTitle:bundleId:", v6, 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v7)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_msgSend(a1, "systemNavigationActionContextWithURL:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_6:

  return v10;
}

+ (id)systemNavigationActionContextWithTitle:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setTitle:", v7);

  objc_msgSend(v8, "setBundleId:", v6);
  return v8;
}

+ (id)systemNavigationActionContextWithTitle:(id)a3 sceneIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setTitle:", v7);

  objc_msgSend(v8, "setSceneIdentifier:", v6);
  return v8;
}

+ (id)systemNavigationActionContextWithURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setURL:", v4);

  return v5;
}

- (UISystemNavigationActionDestinationContext)initWithXPCDictionary:(id)a3
{
  id v4;
  UISystemNavigationActionDestinationContext *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *bundleId;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *URL;
  void *v16;
  uint64_t v17;
  NSString *sceneIdentifier;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UISystemNavigationActionDestinationContext;
  v5 = -[UISystemNavigationActionDestinationContext init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    v7 = objc_msgSend(v6, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    v10 = objc_msgSend(v9, "copy");
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v10;

    v12 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v14 = objc_msgSend(v13, "copy");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v14;

    v16 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    v17 = objc_msgSend(v16, "copy");
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v17;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  NSURL *URL;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[NSString length](self->_title, "length"))
    BSSerializeStringToXPCDictionaryWithKey();
  if (-[NSString length](self->_bundleId, "length"))
    BSSerializeStringToXPCDictionaryWithKey();
  URL = self->_URL;
  if (URL)
  {
    -[NSURL absoluteString](URL, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeStringToXPCDictionaryWithKey();

  }
  v6 = v7;
  if (self->_sceneIdentifier)
  {
    BSSerializeStringToXPCDictionaryWithKey();
    v6 = v7;
  }

}

- (NSString)debugDescription
{
  NSString *title;
  NSString *sceneIdentifier;
  NSURL *URL;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  title = self->_title;
  if (title)
  {
    sceneIdentifier = self->_sceneIdentifier;
    if (sceneIdentifier)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: title: %@, sceneIdentifier: %@>"), self, title, sceneIdentifier);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: title: %@, bundleId: %@>"), self, title, self->_bundleId);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  URL = self->_URL;
  if (!URL)
  {
    v11.receiver = self;
    v11.super_class = (Class)UISystemNavigationActionDestinationContext;
    -[UISystemNavigationActionDestinationContext debugDescription](&v11, sel_debugDescription);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = (void *)v9;
    return (NSString *)v8;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[NSURL absoluteString](URL, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: URL: %@>"), self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
