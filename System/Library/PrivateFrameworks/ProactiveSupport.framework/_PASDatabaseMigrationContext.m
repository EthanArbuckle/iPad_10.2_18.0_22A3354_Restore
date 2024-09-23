@implementation _PASDatabaseMigrationContext

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_PASSqliteDatabase filename](self->db, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<_PASDatabaseMigrationContext db:%@ v:%u mc:%tu>"), v4, self->version, -[NSDictionary count](self->migrations, "count"));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->migrations, 0);
  objc_storeStrong((id *)&self->db, 0);
  objc_storeStrong((id *)&self->object, 0);
}

@end
