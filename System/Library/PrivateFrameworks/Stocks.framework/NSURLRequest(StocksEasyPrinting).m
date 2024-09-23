@implementation NSURLRequest(StocksEasyPrinting)

- (id)HTTPBodyString
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(a1, "HTTPBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithData:encoding:", v3, 4);

  return v4;
}

@end
