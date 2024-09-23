@implementation REScriptASTPrefixExpressionNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  REScriptASTPrefixExpressionNode *v10;

  v5 = a3;
  objc_msgSend(v5, "currentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 21)
  {
    objc_msgSend(v5, "push");
    objc_msgSend(v5, "currentToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "next");
    +[REScriptASTPrimaryExpressionNode parseBuffer:error:](REScriptASTPrimaryExpressionNode, "parseBuffer:error:", v5, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[REScriptASTPrefixExpressionNode initWithPrefixOperatorToken:primaryExpression:]([REScriptASTPrefixExpressionNode alloc], "initWithPrefixOperatorToken:primaryExpression:", v8, v9);
      objc_msgSend(v5, "consume");
    }
    else
    {
      objc_msgSend(v5, "pop");
      v10 = 0;
    }

  }
  else
  {
    +[REScriptASTPrimaryExpressionNode parseBuffer:error:](REScriptASTPrimaryExpressionNode, "parseBuffer:error:", v5, a4);
    v10 = (REScriptASTPrefixExpressionNode *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (REScriptASTPrefixExpressionNode)initWithPrefixOperatorToken:(id)a3 primaryExpression:(id)a4
{
  id v7;
  id v8;
  REScriptASTPrefixExpressionNode *v9;
  REScriptASTPrefixExpressionNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTPrefixExpressionNode;
  v9 = -[REScriptASTNode initWithToken:](&v12, sel_initWithToken_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prefixOperator, a3);
    objc_storeStrong((id *)&v10->_node, a4);
  }

  return v10;
}

- (id)dependencies
{
  return -[REScriptASTNode dependencies](self->_node, "dependencies");
}

- (REScriptToken)prefixOperator
{
  return self->_prefixOperator;
}

- (REScriptASTNode)node
{
  return self->_node;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_prefixOperator, 0);
}

@end
