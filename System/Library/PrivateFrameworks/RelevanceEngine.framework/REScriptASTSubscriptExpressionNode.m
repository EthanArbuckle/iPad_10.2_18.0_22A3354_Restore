@implementation REScriptASTSubscriptExpressionNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  REScriptASTSubscriptExpressionNode *v12;

  v5 = a3;
  objc_msgSend(v5, "currentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 36)
  {
    objc_msgSend(v5, "push");
    objc_msgSend(v5, "next");
    +[REScriptASTExpressionNode parseBuffer:error:](REScriptASTExpressionNode, "parseBuffer:error:", v5, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    if (v10 == 38)
    {
      objc_msgSend(v5, "next");
      +[REScriptASTExpressionNode parseBuffer:error:](REScriptASTExpressionNode, "parseBuffer:error:", v5, a4);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8)
      {
        v11 = (uint64_t)(id)v8;
        goto LABEL_9;
      }
      v11 = 0;
    }
    if (!(v8 | v11))
    {
      v11 = 0;
      goto LABEL_12;
    }
LABEL_9:
    if (REExpectTokenTypeInBuffer(v5, 0x25uLL, a4))
    {
      objc_msgSend(v5, "next");
      objc_msgSend(v5, "consume");
      v12 = -[REScriptASTSubscriptExpressionNode initWithExpression:startIndex:endIndex:]([REScriptASTSubscriptExpressionNode alloc], "initWithExpression:startIndex:endIndex:", 0, v11, v8);
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    objc_msgSend(v5, "pop");
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (REScriptASTSubscriptExpressionNode)initWithExpression:(id)a3 startIndex:(id)a4 endIndex:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  REScriptASTSubscriptExpressionNode *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
    v11 = v10;
  objc_msgSend(v11, "token");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)REScriptASTSubscriptExpressionNode;
  v14 = -[REScriptASTNode initWithToken:](&v16, sel_initWithToken_, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_expression, a3);
    objc_storeStrong((id *)&v14->_startIndex, a4);
    objc_storeStrong((id *)&v14->_endIndex, a5);
  }

  return v14;
}

- (id)dependencies
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[REScriptASTNode dependencies](self->_expression, "dependencies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (REScriptASTNode)expression
{
  return self->_expression;
}

- (REScriptASTNode)startIndex
{
  return self->_startIndex;
}

- (REScriptASTNode)endIndex
{
  return self->_endIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endIndex, 0);
  objc_storeStrong((id *)&self->_startIndex, 0);
  objc_storeStrong((id *)&self->_expression, 0);
}

@end
