@implementation NSDictionary(WiFiKit)

- (id)plistString
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a1, 100, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v1, 4);

  return v2;
}

@end
