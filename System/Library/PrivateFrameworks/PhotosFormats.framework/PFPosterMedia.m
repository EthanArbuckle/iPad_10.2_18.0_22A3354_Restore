@implementation PFPosterMedia

- (PFPosterMedia)init
{
  return -[PFPosterMedia initWithAssetUUID:](self, "initWithAssetUUID:", 0);
}

- (PFPosterMedia)initWithAssetUUID:(id)a3
{
  id v4;
  PFPosterMedia *v5;
  PFPosterMedia *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PFPosterMedia;
  v5 = -[PFPosterMedia init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PFPosterMedia setMediaType:](v5, "setMediaType:", 1);
    -[PFPosterMedia setAssetUUID:](v6, "setAssetUUID:", v4);
    if (v4)
    {
      -[PFPosterMedia setSubpath:](v6, "setSubpath:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFPosterMedia setSubpath:](v6, "setSubpath:", v8);

    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAssetUUID:", self->_assetUUID);
  *(_QWORD *)(v4 + 8) = self->_mediaType;
  objc_storeStrong((id *)(v4 + 16), self->_subpath);
  *(_QWORD *)(v4 + 32) = self->_version;
  v5 = -[PFPosterEditConfiguration copy](self->_editConfiguration, "copy");
  v6 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v5;

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  PFPosterMedia *v4;
  PFPosterMedia *v5;
  int64_t v6;
  id v7;
  id v8;
  int v9;
  char v10;
  id v11;
  id v12;
  int v13;
  unint64_t v14;
  void *v15;
  void *v16;

  v4 = (PFPosterMedia *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PFPosterMedia mediaType](self, "mediaType");
      if (v6 != -[PFPosterMedia mediaType](v5, "mediaType"))
      {
        v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
      -[PFPosterMedia assetUUID](self, "assetUUID");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PFPosterMedia assetUUID](v5, "assetUUID");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {

      }
      else
      {
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (!v9)
        {
          v10 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      -[PFPosterMedia subpath](self, "subpath");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PFPosterMedia subpath](v5, "subpath");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_18;
      }
      v14 = -[PFPosterMedia version](self, "version");
      if (v14 == -[PFPosterMedia version](v5, "version"))
      {
        -[PFPosterMedia editConfiguration](self, "editConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFPosterMedia editConfiguration](v5, "editConfiguration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 == v16)
          v10 = 1;
        else
          v10 = objc_msgSend(v15, "isEqual:", v16);

        goto LABEL_21;
      }
LABEL_18:
      v10 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v10 = 0;
  }
LABEL_24:

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[PFPosterMedia mediaType](self, "mediaType");
  -[PFPosterMedia assetUUID](self, "assetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ (2 * objc_msgSend(v4, "hash"));
  -[PFPosterMedia subpath](self, "subpath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ (4 * objc_msgSend(v6, "hash"));
  v8 = v7 ^ (8 * -[PFPosterMedia version](self, "version"));
  -[PFPosterMedia editConfiguration](self, "editConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ (16 * objc_msgSend(v9, "hash"));

  return v10;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PFPosterMedia mediaType](self, "mediaType") - 1;
  if (v6 > 2)
    v7 = CFSTR("Undefined");
  else
    v7 = off_1E45A1BB0[v6];
  -[PFPosterMedia subpath](self, "subpath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PFPosterMedia version](self, "version");
  -[PFPosterMedia editConfiguration](self, "editConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; type: %@; subpath: %@; version: %lul, editConfig: %@>"),
                  v5,
                  self,
                  v7,
                  v8,
                  v9,
                  v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterMedia mediaType](self, "mediaType"), CFSTR("mediaType"));
  -[PFPosterMedia assetUUID](self, "assetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetUUID"));

  -[PFPosterMedia subpath](self, "subpath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subpath"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterMedia version](self, "version"), CFSTR("version"));
  -[PFPosterMedia editConfiguration](self, "editConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("editConfiguration"));

}

- (PFPosterMedia)initWithCoder:(id)a3
{
  id v4;
  PFPosterMedia *v5;
  uint64_t v6;
  NSString *assetUUID;
  uint64_t v8;
  NSString *subpath;
  uint64_t v10;
  PFPosterEditConfiguration *editConfiguration;
  NSString *v13;
  unint64_t version;
  int v15;
  NSString *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PFPosterMedia init](self, "init");
  if (v5)
  {
    v5->_mediaType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetUUID = v5->_assetUUID;
    v5->_assetUUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subpath"));
    v8 = objc_claimAutoreleasedReturnValue();
    subpath = v5->_subpath;
    v5->_subpath = (NSString *)v8;

    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("editConfiguration"));
    v10 = objc_claimAutoreleasedReturnValue();
    editConfiguration = v5->_editConfiguration;
    v5->_editConfiguration = (PFPosterEditConfiguration *)v10;

    if (!v5->_subpath && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v13 = v5->_assetUUID;
      version = v5->_version;
      v15 = 138543618;
      v16 = v13;
      v17 = 2050;
      v18 = version;
      _os_log_fault_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFPosterMedia failed to decode subpath: assetUUID: %{public}@, version: %{public}lu", (uint8_t *)&v15, 0x16u);
    }
  }

  return v5;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (NSString)subpath
{
  return self->_subpath;
}

- (void)setSubpath:(id)a3
{
  objc_storeStrong((id *)&self->_subpath, a3);
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (void)setAssetUUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUID, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (PFPosterEditConfiguration)editConfiguration
{
  return self->_editConfiguration;
}

- (void)setEditConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_editConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editConfiguration, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_subpath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
