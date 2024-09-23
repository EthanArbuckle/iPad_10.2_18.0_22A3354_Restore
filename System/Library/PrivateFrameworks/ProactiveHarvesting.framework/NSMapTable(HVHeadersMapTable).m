@implementation NSMapTable(HVHeadersMapTable)

- (uint64_t)hv_addEntriesFromHeadersDictionary:()HVHeadersMapTable
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__NSMapTable_HVHeadersMapTable__hv_addEntriesFromHeadersDictionary___block_invoke;
  v4[3] = &unk_24DD7E360;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (id)hv_firstHeaderForKey:()HVHeadersMapTable
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)hv_headerKeyFunctions
{
  void *v0;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1750]), "initWithOptions:", 0x10000);
  objc_msgSend(v0, "setHashFunction:", HVCaseInsensitiveStringHash);
  objc_msgSend(v0, "setIsEqualFunction:", HVCaseInsensitiveEqual);
  return v0;
}

+ (id)hv_headerValueFunctions
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1750]), "initWithOptions:", 0);
}

@end
