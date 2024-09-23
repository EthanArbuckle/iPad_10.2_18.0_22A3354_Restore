@implementation _UIDebugLogReport

- (_UIDebugLogReport)init
{
  _UIDebugLogReport *v2;
  NSMutableArray *v3;
  NSMutableArray *statements;
  NSMutableArray *v5;
  NSMutableArray *prefixStack;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDebugLogReport;
  v2 = -[_UIDebugLogReport init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    statements = v2->_statements;
    v2->_statements = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    prefixStack = v2->_prefixStack;
    v2->_prefixStack = v5;

  }
  return v2;
}

- (unint64_t)messageCount
{
  void *v2;
  unint64_t v3;

  -[_UIDebugLogReport _statements](self, "_statements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)addMessageWithFormat:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDebugLogReport.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageFormat"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v5, &v8);
  -[_UIDebugLogReport addMessage:](self, "addMessage:", v6);

}

- (void)addMessage:(id)a3
{
  unint64_t v5;
  _UIDebugLogStatement *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDebugLogReport.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  v5 = -[_UIDebugLogReport currentIndentLevel](self, "currentIndentLevel");
  v6 = objc_alloc_init(_UIDebugLogStatement);
  -[_UIDebugLogStatement setType:](v6, "setType:", 0);
  -[_UIDebugLogStatement setIndentLevel:](v6, "setIndentLevel:", v5);
  -[_UIDebugLogReport _messagePrefixAtIndentLevel:](self, "_messagePrefixAtIndentLevel:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDebugLogStatement setPrefix:](v6, "setPrefix:", v7);

  -[_UIDebugLogStatement setText:](v6, "setText:", v10);
  -[_UIDebugLogReport _statements](self, "_statements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v6);

}

- (void)addLineBreak
{
  void *v3;
  _UIDebugLogStatement *v4;

  v4 = objc_alloc_init(_UIDebugLogStatement);
  -[_UIDebugLogStatement setType:](v4, "setType:", 1);
  -[_UIDebugLogReport _statements](self, "_statements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void)incrementIndentLevel
{
  -[_UIDebugLogReport setCurrentIndentLevel:](self, "setCurrentIndentLevel:", -[_UIDebugLogReport currentIndentLevel](self, "currentIndentLevel") + 1);
}

- (void)decrementIndentLevel
{
  -[_UIDebugLogReport setCurrentIndentLevel:](self, "setCurrentIndentLevel:", -[_UIDebugLogReport currentIndentLevel](self, "currentIndentLevel") - 1);
}

- (void)resetIndentLevel
{
  -[_UIDebugLogReport setCurrentIndentLevel:](self, "setCurrentIndentLevel:", 0);
}

- (id)fallbackMessagePrefixHandler
{
  id fallbackMessagePrefixHandler;

  fallbackMessagePrefixHandler = self->_fallbackMessagePrefixHandler;
  if (!fallbackMessagePrefixHandler)
  {
    self->_fallbackMessagePrefixHandler = &__block_literal_global_200;
    fallbackMessagePrefixHandler = &__block_literal_global_200;
  }
  return _Block_copy(fallbackMessagePrefixHandler);
}

- (void)pushMessagePrefix:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDebugLogReport.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefix"));

  }
  -[_UIDebugLogReport _prefixStack](self, "_prefixStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

}

- (void)pushMessagePrefixHandler:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id aBlock;

  aBlock = a3;
  if (!aBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDebugLogReport.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefixHandler"), 0);

  }
  -[_UIDebugLogReport _prefixStack](self, "_prefixStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "addObject:", v6);

}

- (void)popMessagePrefix
{
  id v2;

  -[_UIDebugLogReport _prefixStack](self, "_prefixStack");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeLastObject");

}

- (void)clearAllMessagePrefixes
{
  id v2;

  -[_UIDebugLogReport _prefixStack](self, "_prefixStack");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)_messagePrefixAtIndentLevel:(unint64_t)a3
{
  void *v6;
  void *v7;
  id v8;
  void (**v9)(void *, unint64_t);
  void (**v10)(_QWORD, _QWORD);
  void *v12;

  -[_UIDebugLogReport _prefixStack](self, "_prefixStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if (v8)
      goto LABEL_8;
  }
  else if (v7)
  {
    v9 = (void (**)(void *, unint64_t))_Block_copy(v7);
    v9[2](v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_8;
  }
  -[_UIDebugLogReport fallbackMessagePrefixHandler](self, "fallbackMessagePrefixHandler");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10[2](v10, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDebugLogReport.m"), 177, CFSTR("nil message prefixes are not allowed."));

  }
LABEL_8:

  return v8;
}

- (void)incrementIndentLevelAndPushMessagePrefix:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIDebugLogReport incrementIndentLevel](self, "incrementIndentLevel");
  -[_UIDebugLogReport pushMessagePrefix:](self, "pushMessagePrefix:", v4);

}

- (void)decrementIndentLevelAndPopMessagePrefix
{
  -[_UIDebugLogReport popMessagePrefix](self, "popMessagePrefix");
  -[_UIDebugLogReport decrementIndentLevel](self, "decrementIndentLevel");
}

- (unint64_t)currentIndentLevel
{
  return self->_currentIndentLevel;
}

- (void)setCurrentIndentLevel:(unint64_t)a3
{
  self->_currentIndentLevel = a3;
}

- (void)setFallbackMessagePrefixHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)_statements
{
  return self->_statements;
}

- (void)setStatements:(id)a3
{
  objc_storeStrong((id *)&self->_statements, a3);
}

- (NSMutableArray)_prefixStack
{
  return self->_prefixStack;
}

- (void)setPrefixStack:(id)a3
{
  objc_storeStrong((id *)&self->_prefixStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefixStack, 0);
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong(&self->_fallbackMessagePrefixHandler, 0);
}

@end
