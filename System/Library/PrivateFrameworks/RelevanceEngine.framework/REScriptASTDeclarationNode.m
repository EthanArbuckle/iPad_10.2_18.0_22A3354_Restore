@implementation REScriptASTDeclarationNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  REScriptASTDeclarationNode *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = a3;
  if (REExpectTokenTypeInBuffer(v5, 6uLL, a4))
  {
    objc_msgSend(v5, "currentToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "push");
    objc_msgSend(v5, "next");
    if (!REExpectTokenTypeInBuffer(v5, 6uLL, a4))
    {
      objc_msgSend(v5, "pop");
      v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v5, "currentToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "next");
    objc_msgSend(v5, "consume");
    objc_msgSend(v5, "push");
    +[REScriptASTBinaryExpressionListNode parseBuffer:error:](REScriptASTBinaryExpressionListNode, "parseBuffer:error:", v5, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "expressions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_14;
    }
    else
    {
      v10 = v8;
      if (!v10)
        goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "binaryOperator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "type") == 30)
      {
        objc_msgSend(v10, "binaryOperator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "type");

        if (v14 == 29)
        {
          objc_msgSend(v5, "consume");
LABEL_15:
          v11 = -[REScriptASTDeclarationNode initWithName:type:expression:]([REScriptASTDeclarationNode alloc], "initWithName:type:expression:", v7, v6, v8);

          goto LABEL_16;
        }
      }
      else
      {

      }
    }
LABEL_14:
    objc_msgSend(v5, "pop");

    v8 = 0;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (REScriptASTDeclarationNode)initWithName:(id)a3 type:(id)a4 expression:(id)a5
{
  id v9;
  id v10;
  id v11;
  REScriptASTDeclarationNode *v12;
  REScriptASTDeclarationNode *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REScriptASTDeclarationNode;
  v12 = -[REScriptASTNode initWithToken:](&v15, sel_initWithToken_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_type, a4);
    objc_storeStrong((id *)&v13->_value, a5);
  }

  return v13;
}

- (id)dependencies
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[REScriptASTNode dependencies](self->_value, "dependencies");
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

- (REScriptToken)type
{
  return self->_type;
}

- (REScriptToken)name
{
  return self->_name;
}

- (REScriptASTNode)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
