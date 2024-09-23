@implementation SKDiskPrivateCache

- (SKDiskPrivateCache)init
{
  SKDiskPrivateCache *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKDiskPrivateCache;
  result = -[SKDiskPrivateCache init](&v3, "init");
  if (result)
    result->_schemeID = 512;
  return result;
}

- (id)copyHumanIOContentWithMediaDict:(id)a3 isWholeDisk:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  SKIOMedia *v10;
  void *v11;
  SKIOMedia *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unsigned __int16 v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  id v28;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Content")));
  -[SKDiskPrivateCache setRawIOContent:](self, "setRawIOContent:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
  if (!v7)
    return 0;
  if (v4)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
  }
  else
  {
    v10 = [SKIOMedia alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache wholeDADisk](self, "wholeDADisk"));
    v12 = -[SKIOMedia initWithDADisk:](v10, "initWithDADisk:", v11);

    v8 = -[SKIOObject copyPropertyWithClass:key:](v12, "copyPropertyWithClass:key:", objc_opt_class(NSString), CFSTR("Content"));
  }
  if (sub_10000FABC(v8))
  {
    v13 = v8;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Apple_partition_scheme")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("FDisk_partition_scheme")) & 1) != 0)
    {
      v14 = 8;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("GUID_partition_scheme")))
    {
      v14 = 16;
    }
    else
    {
      v14 = 512;
    }

  }
  else
  {
    v14 = 512;
  }
  -[SKDiskPrivateCache setSchemeID:](self, "setSchemeID:", v14);
  if (-[SKDiskPrivateCache schemeID](self, "schemeID") == 512)
  {
    if (v4)
    {
      v15 = 0;
      v16 = 0;
      while (1)
      {
        v17 = v16;
        v18 = (unsigned __int16)word_10003CFC0[v15];
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
        v16 = (void *)MKTypeToHuman(v18, v19, &off_100047CC8);

        if (v16)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
          v21 = objc_msgSend(v16, "isEqualToString:", v20);

          if (!v21)
            break;
        }
        v15 += 2;
        if (v15 == 8)
        {
          if (v16)
            break;
          goto LABEL_28;
        }
      }
LABEL_25:
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
      v25 = objc_msgSend(v16, "isEqualToString:", v24);

      if (!v25)
        goto LABEL_29;
      goto LABEL_28;
    }
    v16 = 0;
  }
  else
  {
    v22 = (unsigned __int16)-[SKDiskPrivateCache schemeID](self, "schemeID");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
    v16 = (void *)MKTypeToHuman(v22, v23, 0);

    if (v16)
      goto LABEL_25;
  }
LABEL_28:
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100047CF0, "objectForKey:", v26));

  v16 = (void *)v27;
LABEL_29:
  if (sub_10000FABC(v16))
    v28 = v16;
  else
    v28 = (id)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
  v9 = v28;

  return v9;
}

- (NSObject)wholeDADisk
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setWholeDADisk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)schemeID
{
  return self->_schemeID;
}

- (void)setSchemeID:(int)a3
{
  self->_schemeID = a3;
}

- (NSString)rawIOContent
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRawIOContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)volumeKind
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVolumeKind:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)volumeType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVolumeType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)liveDiskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLiveDiskIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isLiveFSContainer
{
  return self->_isLiveFSContainer;
}

- (void)setIsLiveFSContainer:(BOOL)a3
{
  self->_isLiveFSContainer = a3;
}

- (int64_t)mountFlags
{
  return self->_mountFlags;
}

- (void)setMountFlags:(int64_t)a3
{
  self->_mountFlags = a3;
}

- (NSArray)sortedChildren
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSortedChildren:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedChildren, 0);
  objc_storeStrong((id *)&self->_liveDiskIdentifier, 0);
  objc_storeStrong((id *)&self->_volumeType, 0);
  objc_storeStrong((id *)&self->_volumeKind, 0);
  objc_storeStrong((id *)&self->_rawIOContent, 0);
  objc_storeStrong((id *)&self->_wholeDADisk, 0);
}

@end
