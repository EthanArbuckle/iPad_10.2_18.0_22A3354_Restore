@implementation SXCloseActionFactory

- (id)actionForURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  SXCloseAction *v7;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("action")) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("close"));

  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = objc_alloc_init(SXCloseAction);
LABEL_6:

  return v7;
}

- (id)actionForAddition:(id)a3
{
  return 0;
}

@end
