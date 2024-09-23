@implementation PQLFormatInjection

+ (id)formatInjection:(id)a3
{
  id v3;
  PQLFormatInjection *v4;
  uint64_t v6;

  v3 = a3;
  v4 = -[PQLFormatInjection initWithFormat:arguments:]([PQLFormatInjection alloc], "initWithFormat:arguments:", v3, &v6);

  return v4;
}

- (PQLFormatInjection)initWithFormat:(id)a3 arguments:(char *)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  size_t v9;
  const char *v10;
  id v11;
  int v12;
  const char *v13;
  id *v14;
  void *v15;
  int v16;
  unsigned int *v17;
  uint64_t v18;
  double *v19;
  int v20;
  char *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  id v25;
  char *v26;
  uint64_t v27;
  unsigned int *v28;
  void *v29;
  size_t v30;
  char *v31;
  uint64_t v32;
  id v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  id v38;
  char *v39;
  uint64_t v40;
  unsigned int *v41;
  id v42;
  char *v43;
  unsigned int *v44;
  id v45;
  char *v46;
  char *v47;
  void *v48;
  PQLFormatInjection *v49;
  PQLFormatInjection *v50;
  uint64_t v52;
  id v54;
  void *v55;
  char *v56;
  char *v57;
  char *v58;

  v5 = a3;
  v56 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v54 = objc_retainAutorelease(v5);
  v7 = (const char *)objc_msgSend(v54, "UTF8String");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", strlen(v7) + 1);
  v9 = strcspn(v7, "%");
  objc_msgSend(v8, "appendBytes:length:", v7, v9);
  v10 = &v7[v9];
  if (*v10)
  {
    v11 = 0;
    v55 = 0;
    v52 = *MEMORY[0x1E0C99778];
    while (1)
    {
      v13 = v10 + 1;
      v12 = *((unsigned __int8 *)v10 + 1);
      if (v12 == 64)
        break;
      if (v12 == 37)
      {
        v13 = v10 + 2;
        objc_msgSend(v8, "appendBytes:length:", "%", 1);
      }
      else
      {
        v16 = (char)v12;
        objc_msgSend(v8, "appendBytes:length:", "?", 1);
        if (v16 <= 96)
        {
          if (v16 > 64)
          {
            if ((v16 - 69) >= 3 && v16 != 65)
              goto LABEL_56;
LABEL_19:
            v19 = (double *)v56;
            v56 += 8;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v19);
            v18 = objc_claimAutoreleasedReturnValue();
LABEL_31:
            v29 = (void *)v18;
            objc_msgSend(v6, "addObject:", v18);

            goto LABEL_32;
          }
          if (v16 == 42)
          {
            if (!memchr("sp", v10[2], 3uLL))
              goto LABEL_56;
            v31 = v56;
            v57 = v56 + 8;
            v32 = *(int *)v31;
            if (v10[2] == 115)
            {
              v33 = objc_alloc(MEMORY[0x1E0CB3940]);
              v34 = v57;
              v56 = v57 + 8;
              v35 = objc_msgSend(v33, "initWithBytes:length:encoding:", *(_QWORD *)v34, v32, 4);
            }
            else
            {
              v42 = objc_alloc(MEMORY[0x1E0C99D50]);
              v43 = v57;
              v56 = v57 + 8;
              v35 = objc_msgSend(v42, "initWithBytes:length:", *(_QWORD *)v43, v32);
            }
            v27 = v35;

            objc_msgSend(v6, "addObject:", v27);
            v13 = v10 + 3;
LABEL_53:
            v55 = (void *)v27;
            goto LABEL_33;
          }
          if (v16 == 46)
          {
            if (v10[2] != 42 || !memchr("sp", v10[3], 3uLL))
              goto LABEL_56;
            v36 = v56;
            v58 = v56 + 8;
            v37 = *(int *)v36;
            if (v10[3] == 115)
            {
              v38 = objc_alloc(MEMORY[0x1E0CB3940]);
              v39 = v58;
              v56 = v58 + 8;
              v40 = objc_msgSend(v38, "initWithBytes:length:encoding:", *(_QWORD *)v39, v37, 4);
            }
            else
            {
              v45 = objc_alloc(MEMORY[0x1E0C99D50]);
              v46 = v58;
              v56 = v58 + 8;
              v40 = objc_msgSend(v45, "initWithBytes:length:", *(_QWORD *)v46, v37);
            }
            v27 = v40;

            objc_msgSend(v6, "addObject:", v27);
            v13 = v10 + 4;
            goto LABEL_53;
          }
          if (v16 != 64)
            goto LABEL_56;
LABEL_12:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = objc_msgSend(v11, "copy");
            goto LABEL_31;
          }
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          }
          objc_msgSend(v6, "addObject:", v11);
LABEL_32:
          v13 = v10 + 2;
          goto LABEL_33;
        }
        switch(v16)
        {
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            goto LABEL_19;
          case 'd':
          case 'i':
            v17 = (unsigned int *)v56;
            v56 += 8;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v17);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          case 'l':
            v20 = v10[2];
            if (memchr("udi", v20, 4uLL))
            {
              v21 = v56;
              v56 += 8;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)v21);
              v22 = objc_claimAutoreleasedReturnValue();
