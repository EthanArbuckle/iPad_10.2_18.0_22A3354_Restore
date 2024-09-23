@implementation NSURL(PQLValuable)

- (void)sqliteBind:()PQLValuable index:
{
  id v6;

  objc_msgSend(a1, "absoluteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sqliteBind:index:", a3, a4);

}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "newFromSqliteStatement:atIndex:");
  if (v0)
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v0);
  else
    v1 = 0;

  return v1;
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "newFromSqliteValue:");
  if (v0)
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v0);
  else
    v1 = 0;

  return v1;
}

@end
