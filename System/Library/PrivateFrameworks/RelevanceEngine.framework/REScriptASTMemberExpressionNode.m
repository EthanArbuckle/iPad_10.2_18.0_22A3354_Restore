@implementation REScriptASTMemberExpressionNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  REScriptASTMemberExpressionNode *v9;

  v5 = a3;
  objc_msgSend(v5, "currentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 != 26)
    goto LABEL_5;
  objc_msgSend(v5, "push");
  objc_msgSend(v5, "next");
  if (!REExpectTokenTypeInBuffer(v5, 6uLL, a4))
  {
    objc_msgSend(v5, "pop");
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v5, "currentToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "next");
  objc_msgSend(v5, "consume");
  v9 = -[REScriptASTMemberExpressionNode initWithMember:expression:]([REScriptASTMemberExpressionNode alloc], "initWithMember:expression:", v8, 0);

LABEL_6:
  return v9;
}

- (REScriptASTMemberExpressionNode)initWithMember:(id)a3 expression:(id)a4
{
  id v7;
  id v8;
  REScriptASTMemberExpressionNode *v9;
  REScriptASTMemberExpressionNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTMemberExpressionNode;
  v9 = -[REScriptASTNode initWithToken:](&v12, sel_initWithToken_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_member, a3);
    objc_storeStrong((id *)&v10->_expression, a4);
  }

  return v10;
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

- (REScriptToken)member
{
  return self->_member;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member, 0);
  objc_storeStrong((id *)&self->_expression, 0);
}

@end
