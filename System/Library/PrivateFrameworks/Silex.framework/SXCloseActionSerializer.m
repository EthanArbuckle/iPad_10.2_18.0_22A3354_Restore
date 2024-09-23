@implementation SXCloseActionSerializer

- (id)URLForAction:(id)a3 type:(int64_t)a4
{
  void *v4;
  id v5;

  if (a4 == 1)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v5, "setScheme:", CFSTR("action"));
    objc_msgSend(v5, "setHost:", CFSTR("close"));
    objc_msgSend(v5, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
