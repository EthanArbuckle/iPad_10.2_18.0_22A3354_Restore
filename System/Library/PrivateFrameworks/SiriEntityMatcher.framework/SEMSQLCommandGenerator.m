@implementation SEMSQLCommandGenerator

+ (id)selectFromTableWithName:(id)a3 columns:(id)a4 count:(BOOL)a5 join:(id)a6 criterion:(id)a7 order:(id)a8 limit:(id)a9 offset:(id)a10
{
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  SEMDatabaseSelect *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  id v61;
  id v62;

  v13 = a5;
  v16 = a3;
  v62 = a7;
  v61 = a8;
  v17 = a9;
  v18 = a10;
  v19 = a6;
  objc_msgSend__produceSelectClauseWithTableName_columnNames_count_(a1, v20, (uint64_t)v16, a4, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_new();
  objc_msgSend__generateJoinClause_(a1, v23, (uint64_t)v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_clause(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v21, v28, (uint64_t)v27);
    v29 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_parameters(v24, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v22, v33, (uint64_t)v32);

    v21 = (void *)v29;
  }
  objc_msgSend__produceCriterionClause_tableName_(a1, v25, (uint64_t)v62, v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v34;
  if (v34)
  {
    objc_msgSend_clause(v34, v35, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v21, v39, (uint64_t)CFSTR(" WHERE %@"), v38);
    v40 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_parameters(v37, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v22, v44, (uint64_t)v43);

    v21 = (void *)v40;
  }
  objc_msgSend__generateOrderByClause_(a1, v35, (uint64_t)v61);
  v45 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v45;
  if (v45)
  {
    objc_msgSend_stringByAppendingFormat_(v21, v46, (uint64_t)CFSTR(" ORDER BY %@"), v45);
    v48 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v48;
  }
  if (v17)
  {
    objc_msgSend_stringByAppendingFormat_(v21, v46, (uint64_t)CFSTR(" LIMIT %@"), CFSTR("?"));
    v49 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v22, v50, (uint64_t)v17);
    v21 = (void *)v49;
  }
  if (v18)
  {
    objc_msgSend_stringByAppendingFormat_(v21, v46, (uint64_t)CFSTR(" OFFSET %@"), CFSTR("?"));
    v51 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v22, v52, (uint64_t)v18);
    v21 = (void *)v51;
  }
  objc_msgSend_stringByAppendingString_(v21, v46, (uint64_t)CFSTR(";"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = [SEMDatabaseSelect alloc];
  if (objc_msgSend_count(v22, v55, v56))
    v58 = objc_msgSend_initWithCommandString_parameters_(v54, v57, (uint64_t)v53, v22);
  else
    v58 = objc_msgSend_initWithCommandString_parameters_(v54, v57, (uint64_t)v53, 0);
  v59 = (void *)v58;

  return v59;
}

+ (void)addLimit:(id)a3 offset:(id)a4 forSelect:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  id v39;

  v39 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend_commandString(v39, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_mutableCopy(v11, v12, v13);

  objc_msgSend_parameters(v39, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend_mutableCopy(v17, v18, v19);

  if (!v20)
  {
    v22 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v20 = (void *)objc_msgSend_initWithCapacity_(v22, v23, 2);
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v21, (uint64_t)CFSTR(" LIMIT %@"), CFSTR("?"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_length(v14, v25, v26);
  objc_msgSend_insertString_atIndex_(v14, v28, (uint64_t)v24, v27 - 1);
  objc_msgSend_addObject_(v20, v29, (uint64_t)v8);

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v30, (uint64_t)CFSTR(" OFFSET %@"), CFSTR("?"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_length(v14, v32, v33);
  objc_msgSend_insertString_atIndex_(v14, v35, (uint64_t)v31, v34 - 1);
  objc_msgSend_addObject_(v20, v36, (uint64_t)v7);

  objc_msgSend_replaceParameters_(v39, v37, (uint64_t)v20);
  objc_msgSend_updateCommandString_(v39, v38, (uint64_t)v14);

}

+ (void)replaceOffset:(id)a3 forSelect:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  id v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend_parameters(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend_mutableCopy(v9, v10, v11);

  v14 = objc_msgSend_count(v17, v12, v13);
  objc_msgSend_replaceObjectAtIndex_withObject_(v17, v15, v14 - 1, v6);

  objc_msgSend_updateParameters_(v5, v16, (uint64_t)v17);
}

+ (id)deleteFromTableWithName:(id)a3 criterion:(id)a4 returningColumns:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  SEMDatabaseDelete *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a4;
  v11 = a3;
  v12 = [v9 alloc];
  v14 = (void *)objc_msgSend_initWithFormat_(v12, v13, (uint64_t)CFSTR("DELETE FROM %@"), v11);
  objc_msgSend__produceCriterionClause_tableName_(a1, v15, (uint64_t)v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_clause(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v14, v20, (uint64_t)CFSTR(" WHERE %@"), v19);
    v21 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v21;
  }
  if (objc_msgSend_count(v8, v17, v18))
  {
    objc_msgSend_componentsJoinedByString_(v8, v22, (uint64_t)CFSTR(", "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v14, v24, (uint64_t)CFSTR(" RETURNING %@"), v23);
    v25 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v25;
  }
  objc_msgSend_stringByAppendingString_(v14, v22, (uint64_t)CFSTR(";"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [SEMDatabaseDelete alloc];
  objc_msgSend_parameters(v16, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend_initWithCommandString_parameters_(v27, v31, (uint64_t)v26, v30);

  return v32;
}

+ (id)updateWithTableName:(id)a3 columnNames:(id)a4 columnValues:(id)a5 criterion:(id)a6 returningColumns:(id)a7
{
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  SEMDatabaseUpdate *v62;
  const char *v63;
  void *v64;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = (objc_class *)MEMORY[0x24BDD17C8];
  v16 = a5;
  v17 = a4;
  v18 = [v15 alloc];
  v20 = (void *)objc_msgSend_initWithFormat_(v18, v19, (uint64_t)CFSTR("UPDATE %@"), v12);
  objc_msgSend__produceSetValuesClauseForColumnNames_columnValues_(a1, v21, (uint64_t)v17, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_clause(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v20, v26, (uint64_t)CFSTR(" SET %@"), v25);
    v27 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v27;
  }
  objc_msgSend__produceCriterionClause_tableName_(a1, v23, (uint64_t)v13, v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v28;
  if (v28)
  {
    objc_msgSend_clause(v28, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v20, v33, (uint64_t)CFSTR(" WHERE %@"), v32);
    v34 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v34;
  }
  if (objc_msgSend_count(v14, v29, v30))
  {
    objc_msgSend_componentsJoinedByString_(v14, v35, (uint64_t)CFSTR(", "));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v20, v37, (uint64_t)CFSTR(" RETURNING %@"), v36);
    v38 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v38;
  }
  objc_msgSend_stringByAppendingString_(v20, v35, (uint64_t)CFSTR(";"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_parameters(v22, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_count(v42, v43, v44);
  objc_msgSend_parameters(v31, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_count(v48, v49, v50) + v45;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v52, v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parameters(v22, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v53, v57, (uint64_t)v56);

  objc_msgSend_parameters(v31, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v53, v61, (uint64_t)v60);

  v62 = [SEMDatabaseUpdate alloc];
  v64 = (void *)objc_msgSend_initWithCommandString_parameters_(v62, v63, (uint64_t)v39, v53);

  return v64;
}

+ (id)insertCommandStringWithTableName:(id)a3 columnNames:(id)a4 returningColumns:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a4;
  v11 = a3;
  v12 = [v9 alloc];
  objc_msgSend_componentsJoinedByString_(v10, v13, (uint64_t)CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v10, v15, v16);

  objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_initWithFormat_(v12, v20, (uint64_t)CFSTR("INSERT INTO %@ (%@) VALUES (%@)"), v11, v14, v19);

  if (objc_msgSend_count(v8, v22, v23))
  {
    objc_msgSend_componentsJoinedByString_(v8, v24, (uint64_t)CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v21, v26, (uint64_t)CFSTR(" RETURNING %@"), v25);
    v27 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v27;
  }
  objc_msgSend_stringByAppendingString_(v21, v24, (uint64_t)CFSTR(";"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)_produceSetValuesClauseForColumnNames:(id)a3 columnValues:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  SEMSQLCommandClause *v38;
  const char *v39;
  void *v40;
  SEMSQLCommandClause *v41;
  const char *v42;

  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_count(v6, v8, v9);
  if (v10 && (v13 = v10, objc_msgSend_count(v7, v11, v12) == v10))
  {
    v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v16 = (void *)objc_msgSend_initWithCapacity_(v14, v15, v13);
    v17 = (void *)objc_opt_new();
    if (objc_msgSend_count(v6, v18, v19))
    {
      v22 = 0;
      do
      {
        v23 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend_objectAtIndex_(v6, v24, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v26, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend_initWithFormat_(v23, v28, (uint64_t)CFSTR("%@ = %@"), v25, v27);
        objc_msgSend_addObject_(v16, v30, (uint64_t)v29);

        objc_msgSend_objectAtIndex_(v7, v31, v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v17, v33, (uint64_t)v32);

        ++v22;
      }
      while (v22 < objc_msgSend_count(v6, v34, v35));
    }
    if ((unint64_t)objc_msgSend_count(v16, v20, v21) <= 1)
    {
      v41 = [SEMSQLCommandClause alloc];
      objc_msgSend_objectAtIndex_(v16, v42, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v41;
    }
    else
    {
      objc_msgSend_componentsJoinedByString_(v16, v36, (uint64_t)CFSTR(", "));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = [SEMSQLCommandClause alloc];
    }
    v40 = (void *)objc_msgSend_initWithClause_parameters_(v38, v39, (uint64_t)v37, v17);

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

+ (id)_produceSelectClauseWithTableName:(id)a3 columnNames:(id)a4 count:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v11 = v9;
  if (v5)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("SELECT COUNT(*) FROM %@"), v8);
LABEL_6:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  if (!v9)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("SELECT * FROM %@"), v8);
    goto LABEL_6;
  }
  objc_msgSend__generateCommaSeparatedValuesString_(a1, v10, (uint64_t)v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("SELECT %@ FROM %@"), v13, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v15;
}

+ (id)_generateJoinClause:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  SEMSQLCommandClause *v19;
  const char *v20;
  void *v21;

  if (a3)
  {
    v4 = a3;
    objc_msgSend_joinCriterion(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__produceJoinCriterionClause_(a1, v8, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend_table(v4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_clause(v9, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend_initWithFormat_(v10, v17, (uint64_t)CFSTR(" JOIN %@ ON (%@)"), v13, v16);

    v19 = [SEMSQLCommandClause alloc];
    v21 = (void *)objc_msgSend_initWithClause_parameters_(v19, v20, (uint64_t)v18, 0);

  }
  else
  {
    v21 = 0;
  }
  return v21;
}

+ (id)prefixColumnName:(id)a3 withTableName:(id)a4
{
  id v5;
  const char *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v7 = v5;
  if (a4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("%@.%@"), a4, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

+ (id)_produceJoinCriterionClause:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  SEMSQLCommandClause *v55;
  const char *v56;
  void *v57;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_subCriteria(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_sqlOperator(v4, v8, v9);
  if (v10 == 10)
  {
    v63 = v4;
    v32 = objc_msgSend_count(v7, v11, v12);
    v33 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v35 = (void *)objc_msgSend_initWithCapacity_(v33, v34, v32);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v62 = v7;
    v36 = v7;
    v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v64, v72, 16);
    if (v38)
    {
      v40 = v38;
      v41 = *(_QWORD *)v65;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v65 != v41)
            objc_enumerationMutation(v36);
          objc_msgSend__produceJoinCriterionClause_(a1, v39, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v42));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            v44 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend_clause(v43, v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)objc_msgSend_initWithFormat_(v44, v48, (uint64_t)CFSTR("(%@)"), v47);
            objc_msgSend_addObject_(v35, v50, (uint64_t)v49);

          }
          ++v42;
        }
        while (v40 != v42);
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v64, v72, 16);
      }
      while (v40);
    }

    if (objc_msgSend_count(v35, v51, v52))
    {
      objc_msgSend_componentsJoinedByString_(v35, v53, (uint64_t)CFSTR(" AND "));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    v4 = v63;

    v7 = v62;
  }
  else if (v10 == 1)
  {
    v13 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend_columnName(v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tableName(v4, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_prefixColumnName_withTableName_(a1, v20, (uint64_t)v16, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_comparingColumnName(v4, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_comparingTableName(v4, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_prefixColumnName_withTableName_(a1, v28, (uint64_t)v24, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend_initWithFormat_(v13, v30, (uint64_t)CFSTR("%@ = %@"), v21, v29);

  }
  else
  {
    v54 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v59 = v54;
      *(_DWORD *)buf = 136315394;
      v69 = "+[SEMSQLCommandGenerator _produceJoinCriterionClause:]";
      v70 = 2048;
      v71 = objc_msgSend_sqlOperator(v4, v60, v61);
      _os_log_error_impl(&dword_2462C4000, v59, OS_LOG_TYPE_ERROR, "%s Inavlid join criterion, sql operator not supported for join %ld", buf, 0x16u);

    }
    v31 = 0;
  }
  v55 = [SEMSQLCommandClause alloc];
  v57 = (void *)objc_msgSend_initWithClause_parameters_(v55, v56, (uint64_t)v31, 0);

  return v57;
}

+ (id)_produceCriterionClause:(id)a3 tableName:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  id v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  const char *v39;
  id v40;
  const char *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  id v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  id v59;
  const char *v60;
  const char *v61;
  id v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  void *v67;
  const char *v68;
  const char *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  id v78;
  const char *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  const char *v86;
  void *v87;
  id v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  id v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  id v111;
  const char *v112;
  id v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  id v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  void *v126;
  const char *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  id v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  const char *v140;
  id v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  const char *v146;
  const char *v147;
  SEMSQLCommandClause *v148;
  const char *v149;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _BYTE v164[128];
  _BYTE v165[128];
  uint64_t v166;

  v166 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v155 = a4;
  if (v6)
  {
    objc_msgSend_columnName(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tableName(v6, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_prefixColumnName_withTableName_(a1, v13, (uint64_t)v9, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_columnValues(v6, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subCriteria(v6, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_opt_new();
    switch(objc_msgSend_sqlOperator(v6, v22, v23))
    {
      case 1:
        v26 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v27, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_initWithFormat_(v26, v29, (uint64_t)CFSTR("%@ = %@"), v14, v28);
        goto LABEL_15;
      case 2:
        v32 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v33, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_initWithFormat_(v32, v35, (uint64_t)CFSTR("%@ < %@"), v14, v34);
        goto LABEL_8;
      case 3:
        v37 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v38, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_initWithFormat_(v37, v39, (uint64_t)CFSTR("%@ <= %@"), v14, v34);
        goto LABEL_8;
      case 4:
        v40 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v41, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_initWithFormat_(v40, v42, (uint64_t)CFSTR("%@ >= %@"), v14, v34);
LABEL_8:
        v43 = (void *)v36;

        objc_msgSend_firstObject(v17, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v21, v47, (uint64_t)v46);

        if (!v43)
          goto LABEL_48;
        goto LABEL_45;
      case 5:
        v48 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v49, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend_initWithFormat_(v48, v51, (uint64_t)CFSTR("%@ MATCH %@"), v155, v50);

        v52 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_firstObject(v17, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v52, v56, (uint64_t)CFSTR("%@ : %@"), v14, v55);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      case 6:
        v59 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v60, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_initWithFormat_(v59, v61, (uint64_t)CFSTR("%@ != %@"), v14, v28);
        goto LABEL_15;
      case 7:
        v62 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v63, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v65, 1);
        v66 = v21;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend_initWithFormat_(v62, v68, (uint64_t)CFSTR("%@ BETWEEN (%@) AND (%@)"), v14, v64, v67);

        v21 = v66;
        objc_msgSend_addObjectsFromArray_(v66, v69, (uint64_t)v17);
        goto LABEL_44;
      case 8:
        v70 = objc_alloc(MEMORY[0x24BDD17C8]);
        v73 = objc_msgSend_count(v17, v71, v72);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v74, v73);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend_initWithFormat_(v70, v76, (uint64_t)CFSTR("%@ IN (%@)"), v14, v75);
        goto LABEL_43;
      case 9:
        v78 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v79, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_initWithFormat_(v78, v80, (uint64_t)CFSTR("%@ LIKE %@"), v14, v28);
LABEL_15:
        v43 = (void *)v30;

        objc_msgSend_firstObject(v17, v81, v82);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        objc_msgSend_addObject_(v21, v58, (uint64_t)v57);

        if (!v43)
          goto LABEL_48;
        goto LABEL_45;
      case 10:
        v83 = v21;
        v152 = v17;
        v153 = v14;
        v154 = v6;
        v84 = objc_msgSend_count(v20, v24, v25);
        v85 = objc_alloc(MEMORY[0x24BDBCEB8]);
        v87 = (void *)objc_msgSend_initWithCapacity_(v85, v86, v84);
        v160 = 0u;
        v161 = 0u;
        v162 = 0u;
        v163 = 0u;
        v151 = v20;
        v88 = v20;
        v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v160, v165, 16);
        if (v90)
        {
          v92 = v90;
          v93 = *(_QWORD *)v161;
          do
          {
            v94 = 0;
            do
            {
              if (*(_QWORD *)v161 != v93)
                objc_enumerationMutation(v88);
              objc_msgSend__produceCriterionClause_tableName_(a1, v91, *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * v94), v155);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              if (v95)
              {
                v96 = objc_alloc(MEMORY[0x24BDD17C8]);
                objc_msgSend_clause(v95, v97, v98);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = (void *)objc_msgSend_initWithFormat_(v96, v100, (uint64_t)CFSTR("(%@)"), v99);
                objc_msgSend_addObject_(v87, v102, (uint64_t)v101);

                objc_msgSend_parameters(v95, v103, v104);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObjectsFromArray_(v83, v106, (uint64_t)v105);

              }
              ++v94;
            }
            while (v92 != v94);
            v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v91, (uint64_t)&v160, v165, 16);
          }
          while (v92);
        }

        if (!objc_msgSend_count(v87, v107, v108))
          goto LABEL_46;
        objc_msgSend_componentsJoinedByString_(v87, v109, (uint64_t)CFSTR(" AND "));
        goto LABEL_40;
      case 11:
        v83 = v21;
        v152 = v17;
        v153 = v14;
        v154 = v6;
        v110 = objc_msgSend_count(v20, v24, v25);
        v111 = objc_alloc(MEMORY[0x24BDBCEB8]);
        v87 = (void *)objc_msgSend_initWithCapacity_(v111, v112, v110);
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v159 = 0u;
        v151 = v20;
        v113 = v20;
        v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v114, (uint64_t)&v156, v164, 16);
        if (v115)
        {
          v117 = v115;
          v118 = *(_QWORD *)v157;
          do
          {
            v119 = 0;
            do
            {
              if (*(_QWORD *)v157 != v118)
                objc_enumerationMutation(v113);
              objc_msgSend__produceCriterionClause_tableName_(a1, v116, *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * v119), v155);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              if (v120)
              {
                v121 = objc_alloc(MEMORY[0x24BDD17C8]);
                objc_msgSend_clause(v120, v122, v123);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v126 = (void *)objc_msgSend_initWithFormat_(v121, v125, (uint64_t)CFSTR("(%@)"), v124);
                objc_msgSend_addObject_(v87, v127, (uint64_t)v126);

                objc_msgSend_parameters(v120, v128, v129);
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObjectsFromArray_(v83, v131, (uint64_t)v130);

              }
              ++v119;
            }
            while (v117 != v119);
            v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v116, (uint64_t)&v156, v164, 16);
          }
          while (v117);
        }

        if (objc_msgSend_count(v87, v132, v133))
        {
          objc_msgSend_componentsJoinedByString_(v87, v134, (uint64_t)CFSTR(" OR "));
LABEL_40:
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_46:
          v43 = 0;
        }
        v17 = v152;
        v14 = v153;
        v20 = v151;

        v6 = v154;
        v21 = v83;
        if (!v43)
          goto LABEL_48;
        goto LABEL_45;
      case 12:
        v135 = objc_alloc(MEMORY[0x24BDD17C8]);
        v138 = objc_msgSend_count(v17, v136, v137);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v139, v138);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend_initWithFormat_(v135, v140, (uint64_t)CFSTR("%@ IS %@"), v14, v75);
        goto LABEL_43;
      case 13:
        v141 = objc_alloc(MEMORY[0x24BDD17C8]);
        v144 = objc_msgSend_count(v17, v142, v143);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v145, v144);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend_initWithFormat_(v141, v146, (uint64_t)CFSTR("%@ IS NOT %@"), v14, v75);
LABEL_43:
        v43 = (void *)v77;

        objc_msgSend_addObjectsFromArray_(v21, v147, (uint64_t)v17);
LABEL_44:
        if (!v43)
          goto LABEL_48;
LABEL_45:
        v148 = [SEMSQLCommandClause alloc];
        v31 = (void *)objc_msgSend_initWithClause_parameters_(v148, v149, (uint64_t)v43, v21);

        break;
      default:
LABEL_48:
        v31 = 0;
        break;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)_generateOrderByClause:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;

  v4 = a3;
  v7 = v4;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_11;
  }
  v8 = objc_msgSend_orderMode(v4, v5, v6);
  switch(v8)
  {
    case 3:
      v10 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend_columnNames(v7, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__generateCommaSeparatedValuesString_(a1, v14, (uint64_t)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_initWithFormat_(v10, v16, (uint64_t)CFSTR("%@ DESC"), v15);
LABEL_10:
      v9 = (__CFString *)v17;

      break;
    case 2:
      v18 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend_columnNames(v7, v19, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__generateCommaSeparatedValuesString_(a1, v21, (uint64_t)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_initWithFormat_(v18, v22, (uint64_t)CFSTR("%@ ASC"), v15);
      goto LABEL_10;
    case 1:
      v9 = CFSTR("rank");
      break;
    default:
      v9 = 0;
      break;
  }
LABEL_11:

  return v9;
}

+ (id)_generateCommaSeparatedPlaceholdersString:(unint64_t)a3
{
  unint64_t v3;
  __CFString *v4;
  id v5;
  const char *v6;
  const char *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    if (a3 == 1)
    {
      v4 = CFSTR("?");
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v8 = (void *)objc_msgSend_initWithCapacity_(v5, v6, v3);
      do
      {
        objc_msgSend_addObject_(v8, v7, (uint64_t)CFSTR("?"));
        --v3;
      }
      while (v3);
      objc_msgSend_componentsJoinedByString_(v8, v7, (uint64_t)CFSTR(", "));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = &stru_251783AF0;
  }
  return v4;
}

+ (id)_generateCommaSeparatedValuesString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  __CFString *v8;

  v3 = a3;
  v6 = objc_msgSend_count(v3, v4, v5);
  if (v6)
  {
    if (v6 == 1)
      objc_msgSend_objectAtIndex_(v3, v7, 0);
    else
      objc_msgSend_componentsJoinedByString_(v3, v7, (uint64_t)CFSTR(", "));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_251783AF0;
  }

  return v8;
}

- (SEMSQLCommandGenerator)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must call class methods"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end
