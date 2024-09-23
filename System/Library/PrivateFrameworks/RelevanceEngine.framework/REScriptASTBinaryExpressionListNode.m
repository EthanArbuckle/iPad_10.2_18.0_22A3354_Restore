@implementation REScriptASTBinaryExpressionListNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  REScriptASTBinaryExpressionListNode *v9;
  REScriptASTBinaryExpressionListNode *v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "push");
  +[REScriptASTBinaryExpressionNode parseBuffer:error:](REScriptASTBinaryExpressionNode, "parseBuffer:error:", v5, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_msgSend(v6, "addObject:", v8);
      objc_msgSend(v5, "consume");

      objc_msgSend(v5, "push");
      +[REScriptASTBinaryExpressionNode parseBuffer:error:](REScriptASTBinaryExpressionNode, "parseBuffer:error:", v5, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v8);
  }
  objc_msgSend(v5, "pop");
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    objc_msgSend(v6, "firstObject");
    v9 = (REScriptASTBinaryExpressionListNode *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[REScriptASTBinaryExpressionListNode initWithExpressions:]([REScriptASTBinaryExpressionListNode alloc], "initWithExpressions:", v6);
  }
  v10 = v9;

  return v10;
}

- (REScriptASTBinaryExpressionListNode)initWithExpressions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  REScriptASTBinaryExpressionListNode *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)REScriptASTBinaryExpressionListNode;
  v8 = -[REScriptASTNode initWithToken:](&v10, sel_initWithToken_, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_expressions, a3);

  return v8;
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
  v4 = self->_expressions;
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

- (NSArray)expressions
{
  return self->_expressions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressions, 0);
}

@end
