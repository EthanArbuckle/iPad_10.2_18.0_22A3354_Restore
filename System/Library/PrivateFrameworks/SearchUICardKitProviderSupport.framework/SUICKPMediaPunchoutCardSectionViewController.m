@implementation SUICKPMediaPunchoutCardSectionViewController

- (BOOL)shouldHandleEngagement:(id)a3 forCardSection:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;

  objc_msgSend(a3, "backingFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE15508]);
    objc_msgSend(v7, "setPunchout:", v6);
    -[CRKCardSectionViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_opt_respondsToSelector() & 1) == 0
       || objc_msgSend(v8, "canPerformCommand:forCardSectionViewController:", v7, self))
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "performCommand:forCardSectionViewController:", v7, self) ^ 1;
    }
    else
    {
      LOBYTE(v9) = 1;
    }

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

@end
