@implementation _PBFSQLitePreparedCompoundStatement

- (id)initWithDatabaseConnection:(void *)a3 statements:
{
  id v5;
  id *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  if (a1)
  {
    v6 = -[PBFSQLitePreparedStatement _initWithDatabaseConnection:](a1, a2);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = v6[3];
      v6[3] = (id)v7;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_statements;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "executeWithBindings:resultRowHandler:error:", v8, v9, a5, (_QWORD)v17))
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statements, 0);
}

@end
