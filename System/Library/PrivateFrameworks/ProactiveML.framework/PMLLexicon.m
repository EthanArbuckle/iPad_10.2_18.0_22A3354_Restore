@implementation PMLLexicon

- (PMLLexicon)init
{
  PMLLexicon *v2;
  uint64_t v3;
  _PASCFBurstTrie *lexicon;
  PMLLexicon *v5;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PMLLexicon;
  v2 = -[PMLLexicon init](&v9, sel_init);
  if (v2
    && (v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A5B8]), "initWithPath:", &stru_24D3DC000),
        lexicon = v2->_lexicon,
        v2->_lexicon = (_PASCFBurstTrie *)v3,
        lexicon,
        !v2->_lexicon))
  {
    PML_LogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_2159BB000, v6, OS_LOG_TYPE_ERROR, "Returning nil for PMLLexicon since unable to initialize lexicon", v8, 2u);
    }

    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (PMLLexicon)initWithPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PMLLexicon *v10;
  uint64_t v11;
  _PASCFBurstTrie *lexicon;
  PMLLexicon *v13;
  NSObject *v14;
  PMLLexicon *v15;
  NSObject *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLLexicon.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "fileExistsAtPath:", v5) & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileSize");

  if (!v9)
  {
LABEL_9:
    PML_LogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_2159BB000, v14, OS_LOG_TYPE_DEFAULT, "Falling back to default system lexicon since lexicon at following path is invalid in existence: %@", buf, 0xCu);
    }

    v13 = -[PMLLexicon init](self, "init");
    goto LABEL_12;
  }
  v19.receiver = self;
  v19.super_class = (Class)PMLLexicon;
  v10 = -[PMLLexicon init](&v19, sel_init);
  if (!v10
    || (v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A5B8]), "initWithPath:", v5),
        lexicon = v10->_lexicon,
        v10->_lexicon = (_PASCFBurstTrie *)v11,
        lexicon,
        v10->_lexicon))
  {
    v13 = v10;
LABEL_12:
    v10 = v13;
    v15 = v13;
    goto LABEL_13;
  }
  PML_LogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2159BB000, v17, OS_LOG_TYPE_ERROR, "Returning nil for PMLLexicon since unable to initialize lexicon", buf, 2u);
  }

  v15 = 0;
LABEL_13:

  return v15;
}

- (unint64_t)getWordIDforToken:(id)a3
{
  id v4;
  unsigned int v5;
  unint64_t v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[_PASCFBurstTrie payloadForString:](self->_lexicon, "payloadForString:", v4);
  if (v5 == -1)
  {
    PML_LogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_debug_impl(&dword_2159BB000, v7, OS_LOG_TYPE_DEBUG, "Returning 0 for word id since token is not in lexicon: %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (unint64_t)getTotalEntries
{
  _PASCFBurstTrie *lexicon;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lexicon = self->_lexicon;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__PMLLexicon_getTotalEntries__block_invoke;
  v5[3] = &unk_24D3DBDF0;
  v5[4] = &v6;
  -[_PASCFBurstTrie runBlockWithTrie:](lexicon, "runBlockWithTrie:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lexicon, 0);
}

uint64_t __29__PMLLexicon_getTotalEntries__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CFBurstTrieGetCount();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)serializeLexiconToFile:(id)a3 tokenToWordIDDict:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = CFBurstTrieCreate();
  v16[3] = v7;
  if (v7)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__PMLLexicon_serializeLexiconToFile_tokenToWordIDDict___block_invoke;
    v10[3] = &unk_24D3DBE18;
    v10[4] = &v11;
    v10[5] = &v15;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
    if (*((_BYTE *)v12 + 24))
    {
      CFBurstTrieRelease();
      v8 = 0;
    }
    else
    {
      v8 = CFBurstTrieSerialize() != 0;
      if (v16[3])
        CFBurstTrieRelease();
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __55__PMLLexicon_serializeLexiconToFile_tokenToWordIDDict___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if ((int)objc_msgSend(v7, "intValue") <= 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v8, "length");
    objc_msgSend(v7, "unsignedIntegerValue");
    CFBurstTrieAdd();
  }

}

@end
