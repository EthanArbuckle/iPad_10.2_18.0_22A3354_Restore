@implementation SEMDatabaseSelect

+ (id)builderWithTableName:(id)a3
{
  id v3;
  SEMDatabaseSelectBuilder *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = [SEMDatabaseSelectBuilder alloc];
  v6 = (void *)objc_msgSend_initWithTableName_(v4, v5, (uint64_t)v3);

  return v6;
}

- (void)addLimit:(unint64_t)a3 offset:(unint64_t)a4
{
  const char *v6;
  void *v7;
  const char *v8;
  id v9;

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], a2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLimit_offset_forSelect_(SEMSQLCommandGenerator, v8, (uint64_t)v9, v7, self);

}

- (void)replaceOffset:(unint64_t)a3
{
  const char *v4;
  id v5;

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_replaceOffset_forSelect_(SEMSQLCommandGenerator, v4, (uint64_t)v5, self);

}

@end
