@implementation SUCompletionDataProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  id v7;
  int v8;
  SUCompletionsResponse *v9;
  void *v11;

  v11 = 0;
  v7 = objc_alloc_init(MEMORY[0x24BEC8C08]);
  objc_msgSend(v7, "configureFromProvider:", self);
  v8 = objc_msgSend(v7, "parseData:returningError:", a3, &v11);
  if (v8)
  {
    v9 = -[SUCompletionsResponse initWithPropertyList:]([SUCompletionsResponse alloc], "initWithPropertyList:", objc_msgSend(v7, "output"));
    -[ISDataProvider setOutput:](self, "setOutput:", v9);
    -[ISDataProvider migrateOutputFromSubProvider:](self, "migrateOutputFromSubProvider:", v7);

  }
  if (a4)
    *a4 = v11;
  return v8;
}

@end
