@implementation REScriptASTExpressionNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  REScriptASTExpressionNode *v8;
  REScriptASTExpressionNode *v9;

  v5 = a3;
  +[REScriptASTPrefixExpressionNode parseBuffer:error:](REScriptASTPrefixExpressionNode, "parseBuffer:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[REScriptASTBinaryExpressionListNode parseBuffer:error:](REScriptASTBinaryExpressionListNode, "parseBuffer:error:", v5, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = -[REScriptASTExpressionNode initWithPrefixExpression:binaryExpression:]([REScriptASTExpressionNode alloc], "initWithPrefixExpression:binaryExpression:", v6, v7);
    else
      v8 = v6;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (REScriptASTExpressionNode)initWithPrefixExpression:(id)a3 binaryExpression:(id)a4
{
  id v7;
  id v8;
  void *v9;
  REScriptASTExpressionNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTExpressionNode;
  v10 = -[REScriptASTNode initWithToken:](&v12, sel_initWithToken_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_prefixExpression, a3);
    objc_storeStrong((id *)&v10->_binaryExpressions, a4);
  }

  return v10;
}

- (id)dependencies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REScriptASTNode dependencies](self->_prefixExpression, "dependencies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[REScriptASTNode dependencies](self->_binaryExpressions, "dependencies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (REScriptASTNode)prefixExpression
{
  return self->_prefixExpression;
}

- (REScriptASTNode)binaryExpressions
{
  return self->_binaryExpressions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryExpressions, 0);
  objc_storeStrong((id *)&self->_prefixExpression, 0);
}

@end
