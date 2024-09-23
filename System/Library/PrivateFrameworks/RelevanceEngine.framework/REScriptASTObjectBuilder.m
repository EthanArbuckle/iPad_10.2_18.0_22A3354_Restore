@implementation REScriptASTObjectBuilder

- (REScriptASTObjectBuilder)initWithTable:(id)a3
{
  id v5;
  REScriptASTObjectBuilder *v6;
  REScriptASTObjectBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REScriptASTObjectBuilder;
  v6 = -[REScriptASTObjectBuilder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_table, a3);

  return v7;
}

- (id)buildObjectWithNode:(id)a3 error:(id *)a4
{
  id v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0;
    v7 = (id *)&v20;
    -[REScriptASTObjectBuilder buildObjectWithIdentifierNode:error:](self, "buildObjectWithIdentifierNode:error:", v6, &v20);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v9 = v8;
    v10 = (uint64_t)*v7;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0;
    v7 = (id *)&v19;
    -[REScriptASTObjectBuilder buildObjectWithLiteralNode:error:](self, "buildObjectWithLiteralNode:error:", v6, &v19);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0;
    v7 = (id *)&v18;
    -[REScriptASTObjectBuilder buildObjectWithExpressionNode:error:](self, "buildObjectWithExpressionNode:error:", v6, &v18);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0;
    v7 = (id *)&v17;
    -[REScriptASTObjectBuilder buildObjectWithPrefixExpressionNode:error:](self, "buildObjectWithPrefixExpressionNode:error:", v6, &v17);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0;
    v7 = (id *)&v16;
    -[REScriptASTObjectBuilder buildObjectWithFunctionNode:error:](self, "buildObjectWithFunctionNode:error:", v6, &v16);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0;
    v7 = (id *)&v15;
    -[REScriptASTObjectBuilder buildObjectWithMemberExpressionNode:error:](self, "buildObjectWithMemberExpressionNode:error:", v6, &v15);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    v7 = (id *)&v14;
    -[REScriptASTObjectBuilder buildObjectWithSubscriptExpressionNode:error:](self, "buildObjectWithSubscriptExpressionNode:error:", v6, &v14);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0;
    v7 = (id *)&v13;
    -[REScriptASTObjectBuilder buildObjectWithTopLevelBinaryExpression:error:](self, "buildObjectWithTopLevelBinaryExpression:error:", v6, &v13);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0;
    v7 = (id *)&v12;
    -[REScriptASTObjectBuilder buildObjectWithTopLevelBinaryExpressionListNode:error:](self, "buildObjectWithTopLevelBinaryExpressionListNode:error:", v6, &v12);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v10 = 0;
  v9 = 0;
LABEL_20:
  if (!(v9 | v10))
  {
    -[REScriptASTObjectBuilder _errorForUnsupportedNode:](self, "_errorForUnsupportedNode:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v10);

  return (id)v9;
}

- (id)buildObjectWithExpressionNode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "prefixExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REScriptASTObjectBuilder buildObjectWithNode:error:](self, "buildObjectWithNode:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "binaryExpressions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REScriptASTObjectBuilder buildObjectWithBinaryExpressionListNode:previousExpression:error:](self, "buildObjectWithBinaryExpressionListNode:previousExpression:error:", v9, v8, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REScriptASTObjectBuilder buildObjectWithBinaryExpressionNode:previousExpression:error:](self, "buildObjectWithBinaryExpressionNode:previousExpression:error:", v9, v8, a4);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v10;
    if (v10)
      goto LABEL_9;
  }
  if (*a4)
  {
    v11 = 0;
  }
  else
  {
    -[REScriptASTObjectBuilder _errorForUnsupportedNode:](self, "_errorForUnsupportedNode:", v9);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v11;
}

- (id)buildObjectWithTopLevelBinaryExpression:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "binaryOperator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if ((unint64_t)(v8 - 29) > 1)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "expression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REScriptASTObjectBuilder buildObjectWithNode:error:](self, "buildObjectWithNode:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)buildObjectWithTopLevelBinaryExpressionListNode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  REScriptASTBinaryExpressionListNode *v13;
  void *v14;

  v6 = a3;
  objc_msgSend(v6, "expressions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[REScriptASTObjectBuilder buildObjectWithTopLevelBinaryExpression:error:](self, "buildObjectWithTopLevelBinaryExpression:error:", v8, a4), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    objc_msgSend(v6, "expressions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "removeObjectAtIndex:", 0);
    v13 = -[REScriptASTBinaryExpressionListNode initWithExpressions:]([REScriptASTBinaryExpressionListNode alloc], "initWithExpressions:", v12);
    -[REScriptASTObjectBuilder buildObjectWithBinaryExpressionListNode:previousExpression:error:](self, "buildObjectWithBinaryExpressionListNode:previousExpression:error:", v13, v10, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)buildObjectWithBinaryExpressionListNode:(id)a3 previousExpression:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "expressions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = v9;
  if (v11)
  {
    v13 = 0;
    v14 = v9;
    while (1)
    {
      objc_msgSend(v8, "expressions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      -[REScriptASTObjectBuilder buildObjectWithBinaryExpressionNode:previousExpression:error:](self, "buildObjectWithBinaryExpressionNode:previousExpression:error:", v16, v14, a5);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        break;
      v12 = (void *)v17;

      ++v13;
      v14 = v12;
      if (v11 == v13)
        goto LABEL_6;
    }
    if (a5 && !*a5)
    {
      -[REScriptASTObjectBuilder _errorForUnsupportedNode:](self, "_errorForUnsupportedNode:", v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v18 = 0;
  }
  else
  {
LABEL_6:
    v14 = v12;
    v18 = v14;
  }

  return v18;
}

- (id)_errorForUnsupportedNode:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[REScriptASTObjectBuilder objectTypeErrorDescription](self, "objectTypeErrorDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Unsupported expression found when creating %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CFSTR("REErrorTokenKey");
  objc_msgSend(v5, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  RECreateErrorWithCodeMessageAndUseInfo(209, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (REScriptSymbolTable)table
{
  return self->_table;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
}

- (id)objectTypeErrorDescription
{
  return CFSTR("object");
}

- (id)buildObjectWithIdentifierNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithLiteralNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithPrefixExpressionNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithBinaryExpressionNode:(id)a3 previousExpression:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)buildObjectWithFunctionNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithMemberExpressionNode:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)buildObjectWithSubscriptExpressionNode:(id)a3 error:(id *)a4
{
  return 0;
}

@end
