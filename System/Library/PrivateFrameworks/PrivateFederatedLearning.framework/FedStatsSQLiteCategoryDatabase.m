@implementation FedStatsSQLiteCategoryDatabase

- (FedStatsSQLiteCategoryDatabase)initWithSQLiteDatabase:(id)a3 dimensionality:(unint64_t)a4
{
  id v7;
  FedStatsSQLiteCategoryDatabase *v8;
  FedStatsSQLiteCategoryDatabase *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FedStatsSQLiteCategoryDatabase;
  v8 = -[FedStatsSQLiteCategoryDatabase init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sqliteDB, a3);
    v9->_dimensionality = a4;
  }

  return v9;
}

+ (id)databaseWithFileURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id *v45;
  id v46;
  objc_class *v48;
  id v49;
  id *v50;
  void *v51;
  id obj;
  id obja;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _BYTE v69[128];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[8];

  v76[6] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, CFSTR("SQLite categories database requires a path in URL"));
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    goto LABEL_67;
  }
  v68 = 0;
  +[FedStatsSQLiteDatabase databaseWithURL:mode:error:](FedStatsSQLiteDatabase, "databaseWithURL:mode:error:", v6, 114, &v68);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v68;
  v9 = v8;
  if (!v7)
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v8, CFSTR("Cannot open database"));
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    goto LABEL_66;
  }
  v48 = (objc_class *)a1;
  v49 = v6;
  v50 = a4;
  v51 = v8;
  v57 = v7;
  v75[0] = CFSTR("SELECT COUNT(*) AS count FROM sqlite_master WHERE type == 'table' AND name == 'categories'");
  v75[1] = &unk_24D0E0B58;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v10;
  v74[0] = CFSTR("SELECT COUNT(*) AS count FROM PRAGMA_TABLE_XINFO('categories')");
  v74[1] = &unk_24D0E0B70;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v11;
  v73[0] = CFSTR("SELECT COUNT(*) AS count FROM sqlite_master, PRAGMA_INDEX_LIST(sqlite_master.name) AS index_list, PRAGMA_INDEX_XINFO(index_list.name) AS index_info WHERE sqlite_master.type == 'table' AND index_list.origin == 'pk' AND index_info.cid < 0");
  v73[1] = &unk_24D0E0B88;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v12;
  v72[0] = CFSTR("SELECT COUNT(*) AS count FROM PRAGMA_INDEX_LIST('categories') AS indices, PRAGMA_TABLE_XINFO('categories') AS table_info, PRAGMA_INDEX_XINFO(indices.name) AS index_info WHERE indices.origin != 'pk' AND indices.[unique] == 1 AND index_info.key == 1 AND index_info.name == table_info.name AND index_info.name == 'idx' AND table_info.type == 'INTEGER'");
  v72[1] = &unk_24D0E0B58;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76[3] = v13;
  v71[0] = CFSTR("SELECT COUNT(*) AS count FROM PRAGMA_INDEX_LIST('categories') AS indices, PRAGMA_TABLE_XINFO('categories') AS table_info, PRAGMA_INDEX_XINFO(indices.name) AS index_info WHERE indices.origin != 'pk' AND indices.[unique] == 1 AND index_info.key == 1 AND index_info.name == table_info.name AND index_info.name == 'category' AND table_info.type == 'TEXT'");
  v71[1] = &unk_24D0E0B58;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v76[4] = v14;
  v70[0] = CFSTR("SELECT COUNT(*) AS count FROM PRAGMA_INDEX_LIST('categories') AS indices, PRAGMA_INDEX_XINFO(indices.name) AS index_info WHERE indices.origin == 'pk' AND index_info.key == 1;");
  v70[1] = &unk_24D0E0B70;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v76[5] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v17 = v16;
  v54 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  v18 = 0;
  v19 = 0;
  v20 = 0;
  if (!v54)
  {
    v60 = 0;
    goto LABEL_22;
  }
  v21 = 0;
  v22 = 0;
  v55 = *(_QWORD *)v65;
  obj = v17;
  while (2)
  {
    v23 = 0;
    v24 = v18;
    v25 = v19;
    v58 = v20;
    v26 = v21;
    v27 = v51;
    do
    {
      if (*(_QWORD *)v65 != v55)
        objc_enumerationMutation(obj);
      v28 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v23);
      objc_msgSend(v28, "objectAtIndex:", 0);
      v29 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "objectAtIndex:", 1);
      v30 = objc_claimAutoreleasedReturnValue();

      v63 = v27;
      v60 = (void *)v29;
      objc_msgSend(v57, "runQuery:error:", v29, &v63);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v63;

      if (!v21)
      {
        v45 = v50;
        v44 = v58;
        if (!v50)
        {
LABEL_52:
          v18 = (void *)v30;

          v33 = 0;
          v19 = v25;
          v20 = v44;
          v17 = obj;
          v6 = v49;
          goto LABEL_64;
        }
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v9, CFSTR("Cannot query database"));
        v46 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
        *v45 = v46;
        goto LABEL_52;
      }
      objc_msgSend(v21, "next");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v45 = v50;
        if (!v50)
        {
          v44 = 0;
          goto LABEL_52;
        }
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v9, CFSTR("Cannot check query result"));
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        goto LABEL_42;
      }
      objc_msgSend(v20, "objectForKey:", CFSTR("count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19
        || (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_msgSend(v19, "isEqualToNumber:", v30) & 1) == 0)
      {
        if (v50)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot complete check statement for %@"), v60);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v43);
          *v50 = (id)objc_claimAutoreleasedReturnValue();

        }
        v25 = v19;
        v44 = v20;
        goto LABEL_52;
      }
      ++v23;
      v32 = v9;
      v24 = (void *)v30;
      v25 = v19;
      v58 = v20;
      v26 = v21;
      v22 = v60;
      v27 = v32;
    }
    while (v54 != v23);
    v51 = v32;
    v17 = obj;
    v22 = v60;
    v18 = v31;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v54)
      continue;
    break;
  }

