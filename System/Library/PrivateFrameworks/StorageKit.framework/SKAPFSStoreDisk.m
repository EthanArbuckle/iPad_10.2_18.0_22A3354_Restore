@implementation SKAPFSStoreDisk

- (void)updateWithDictionary:(id)a3
{
  id v4;
  SKAPFSStoreDisk *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8.receiver = v5;
  v8.super_class = (Class)SKAPFSStoreDisk;
  -[SKDisk updateWithDictionary:](&v8, sel_updateWithDictionary_, v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("apfsContainerUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSStoreDisk setApfsContainerUUID:](v5, "setApfsContainerUUID:", v6);

  objc_msgSend(v4, "objectForKey:", CFSTR("apfsContainerIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSStoreDisk setApfsContainerIdentifier:](v5, "setApfsContainerIdentifier:", v7);

  objc_sync_exit(v5);
}

- (id)minimalDictionaryRepresentation
{
  SKAPFSStoreDisk *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)SKAPFSStoreDisk;
  -[SKDisk minimalDictionaryRepresentation](&v7, sel_minimalDictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSStoreDisk apfsContainerUUID](v2, "apfsContainerUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("apfsContainerUUID"));

  -[SKAPFSStoreDisk apfsContainerIdentifier](v2, "apfsContainerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("apfsContainerIdentifier"));

  objc_sync_exit(v2);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKAPFSStoreDisk;
  if (-[SKDisk isEqual:](&v11, sel_isEqual_, v4))
  {
    -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "apfsContainerUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[SKAPFSStoreDisk apfsContainerIdentifier](self, "apfsContainerIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "apfsContainerIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SKAPFSStoreDisk apfsUUID](self, "apfsUUID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SKAPFSStoreDisk apfsUUID](self, "apfsUUID");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("--");
  }
  -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("APFS UUID: %@, Container UUID: %@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("APFS UUID: %@, Container UUID: %@"), v6, CFSTR("--"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v5)
  return v9;
}

- (BOOL)canResize
{
  return 1;
}

- (BOOL)isOurContainerWithDisk:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_4;
    v7 = (void *)v6;
    -[SKAPFSStoreDisk apfsContainerUUID](self, "apfsContainerUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "apfsUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
      v13 = 0;
    }
    else
    {
LABEL_4:
      objc_msgSend(v5, "diskIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKAPFSStoreDisk apfsContainerIdentifier](self, "apfsContainerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)container
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "allDisks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[SKAPFSStoreDisk isOurContainerWithDisk:](self, "isOurContainerWithDisk:", v9))
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSString)apfsContainerUUID
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setApfsContainerUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)apfsContainerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setApfsContainerIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apfsContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_apfsContainerUUID, 0);
}

@end
