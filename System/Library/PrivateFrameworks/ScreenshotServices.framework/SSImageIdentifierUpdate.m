@implementation SSImageIdentifierUpdate

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SSImageIdentifierUpdate)initWithBSXPCCoder:(id)a3
{
  id v3;
  SSImageIdentifierUpdate *v4;
  uint64_t v5;
  NSString *imageIdentifier;
  uint64_t v7;
  NSString *environmentDescriptionIdentifier;
  char v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSImageIdentifierUpdate;
  v3 = a3;
  v4 = -[SSImageIdentifierUpdate init](&v11, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSImageIdentifierUpdateKeyImageIdentifier"), v11.receiver, v11.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  imageIdentifier = v4->_imageIdentifier;
  v4->_imageIdentifier = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSImageIdentifierUpdateKeyEnvironmentDescriptionIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  environmentDescriptionIdentifier = v4->_environmentDescriptionIdentifier;
  v4->_environmentDescriptionIdentifier = (NSString *)v7;

  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("SSImageIdentifierUpdateKeySuccess"));
  v4->_success = v9;
  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SSImageIdentifierUpdate imageIdentifier](self, "imageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("SSImageIdentifierUpdateKeyImageIdentifier"));

  -[SSImageIdentifierUpdate environmentDescriptionIdentifier](self, "environmentDescriptionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("SSImageIdentifierUpdateKeyEnvironmentDescriptionIdentifier"));

  objc_msgSend(v6, "encodeBool:forKey:", -[SSImageIdentifierUpdate success](self, "success"), CFSTR("SSImageIdentifierUpdateKeySuccess"));
}

- (BSSettings)bsSettings
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v3, "setObject:forSetting:", self, 2);
  return (BSSettings *)v3;
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
  void *v11;
  void *v12;
  _BOOL4 v13;
  const __CFString *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SSImageIdentifierUpdate imageIdentifier](self, "imageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shorterLoggableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("imageIdentifier: %@ "), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[SSImageIdentifierUpdate environmentDescriptionIdentifier](self, "environmentDescriptionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shorterLoggableString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("environmentDescriptionIdentifier: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v11);

  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = -[SSImageIdentifierUpdate success](self, "success");
  v14 = CFSTR("NO");
  if (v13)
    v14 = CFSTR("YES");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("success: %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v15);

  return (NSString *)v3;
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (void)setImageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)environmentDescriptionIdentifier
{
  return self->_environmentDescriptionIdentifier;
}

- (void)setEnvironmentDescriptionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

@end