LABEL_22:
  v62 = v51;
  v7 = v57;
  objc_msgSend(v57, "runQuery:error:", CFSTR("SELECT COUNT(*) AS count FROM categories"), &v62);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v62;

  v6 = v49;
  v59 = (void *)v34;
  if (v34)
  {
    v61 = v35;
    objc_msgSend(v57, "runQuery:error:", CFSTR("SELECT MAX(idx) AS maxIndex FROM categories"), &v61);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v61;

    v37 = v36;
    v38 = v18;
    if (v36)
    {
      objc_msgSend(v59, "next");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        v56 = v36;
        objc_msgSend(v36, "next");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        obja = v17;
        if (v40)
        {
          objc_msgSend(v39, "objectForKey:", CFSTR("count"));
          v41 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "objectForKey:", CFSTR("maxIndex"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && v42
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && (objc_msgSend(v42, "isEqualToNumber:", v41) & 1) != 0)
          {
            v33 = (void *)objc_msgSend([v48 alloc], "initWithSQLiteDatabase:dimensionality:", v57, objc_msgSend(v42, "unsignedLongValue"));
          }
          else if (v50)
          {
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, CFSTR("Cannot check if max index is equal to the number of entries"));
            v33 = 0;
            *v50 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v33 = 0;
          }

        }
        else
        {
          if (v50)
          {
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, CFSTR("No results for max index (how?)"));
            v33 = 0;
            *v50 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v33 = 0;
          }
          v41 = (uint64_t)v19;
        }

        v19 = (void *)v41;
        v17 = obja;
        v37 = v56;
      }
      else if (v50)
      {
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, CFSTR("No results for row count (how?)"));
        v39 = 0;
        v33 = 0;
        *v50 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
        v33 = 0;
      }
    }
    else
    {
      if (v50)
      {
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v9, CFSTR("Cannot find max index"));
        v33 = 0;
        *v50 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
      v39 = v20;
    }

    v20 = v39;
    v18 = v38;
