@implementation REScriptASTIdentifierNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  REScriptASTIdentifierNode *v6;
  void *v7;
  REScriptASTIdentifierNode *v8;

  v5 = a3;
  if (REExpectTokenTypeInBuffer(v5, 6uLL, a4))
  {
    v6 = [REScriptASTIdentifierNode alloc];
    objc_msgSend(v5, "currentToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[REScriptASTNode initWithToken:](v6, "initWithToken:", v7);

    objc_msgSend(v5, "next");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[REScriptASTNode token](self, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)dependencies
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[REScriptASTIdentifierNode name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
