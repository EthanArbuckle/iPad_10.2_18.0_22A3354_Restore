@implementation REScriptASTLiteralNode

+ (id)parseBuffer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  REScriptASTLiteralNode *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CFC1D48);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  if (v9)
  {
    v10 = [REScriptASTLiteralNode alloc];
    objc_msgSend(v5, "currentToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = -[REScriptASTNode initWithToken:](v10, "initWithToken:", v11);

    objc_msgSend(v5, "next");
  }
  else if (a4)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Unexpected token \"%@\" found. Expecting literal token."), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = CFSTR("REErrorTokenKey");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(204, v14, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end
