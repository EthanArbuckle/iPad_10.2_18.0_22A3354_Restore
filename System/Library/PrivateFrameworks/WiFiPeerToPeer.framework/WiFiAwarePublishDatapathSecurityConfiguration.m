@implementation WiFiAwarePublishDatapathSecurityConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WiFiAwarePublishDatapathSecurityConfiguration pmkList](self, "pmkList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WiFiAwarePublishDatapathSecurityConfiguration.pmkList"));

  -[WiFiAwarePublishDatapathSecurityConfiguration passphraseList](self, "passphraseList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WiFiAwarePublishDatapathSecurityConfiguration.passphraseList"));

  -[WiFiAwarePublishDatapathSecurityConfiguration pmkID](self, "pmkID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WiFiAwarePublishDatapathSecurityConfiguration.pmkID"));

}

- (WiFiAwarePublishDatapathSecurityConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WiFiAwarePublishDatapathSecurityConfiguration *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishDatapathSecurityConfiguration.pmkList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishDatapathSecurityConfiguration.passphraseList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count")
    && objc_msgSend(v5, "count") == 1
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwarePublishDatapathSecurityConfiguration.pmkID")), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WiFiAwarePublishDatapathSecurityConfiguration initWithPMK:andPMKID:](self, "initWithPMK:andPMKID:", v9, v8);

  }
  else
  {
    v10 = -[WiFiAwarePublishDatapathSecurityConfiguration initWithPMKList:passphraseList:](self, "initWithPMKList:passphraseList:", v5, v6);
  }

  return v10;
}

- (WiFiAwarePublishDatapathSecurityConfiguration)initWithPMKList:(id)a3 passphraseList:(id)a4
{
  id v6;
  id v7;
  WiFiAwarePublishDatapathSecurityConfiguration *v8;
  uint64_t v9;
  NSArray *pmkList;
  uint64_t v11;
  NSArray *passphraseList;
  NSData *pmkID;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WiFiAwarePublishDatapathSecurityConfiguration;
  v8 = -[WiFiAwarePublishDatapathSecurityConfiguration init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    pmkList = v8->_pmkList;
    v8->_pmkList = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    passphraseList = v8->_passphraseList;
    v8->_passphraseList = (NSArray *)v11;

    pmkID = v8->_pmkID;
    v8->_pmkID = 0;

  }
  return v8;
}

- (WiFiAwarePublishDatapathSecurityConfiguration)initWithPMK:(id)a3 andPMKID:(id)a4
{
  id v6;
  id v7;
  WiFiAwarePublishDatapathSecurityConfiguration *v8;
  void *v9;
  uint64_t v10;
  NSArray *pmkList;
  NSArray *passphraseList;
  uint64_t v13;
  NSData *pmkID;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WiFiAwarePublishDatapathSecurityConfiguration;
  v8 = -[WiFiAwarePublishDatapathSecurityConfiguration init](&v16, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    pmkList = v8->_pmkList;
    v8->_pmkList = (NSArray *)v10;

    passphraseList = v8->_passphraseList;
    v8->_passphraseList = (NSArray *)MEMORY[0x1E0C9AA60];

    v13 = objc_msgSend(v7, "copy");
    pmkID = v8->_pmkID;
    v8->_pmkID = (NSData *)v13;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WiFiAwarePublishDatapathSecurityConfiguration *v4;
  WiFiAwarePublishDatapathSecurityConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  char v17;

  v4 = (WiFiAwarePublishDatapathSecurityConfiguration *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = 0;
      v5 = 0;
      goto LABEL_14;
    }
    v5 = v4;
    -[WiFiAwarePublishDatapathSecurityConfiguration pmkList](self, "pmkList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwarePublishDatapathSecurityConfiguration pmkList](v5, "pmkList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToArray:", v7) & 1) != 0)
    {
      -[WiFiAwarePublishDatapathSecurityConfiguration passphraseList](self, "passphraseList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiAwarePublishDatapathSecurityConfiguration passphraseList](v5, "passphraseList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToArray:", v9))
      {
        -[WiFiAwarePublishDatapathSecurityConfiguration pmkID](self, "pmkID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiAwarePublishDatapathSecurityConfiguration pmkID](v5, "pmkID");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v10 == (void *)v11)
        {

        }
        else
        {
          v12 = (void *)v11;
          -[WiFiAwarePublishDatapathSecurityConfiguration pmkID](self, "pmkID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WiFiAwarePublishDatapathSecurityConfiguration pmkID](v5, "pmkID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v13, "isEqual:", v14);

          if ((v17 & 1) == 0)
            goto LABEL_13;
        }
        goto LABEL_9;
      }

    }
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v5 = 0;
LABEL_9:
  v15 = 1;
LABEL_14:

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[WiFiAwarePublishDatapathSecurityConfiguration pmkList](self, "pmkList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v8);
        if (objc_msgSend(v3, "length"))
          objc_msgSend(v3, "appendString:", CFSTR(", "));
        objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[WiFiAwarePublishDatapathSecurityConfiguration passphraseList](self, "passphraseList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        if (objc_msgSend(v3, "length"))
          objc_msgSend(v3, "appendString:", CFSTR(", "));
        objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v15);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v12);
  }

  -[WiFiAwarePublishDatapathSecurityConfiguration pmkID](self, "pmkID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[WiFiAwarePublishDatapathSecurityConfiguration pmkID](self, "pmkID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", PMK-ID: %@"), v17);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSArray)pmkList
{
  return self->_pmkList;
}

- (NSArray)passphraseList
{
  return self->_passphraseList;
}

- (NSData)pmkID
{
  return self->_pmkID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pmkID, 0);
  objc_storeStrong((id *)&self->_passphraseList, 0);
  objc_storeStrong((id *)&self->_pmkList, 0);
}

@end
