@implementation REScriptTokenizer

- (REScriptTokenizer)initWithScriptBuffer:(id)a3
{
  id v5;
  REScriptTokenizer *v6;
  REScriptTokenizer *v7;
  REScriptToken *currentToken;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REScriptTokenizer;
  v6 = -[REScriptTokenizer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buffer, a3);
    currentToken = v7->_currentToken;
    v7->_currentToken = 0;

    -[REScriptTokenizer _consumeWhitespace](v7, "_consumeWhitespace");
    -[REScriptTokenizer next](v7, "next");
  }

  return v7;
}

- (REScriptToken)currentToken
{
  return self->_currentToken;
}

- (BOOL)isEmpty
{
  return !-[REScriptTokenizer _hasChar](self, "_hasChar") && -[REScriptToken type](self->_currentToken, "type") == 0;
}

- (void)next
{
  unint64_t column;
  unint64_t line;
  void (**v5)(_QWORD);
  id *v6;
  _BOOL4 v7;
  uint64_t *v8;
  uint64_t v9;
  id *v10;
  _BOOL4 v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  _BOOL4 v19;
  uint64_t v20;
  id v21;
  _BOOL4 v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  REScriptToken *v31;
  REScriptToken *v32;
  REScriptToken *currentToken;
  id *v34;
  _BOOL4 v35;
  uint64_t v36;
  id v37;
  id v38;
  __CFString *v39;
  id v40;
  id v41;
  id obj;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  __CFString *v53;

  line = self->_line;
  column = self->_column;
  v48 = 0;
  v49 = (id *)&v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__4;
  v52 = __Block_byref_object_dispose__4;
  v53 = &stru_24CF92178;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __25__REScriptTokenizer_next__block_invoke;
  v43[3] = &unk_24CF8BA90;
  v43[4] = &v48;
  v43[5] = &v44;
  v5 = (void (**)(_QWORD))MEMORY[0x2199B2434](v43, a2);
  if (-[REScriptTokenizer _hasChar](self, "_hasChar"))
  {
    v6 = v49;
    obj = v49[5];
    v7 = -[REScriptTokenizer _matchTokenStart:body:value:](self, "_matchTokenStart:body:value:", REIsPreprocessStartCharacter, REIsAlphaCharacter, &obj);
    objc_storeStrong(v6 + 5, obj);
    if (v7)
    {
      v8 = v45;
      v9 = 2;
LABEL_4:
      v8[3] = v9;
      goto LABEL_34;
    }
    v10 = v49;
    v41 = v49[5];
    v11 = -[REScriptTokenizer _matchTokenStart:body:value:](self, "_matchTokenStart:body:value:", REIsIdentifierStartCharacter, REIsIdentifierCharacter, &v41);
    objc_storeStrong(v10 + 5, v41);
    if (v11)
    {
      v45[3] = 6;
      v12 = (__CFString *)v49[5];
      if (REKeywordTokenForString_onceToken != -1)
        dispatch_once(&REKeywordTokenForString_onceToken, &__block_literal_global_121);
      objc_msgSend((id)REKeywordTokenForString_KeywordTokenMap, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = objc_msgSend(v13, "unsignedIntegerValue");
LABEL_10:
        v16 = v15;

        v45[3] = v16;
        goto LABEL_34;
      }
LABEL_20:

      goto LABEL_34;
    }
    if (-[REScriptTokenizer _peekChar](self, "_peekChar") == 47)
    {
      -[REScriptTokenizer _popChar](self, "_popChar");
      if (-[REScriptTokenizer _hasChar](self, "_hasChar"))
      {
        if (-[REScriptTokenizer _peekChar](self, "_peekChar") == 47)
        {
          v45[3] = 7;
          -[REScriptTokenizer _popChar](self, "_popChar");
          -[REScriptTokenizer _readSingleComment](self, "_readSingleComment");
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
        if (-[REScriptTokenizer _peekChar](self, "_peekChar") == 42)
        {
          v45[3] = 8;
          -[REScriptTokenizer _popChar](self, "_popChar");
          -[REScriptTokenizer _readMultilineComment](self, "_readMultilineComment");
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
      }
      v30 = v49[5];
      v49[5] = CFSTR("/");

      v5[2](v5);
      goto LABEL_34;
    }
    v18 = v49;
    v40 = v49[5];
    v19 = -[REScriptTokenizer _matchTokenStart:body:value:](self, "_matchTokenStart:body:value:", REIsNumericCharacter, REIsNumericCharacter, &v40);
    objc_storeStrong(v18 + 5, v40);
    if (!v19)
    {
      if (-[REScriptTokenizer _peekChar](self, "_peekChar") != 34)
      {
        v25 = -[REScriptTokenizer _peekChar](self, "_peekChar");
        if (RELoadControlCharacterMap_onceToken != -1)
          dispatch_once(&RELoadControlCharacterMap_onceToken, &__block_literal_global_138);
        if (objc_msgSend((id)REControlCharacterSet, "characterIsMember:", v25))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), -[REScriptTokenizer _peekChar](self, "_peekChar"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v49[5];
          v49[5] = (id)v26;

          -[REScriptTokenizer _popChar](self, "_popChar");
          v12 = (__CFString *)v49[5];
          if (RELoadControlCharacterMap_onceToken != -1)
            dispatch_once(&RELoadControlCharacterMap_onceToken, &__block_literal_global_138);
          objc_msgSend((id)REControlTokenMap, "objectForKeyedSubscript:", v12);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          if (v28)
          {
            v15 = objc_msgSend(v28, "unsignedIntegerValue");
            goto LABEL_10;
          }

        }
        else
        {
          v34 = v49;
          v38 = v49[5];
          v35 = -[REScriptTokenizer _matchTokenStart:body:value:](self, "_matchTokenStart:body:value:", REIsOperatorCharacter, REIsOperatorCharacter, &v38);
          objc_storeStrong(v34 + 5, v38);
          if (v35)
          {
            v5[2](v5);
            goto LABEL_34;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), -[REScriptTokenizer _peekChar](self, "_peekChar"));
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = v49[5];
          v49[5] = (id)v36;

          -[REScriptTokenizer _popChar](self, "_popChar");
        }
        v8 = v45;
        v9 = 1;
        goto LABEL_4;
      }
      v45[3] = 5;
      -[REScriptTokenizer _popChar](self, "_popChar");
      -[REScriptTokenizer _readString](self, "_readString");
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_32:
      v29 = v49[5];
      v49[5] = (id)v17;

      goto LABEL_34;
    }
    v45[3] = 3;
    if (-[REScriptTokenizer _hasChar](self, "_hasChar") && -[REScriptTokenizer _peekChar](self, "_peekChar") == 46)
    {
      v45[3] = 4;
      -[REScriptTokenizer _popChar](self, "_popChar");
      objc_msgSend(v49[5], "stringByAppendingString:", CFSTR("."));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v49[5];
      v49[5] = (id)v20;

      v39 = &stru_24CF92178;
      v22 = -[REScriptTokenizer _matchTokenStart:body:value:](self, "_matchTokenStart:body:value:", REIsNumericCharacter, REIsNumericCharacter, &v39);
      v12 = v39;
      if (v22)
      {
        objc_msgSend(v49[5], "stringByAppendingString:", v12);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v49[5];
        v49[5] = (id)v23;

      }
      goto LABEL_20;
    }
  }
LABEL_34:
  v31 = [REScriptToken alloc];
  v32 = -[REScriptToken initWithValue:type:line:column:](v31, "initWithValue:type:line:column:", v49[5], v45[3], line, column);
  currentToken = self->_currentToken;
  self->_currentToken = v32;

  -[REScriptTokenizer _validateToken](self, "_validateToken");
  -[REScriptTokenizer _consumeWhitespace](self, "_consumeWhitespace");

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

}

