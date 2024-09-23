@implementation NSURLConnection(SU)

+ (id)sendSynchronousRequest:()SU allowRedirects:returningResponse:error:
{
  id v9;
  SUHttpOperation *v10;
  id v11;
  void *v12;

  v9 = a3;
  v10 = -[SUHttpOperation initWithRequest:]([SUHttpOperation alloc], "initWithRequest:", v9);

  -[SUHttpOperation setAllowRedirects:](v10, "setAllowRedirects:", a4);
  v11 = objc_alloc_init(MEMORY[0x24BDD1710]);
  objc_msgSend(v11, "addOperation:", v10);
  objc_msgSend(v11, "waitUntilAllOperationsAreFinished");
  -[SUHttpOperation data](v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    -[SUHttpOperation response](v10, "response");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    -[SUHttpOperation error](v10, "error");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
