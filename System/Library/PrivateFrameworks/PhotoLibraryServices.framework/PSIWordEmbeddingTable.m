@implementation PSIWordEmbeddingTable

- (PSIWordEmbeddingTable)initWithDelegate:(id)a3 searchable:(BOOL)a4 writable:(BOOL)a5 locale:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  PSIWordEmbeddingTable *v12;
  __CFLocale *v13;
  uint64_t v14;
  void *v15;
  uint8_t v17[16];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v7 = a5;
  v8 = a4;
  v25[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PSIWordEmbeddingTable;
  v12 = -[PSITable initWithDelegate:searchable:writable:](&v23, sel_initWithDelegate_searchable_writable_, v10, v8, v7);
  if (v12)
  {
    if (v7)
    {
      objc_msgSend(v10, "executeStatementFromString:", CFSTR("CREATE TABLE IF NOT EXISTS word_embedding(word TEXT, extended_word TEXT, score DOUBLE)"));
      objc_msgSend(v10, "executeStatementFromString:", CFSTR("CREATE INDEX IF NOT EXISTS word_embedding_index ON word_embedding(word)"));
      objc_msgSend(v10, "executeStatementFromString:", CFSTR("CREATE VIRTUAL TABLE IF NOT EXISTS word_embedding_prefix USING fts5(extended_word)"));
      -[PSIWordEmbeddingTable cacheWritableStatements](v12, "cacheWritableStatements");
    }
    if (v8)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __69__PSIWordEmbeddingTable_initWithDelegate_searchable_writable_locale___block_invoke;
      v18[3] = &unk_1E3674DD0;
      v18[4] = &v19;
      objc_msgSend(v10, "executeStatementFromString:withResultEnumerationBlock:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND name='word_embedding'"), v18);
      if (*((_BYTE *)v20 + 24))
      {
        -[PSIWordEmbeddingTable cacheSearchableStatements](v12, "cacheSearchableStatements");
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Word Embedding table doesn't exist, probably racing with assetsd", v17, 2u);
      }
      _Block_object_dispose(&v19, 8);
    }
    v13 = (__CFLocale *)CFRetain(v11);
    v12->_locale = v13;
    v14 = *MEMORY[0x1E0D17460];
    v24[0] = *MEMORY[0x1E0D17470];
    v24[1] = v14;
    v25[0] = *MEMORY[0x1E0D17478];
    v25[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_embeddingRef = (void *)NLStringEmbeddingCreateWithOptions();

  }
  return v12;
}

- (void)finalizze
{
  PSIStatement *insertStatement;
  PSIStatement *v4;
  PSIStatement *insertPrefixStatement;
  PSIStatement *v6;
  PSIStatement *deleteStatement;
  PSIStatement *v8;
  PSIStatement *deletePrefixStatement;
  PSIStatement *v10;
  PSIStatement *checkStatement;
  PSIStatement *v12;
  PSIStatement *selectMatchesStatement;
  PSIStatement *v14;
  PSIStatement *selectStatement;
  PSIStatement *v16;
  __CFLocale *locale;
  void *embeddingRef;
  objc_super v19;

  insertStatement = self->_insertStatement;
  if (insertStatement)
  {
    -[PSIStatement finalizze](insertStatement, "finalizze");
    v4 = self->_insertStatement;
    self->_insertStatement = 0;

  }
  insertPrefixStatement = self->_insertPrefixStatement;
  if (insertPrefixStatement)
  {
    -[PSIStatement finalizze](insertPrefixStatement, "finalizze");
    v6 = self->_insertPrefixStatement;
    self->_insertPrefixStatement = 0;

  }
  deleteStatement = self->_deleteStatement;
  if (deleteStatement)
  {
    -[PSIStatement finalizze](deleteStatement, "finalizze");
    v8 = self->_deleteStatement;
    self->_deleteStatement = 0;

  }
  deletePrefixStatement = self->_deletePrefixStatement;
  if (deletePrefixStatement)
  {
    -[PSIStatement finalizze](deletePrefixStatement, "finalizze");
    v10 = self->_deletePrefixStatement;
    self->_deletePrefixStatement = 0;

  }
  checkStatement = self->_checkStatement;
  if (checkStatement)
  {
    -[PSIStatement finalizze](checkStatement, "finalizze");
    v12 = self->_checkStatement;
    self->_checkStatement = 0;

  }
  selectMatchesStatement = self->_selectMatchesStatement;
  if (selectMatchesStatement)
  {
    -[PSIStatement finalizze](selectMatchesStatement, "finalizze");
    v14 = self->_selectMatchesStatement;
    self->_selectMatchesStatement = 0;

  }
  selectStatement = self->_selectStatement;
  if (selectStatement)
  {
    -[PSIStatement finalizze](selectStatement, "finalizze");
    v16 = self->_selectStatement;
    self->_selectStatement = 0;

  }
  locale = self->_locale;
  if (locale)
  {
    CFRelease(locale);
    self->_locale = 0;
  }
  embeddingRef = self->_embeddingRef;
  if (embeddingRef)
  {
    CFRelease(embeddingRef);
    self->_embeddingRef = 0;
  }
  v19.receiver = self;
  v19.super_class = (Class)PSIWordEmbeddingTable;
  -[PSITable finalizze](&v19, sel_finalizze);
}

