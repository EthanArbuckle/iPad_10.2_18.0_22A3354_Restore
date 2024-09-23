@implementation QLURLExtensionPreview

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLURLExtensionPreview)initWithURLHandler:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  QLURLExtensionPreview *v8;
  QLURLExtensionPreview *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)QLURLExtensionPreview;
  v8 = -[QLExtensionPreview initWithDescription:](&v11, sel_initWithDescription_, 0);
  v9 = v8;
  if (v8)
  {
    -[QLURLExtensionPreview setUrlHandler:](v8, "setUrlHandler:", v6);
    objc_storeStrong((id *)&v9->_contentType, a4);
  }

  return v9;
}

- (QLURLExtensionPreview)initWithURL:(id)a3 contentType:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  QLURLExtensionPreview *v11;

  v6 = (objc_class *)MEMORY[0x24BDE5F10];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithURL:sandboxType:", v8, *MEMORY[0x24BDAC000]);

  v11 = -[QLURLExtensionPreview initWithURLHandler:contentType:](self, "initWithURLHandler:contentType:", v10, v7);
  return v11;
}

- (void)updateForExternalResourceAccessWithExtension:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a4, "_auxiliaryConnection", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.quickLook.externalResources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[QLURLExtensionPreview urlHandler](self, "urlHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsAccessToExternalResources:", v7);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLURLExtensionPreview;
  v4 = a3;
  -[QLExtensionPreview encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[QLURLExtensionPreview urlHandler](self, "urlHandler", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("urlHandler"));

  -[QLURLExtensionPreview contentType](self, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contentType"));

}

- (QLURLExtensionPreview)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  QLURLExtensionPreview *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[QLURLExtensionPreview initWithURLHandler:contentType:](self, "initWithURLHandler:contentType:", v5, v6);
  return v7;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[QLURLExtensionPreview urlHandler](self, "urlHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (QLURLHandler)urlHandler
{
  return (QLURLHandler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)additionalURLsAccessed
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdditionalURLsAccessed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalURLsAccessed, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
}

@end
