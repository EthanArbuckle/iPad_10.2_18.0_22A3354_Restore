@implementation SSEnvironmentElementDocumentUpdate

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SSEnvironmentElementDocumentUpdate environmentElementIdentifier](self, "environmentElementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SSEnvironmentElementMetadataUpdateEnvironmentElementIdentifierKey"));

  -[SSEnvironmentElementDocumentUpdate document](self, "document");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SSEnvironmentElementMetadataUpdateDocumentKey"));

}

- (SSEnvironmentElementDocumentUpdate)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSEnvironmentElementDocumentUpdate *v5;
  uint64_t v6;
  NSString *environmentElementIdentifier;
  uint64_t v8;
  SSHarvestedApplicationDocument *document;

  v4 = a3;
  v5 = -[SSEnvironmentElementDocumentUpdate init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentElementMetadataUpdateEnvironmentElementIdentifierKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  environmentElementIdentifier = v5->_environmentElementIdentifier;
  v5->_environmentElementIdentifier = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSEnvironmentElementMetadataUpdateDocumentKey"));
  v8 = objc_claimAutoreleasedReturnValue();

  document = v5->_document;
  v5->_document = (SSHarvestedApplicationDocument *)v8;

  return v5;
}

- (BSSettings)bsSettings
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v3, "setObject:forSetting:", self, 6);
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

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SSEnvironmentElementDocumentUpdate environmentElementIdentifier](self, "environmentElementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shorterLoggableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("element: %@ "), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  objc_msgSend(v3, "appendString:", CFSTR("metadata: <"));
  -[SSEnvironmentElementDocumentUpdate document](self, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SSEnvironmentElementDocumentUpdate document](self, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggableDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v10);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSString)environmentElementIdentifier
{
  return self->_environmentElementIdentifier;
}

- (void)setEnvironmentElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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
  objc_storeStrong((id *)&self->_environmentElementIdentifier, 0);
}

@end