LABEL_64:
    v7 = v57;
  }
  else
  {
    if (v50)
    {
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v35, CFSTR("Cannot count rows"));
      v33 = 0;
      *v50 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    v9 = v35;
  }

LABEL_66:
LABEL_67:

  return v33;
}

- (id)encode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT idx FROM categories WHERE category == '%@'"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsSQLiteCategoryDatabase sqliteDB](self, "sqliteDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v8, "runQuery:error:", v7, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;

    if (v9)
    {
      objc_msgSend(v9, "next");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = &unk_24D0E0B88;
      if (v11)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("idx"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if ((int)objc_msgSend(v14, "intValue") >= 0)
            v15 = v14;
          else
            v15 = &unk_24D0E0B88;
          v13 = v15;
        }
        else if (a4)
        {
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("Database columns are malformed"));
          v13 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }

      }
    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v10, CFSTR("Failed to lookup category in the database"));
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Input category should be a string"));
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)decode:(unint64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v13;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT category FROM categories WHERE idx == %lu"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsSQLiteCategoryDatabase sqliteDB](self, "sqliteDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "runQuery:error:", v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "next");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("category"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v11 = v10;
      else
        v11 = 0;

    }
    else
    {
      v11 = CFSTR("FedStatsCategoricalDataOutOfBounds");
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)categoryDatabaseAt:(id)a3 withCategories:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v34 != v12)
              objc_enumerationMutation(v9);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a5)
              {
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_35;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v11)
            continue;
          break;
        }
      }

      v32 = 0;
      +[FedStatsSQLiteDatabase databaseWithURL:mode:error:](FedStatsSQLiteDatabase, "databaseWithURL:mode:error:", v7, 119, &v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v32;
      v16 = v15;
      if (v14)
      {
        v31 = v15;
        v17 = objc_msgSend(v14, "execute:error:", CFSTR("CREATE TABLE categories (idx INTEGER UNIQUE, category TEXT UNIQUE, PRIMARY KEY(idx,category)) WITHOUT ROWID,STRICT"), &v31);
        v18 = v31;

        if (v17)
        {
          v29 = v14;
          v19 = 0;
          v20 = 1;
          do
          {
            if (v20 - 1 >= (unint64_t)objc_msgSend(v9, "count"))
            {

              +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:error:](FedStatsSQLiteCategoryDatabase, "databaseWithFileURL:error:", v7, a5);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_36;
            }
            v21 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v9, "objectAtIndex:", v20 - 1);
            v22 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("INSERT INTO categories VALUES (%lu, '%@')"), v20, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v30 = v18;
            LOBYTE(v22) = objc_msgSend(v29, "execute:error:", v23, &v30);
            v24 = v30;

            ++v20;
            v18 = v24;
            v19 = v23;
          }
          while ((v22 & 1) != 0);
          if (a5)
          {
            +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v24, CFSTR("Cannot insert elements into the table"));
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_35;
        }
        if (!a5)
          goto LABEL_34;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!a5)
        {
          v18 = v15;
          goto LABEL_34;
        }
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v15, CFSTR("Cannot create new database"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v16;
      }
      *a5 = v27;
LABEL_34:

      goto LABEL_35;
    }
    if (a5)
    {
      goto LABEL_23;
    }
LABEL_35:
    v26 = 0;
    goto LABEL_36;
  }
  if (!a5)
    goto LABEL_35;
LABEL_23:
  +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v25);
  v26 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v26;
}

- (FedStatsSQLiteDatabase)sqliteDB
{
  return (FedStatsSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)dimensionality
{
  return self->_dimensionality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqliteDB, 0);
}

@end
