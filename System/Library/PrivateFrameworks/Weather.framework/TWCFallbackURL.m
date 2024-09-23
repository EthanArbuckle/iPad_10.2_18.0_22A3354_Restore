@implementation TWCFallbackURL

void __TWCFallbackURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("http://www.weather.com/wx/today/"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryItems");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
    v2 = (void *)v0;
  else
    v2 = (void *)MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("par"), CFSTR("apple_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryItems:", v4);

  objc_msgSend(v8, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)TWCFallbackURL_TWCFallbackURL;
  TWCFallbackURL_TWCFallbackURL = v6;

}

@end
