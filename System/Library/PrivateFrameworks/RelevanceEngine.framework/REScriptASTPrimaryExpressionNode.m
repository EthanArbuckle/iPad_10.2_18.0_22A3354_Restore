@implementation REScriptASTPrimaryExpressionNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  REScriptASTSubscriptExpressionNode *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  REScriptASTMemberExpressionNode *v20;
  void *v21;
  char v22;
  void *v24;
  id v25;
  id v26;

  v5 = a3;
  objc_msgSend(v5, "currentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  v8 = 0;
  if (v7 > 0x20)
    goto LABEL_13;
  if (((1 << v7) & 0x638) != 0)
  {
    v9 = (void *)objc_opt_class();
    v10 = v5;
    goto LABEL_4;
  }
  if (v7 == 6)
  {
    v24 = (void *)objc_opt_class();
    v25 = v5;
    objc_msgSend(v25, "push");
    objc_msgSend(v24, "parseBuffer:error:", v25, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v25, "consume");
      v26 = v8;
    }
    else
    {
      objc_msgSend(v25, "pop");
    }

    if (v8)
      goto LABEL_13;
    v9 = (void *)objc_opt_class();
    v10 = v25;
LABEL_4:
    v11 = v10;
    objc_msgSend(v10, "push");
    objc_msgSend(v9, "parseBuffer:error:", v11, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v11, "consume");
      v12 = v8;
    }
    else
    {
      objc_msgSend(v11, "pop");
    }

    goto LABEL_13;
  }
  if (v7 == 32)
  {
    objc_msgSend(v5, "push");
    objc_msgSend(v5, "next");
    +[REScriptASTExpressionNode parseBuffer:error:](REScriptASTExpressionNode, "parseBuffer:error:", v5, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (objc_msgSend(v5, "currentToken"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "type"),
          v13,
          v14 == 33))
    {
      objc_msgSend(v5, "next");
      objc_msgSend(v5, "consume");
    }
    else
    {
      objc_msgSend(v5, "pop");
    }
  }
  do
  {
LABEL_13:
    +[REScriptASTSubscriptExpressionNode parseBuffer:error:](REScriptASTSubscriptExpressionNode, "parseBuffer:error:", v5, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = [REScriptASTSubscriptExpressionNode alloc];
      objc_msgSend(v15, "startIndex");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endIndex");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[REScriptASTSubscriptExpressionNode initWithExpression:startIndex:endIndex:](v16, "initWithExpression:startIndex:endIndex:", v8, v17, v18);
LABEL_17:
      v21 = (void *)v19;

      v22 = 1;
      v8 = v21;
      goto LABEL_18;
    }
    +[REScriptASTMemberExpressionNode parseBuffer:error:](REScriptASTMemberExpressionNode, "parseBuffer:error:", v5, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v20 = [REScriptASTMemberExpressionNode alloc];
      objc_msgSend(v17, "member");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[REScriptASTMemberExpressionNode initWithMember:expression:](v20, "initWithMember:expression:", v18, v8);
      goto LABEL_17;
    }
    v22 = 0;
LABEL_18:

  }
  while ((v22 & 1) != 0);

  return v8;
}

@end
