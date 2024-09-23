@implementation SKAPFSDisk

- (void)updateWithDictionary:(id)a3
{
  id v4;
  SKAPFSDisk *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v13.receiver = v5;
  v13.super_class = (Class)SKAPFSDisk;
  -[SKDisk updateWithDictionary:](&v13, sel_updateWithDictionary_, v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("isEncrypted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setIsEncrypted:](v5, "setIsEncrypted:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("defaultEffaceable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setDefaultEffaceable:](v5, "setDefaultEffaceable:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("usedSpace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setUsedSpace:](v5, "setUsedSpace:", objc_msgSend(v8, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("reserveSpace"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setReserveSpace:](v5, "setReserveSpace:", objc_msgSend(v9, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("quotaSpace"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setQuotaSpace:](v5, "setQuotaSpace:", objc_msgSend(v10, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("apfsRole"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setApfsRole:](v5, "setApfsRole:", v11);

  objc_msgSend(v4, "objectForKey:", CFSTR("apfsVolumeGroupUUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSDisk setApfsVolumeGroupUUID:](v5, "setApfsVolumeGroupUUID:", v12);

  objc_sync_exit(v5);
}

- (id)dictionaryRepresentation
{
  SKAPFSDisk *v2;
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
  objc_super v14;

  v2 = self;
  objc_sync_enter(v2);
  v14.receiver = v2;
  v14.super_class = (Class)SKAPFSDisk;
  -[SKDisk dictionaryRepresentation](&v14, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKAPFSDisk usedSpace](v2, "usedSpace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("usedSpace"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKAPFSDisk quotaSpace](v2, "quotaSpace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("quotaSpace"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SKAPFSDisk reserveSpace](v2, "reserveSpace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("reserveSpace"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKAPFSDisk isEncrypted](v2, "isEncrypted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("isEncrypted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SKAPFSDisk defaultEffaceable](v2, "defaultEffaceable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("defaultEffaceable"));

  -[SKAPFSDisk apfsVolumeGroupUUID](v2, "apfsVolumeGroupUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SKAPFSDisk apfsVolumeGroupUUID](v2, "apfsVolumeGroupUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("apfsVolumeGroupUUID"));

  }
  -[SKAPFSDisk apfsRole](v2, "apfsRole");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SKAPFSDisk apfsRole](v2, "apfsRole");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("apfsRole"));

  }
  objc_sync_exit(v2);

  return v3;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[SKAPFSDisk apfsUUID](self, "apfsUUID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SKAPFSDisk apfsUUID](self, "apfsUUID");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("--");
  }
  v7 = -[SKAPFSDisk isEncrypted](self, "isEncrypted");
  v8 = CFSTR("No");
  if (v7)
    v8 = CFSTR("Yes");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("APFS UUID: %@, Encrypted: %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)

  return v9;
}

- (id)container
{
  void *v2;
  id v3;

  -[SKDisk cachedWholeDiskByIdentifier](self, "cachedWholeDiskByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)wholeDiskIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk"))
  {
    v3 = objc_alloc(MEMORY[0x24BDBCF48]);
    -[SKDisk diskIdentifier](self, "diskIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("apfs://%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKAPFSDisk;
    -[SKDisk wholeDiskIdentifier](&v10, sel_wholeDiskIdentifier);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)matchesDictionary:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  if (-[SKDisk isIOMediaDisk](self, "isIOMediaDisk"))
  {
    v12.receiver = self;
    v12.super_class = (Class)SKAPFSDisk;
    v5 = -[SKDisk matchesDictionary:](&v12, sel_matchesDictionary_, v4);
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("**ClassName**"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[SKDisk mountPoint](self, "mountPoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("mountPoint"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)minimalDictionaryRepresentation
{
  SKAPFSDisk *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = self;
  objc_sync_enter(v2);
  v6.receiver = v2;
  v6.super_class = (Class)SKAPFSDisk;
  -[SKDisk minimalDictionaryRepresentation](&v6, sel_minimalDictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SKDisk isIOMediaDisk](v2, "isIOMediaDisk"))
  {
    -[SKDisk mountPoint](v2, "mountPoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("mountPoint"));

  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (-[SKDisk isIOMediaDisk](self, "isIOMediaDisk"))
  {
    v10.receiver = self;
    v10.super_class = (Class)SKAPFSDisk;
    v5 = -[SKDisk isEqual:](&v10, sel_isEqual_, v4);
  }
  else if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = v4;
    -[SKDisk mountPoint](self, "mountPoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mountPoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasVolumeSiblings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[SKAPFSDisk container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SKAPFSDisk container](self, "container");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "volumes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SKAPFSDisk container](self, "container");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "volumes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (unint64_t)objc_msgSend(v7, "count") > 1;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)usedSpace
{
  return self->_usedSpace;
}

- (void)setUsedSpace:(unint64_t)a3
{
  self->_usedSpace = a3;
}

- (unint64_t)reserveSpace
{
  return self->_reserveSpace;
}

- (void)setReserveSpace:(unint64_t)a3
{
  self->_reserveSpace = a3;
}

- (unint64_t)quotaSpace
{
  return self->_quotaSpace;
}

- (void)setQuotaSpace:(unint64_t)a3
{
  self->_quotaSpace = a3;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (BOOL)defaultEffaceable
{
  return self->_defaultEffaceable;
}

- (void)setDefaultEffaceable:(BOOL)a3
{
  self->_defaultEffaceable = a3;
}

- (NSString)apfsVolumeGroupUUID
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setApfsVolumeGroupUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)apfsRole
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setApfsRole:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apfsRole, 0);
  objc_storeStrong((id *)&self->_apfsVolumeGroupUUID, 0);
}

@end