- (void)clear
{
  id v2;

  -[PSITable delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeStatementFromString:", CFSTR("DROP TABLE IF EXISTS word_embedding_prefix"));
  objc_msgSend(v2, "executeStatementFromString:", CFSTR("DROP TABLE IF EXISTS word_embedding"));

}

- (void)cacheWritableStatements
{
  PSIStatement *v3;
  PSIStatement *insertStatement;
  PSIStatement *v5;
  PSIStatement *insertPrefixStatement;
  PSIStatement *v7;
  PSIStatement *deleteStatement;
  PSIStatement *v9;
  PSIStatement *deletePrefixStatement;
  PSIStatement *v11;
  PSIStatement *checkStatement;
  id v13;

  -[PSITable delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "statementFromString:", CFSTR("INSERT INTO word_embedding(word, extended_word, score) VALUES(?, ?, ?)"));
  v3 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  insertStatement = self->_insertStatement;
  self->_insertStatement = v3;

  objc_msgSend(v13, "statementFromString:", CFSTR("INSERT INTO word_embedding_prefix(rowid, extended_word) VALUES(?, ?)"));
  v5 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  insertPrefixStatement = self->_insertPrefixStatement;
  self->_insertPrefixStatement = v5;

  objc_msgSend(v13, "statementFromString:", CFSTR("DELETE FROM word_embedding WHERE word = ?"));
  v7 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  deleteStatement = self->_deleteStatement;
  self->_deleteStatement = v7;

  objc_msgSend(v13, "statementFromString:", CFSTR("DELETE FROM word_embedding_prefix WHERE rowid IN (SELECT rowid FROM word_embedding WHERE word = ?)"));
  v9 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  deletePrefixStatement = self->_deletePrefixStatement;
  self->_deletePrefixStatement = v9;

  objc_msgSend(v13, "statementFromString:", CFSTR("SELECT rowid FROM word_embedding WHERE word = ?"));
  v11 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  checkStatement = self->_checkStatement;
  self->_checkStatement = v11;

}

- (void)cacheSearchableStatements
{
  PSIStatement *v3;
  PSIStatement *selectMatchesStatement;
  PSIStatement *v5;
  PSIStatement *selectStatement;
  id v7;

  -[PSITable delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statementFromString:", CFSTR("SELECT word, extended_word, score FROM word_embedding WHERE rowid IN (SELECT rowid FROM word_embedding_prefix WHERE extended_word MATCH ?)"));
  v3 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  selectMatchesStatement = self->_selectMatchesStatement;
  self->_selectMatchesStatement = v3;

  objc_msgSend(v7, "statementFromString:", CFSTR("SELECT word, score FROM word_embedding WHERE rowid IN (SELECT rowid FROM word_embedding_prefix WHERE extended_word MATCH ?)"));
  v5 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  selectStatement = self->_selectStatement;
  self->_selectStatement = v5;

}

- (id)dumpWordEmbeddingTable
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSITable delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__PSIWordEmbeddingTable_dumpWordEmbeddingTable__block_invoke;
  v13[3] = &unk_1E3675060;
  v6 = v3;
  v14 = v6;
  objc_msgSend(v4, "executeStatementFromString:withResultEnumerationBlock:", CFSTR("SELECT rowid, word, extended_word, score from word_embedding"), v13);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __47__PSIWordEmbeddingTable_dumpWordEmbeddingTable__block_invoke_2;
  v11[3] = &unk_1E3675060;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v4, "executeStatementFromString:withResultEnumerationBlock:", CFSTR("SELECT rowid, extended_word from word_embedding_prefix"), v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)matchesForToken:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PSIStatement *selectMatchesStatement;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIStatement bindText:atIndex:](self->_selectMatchesStatement, "bindText:atIndex:", v5, 1);

  -[PSITable delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  selectMatchesStatement = self->_selectMatchesStatement;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__PSIWordEmbeddingTable_matchesForToken___block_invoke;
  v11[3] = &unk_1E3675060;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "executeStatement:withResultEnumerationBlock:", selectMatchesStatement, v11);

  return v9;
}

- (id)wordEmbeddingsForToken:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PSIStatement *selectStatement;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIStatement bindText:atIndex:](self->_selectStatement, "bindText:atIndex:", v5, 1);

  -[PSITable delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  selectStatement = self->_selectStatement;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__PSIWordEmbeddingTable_wordEmbeddingsForToken___block_invoke;
  v11[3] = &unk_1E3675060;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "executeStatement:withResultEnumerationBlock:", selectStatement, v11);

  return v9;
}

