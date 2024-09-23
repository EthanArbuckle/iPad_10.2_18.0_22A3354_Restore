@implementation REScriptASTFeatureNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  REScriptASTFeatureNode *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (REExpectTokenTypeInBuffer(v5, 0xCuLL, a4))
  {
    objc_msgSend(v5, "push");
    objc_msgSend(v5, "next");
    REScriptParseOptionsValues(v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || !REExpectTokenTypeInBuffer(v5, 6uLL, a4))
    {
      objc_msgSend(v5, "pop");
      v11 = 0;
LABEL_20:

      goto LABEL_21;
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
        goto LABEL_17;
    }
    else
    {
      v10 = v8;
      if (!v10)
        goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "binaryOperator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "type");

      if (v13 == 30)
      {
        objc_msgSend(v5, "consume");
LABEL_18:
        v11 = -[REScriptASTFeatureNode initWithName:options:expression:]([REScriptASTFeatureNode alloc], "initWithName:options:expression:", v7, v6, v8);
LABEL_19:

        goto LABEL_20;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a4)
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        REDescriptionForTokenType(0x1EuLL);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "binaryOperator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        REDescriptionForTokenType(objc_msgSend(v16, "type"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("Expecting '%@' token but found '%@'"), v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = CFSTR("REErrorTokenKey");
        objc_msgSend(v10, "binaryOperator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        RECreateErrorWithCodeMessageAndUseInfo(204, v18, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v5, "pop");

      v8 = 0;
      v11 = 0;
      goto LABEL_19;
    }
LABEL_17:
    objc_msgSend(v5, "pop");

    v8 = 0;
    goto LABEL_18;
  }
  v11 = 0;
LABEL_21:

  return v11;
}

- (REScriptASTFeatureNode)initWithName:(id)a3 options:(id)a4 expression:(id)a5
{
  id v9;
  id v10;
  id v11;
  REScriptASTFeatureNode *v12;
  REScriptASTFeatureNode *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REScriptASTFeatureNode;
  v12 = -[REScriptASTNode initWithToken:](&v15, sel_initWithToken_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_options, a4);
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

- (REScriptToken)name
{
  return self->_name;
}

- (NSDictionary)options
{
  return self->_options;
}

- (REScriptASTNode)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
