@implementation REScriptParser

- (REScriptParser)initWithBacktrackingBuffer:(id)a3
{
  id v5;
  REScriptParser *v6;
  REScriptParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REScriptParser;
  v6 = -[REScriptParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_buffer, a3);

  return v7;
}

- (id)parse
{
  void *v3;
  void *v4;
  uint64_t v5;
  REBacktrackingTokenBuffer *v6;
  void *v7;
  void *v8;
  REBacktrackingTokenBuffer *buffer;
  id v10;
  REBacktrackingTokenBuffer *v11;
  REBacktrackingTokenBuffer *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[REBacktrackingTokenBuffer isEmpty](self->_buffer, "isEmpty") & 1) == 0)
  {
    while (1)
    {
      -[REBacktrackingTokenBuffer currentToken](self->_buffer, "currentToken");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "type");

      if ((unint64_t)(v5 - 13) < 3)
        break;
      if (v5 == 12)
      {
        buffer = self->_buffer;
        v19 = 0;
        +[REScriptASTFeatureNode parseBuffer:error:](REScriptASTFeatureNode, "parseBuffer:error:", buffer, &v19);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v19;
LABEL_6:
        v10 = v8;
        if (!v7)
          goto LABEL_11;
        goto LABEL_7;
      }
      v11 = self->_buffer;
      v18 = 0;
      +[REScriptASTDeclarationNode parseBuffer:error:](REScriptASTDeclarationNode, "parseBuffer:error:", v11, &v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v18;
      if (!v7)
      {
        v12 = self->_buffer;
        v17 = v10;
        +[REScriptASTExpressionNode parseBuffer:error:](REScriptASTExpressionNode, "parseBuffer:error:", v12, &v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v17;

        v10 = v13;
        if (!v7)
        {
LABEL_11:
          -[REScriptParser delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "parser:didEncouterParserError:", self, v10);

          goto LABEL_12;
        }
      }
LABEL_7:
      objc_msgSend(v3, "addObject:", v7);

      if (-[REBacktrackingTokenBuffer isEmpty](self->_buffer, "isEmpty"))
        goto LABEL_12;
    }
    v6 = self->_buffer;
    v20 = 0;
    +[REScriptASTRuleNode parseBuffer:error:](REScriptASTRuleNode, "parseBuffer:error:", v6, &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;
    goto LABEL_6;
  }
LABEL_12:
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (REScriptParserDelegate)delegate
{
  return (REScriptParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
