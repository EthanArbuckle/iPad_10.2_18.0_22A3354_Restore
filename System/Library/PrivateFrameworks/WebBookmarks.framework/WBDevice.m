@implementation WBDevice

+ (id)deviceWithParameters:(id)a3 unnamedTabGroups:(id)a4 profileIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  WebBookmark *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v8, "isRemoteDevice"))
    v11 = 4;
  else
    v11 = 3;
  v12 = [WebBookmark alloc];
  objc_msgSend(v8, "deviceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WebBookmark initFolderWithParentID:subtype:deviceIdentifier:collectionType:](v12, "initFolderWithParentID:subtype:deviceIdentifier:collectionType:", 0, v11, v13, 1);

  objc_msgSend(v8, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v15);

  objc_msgSend(v8, "creationDeviceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v8, "creationDeviceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCreationDeviceIdentifier:", v17);

  }
  objc_msgSend(v8, "deviceTypeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v8, "deviceTypeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDeviceTypeIdentifier:", v19);

  }
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBookmark:unnamedTabGroups:profileIdentifier:", v14, v10, v9);

  return v20;
}

- (WBDevice)initWithBookmark:(id)a3 unnamedTabGroups:(id)a4 profileIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBDevice *v12;
  WBDevice *v13;
  uint64_t v14;
  NSArray *unnamedTabGroups;
  uint64_t v16;
  NSString *profileIdentifier;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  WBDevice *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)WBDevice;
  v12 = -[WBDevice init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmark, a3);
    v13->_remoteDevice = objc_msgSend(v9, "subtype") == 4;
    v14 = objc_msgSend(v10, "copy");
    unnamedTabGroups = v13->_unnamedTabGroups;
    v13->_unnamedTabGroups = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    profileIdentifier = v13->_profileIdentifier;
    v13->_profileIdentifier = (NSString *)v16;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v10;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22++), "setProfileIdentifier:", v11, (_QWORD)v25);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v20);
    }

    v23 = v13;
  }

  return v13;
}

- (WBDevice)initWithBookmark:(id)a3
{
  return -[WBDevice initWithBookmark:unnamedTabGroups:profileIdentifier:](self, "initWithBookmark:unnamedTabGroups:profileIdentifier:", a3, MEMORY[0x24BDBD1A8], *MEMORY[0x24BE82E70]);
}

- (BOOL)isEqual:(id)a3
{
  WBDevice *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WBDevice *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WBDevice uuid](v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBDevice uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSArray)tabs
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_unnamedTabGroups;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "tabs", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safari_filterObjectsUsingBlock:", &__block_literal_global_22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObjectsFromArray:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

uint64_t __16__WBDevice_tabs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBlank") ^ 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WBDevice uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)title
{
  return -[WebBookmark title](self->_bookmark, "title");
}

- (void)setTitle:(id)a3
{
  -[WebBookmark setTitle:](self->_bookmark, "setTitle:", a3);
}

- (NSString)uuid
{
  return -[WebBookmark UUID](self->_bookmark, "UUID");
}

- (int)_identifier
{
  return -[WebBookmark identifier](self->_bookmark, "identifier");
}

- (WBSCRDTPosition)syncPosition
{
  return -[WebBookmark syncPosition](self->_bookmark, "syncPosition");
}

- (void)setSyncPosition:(id)a3
{
  -[WebBookmark setSyncPosition:](self->_bookmark, "setSyncPosition:", a3);
}

- (BOOL)isInserted
{
  return -[WebBookmark isInserted](self->_bookmark, "isInserted");
}

- (NSArray)unnamedTabGroups
{
  return self->_unnamedTabGroups;
}

- (BOOL)needsSecureDelete
{
  return 0;
}

- (BOOL)isCloseRequestSupported
{
  return 1;
}

- (NSString)serverID
{
  return -[WebBookmark serverID](self->_bookmark, "serverID");
}

- (NSString)deviceTypeIdentifier
{
  return -[WebBookmark deviceTypeIdentifier](self->_bookmark, "deviceTypeIdentifier");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  WBDevice *v6;

  v5 = (void *)-[WebBookmark copy](self->_bookmark, "copy");
  v6 = -[WBDevice initWithBookmark:unnamedTabGroups:profileIdentifier:](+[WBDevice allocWithZone:](WBDevice, "allocWithZone:", a3), "initWithBookmark:unnamedTabGroups:profileIdentifier:", v5, self->_unnamedTabGroups, self->_profileIdentifier);

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBDevice _identifier](self, "_identifier");
  -[WBDevice title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBDevice uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %d; title = %@; uuid = %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)privacyPreservingDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBDevice _identifier](self, "_identifier");
  -[WBDevice uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %d; uuid = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)mergeWithDevice:(id)a3
{
  WebBookmark *bookmark;
  id v4;

  bookmark = self->_bookmark;
  objc_msgSend(a3, "bookmark");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmark mergeWithBookmark:](bookmark, "mergeWithBookmark:", v4);

}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (NSArray)unnamedMutableTabGroups
{
  return self->_unnamedTabGroups;
}

- (void)setUnnamedMutableTabGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (BOOL)isRemoteDevice
{
  return self->_remoteDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_unnamedTabGroups, 0);
}

@end
