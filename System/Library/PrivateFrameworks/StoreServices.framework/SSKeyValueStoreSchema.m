@implementation SSKeyValueStoreSchema

+ (id)databasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("com.apple.itunesstored"), CFSTR("kvs.sqlitedb"), 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);

  return v3;
}

+ (void)createSchemaInDatabase:(id)a3
{
  objc_msgSend(a3, "executeSQL:", CFSTR("PRAGMA legacy_file_format = 0;"));
  objc_msgSend(a3, "executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS kvs_value (pid INTEGER, domain TEXT NOT NULL, key TEXT NOT NULL, value BLOB NOT NULL, UNIQUE (domain, key), PRIMARY KEY (pid));"));
  objc_msgSend(a3, "executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS kvs_value_domain_key ON kvs_value (domain, key);"));
  objc_msgSend(a3, "setUserVersion:", 6000);
}

@end
