@implementation ICSQLiteConnectionOptions

- (ICSQLiteConnectionOptions)initWithDatabasePath:(id)a3
{
  id v4;
  ICSQLiteConnectionOptions *v5;
  uint64_t v6;
  NSString *databasePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSQLiteConnectionOptions;
  v5 = -[ICSQLiteConnectionOptions init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    -[ICSQLiteConnectionOptions setCacheSizeWithNumberOfKilobytes:](v5, "setCacheSizeWithNumberOfKilobytes:", 128);
  }

  return v5;
}

- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3
{
  -[ICSQLiteConnectionOptions setCacheSize:](self, "setCacheSize:", -a3);
}

- (int)applyToDatabase:(sqlite3 *)a3
{
  int v5;
  id v6;
  int v8;

  sqlite3_extended_result_codes(a3, 1);
  v8 = 1;
  v5 = sqlite3_file_control(a3, 0, 10, &v8);
  if (!v5)
  {
    v5 = sqlite3_exec(a3, "PRAGMA journal_mode=WAL", 0, 0, 0);
    if (!v5)
    {
      v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA cache_size=%ld"), -[ICSQLiteConnectionOptions cacheSize](self, "cacheSize")));
      v5 = sqlite3_exec(a3, (const char *)objc_msgSend(v6, "UTF8String"), 0, 0, 0);

    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 24) = self->_cacheSize;
    v7 = -[NSString copyWithZone:](self->_databasePath, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v7;

    *(_BYTE *)(v6 + 8) = self->_readOnly;
  }
  return (id)v6;
}

- (ICSQLiteConnectionOptions)initWithCoder:(id)a3
{
  id v4;
  ICSQLiteConnectionOptions *v5;
  uint64_t v6;
  NSString *databasePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSQLiteConnectionOptions;
  v5 = -[ICSQLiteConnectionOptions init](&v9, sel_init);
  if (v5)
  {
    v5->_cacheSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("c"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("p"));
    v6 = objc_claimAutoreleasedReturnValue();
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    v5->_readOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ro"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t cacheSize;
  id v5;

  cacheSize = self->_cacheSize;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", cacheSize, CFSTR("c"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_databasePath, CFSTR("p"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_readOnly, CFSTR("ro"));

}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(int64_t)a3
{
  self->_cacheSize = a3;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
