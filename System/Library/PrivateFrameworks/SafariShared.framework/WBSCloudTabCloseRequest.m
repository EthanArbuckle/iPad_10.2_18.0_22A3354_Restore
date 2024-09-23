@implementation WBSCloudTabCloseRequest

- (WBSCloudTabCloseRequest)initWithDictionary:(id)a3 requestUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSURL *v10;
  NSURL *url;
  NSDate *v12;
  NSDate *lastModified;
  uint64_t v14;
  void *v15;
  NSUUID *v16;
  NSUUID *tabUUID;
  void *v18;
  NSUUID *v19;
  NSUUID *sourceDeviceUUID;
  void *v21;
  NSUUID *v22;
  NSUUID *destinationDeviceUUID;
  WBSCloudTabCloseRequest *v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  if (v6
    && (v26.receiver = self,
        v26.super_class = (Class)WBSCloudTabCloseRequest,
        (self = -[WBSCloudTabCloseRequest init](&v26, sel_init)) != 0))
  {
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("TabURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_bestURLStringForUserTypedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "length"))
      goto LABEL_10;
    v10 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v9);
    url = self->_url;
    self->_url = v10;

    objc_storeStrong((id *)&self->_requestUUID, a4);
    objc_msgSend(v6, "safari_dateForKey:", CFSTR("LastModified"));
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastModified = self->_lastModified;
    self->_lastModified = v12;

    objc_msgSend(v6, "safari_stringForKey:", CFSTR("TabUUID"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_10;
    v15 = (void *)v14;
    v16 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v14);
    tabUUID = self->_tabUUID;
    self->_tabUUID = v16;

    objc_msgSend(v6, "safari_stringForKey:", CFSTR("SourceDeviceUUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "length"))
    {
      v19 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v18);
      sourceDeviceUUID = self->_sourceDeviceUUID;
      self->_sourceDeviceUUID = v19;

    }
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("DestinationDeviceUUID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v21);
      destinationDeviceUUID = self->_destinationDeviceUUID;
      self->_destinationDeviceUUID = v22;

      v24 = self;
    }
    else
    {
LABEL_10:
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (WBSCloudTabCloseRequest)initWithURL:(id)a3 tabUUIDString:(id)a4 lastModified:(id)a5 sourceDeviceUUID:(id)a6 destinationDeviceUUID:(id)a7 requestUUID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  WBSCloudTabCloseRequest *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend((id)objc_opt_class(), "_dictionaryWithURL:tabUUIDString:lastModified:sourceDeviceUUID:destinationDeviceUUID:", v19, v18, v17, v16, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[WBSCloudTabCloseRequest initWithDictionary:requestUUID:](self, "initWithDictionary:requestUUID:", v20, v14);
  return v21;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  NSURL *url;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  url = self->_url;
  -[NSUUID UUIDString](self->_tabUUID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dictionaryWithURL:tabUUIDString:lastModified:sourceDeviceUUID:destinationDeviceUUID:", url, v5, self->_lastModified, self->_sourceDeviceUUID, self->_destinationDeviceUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSURL *url;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  -[NSUUID UUIDString](self->_tabUUID, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_sourceDeviceUUID, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_destinationDeviceUUID, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; url = \"%@\"; tab UUID = \"%@\"; source device UUID = \"%@\"; destination device UUID = \"%@\"; lastModified = %@>"),
    v5,
    self,
    url,
    v7,
    v8,
    v9,
    self->_lastModified);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_dictionaryWithURL:(id)a3 tabUUIDString:(id)a4 lastModified:(id)a5 sourceDeviceUUID:(id)a6 destinationDeviceUUID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  v16 = 0;
  if (v11 && v14)
  {
    objc_msgSend(a3, "safari_userVisibleString");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
    {
      v23[0] = CFSTR("DictionaryType");
      v23[1] = CFSTR("TabURL");
      v24[0] = CFSTR("CloseTabRequest");
      v24[1] = v17;
      v24[2] = v11;
      v23[2] = CFSTR("TabUUID");
      v23[3] = CFSTR("DestinationDeviceUUID");
      objc_msgSend(v15, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[4] = CFSTR("LastModified");
      v24[3] = v19;
      v24[4] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v20, "mutableCopy");

      objc_msgSend(v13, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("SourceDeviceUUID"));

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (BOOL)matchesCloudTab:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", self->_tabUUID);

  if (v6)
  {
    objc_msgSend(v4, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", self->_url);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isCloudTabCloseRequestDictionary:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safari_stringForKey:", CFSTR("DictionaryType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CloseTabRequest"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)destinationDeviceUUIDInDictionary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "safari_stringForKey:", CFSTR("DestinationDeviceUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
  else
    v4 = 0;

  return v4;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (NSUUID)destinationDeviceUUID
{
  return self->_destinationDeviceUUID;
}

- (NSUUID)tabUUID
{
  return self->_tabUUID;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_tabUUID, 0);
  objc_storeStrong((id *)&self->_destinationDeviceUUID, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_sourceDeviceUUID, 0);
}

@end
