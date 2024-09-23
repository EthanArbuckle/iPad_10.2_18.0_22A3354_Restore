@implementation SEMDatabaseDelete

+ (id)builderWithTableName:(id)a3
{
  id v3;
  SEMDatabaseDeleteBuilder *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = [SEMDatabaseDeleteBuilder alloc];
  v6 = (void *)objc_msgSend_initWithTableName_(v4, v5, (uint64_t)v3);

  return v6;
}

@end
