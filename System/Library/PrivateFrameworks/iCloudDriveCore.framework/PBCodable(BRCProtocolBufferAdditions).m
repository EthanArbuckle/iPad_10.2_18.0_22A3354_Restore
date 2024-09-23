@implementation PBCodable(BRCProtocolBufferAdditions)

- (void)sqliteBind:()BRCProtocolBufferAdditions index:
{
  id v6;

  objc_msgSend(a1, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sqliteBind:index:", a3, a4);

}

+ (uint64_t)newFromSqliteValue:()BRCProtocolBufferAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  if (sqlite3_value_type(a3) != 4)
    return 0;
  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "newFromSqliteValue:", a3);
  v6 = objc_msgSend(v4, "initWithData:", v5);

  return v6;
}

+ (uint64_t)newFromSqliteStatement:()BRCProtocolBufferAdditions atIndex:
{
  id v6;
  void *v7;
  uint64_t v8;

  if (sqlite3_column_type(a3, iCol) != 4)
    return 0;
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "newFromSqliteStatement:atIndex:", a3, iCol);
  v8 = objc_msgSend(v6, "initWithData:", v7);

  return v8;
}

@end
