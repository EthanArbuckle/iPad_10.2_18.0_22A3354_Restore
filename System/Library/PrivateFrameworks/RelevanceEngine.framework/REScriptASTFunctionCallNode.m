@implementation REScriptASTFunctionCallNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  REScriptASTFunctionCallNode *v11;
  REScriptASTFunctionCallNode *v12;
  void *v13;

  v5 = a3;
  if (REExpectTokenTypeInBuffer(v5, 6uLL, a4))
  {
    objc_msgSend(v5, "currentToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "push");
    objc_msgSend(v5, "next");
    if (!REExpectTokenTypeInBuffer(v5, 0x20uLL, a4))
    {
      objc_msgSend(v5, "pop");
      v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v5, "next");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[REScriptASTExpressionNode parseBuffer:error:](REScriptASTExpressionNode, "parseBuffer:error:", v5, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v7, "addObject:", v8);
      if (REExpectTokenTypeInBuffer(v5, 0x1BuLL, a4))
      {
        while (1)
        {
          objc_msgSend(v5, "next");
          +[REScriptASTExpressionNode parseBuffer:error:](REScriptASTExpressionNode, "parseBuffer:error:", v5, a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
            break;
          objc_msgSend(v7, "addObject:", v10);
          v9 = v10;
          if (!REExpectTokenTypeInBuffer(v5, 0x1BuLL, a4))
            goto LABEL_12;
        }
        objc_msgSend(v5, "pop");
        goto LABEL_16;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
LABEL_12:
    if (REExpectTokenTypeInBuffer(v5, 0x21uLL, a4))
    {
      objc_msgSend(v5, "next");
      objc_msgSend(v5, "consume");
      v12 = [REScriptASTFunctionCallNode alloc];
      v13 = (void *)objc_msgSend(v7, "copy");
      v11 = -[REScriptASTFunctionCallNode initWithFunctionName:arguments:](v12, "initWithFunctionName:arguments:", v6, v13);

LABEL_17:
      goto LABEL_18;
    }
    objc_msgSend(v5, "pop");

LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (REScriptASTFunctionCallNode)initWithFunctionName:(id)a3 arguments:(id)a4
{
  id v7;
  id v8;
  REScriptASTFunctionCallNode *v9;
  REScriptASTFunctionCallNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTFunctionCallNode;
  v9 = -[REScriptASTNode initWithToken:](&v12, sel_initWithToken_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_functionIdentifier, a3);
    objc_storeStrong((id *)&v10->_arguments, a4);
  }

  return v10;
}

- (id)dependencies
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_arguments;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "dependencies", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (REScriptToken)functionIdentifier
{
  return self->_functionIdentifier;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_functionIdentifier, 0);
}

@end
