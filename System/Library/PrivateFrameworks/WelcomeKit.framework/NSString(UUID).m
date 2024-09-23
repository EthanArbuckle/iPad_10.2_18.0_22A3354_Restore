@implementation NSString(UUID)

+ (id)wl_uniqueIdentifier
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)wl_stringByAppendingRelativePath:()UUID
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(a1, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathWithComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
