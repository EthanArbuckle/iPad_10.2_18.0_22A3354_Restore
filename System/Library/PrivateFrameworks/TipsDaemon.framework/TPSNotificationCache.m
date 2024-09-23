@implementation TPSNotificationCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)notificationCacheWithCollectionIdentifier:(id)a3 document:(id)a4 type:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCollectionIdentifier:document:type:", v8, v7, a5);

  return v9;
}

- (TPSNotificationCache)initWithCollectionIdentifier:(id)a3 document:(id)a4 type:(unint64_t)a5
{
  id v9;
  id v10;
  TPSNotificationCache *v11;
  TPSNotificationCache *v12;
  void *v13;
  uint64_t v14;
  NSString *locale;

  v9 = a3;
  v10 = a4;
  v11 = -[TPSNotificationCache init](self, "init");
  v12 = v11;
  if (v11)
  {
    v11->_type = a5;
    objc_storeStrong((id *)&v11->_collectionIdentifier, a3);
    objc_storeStrong((id *)&v12->_document, a4);
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
    locale = v12->_locale;
    v12->_locale = (NSString *)v14;

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TPSNotificationCache locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setType:", -[TPSNotificationCache type](self, "type"));
  -[TPSNotificationCache extensionPayload](self, "extensionPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtensionPayload:", v6);

  -[TPSNotificationCache document](self, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDocument:", v7);

  -[TPSNotificationCache attachmentURL](self, "attachmentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttachmentURL:", v8);

  -[TPSNotificationCache collectionIdentifier](self, "collectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionIdentifier:", v9);

  return v4;
}

- (TPSNotificationCache)initWithCoder:(id)a3
{
  id v4;
  TPSNotificationCache *v5;
  uint64_t v6;
  NSString *locale;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *extensionPayload;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  TPSDocument *document;
  uint64_t v18;
  NSString *collectionIdentifier;
  uint64_t v20;
  NSURL *attachmentURL;
  objc_super v23;
  _QWORD v24[3];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSNotificationCache;
  v5 = -[TPSNotificationCache init](&v23, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v6 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("extensionPayload"));
    v11 = objc_claimAutoreleasedReturnValue();
    extensionPayload = v5->_extensionPayload;
    v5->_extensionPayload = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("document"));
    v16 = objc_claimAutoreleasedReturnValue();
    document = v5->_document;
    v5->_document = (TPSDocument *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collectionIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    collectionIdentifier = v5->_collectionIdentifier;
    v5->_collectionIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachmentURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    attachmentURL = v5->_attachmentURL;
    v5->_attachmentURL = (NSURL *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSNotificationCache type](self, "type"), CFSTR("type"));
  -[TPSNotificationCache locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("locale"));

  -[TPSNotificationCache extensionPayload](self, "extensionPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extensionPayload"));

  -[TPSNotificationCache document](self, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("document"));

  -[TPSNotificationCache collectionIdentifier](self, "collectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("collectionIdentifier"));

  -[TPSNotificationCache attachmentURL](self, "attachmentURL");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("attachmentURL"));

}

- (BOOL)hasLocaleChanged
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSNotificationCache locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", v5) ^ 1;

  return (char)v3;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v14.receiver = self;
  v14.super_class = (Class)TPSNotificationCache;
  -[TPSNotificationCache debugDescription](&v14, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@ = %lu\n"), CFSTR("type"), -[TPSNotificationCache type](self, "type"));
  -[TPSNotificationCache document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("document"), v7);

  -[TPSNotificationCache collectionIdentifier](self, "collectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("collectionIdentifier"), v8);

  -[TPSNotificationCache locale](self, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("locale"), v9);

  -[TPSNotificationCache attachmentURL](self, "attachmentURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("attachmentURL"), v10);

  -[TPSNotificationCache extensionPayload](self, "extensionPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TPSNotificationCache extensionPayload](self, "extensionPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("extensionPayload"), v12);

  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (void)setCollectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIdentifier, a3);
}

- (NSDictionary)extensionPayload
{
  return self->_extensionPayload;
}

- (void)setExtensionPayload:(id)a3
{
  objc_storeStrong((id *)&self->_extensionPayload, a3);
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentURL, a3);
}

- (TPSDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_extensionPayload, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

@end
