@implementation REScriptASTRuleNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  REScriptASTRuleNode *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "currentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if ((unint64_t)(v7 - 13) < 3)
  {
    objc_msgSend(v5, "currentToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "push");
    objc_msgSend(v5, "next");
    REScriptParseOptionsValues(v5, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || !REExpectTokenTypeInBuffer(v5, 6uLL, a4))
    {
      objc_msgSend(v5, "pop");
      a4 = 0;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v5, "currentToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "next");
    if (!REExpectTokenTypeInBuffer(v5, 0x22uLL, a4))
    {
      objc_msgSend(v5, "pop");
      a4 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v5, "next");
    +[REScriptASTExpressionNode parseBuffer:error:](REScriptASTExpressionNode, "parseBuffer:error:", v5, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (REExpectTokenTypeInBuffer(v5, 0x23uLL, a4))
      {
        objc_msgSend(v5, "next");
        objc_msgSend(v5, "consume");
        v12 = [REScriptASTRuleNode alloc];
        v13 = (void *)objc_msgSend(v9, "copy");
        a4 = -[REScriptASTRuleNode initWithType:options:name:expression:](v12, "initWithType:options:name:expression:", v8, v13, v10, v11);

LABEL_14:
        goto LABEL_15;
      }
      objc_msgSend(v5, "pop");
    }
    a4 = 0;
    goto LABEL_14;
  }
  if (a4)
  {
    objc_msgSend(v5, "currentToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v14, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Unexpected token \"%@\" found. Expecting rule type token."), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = CFSTR("REErrorTokenKey");
    v21[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(204, v17, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_17:

  return a4;
}

- (REScriptASTRuleNode)initWithType:(id)a3 options:(id)a4 name:(id)a5 expression:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  REScriptASTRuleNode *v15;
  REScriptASTRuleNode *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)REScriptASTRuleNode;
  v15 = -[REScriptASTNode initWithToken:](&v18, sel_initWithToken_, v11);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_type, a3);
    objc_storeStrong((id *)&v16->_name, a5);
    objc_storeStrong((id *)&v16->_options, a4);
    objc_storeStrong((id *)&v16->_expression, a6);
  }

  return v16;
}

- (id)dependencies
{
  return -[REScriptASTNode dependencies](self->_expression, "dependencies");
}

- (REScriptToken)type
{
  return self->_type;
}

- (REScriptToken)name
{
  return self->_name;
}

- (NSDictionary)options
{
  return self->_options;
}

- (REScriptASTNode)expression
{
  return self->_expression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
