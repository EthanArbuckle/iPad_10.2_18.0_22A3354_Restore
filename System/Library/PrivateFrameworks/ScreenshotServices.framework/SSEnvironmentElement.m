@implementation SSEnvironmentElement

- (SSEnvironmentElement)init
{
  SSEnvironmentElement *v2;
  void *v3;
  uint64_t v4;
  NSString *bundleIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSEnvironmentElement;
  v2 = -[SSEnvironmentElement init](&v7, sel_init);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v2->_bundleIdentifier;
  v2->_bundleIdentifier = (NSString *)v4;

  return v2;
}

- (SSEnvironmentElement)initWithDisplayLayoutElement:(id)a3
{
  id v3;
  SSEnvironmentElement *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  NSString *elementIdentifier;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SSEnvironmentElement;
  v3 = a3;
  v4 = -[SSEnvironmentElement init](&v17, sel_init);
  objc_msgSend(v3, "frame", v17.receiver, v17.super_class);
  v4->_rect.origin.x = v5;
  v4->_rect.origin.y = v6;
  v4->_rect.size.width = v7;
  v4->_rect.size.height = v8;
  objc_msgSend(v3, "bundleIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = (NSString *)v9;

  objc_msgSend(v3, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v11;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = objc_claimAutoreleasedReturnValue();
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v14;

  LOBYTE(v13) = objc_msgSend(v3, "hasKeyboardFocus");
  v4->_hasKeyboardFocus = (char)v13;
  return v4;
}

- (NSString)loggableDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGRect v12;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SSEnvironmentElement identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shorterLoggableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("identifier: %@ "), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[SSEnvironmentElement rect](self, "rect");
  NSStringFromCGRect(v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("rect: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  return (NSString *)v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SSEnvironmentElement rect](self, "rect");
  objc_msgSend(v7, "encodeCGRect:forKey:", CFSTR("SSEnvironmentElementRect"));
  -[SSEnvironmentElement bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("SSEnvironmentElementBundleIdentifier"));

  -[SSEnvironmentElement elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("SSEnvironmentElementIdentifier"));

  -[SSEnvironmentElement identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SSEnvironmentElementUUID"));

  objc_msgSend(v7, "encodeBool:forKey:", -[SSEnvironmentElement hasKeyboardFocus](self, "hasKeyboardFocus"), CFSTR("SSEnvironmentElementHasKeyboardFocusKey"));
}

- (SSEnvironmentElement)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSEnvironmentElement *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  uint64_t v12;
  NSString *elementIdentifier;
  uint64_t v14;
  NSString *identifier;
  char v16;

  v4 = a3;
  v5 = -[SSEnvironmentElement init](self, "init");
  objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("SSEnvironmentElementRect"));
  v5->_rect.origin.x = v6;
  v5->_rect.origin.y = v7;
  v5->_rect.size.width = v8;
  v5->_rect.size.height = v9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentElementBundleIdentifier"));
  v10 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentElementIdentifier"));
  v12 = objc_claimAutoreleasedReturnValue();
  elementIdentifier = v5->_elementIdentifier;
  v5->_elementIdentifier = (NSString *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentElementUUID"));
  v14 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v14;

  v16 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SSEnvironmentElementHasKeyboardFocusKey"));
  v5->_hasKeyboardFocus = v16;
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SSEnvironmentElement rect](self, "rect");
  v4[1] = v5;
  v4[2] = v6;
  v4[3] = v7;
  v4[4] = v8;
  -[SSEnvironmentElement bundleIdentifier](self, "bundleIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v4[5];
  v4[5] = v9;

  -[SSEnvironmentElement elementIdentifier](self, "elementIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v4[6];
  v4[6] = v11;

  -[SSEnvironmentElement identifier](self, "identifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v4[7];
  v4[7] = v13;

  *((_BYTE *)v4 + 64) = -[SSEnvironmentElement hasKeyboardFocus](self, "hasKeyboardFocus");
  return v4;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (BOOL)hasKeyboardFocus
{
  return self->_hasKeyboardFocus;
}

+ (id)_metadataIdentifierBlocklist
{
  if (_metadataIdentifierBlocklist_onceToken != -1)
    dispatch_once(&_metadataIdentifierBlocklist_onceToken, &__block_literal_global_2);
  return (id)_metadataIdentifierBlocklist___metadataIdentifierBlocklist;
}

void __52__SSEnvironmentElement__metadataIdentifierBlocklist__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", *MEMORY[0x24BEB0C28], *MEMORY[0x24BEB0C08], *MEMORY[0x24BEB0C60], *MEMORY[0x24BEB0C48], *MEMORY[0x24BEB0C10], *MEMORY[0x24BEB0C40], *MEMORY[0x24BEB0C50], *MEMORY[0x24BEB0C38], *MEMORY[0x24BEB0C20], *MEMORY[0x24BE38278], *MEMORY[0x24BE38288], *MEMORY[0x24BE38270], *MEMORY[0x24BE38280], *MEMORY[0x24BEB0C18], *MEMORY[0x24BEB0C58], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_metadataIdentifierBlocklist___metadataIdentifierBlocklist;
  _metadataIdentifierBlocklist___metadataIdentifierBlocklist = v0;

}

- (BOOL)supportsMetadataCapture
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "_metadataIdentifierBlocklist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSEnvironmentElement bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", v4) & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_metadataIdentifierBlocklist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSEnvironmentElement elementIdentifier](self, "elementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v7) ^ 1;

  }
  return v5;
}

- (BOOL)isAppLauncher
{
  if ((-[NSString isEqual:](self->_elementIdentifier, "isEqual:", *MEMORY[0x24BEB0BF8]) & 1) != 0
    || (-[NSString isEqual:](self->_elementIdentifier, "isEqual:", *MEMORY[0x24BEB0C00]) & 1) != 0
    || (-[NSString isEqual:](self->_elementIdentifier, "isEqual:", *MEMORY[0x24BEB0C70]) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[NSString isEqual:](self->_elementIdentifier, "isEqual:", *MEMORY[0x24BEB0C30]);
  }
}

- (SSHarvestedApplicationMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (SSHarvestedApplicationDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
