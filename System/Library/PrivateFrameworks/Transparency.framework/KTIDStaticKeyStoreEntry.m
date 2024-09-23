@implementation KTIDStaticKeyStoreEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTIDStaticKeyStoreEntry)init
{
  KTIDStaticKeyStoreEntry *v2;
  void *v3;
  KTIDStaticKeyStoreEntry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KTIDStaticKeyStoreEntry;
  v2 = -[KTIDStaticKeyStoreEntry init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDStaticKeyStoreEntry setHandles:](v2, "setHandles:", v3);

    v4 = v2;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  KTIDStaticKeyStoreEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = -[KTIDStaticKeyStoreEntry init](+[KTIDStaticKeyStoreEntry allocWithZone:](KTIDStaticKeyStoreEntry, "allocWithZone:"), "init");
  -[KTIDStaticKeyStoreEntry contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[KTIDStaticKeyStoreEntry setContactIdentifier:](v5, "setContactIdentifier:", v7);

  -[KTIDStaticKeyStoreEntry contactExternalURI](self, "contactExternalURI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[KTIDStaticKeyStoreEntry setContactExternalURI:](v5, "setContactExternalURI:", v9);

  -[KTIDStaticKeyStoreEntry handles](self, "handles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[KTIDStaticKeyStoreEntry setHandles:](v5, "setHandles:", v11);

  -[KTIDStaticKeyStoreEntry publicKeyID](self, "publicKeyID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[KTIDStaticKeyStoreEntry setPublicKeyID:](v5, "setPublicKeyID:", v13);

  return v5;
}

- (BOOL)valid
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[KTIDStaticKeyStoreEntry contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contactIdentifier"));

  -[KTIDStaticKeyStoreEntry contactExternalURI](self, "contactExternalURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contactExternalURI"));

  -[KTIDStaticKeyStoreEntry publicKeyID](self, "publicKeyID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("publicKeyID"));

  -[KTIDStaticKeyStoreEntry handles](self, "handles");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("handles"));

}

- (KTIDStaticKeyStoreEntry)initWithCoder:(id)a3
{
  id v4;
  KTIDStaticKeyStoreEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  KTIDStaticKeyStoreEntry *v15;

  v4 = a3;
  v5 = objc_alloc_init(KTIDStaticKeyStoreEntry);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDStaticKeyStoreEntry setPublicKeyID:](v5, "setPublicKeyID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDStaticKeyStoreEntry setContactIdentifier:](v5, "setContactIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactExternalURI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDStaticKeyStoreEntry setContactExternalURI:](v5, "setContactExternalURI:", v8);

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("handles"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    -[KTIDStaticKeyStoreEntry setHandles:](v5, "setHandles:", v14);

    v15 = v5;
  }

  return v5;
}

- (NSArray)mappings
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->handles, "allKeys");
}

- (void)setMappings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  KTIDStaticKeyStoreHandle *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEF0];
  -[KTIDStaticKeyStoreEntry handles](self, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v8, "removeObject:", v14);
        -[KTIDStaticKeyStoreEntry handles](self, "handles");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v16 = (KTIDStaticKeyStoreHandle *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v16 = objc_alloc_init(KTIDStaticKeyStoreHandle);
          -[KTIDStaticKeyStoreHandle setHandle:](v16, "setHandle:", v14);
          -[KTIDStaticKeyStoreHandle setValid:](v16, "setValid:", 0);
          -[KTIDStaticKeyStoreEntry handles](self, "handles");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        -[KTIDStaticKeyStoreEntry handles](self, "handles", (_QWORD)v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", 0, v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

}

- (KTAccountPublicID)publicKeyID
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPublicKeyID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)handles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)contactExternalURI
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContactExternalURI:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->contactIdentifier, 0);
  objc_storeStrong((id *)&self->contactExternalURI, 0);
  objc_storeStrong((id *)&self->handles, 0);
  objc_storeStrong((id *)&self->publicKeyID, 0);
}

@end
