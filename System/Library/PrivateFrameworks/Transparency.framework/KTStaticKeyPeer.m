@implementation KTStaticKeyPeer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stripIMPrefix:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("im://")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("im://"), "length"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (KTStaticKeyPeer)initWithPeer:(id)a3
{
  id v4;
  KTStaticKeyPeer *v5;
  void *v6;
  void *v7;
  KTStaticKeyPeer *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTStaticKeyPeer;
  v5 = -[KTStaticKeyPeer init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "stripIMPrefix:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTStaticKeyPeer setPeer:](v5, "setPeer:", v6);

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTStaticKeyPeer setOtherNamesForPeer:](v5, "setOtherNamesForPeer:", v7);

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[KTStaticKeyPeer peer](self, "peer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("peer"));

  -[KTStaticKeyPeer otherNamesForPeer](self, "otherNamesForPeer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("otherNames"));

  -[KTStaticKeyPeer lastUsedAddressOfMe](self, "lastUsedAddressOfMe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[KTStaticKeyPeer lastUsedAddressOfMe](self, "lastUsedAddressOfMe");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("lastUsed"));

  }
}

- (KTStaticKeyPeer)initWithCoder:(id)a3
{
  id v4;
  KTStaticKeyPeer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  KTStaticKeyPeer *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KTStaticKeyPeer;
  v5 = -[KTStaticKeyPeer init](&v13, sel_init);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peer")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[KTStaticKeyPeer setPeer:](v5, "setPeer:", v6),
        v6,
        -[KTStaticKeyPeer peer](v5, "peer"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("otherNames"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTStaticKeyPeer setOtherNamesForPeer:](v5, "setOtherNamesForPeer:", v9);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUsed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTStaticKeyPeer setLastUsedAddressOfMe:](v5, "setLastUsedAddressOfMe:", v10);

    v11 = v5;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setOtherNamesForPeer:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSSet *otherNames;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend((id)objc_opt_class(), "stripIMPrefix:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSSet addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  otherNames = self->_otherNames;
  self->_otherNames = v5;

}

- (NSSet)otherNamesForPeer
{
  return self->_otherNames;
}

- (NSString)peer
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPeer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)lastUsedAddressOfMe
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastUsedAddressOfMe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedAddressOfMe, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_otherNames, 0);
}

@end
