@implementation REScriptASTBinaryExpressionNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v10;
  REScriptASTBinaryExpressionNode *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "currentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if (v8 > 0x2D || ((1 << v8) & 0x3F0070180000) == 0)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Unexpected token \"%@\" found. Expecting operator token."), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = CFSTR("REErrorTokenKey");
      v18[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      RECreateErrorWithCodeMessageAndUseInfo(204, v15, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "push");
    objc_msgSend(v5, "next");
    +[REScriptASTPrefixExpressionNode parseBuffer:error:](REScriptASTPrefixExpressionNode, "parseBuffer:error:", v5, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "consume");
      v11 = -[REScriptASTBinaryExpressionNode initWithOperator:expression:]([REScriptASTBinaryExpressionNode alloc], "initWithOperator:expression:", v6, v10);
    }
    else
    {
      objc_msgSend(v5, "pop");
      v11 = 0;
    }

  }
  return v11;
}

- (REScriptASTBinaryExpressionNode)initWithOperator:(id)a3 expression:(id)a4
{
  id v7;
  id v8;
  REScriptASTBinaryExpressionNode *v9;
  REScriptASTBinaryExpressionNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTBinaryExpressionNode;
  v9 = -[REScriptASTNode initWithToken:](&v12, sel_initWithToken_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_binaryOperator, a3);
    objc_storeStrong((id *)&v10->_expression, a4);
  }

  return v10;
}

- (id)dependencies
{
  return -[REScriptASTNode dependencies](self->_expression, "dependencies");
}

- (REScriptToken)binaryOperator
{
  return self->_binaryOperator;
}

- (REScriptASTNode)expression
{
  return self->_expression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_binaryOperator, 0);
}

@end