- (BOOL)isInsertedWithWord:(id)a3
{
  id v4;
  void *v5;
  PSIStatement *checkStatement;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[PSIStatement bindText:atIndex:](self->_checkStatement, "bindText:atIndex:", v4, 1);
  -[PSITable delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  checkStatement = self->_checkStatement;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PSIWordEmbeddingTable_isInsertedWithWord___block_invoke;
  v8[3] = &unk_1E3674DD0;
  v8[4] = &v9;
  objc_msgSend(v5, "executeStatement:withResultEnumerationBlock:", checkStatement, v8);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (void)insertWord:(id)a3 synonyms:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  float v16;
  void *v17;
  id v18;
  char v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PSITable delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PSIWordEmbeddingTable isInsertedWithWord:](self, "isInsertedWithWord:", v6))
  {
    objc_msgSend(v6, "lowercaseString");
    v9 = (const void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)NLStringEmbeddingCopyNeighbors();
    if (objc_msgSend(v10, "count"))
    {
      v18 = v6;
      -[PSIStatement bindText:atIndex:](self->_insertStatement, "bindText:atIndex:", v6, 1);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v17 = v10;
      obj = v10;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v19 = 0;
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            if ((objc_msgSend(v7, "containsObject:", v15) & 1) == 0)
            {
              -[PSIStatement bindText:atIndex:](self->_insertStatement, "bindText:atIndex:", v15, 2);
              NLStringEmbeddingGetDistance();
              -[PSIStatement bindDouble:atIndex:](self->_insertStatement, "bindDouble:atIndex:", 3, v16 * -0.5 + 1.0);
              objc_msgSend(v8, "executeStatement:", self->_insertStatement);
              v19 = 1;
              -[PSIStatement bindInt64:atIndex:](self->_insertPrefixStatement, "bindInt64:atIndex:", objc_msgSend(v8, "lastInsertedRowID"), 1);
              -[PSIStatement bindText:atIndex:](self->_insertPrefixStatement, "bindText:atIndex:", v15, 2);
              objc_msgSend(v8, "executeStatement:", self->_insertPrefixStatement);
            }
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v12);
      }
      else
      {
        v19 = 0;
      }

      CFRelease(v9);
      v10 = v17;
      v6 = v18;
      if ((v19 & 1) != 0)
        goto LABEL_17;
    }
    else
    {
      CFRelease(v9);
    }
    -[PSIStatement bindText:atIndex:](self->_insertStatement, "bindText:atIndex:", v6, 1);
    -[PSIStatement bindText:atIndex:](self->_insertStatement, "bindText:atIndex:", CFSTR("__STUB__"), 2);
    -[PSIStatement bindDouble:atIndex:](self->_insertStatement, "bindDouble:atIndex:", 3, 0.0);
    objc_msgSend(v8, "executeStatement:", self->_insertStatement);
LABEL_17:

  }
}

- (void)removeWord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSITable delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PSIStatement bindText:atIndex:](self->_deletePrefixStatement, "bindText:atIndex:", v4, 1);
  objc_msgSend(v5, "executeStatement:", self->_deletePrefixStatement);
  -[PSIStatement bindText:atIndex:](self->_deleteStatement, "bindText:atIndex:", v4, 1);

  objc_msgSend(v5, "executeStatement:", self->_deleteStatement);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectStatement, 0);
  objc_storeStrong((id *)&self->_selectMatchesStatement, 0);
  objc_storeStrong((id *)&self->_checkStatement, 0);
  objc_storeStrong((id *)&self->_deletePrefixStatement, 0);
  objc_storeStrong((id *)&self->_deleteStatement, 0);
  objc_storeStrong((id *)&self->_insertPrefixStatement, 0);
  objc_storeStrong((id *)&self->_insertStatement, 0);
}

uint64_t __44__PSIWordEmbeddingTable_isInsertedWithWord___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "int64AtColumn:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result != 0;
  *a3 = 1;
  return result;
}

void __48__PSIWordEmbeddingTable_wordEmbeddingsForToken___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "textAtColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v10, "doubleAtColumn:", 1);
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6 || (objc_msgSend(v6, "doubleValue"), v5 > v8))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v3);

    }
  }

}

void __41__PSIWordEmbeddingTable_matchesForToken___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  PSIWordEmbeddingMatch *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "textAtColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textAtColumn:", 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(v8, "doubleAtColumn:", 2);
    v7 = -[PSIWordEmbeddingMatch initWithWord:extendedWord:score:]([PSIWordEmbeddingMatch alloc], "initWithWord:extendedWord:score:", v3, v5, v6);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
}

void __47__PSIWordEmbeddingTable_dumpWordEmbeddingTable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64AtColumn:", 0);
  objc_msgSend(v3, "textAtColumn:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textAtColumn:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleAtColumn:", 3);
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu: %@ <- %@ (%f)"), v4, v9, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __47__PSIWordEmbeddingTable_dumpWordEmbeddingTable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64AtColumn:", 0);
  objc_msgSend(v3, "textAtColumn:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld: %@"), v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

uint64_t __69__PSIWordEmbeddingTable_initWithDelegate_searchable_writable_locale___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

@end
