@implementation UASharedPasteboardTypeInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UASharedPasteboardTypeInfo)initWithCoder:(id)a3
{
  id v4;
  UASharedPasteboardTypeInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[UASharedPasteboardTypeInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UASharedPasteboardTypeInfoTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardTypeInfo setType:](v5, "setType:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UASharedPasteboardTypeInfoUUIDKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardTypeInfo setUuid:](v5, "setUuid:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UASharedPasteboardTypeInfoOffsetKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardTypeInfo setOffset:](v5, "setOffset:", v8);

    -[UASharedPasteboardTypeInfo setSize:](v5, "setSize:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UASharedPasteboardTypeInfoSizeKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UASharedPasteboardTypeInfoDataFileKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardTypeInfo setDataFile:](v5, "setDataFile:", v9);

    -[UASharedPasteboardTypeInfo setPreferFileRep:](v5, "setPreferFileRep:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UASharedPasteboardTypeInfoPrefRepKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UASharedPasteboardTypeInfoTypeHintKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardTypeInfo setTypeHint:](v5, "setTypeHint:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UASharedPasteboardTypeInfoIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardTypeInfo setIndex:](v5, "setIndex:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[UASharedPasteboardTypeInfo type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UASharedPasteboardTypeInfoTypeKey"));

  -[UASharedPasteboardTypeInfo uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UASharedPasteboardTypeInfoUUIDKey"));

  -[UASharedPasteboardTypeInfo offset](self, "offset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("UASharedPasteboardTypeInfoOffsetKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UASharedPasteboardTypeInfo size](self, "size"), CFSTR("UASharedPasteboardTypeInfoSizeKey"));
  -[UASharedPasteboardTypeInfo dataFile](self, "dataFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UASharedPasteboardTypeInfoDataFileKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UASharedPasteboardTypeInfo preferFileRep](self, "preferFileRep"), CFSTR("UASharedPasteboardTypeInfoPrefRepKey"));
  -[UASharedPasteboardTypeInfo typeHint](self, "typeHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("UASharedPasteboardTypeInfoTypeHintKey"));

  -[UASharedPasteboardTypeInfo index](self, "index");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UASharedPasteboardTypeInfoIndex"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  int64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[UASharedPasteboardTypeInfo uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[UASharedPasteboardTypeInfo type](self, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[UASharedPasteboardTypeInfo offset](self, "offset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "offset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v13 = -[UASharedPasteboardTypeInfo size](self, "size");
          v12 = v13 == objc_msgSend(v5, "size");
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UASharedPasteboardTypeInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = objc_alloc_init(UASharedPasteboardTypeInfo);
  -[UASharedPasteboardTypeInfo type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[UASharedPasteboardTypeInfo setType:](v4, "setType:", v6);

  -[UASharedPasteboardTypeInfo uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[UASharedPasteboardTypeInfo setUuid:](v4, "setUuid:", v8);

  -[UASharedPasteboardTypeInfo offset](self, "offset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[UASharedPasteboardTypeInfo setOffset:](v4, "setOffset:", v10);

  -[UASharedPasteboardTypeInfo setSize:](v4, "setSize:", -[UASharedPasteboardTypeInfo size](self, "size"));
  -[UASharedPasteboardTypeInfo dataFile](self, "dataFile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[UASharedPasteboardTypeInfo setDataFile:](v4, "setDataFile:", v12);

  -[UASharedPasteboardTypeInfo setPreferFileRep:](v4, "setPreferFileRep:", -[UASharedPasteboardTypeInfo preferFileRep](self, "preferFileRep"));
  -[UASharedPasteboardTypeInfo typeHint](self, "typeHint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[UASharedPasteboardTypeInfo setTypeHint:](v4, "setTypeHint:", v14);

  -[UASharedPasteboardTypeInfo index](self, "index");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[UASharedPasteboardTypeInfo setIndex:](v4, "setIndex:", v16);

  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  __CFString *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[UASharedPasteboardTypeInfo index](self, "index");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  -[UASharedPasteboardTypeInfo type](self, "type");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UASharedPasteboardTypeInfo uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UASharedPasteboardTypeInfo offset](self, "offset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  v23 = v5;
  if (v9 || -[UASharedPasteboardTypeInfo size](self, "size") > 0)
  {
    v10 = v6;
    v21 = 0;
LABEL_4:
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[UASharedPasteboardTypeInfo offset](self, "offset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UASharedPasteboardTypeInfo size](self, "size");
    -[UASharedPasteboardTypeInfo dataFile](self, "dataFile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(", offset: %@, size: %ld, fd: %d"), v3, v12, objc_msgSend(v2, "fileDescriptor"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = 1;
    goto LABEL_5;
  }
  v10 = v6;
  -[UASharedPasteboardTypeInfo dataFile](self, "dataFile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 1;
  if (objc_msgSend(v20, "fileDescriptor"))
    goto LABEL_4;
  v14 = 0;
  v13 = &stru_1E60084E8;
LABEL_5:
  -[UASharedPasteboardTypeInfo typeHint](self, "typeHint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[UASharedPasteboardTypeInfo typeHint](self, "typeHint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR(", hint: %@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendFormat:", CFSTR("info { %ld type: %@, uuid: %@%@%@}"), v10, v24, v8, v13, v18);

  }
  else
  {
    objc_msgSend(v25, "appendFormat:", CFSTR("info { %ld type: %@, uuid: %@%@%@}"), v10, v24, v8, v13, &stru_1E60084E8);
  }

  if (v14)
  {

  }
  if (v21)

  return v25;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)offset
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOffset:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)preferFileRep
{
  return self->_preferFileRep;
}

- (void)setPreferFileRep:(BOOL)a3
{
  self->_preferFileRep = a3;
}

- (NSString)typeHint
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTypeHint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIndex:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_typeHint, 0);
  objc_storeStrong((id *)&self->_dataFile, 0);
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
