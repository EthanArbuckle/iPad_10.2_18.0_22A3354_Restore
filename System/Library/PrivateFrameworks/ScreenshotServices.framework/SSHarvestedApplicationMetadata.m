@implementation SSHarvestedApplicationMetadata

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SSHarvestedApplicationMetadata)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSHarvestedApplicationMetadata *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *contentRects;
  uint64_t v9;
  NSString *userActivityTitle;
  void *v11;
  uint64_t v12;
  NSURL *userActivityURL;

  v4 = a3;
  v5 = -[SSHarvestedApplicationMetadata init](self, "init");
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("kSSHarvestedApplicationMetadataContentRectsKey"));
  v7 = objc_claimAutoreleasedReturnValue();
  contentRects = v5->_contentRects;
  v5->_contentRects = (NSArray *)v7;

  v5->_canGenerateDocument = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSSHarvestedApplicationMetadataCanGenerateDocument"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSSHarvestedApplicationMetadataUserActivityTitleKey"));
  v9 = objc_claimAutoreleasedReturnValue();
  userActivityTitle = v5->_userActivityTitle;
  v5->_userActivityTitle = (NSString *)v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSSHarvestedApplicationMetadataUserActivityURLKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  userActivityURL = v5->_userActivityURL;
  v5->_userActivityURL = (NSURL *)v12;

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SSHarvestedApplicationMetadata contentRects](self, "contentRects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v5, CFSTR("kSSHarvestedApplicationMetadataContentRectsKey"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_canGenerateDocument, CFSTR("kSSHarvestedApplicationMetadataCanGenerateDocument"));
  -[SSHarvestedApplicationMetadata userActivityTitle](self, "userActivityTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSSHarvestedApplicationMetadataUserActivityTitleKey"));

  -[SSHarvestedApplicationMetadata userActivityURL](self, "userActivityURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kSSHarvestedApplicationMetadataUserActivityURLKey"));

}

- (NSString)loggableDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR(" contentRects: <"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SSHarvestedApplicationMetadata contentRects](self, "contentRects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "CGRectValue");
        NSStringFromCGRect(v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        objc_msgSend(v3, "appendString:", CFSTR(" "));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[SSHarvestedApplicationMetadata userActivityTitle](self, "userActivityTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR(" has userActivityTitle: %d"), v11 != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v12);

  if (self->_canGenerateDocument)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" can provide PDF: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v14);

  return (NSString *)v3;
}

- (NSString)userActivityTitle
{
  return self->_userActivityTitle;
}

- (void)setUserActivityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)userActivityURL
{
  return self->_userActivityURL;
}

- (void)setUserActivityURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)contentRects
{
  return self->_contentRects;
}

- (void)setContentRects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)canGenerateDocument
{
  return self->_canGenerateDocument;
}

- (void)setCanGenerateDocument:(BOOL)a3
{
  self->_canGenerateDocument = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRects, 0);
  objc_storeStrong((id *)&self->_userActivityURL, 0);
  objc_storeStrong((id *)&self->_userActivityTitle, 0);
}

@end