void __25__REScriptTokenizer_next__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = RELoadOperatorCharacterMap_onceToken;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2 != -1)
    dispatch_once(&RELoadOperatorCharacterMap_onceToken, &__block_literal_global_13);
  objc_msgSend((id)REOperatorTokenMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  else
  {
    v5 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
}

- (id)_readSingleComment
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("//"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[REScriptTokenizer _hasChar](self, "_hasChar"))
  {
    do
    {
      v4 = -[REScriptTokenizer _peekChar](self, "_peekChar");
      if (v4 == 10)
        break;
      if (v4 == 13)
        break;
      objc_msgSend(v3, "appendFormat:", CFSTR("%c"), -[REScriptTokenizer _peekChar](self, "_peekChar"));
      -[REScriptTokenizer _popChar](self, "_popChar");
    }
    while (-[REScriptTokenizer _hasChar](self, "_hasChar"));
  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)_readMultilineComment
{
  void *v3;
  char v4;
  int v5;
  int v6;
  char v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("/*"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  do
  {
    if (!-[REScriptTokenizer _hasChar](self, "_hasChar"))
      break;
    v5 = -[REScriptTokenizer _peekChar](self, "_peekChar");
    v6 = v5 << 24;
    objc_msgSend(v3, "appendFormat:", CFSTR("%c"), (char)v5);
    -[REScriptTokenizer _popChar](self, "_popChar");
    v7 = (v6 != 788529152) | ~v4;
    v4 = v6 == 704643072;
  }
  while ((v7 & 1) != 0);
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)_readString
{
  void *v3;
  BOOL v4;
  int v5;
  int v6;
  id v7;
  BOOL v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("\"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  do
  {
    if (!-[REScriptTokenizer _hasChar](self, "_hasChar"))
      break;
    v5 = -[REScriptTokenizer _peekChar](self, "_peekChar");
    v6 = v5 << 24;
    v7 = (id)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%c"), (char)v5);
    -[REScriptTokenizer _popChar](self, "_popChar");
    v8 = v4 || v6 != 570425344;
    v4 = v6 == 1543503872;
  }
  while (v8);
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (void)_validateToken
{
  unint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  REScriptToken *v12;
  uint64_t v13;
  REScriptToken *v14;
  void *v15;
  void *v16;
  REScriptToken *currentToken;
  void *v18;
  void *v19;
  const __CFString *v20;
  REScriptToken *v21;
  const __CFString *v22;
  REScriptToken *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[REScriptToken type](self->_currentToken, "type");
  if (v3 == 1)
  {
    -[REScriptToken value](self->_currentToken, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = 0;
      v9 = CFSTR("Invalid operator \"%@\");
      v10 = 202;
      while (1)
      {
        v11 = objc_msgSend(v7, "characterAtIndex:", v8);
        if (RELoadOperatorCharacterMap_onceToken != -1)
          dispatch_once(&RELoadOperatorCharacterMap_onceToken, &__block_literal_global_13);
        if ((objc_msgSend((id)REOperatorCharacterSet, "characterIsMember:", v11) & 1) == 0)
          break;
        if (++v8 >= (unint64_t)objc_msgSend(v7, "length"))
          goto LABEL_20;
      }
      v9 = CFSTR("Unrecognzied character \"%@\");
      v10 = 203;
    }
    else
    {
      v9 = CFSTR("Invalid operator \"%@\");
      v10 = 202;
    }
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    currentToken = self->_currentToken;
    v20 = CFSTR("REErrorTokenKey");
    v21 = currentToken;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeMessageAndUseInfo(v10, v16, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3 == 5)
    {
      v12 = self->_currentToken;
      v22 = CFSTR("REErrorTokenKey");
      v23 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 201;
    }
    else
    {
      if (v3 != 8)
        return;
      -[REScriptToken value](self->_currentToken, "value");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "hasPrefix:", CFSTR("/*")) & 1) != 0)
      {
        -[REScriptToken value](self->_currentToken, "value");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "hasSuffix:", CFSTR("*/"));

        if ((v6 & 1) != 0)
          return;
      }
      else
      {

      }
      v14 = self->_currentToken;
      v24 = CFSTR("REErrorTokenKey");
      v25[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 200;
    }
    RECreateErrorWithCodeAndUseInfo(v13, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v15)
  {
    -[REScriptTokenizer delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tokenizer:didEncouterTokenError:", self, v15);

  }
}

- (void)_consumeWhitespace
{
  int v3;

  if (-[REScriptTokenizer _hasChar](self, "_hasChar"))
  {
    do
    {
      v3 = -[REScriptTokenizer _peekChar](self, "_peekChar");
      if ((v3 - 9) >= 5 && v3 != 32)
        break;
      -[REScriptTokenizer _popChar](self, "_popChar");
    }
    while (-[REScriptTokenizer _hasChar](self, "_hasChar"));
  }
}

- (BOOL)_hasChar
{
  return -[REScriptBuffer isEmpty](self->_buffer, "isEmpty") ^ 1;
}

- (unsigned)_peekChar
{
  return -[REScriptBuffer current](self->_buffer, "current");
}

- (void)_popChar
{
  int v3;
  int v4;
  REScriptBuffer **p_buffer;
  REScriptBuffer *buffer;

  ++self->_column;
  v3 = -[REScriptTokenizer _peekChar](self, "_peekChar");
  v4 = v3;
  if (v3 != 10 && v3 != 13)
  {
    p_buffer = &self->_buffer;
LABEL_7:
    -[REScriptBuffer next](*p_buffer, "next");
    return;
  }
  buffer = self->_buffer;
  p_buffer = &self->_buffer;
  p_buffer[2] = (REScriptBuffer *)((char *)p_buffer[2] + 1);
  p_buffer[3] = 0;
  -[REScriptBuffer next](buffer, "next");
  if (v4 == 13 && -[REScriptBuffer current](*p_buffer, "current") == 10)
    goto LABEL_7;
}

- (BOOL)_matchTokenStart:(void *)a3 body:(void *)a4 value:(id *)a5
{
  _BOOL4 v9;
  int v10;
  unsigned int v11;
  void *v12;
  unsigned __int16 v13;

  v9 = -[REScriptTokenizer _hasChar](self, "_hasChar");
  LOBYTE(v10) = 0;
  if (a4)
  {
    if (a3)
    {
      if (v9)
      {
        v11 = -[REScriptTokenizer _peekChar](self, "_peekChar");
        v10 = ((uint64_t (*)(void))a3)();
        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDD16A8], "string");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendFormat:", CFSTR("%c"), v11);
          -[REScriptTokenizer _popChar](self, "_popChar");
          if (-[REScriptTokenizer _hasChar](self, "_hasChar"))
          {
            v13 = -[REScriptTokenizer _peekChar](self, "_peekChar");
            if (((unsigned int (*)(void))a4)())
            {
              do
              {
                objc_msgSend(v12, "appendFormat:", CFSTR("%c"), v13);
                -[REScriptTokenizer _popChar](self, "_popChar");
                if (!-[REScriptTokenizer _hasChar](self, "_hasChar"))
                  break;
                v13 = -[REScriptTokenizer _peekChar](self, "_peekChar");
              }
              while ((((uint64_t (*)(void))a4)() & 1) != 0);
            }
          }
          if (a5)
            *a5 = (id)objc_msgSend(v12, "copy");

          LOBYTE(v10) = 1;
        }
      }
    }
  }
  return v10;
}

- (REScriptTokenizerDelegate)delegate
{
  return (REScriptTokenizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
