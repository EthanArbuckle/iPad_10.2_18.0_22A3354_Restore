@implementation SSWishlistDatabaseSchema

+ (void)createSchemaInDatabase:(id)a3
{
  uint64_t v5;

  objc_msgSend(a3, "executeSQL:", CFSTR("PRAGMA legacy_file_format = 0;"));
  objc_msgSend(a3, "executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS item (pid INTEGER, item_id INTEGER, sort_order INTEGER DEFAULT 0, state INTEGER DEFAULT 0, item_kind TEXT NOT NULL, item_data BLOB, PRIMARY KEY (pid));"));
  objc_msgSend(a3, "executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS properties (key TEXT, value TEXT, PRIMARY KEY (key));"));
  objc_msgSend(a3, "executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS item_item_id ON item (item_id);"));
  objc_msgSend(a3, "executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS item_state ON item (state);"));
  v5 = objc_msgSend(a3, "userVersion");
  if (v5 == 7001)
  {
    objc_msgSend(a1, "_migrate7001to7002InDatabase:", a3);
  }
  else if (v5 == 7000)
  {
    objc_msgSend(a1, "_migrate7000to7001InDatabase:", a3);
  }
  objc_msgSend(a3, "setUserVersion:", 7002);
}

+ (id)databasePathWithAccountIdentifier:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld.sqlitedb"), a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("com.apple.itunesstored"), CFSTR("Wishlists"), v3, 0);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v4);

  return v5;
}

+ (void)_migrate7000to7001InDatabase:(id)a3
{
  objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE item ADD COLUMN sort_order INTEGER DEFAULT 0;"));
}

+ (void)_migrate7001to7002InDatabase:(id)a3
{
  objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE item ADD COLUMN wishlist_item_id INTEGER DEFAULT 0;"));
}

@end
