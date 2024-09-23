@implementation UASharedPasteboardInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UASharedPasteboardInfo)initWithCoder:(id)a3
{
  id v4;
  UASharedPasteboardInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = -[UASharedPasteboardInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UASharedPasteboardInfoDataFileKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardInfo setDataFile:](v5, "setDataFile:", v6);

    -[UASharedPasteboardInfo setDataSize:](v5, "setDataSize:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UASharedPasteboardInfoDataSizeKey")));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("UASharedPasteboardInfoItemsKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardInfo setItems:](v5, "setItems:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UASharedPasteboardInfoDataPathKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardInfo setSharedDataPath:](v5, "setSharedDataPath:", v11);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("UASharedPasteboardInfoExtensionKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UASharedPasteboardInfo setSandboxExtensions:](v5, "setSandboxExtensions:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[UASharedPasteboardInfo dataFile](self, "dataFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UASharedPasteboardInfoDataFileKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UASharedPasteboardInfo dataSize](self, "dataSize"), CFSTR("UASharedPasteboardInfoDataSizeKey"));
  -[UASharedPasteboardInfo items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UASharedPasteboardInfoItemsKey"));

  -[UASharedPasteboardInfo sharedDataPath](self, "sharedDataPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("UASharedPasteboardInfoDataPathKey"));

  -[UASharedPasteboardInfo sandboxExtensions](self, "sandboxExtensions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UASharedPasteboardInfoExtensionKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[UASharedPasteboardInfo dataSize](self, "dataSize");
    if (v6 == objc_msgSend(v5, "dataSize"))
    {
      -[UASharedPasteboardInfo items](self, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

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

- (id)copyWithZone:(_NSZone *)a3
{
  UASharedPasteboardInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc_init(UASharedPasteboardInfo);
  -[UASharedPasteboardInfo dataFile](self, "dataFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[UASharedPasteboardInfo setDataFile:](v5, "setDataFile:", v7);

  -[UASharedPasteboardInfo setDataSize:](v5, "setDataSize:", -[UASharedPasteboardInfo dataSize](self, "dataSize"));
  -[UASharedPasteboardInfo items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[UASharedPasteboardInfo setItems:](v5, "setItems:", v9);

  -[UASharedPasteboardInfo sharedDataPath](self, "sharedDataPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[UASharedPasteboardInfo setSharedDataPath:](v5, "setSharedDataPath:", v11);

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v16.receiver = self;
  v16.super_class = (Class)UASharedPasteboardInfo;
  -[UASharedPasteboardInfo description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: Data size: %ld Items: (\r\n"), v4, -[UASharedPasteboardInfo dataSize](self, "dataSize"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UASharedPasteboardInfo items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\r\n"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(int64_t)a3
{
  self->_dataSize = a3;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)sharedDataPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSharedDataPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDictionary)sandboxExtensions
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSandboxExtensions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_sharedDataPath, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dataFile, 0);
}

@end