LABEL_27:
              v23 = (void *)v22;
              objc_msgSend(v6, "addObject:", v22);

              v13 = v10 + 3;
              break;
            }
            if (v20 <= 107)
            {
              if (v20 == 100 || v20 == 105)
              {
                v41 = (unsigned int *)v56;
                v56 += 8;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v41);
                v22 = objc_claimAutoreleasedReturnValue();
                goto LABEL_27;
              }
              goto LABEL_56;
            }
            if (v20 != 108)
            {
              if (v20 == 117)
              {
                v44 = (unsigned int *)v56;
                v56 += 8;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v44);
                v22 = objc_claimAutoreleasedReturnValue();
                goto LABEL_27;
              }
LABEL_56:
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v52, CFSTR("cannot compile statement [%@] around [...%.10s...]"), v8, v10);
              break;
            }
            if (!memchr("udi", v10[3], 4uLL))
              goto LABEL_56;
            v47 = v56;
            v56 += 8;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v48);

            v13 = v10 + 4;
            break;
          case 'p':
            v24 = v56;
            v56 += 8;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)v24);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          case 's':
            v25 = objc_alloc(MEMORY[0x1E0CB3940]);
            v26 = v56;
            v56 += 8;
            v27 = objc_msgSend(v25, "initWithUTF8String:", *(_QWORD *)v26);

            objc_msgSend(v6, "addObject:", v27);
            v13 = v10 + 2;
            goto LABEL_53;
          case 'u':
            v28 = (unsigned int *)v56;
            v56 += 8;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v28);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          default:
            goto LABEL_56;
        }
      }
LABEL_33:
      v30 = strcspn(v13, "%");
      objc_msgSend(v8, "appendBytes:length:", v13, v30);
      v10 = &v13[v30];
      if (!v13[v30])
        goto LABEL_58;
    }
    v14 = (id *)v56;
    v56 += 8;
    v11 = *v14;
    if ((objc_msgSend(*v14, "conformsToProtocol:", &unk_1EFEAAEB0) & 1) != 0)
    {
      objc_msgSend(v11, "sql");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendData:", v15);

    }
    else
    {
      objc_msgSend(v8, "appendBytes:length:", "?", 1);
    }
    goto LABEL_12;
  }
  v55 = 0;
LABEL_58:
  v49 = -[PQLNameInjectionBase initWithData:](self, "initWithData:", v8);
  v50 = v49;
  if (v49)
    objc_storeStrong((id *)&v49->_binds, v6);

  return v50;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  uint64_t v4;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  LODWORD(v4) = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_binds;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v16 = v4;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v4 = v4;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (v4 + 1);
          sqlite3_bind_null(a3, v4);
LABEL_10:
          v4 = v12;
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (v4 + 1);
          pql_sqlite3_bind_pointer(a3, v4, (sqlite3_int64)v11);
          goto LABEL_10;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v12 = (v4 + 1);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v11, "sqliteBind:index:", a3, v4);
          }
          else
          {
            objc_msgSend(v11, "description");
            v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            sqlite3_bind_text(a3, v4, (const char *)objc_msgSend(v13, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          }
          goto LABEL_10;
        }
        v4 = objc_msgSend(v11, "bindWithStatement:startingAtIndex:", a3, v4) + v4;
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v14;
    }
    while (v14);
  }

  return v4 - v16;
}

- (id)bindValuesToKeepAlive
{
  return self->_binds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binds, 0);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<PQLFormat %s>"), -[PQLNameInjectionBase bytes](objc_retainAutorelease(self), "bytes"));
}

@end
