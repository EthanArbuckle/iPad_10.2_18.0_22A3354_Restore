@implementation APOdmlBiomeSQLQuery

- (APOdmlBiomeSQLQuery)init
{
  APOdmlBiomeSQLQuery *v2;
  id v3;
  const char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APOdmlBiomeSQLQuery;
  v2 = -[APOdmlBiomeSQLQuery init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D02718]);
    objc_msgSend_setDatabase_(v2, v4, (uint64_t)v3);

  }
  return v2;
}

- (id)query:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend_database(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_formatEventName_(self, v14, (uint64_t)v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v9)
  {
    objc_msgSend_timeIntervalSince1970(v8, v16, v17);
    v19 = v18;
    objc_msgSend_timeIntervalSince1970(v9, v20, v21);
    objc_msgSend_executeQuery_(v13, v22, (uint64_t)CFSTR("SELECT * FROM %@ WHERE eventTimestamp > %f AND eventTimestamp < %f"), v15, v19, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_error(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      OdmlLogForCategory(2uLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      goto LABEL_9;
    }
LABEL_10:
    objc_msgSend_getRowsFromResults_(self, v28, (uint64_t)v24);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend_executeQuery_(v13, v16, (uint64_t)CFSTR("SELECT * FROM %@"), v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_error(v24, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
    goto LABEL_10;
  OdmlLogForCategory(2uLL);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
LABEL_8:
    objc_msgSend_error(v24, v30, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = v35;
    _os_log_impl(&dword_1B69D6000, v29, OS_LOG_TYPE_DEFAULT, "Biome SQL query error: %@", buf, 0xCu);

  }
LABEL_9:

  v36 = 0;
LABEL_11:

  return v36;
}

- (id)formatEventName:(id)a3
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("\"%@\"), a3);
}

- (id)getRowsFromResults:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_next(v3, v7, v8))
  {
    do
    {
      objc_msgSend_row(v3, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v6, v12, (uint64_t)v11);

    }
    while ((objc_msgSend_next(v3, v13, v14) & 1) != 0);
  }
  v15 = (void *)objc_msgSend_copy(v6, v9, v10);

  return v15;
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
