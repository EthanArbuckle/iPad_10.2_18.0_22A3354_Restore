@implementation REScriptASTNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  return 0;
}

- (REScriptASTNode)initWithToken:(id)a3
{
  id v5;
  REScriptASTNode *v6;
  REScriptASTNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REScriptASTNode;
  v6 = -[REScriptASTNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_token, a3);

  return v7;
}

- (NSSet)dependencies
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (REScriptToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
