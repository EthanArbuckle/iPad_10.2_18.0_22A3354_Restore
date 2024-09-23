@implementation SKAPFSContainerDisk

- (void)updateWithDictionary:(id)a3
{
  id v4;
  SKAPFSContainerDisk *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7.receiver = v5;
  v7.super_class = (Class)SKAPFSContainerDisk;
  -[SKDisk updateWithDictionary:](&v7, sel_updateWithDictionary_, v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("designatedPSUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSContainerDisk setDesignatedPSUUID:](v5, "setDesignatedPSUUID:", v6);

  objc_sync_exit(v5);
}

- (id)minimalDictionaryRepresentation
{
  SKAPFSContainerDisk *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)SKAPFSContainerDisk;
  -[SKDisk minimalDictionaryRepresentation](&v7, sel_minimalDictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAPFSContainerDisk designatedPSUUID](v2, "designatedPSUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SKAPFSContainerDisk designatedPSUUID](v2, "designatedPSUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("designatedPSUUID"));

  }
  objc_sync_exit(v2);

  return v3;
}

- (id)dictionaryRepresentation
{
  SKAPFSContainerDisk *v2;
  void *v3;
  objc_super v5;

  v2 = self;
  objc_sync_enter(v2);
  v5.receiver = v2;
  v5.super_class = (Class)SKAPFSContainerDisk;
  -[SKDisk dictionaryRepresentation](&v5, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;

  if (-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk", a3))
  {
    v4 = CFSTR("liveFS");
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[SKAPFSContainerDisk apfsUUID](self, "apfsUUID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("--");
    if (v6)
      v8 = (const __CFString *)v6;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("APFS UUID: %@"), v8);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)physicalStores
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[SKBaseManager sharedManager](SKBaseManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "allDisks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          if (objc_msgSend(v11, "isOurContainerWithDisk:", self))
            objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)copyVolumesWithIncludeSnapshots:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SKDisk children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)volumes
{
  return -[SKAPFSContainerDisk copyVolumesWithIncludeSnapshots:](self, "copyVolumesWithIncludeSnapshots:", 1);
}

- (id)volumesExcludingSnapshots
{
  return -[SKAPFSContainerDisk copyVolumesWithIncludeSnapshots:](self, "copyVolumesWithIncludeSnapshots:", 0);
}

- (id)designatedPhysicalStore
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SKAPFSContainerDisk physicalStores](self, "physicalStores");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[SKDisk isLiveFSAPFSDisk](self, "isLiveFSAPFSDisk", (_QWORD)v16))
          goto LABEL_12;
        -[SKAPFSContainerDisk designatedPSUUID](self, "designatedPSUUID");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_12;
        v10 = (void *)v9;
        -[SKAPFSContainerDisk designatedPSUUID](self, "designatedPSUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "apfsUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
LABEL_12:
          v14 = v8;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (BOOL)isVirtualDiskType
{
  return 1;
}

- (NSString)designatedPSUUID
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDesignatedPSUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_designatedPSUUID, 0);
}

@end
