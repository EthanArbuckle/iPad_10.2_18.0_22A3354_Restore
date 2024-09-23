@implementation SEMDatabaseReader

+ (id)readerForDatabaseAtURL:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;

  objc_msgSend_readOnlyConnectionToDatabaseAtURL_(SEMDatabaseConnection, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)objc_msgSend_initWithConnection_lifespan_(v4, v5, (uint64_t)v3, 5.0);

  return v6;
}

- (SEMDatabaseReader)initWithConnection:(id)a3 lifespan:(double)a4
{
  id v7;
  SEMDatabaseReader *v8;
  SEMDatabaseReader *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  SEMProvisionalResourceManager *v16;
  double lifespan;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  SEMProvisionalResourceManager *resourceManager;
  SEMDatabaseReader *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SEMDatabaseReader;
  v8 = -[SEMDatabaseReader init](&v36, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_6;
  objc_storeStrong((id *)&v8->_connection, a3);
  if (!v9->_connection)
  {
    v28 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[SEMDatabaseReader initWithConnection:lifespan:]";
      _os_log_error_impl(&dword_2462C4000, v28, OS_LOG_TYPE_ERROR, "%s nil database connection.", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v9->_lifespan = a4;
  if (a4 <= 0.0)
  {
    v29 = (void *)qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      v27 = 0;
      goto LABEL_15;
    }
    v30 = (void *)MEMORY[0x24BDD16E0];
    v15 = v29;
    objc_msgSend_numberWithDouble_(v30, v31, v32, a4);
    v33 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v38 = "-[SEMDatabaseReader initWithConnection:lifespan:]";
    v39 = 2112;
    v40 = v33;
    _os_log_error_impl(&dword_2462C4000, v15, OS_LOG_TYPE_ERROR, "%s Invalid lifespan: %@", buf, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = dword_25756B76C++;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v11, v14, (uint64_t)CFSTR("DB-Reader-%@"), v13);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = [SEMProvisionalResourceManager alloc];
  lifespan = v9->_lifespan;
  objc_msgSend__activationBlock(v9, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__deactivationBlock(v9, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_initWithResourceName_lifespan_activationBlock_deactivationBlock_serializeOperations_(v16, v24, (uint64_t)v15, v20, v23, 0, lifespan);
  resourceManager = v9->_resourceManager;
  v9->_resourceManager = (SEMProvisionalResourceManager *)v25;

  if (!v9->_resourceManager)
  {
    v34 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[SEMDatabaseReader initWithConnection:lifespan:]";
      v39 = 2112;
      v40 = v15;
      _os_log_error_impl(&dword_2462C4000, v34, OS_LOG_TYPE_ERROR, "%s Failed to initialize resource manager for resource: %@", buf, 0x16u);
    }
    goto LABEL_13;
  }

LABEL_6:
  v27 = v9;
LABEL_15:

  return v27;
}

- (SEMDatabaseReader)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use supported initializer"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_deactivateWithError_(self->_resourceManager, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)SEMDatabaseReader;
  -[SEMDatabaseReader dealloc](&v3, sel_dealloc);
}

- (id)_activationBlock
{
  SEMDatabaseConnection *v2;
  SEMDatabaseConnection *v3;
  void *v4;
  _QWORD v6[4];
  SEMDatabaseConnection *v7;

  v2 = self->_connection;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_24630ACEC;
  v6[3] = &unk_2517832B0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x2495571C4](v6);

  return v4;
}

- (id)_deactivationBlock
{
  SEMDatabaseConnection *v2;
  SEMDatabaseConnection *v3;
  void *v4;
  _QWORD v6[4];
  SEMDatabaseConnection *v7;

  v2 = self->_connection;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_24630AD74;
  v6[3] = &unk_2517832B0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x2495571C4](v6);

  return v4;
}

- (BOOL)activateWithError:(id *)a3 operationBlock:(id)a4
{
  return (unint64_t)(objc_msgSend_activateWithError_operationBlock_(self->_resourceManager, a2, (uint64_t)a3, a4)
                          - 1) < 4;
}

- (BOOL)deactivateWithError:(id *)a3
{
  return (unint64_t)(objc_msgSend_deactivateWithError_(self->_resourceManager, a2, (uint64_t)a3) - 1) < 4;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  BOOL v15;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  Class v22;
  id *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_24630AF88;
  v18[3] = &unk_2517832D8;
  v21 = &v24;
  v18[4] = self;
  v12 = v10;
  v19 = v12;
  v22 = a4;
  v23 = a5;
  v13 = v11;
  v20 = v13;
  if ((objc_msgSend_activateWithError_operationBlock_(self, v14, (uint64_t)a5, v18) & 1) != 0)
  {

    v15 = *((_BYTE *)v25 + 24) != 0;
  }
  else
  {
    v16 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[SEMDatabaseReader enumerateRecordResultsOfSelect:recordClass:error:usingBlock:]";
      _os_log_error_impl(&dword_2462C4000, v16, OS_LOG_TYPE_ERROR, "%s Failed to activate database connection.", buf, 0xCu);
    }

    v15 = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v15;
}

- (BOOL)enumerateRecordResultsOfSelect:(id)a3 recordClass:(Class)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6 enumerateAll:(BOOL)a7 error:(id *)a8 usingBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  BOOL v20;
  NSObject *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t *v26;
  Class v27;
  unint64_t v28;
  unint64_t v29;
  id *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a9;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_24630B1A0;
  v23[3] = &unk_251783300;
  v26 = &v32;
  v23[4] = self;
  v17 = v15;
  v24 = v17;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a8;
  v31 = a7;
  v18 = v16;
  v25 = v18;
  if ((objc_msgSend_activateWithError_operationBlock_(self, v19, (uint64_t)a8, v23) & 1) != 0)
  {

    v20 = *((_BYTE *)v33 + 24) != 0;
  }
  else
  {
    v21 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[SEMDatabaseReader enumerateRecordResultsOfSelect:recordClass:batchSize:offset:enumerateAll:error:usingBlock:]";
      _os_log_error_impl(&dword_2462C4000, v21, OS_LOG_TYPE_ERROR, "%s Failed to activate database connection.", buf, 0xCu);
    }

    v20 = 0;
  }
  _Block_object_dispose(&v32, 8);

  return v20;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  BOOL v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_24630B3AC;
  v16[3] = &unk_251783328;
  v19 = &v21;
  v16[4] = self;
  v10 = v8;
  v17 = v10;
  v20 = a4;
  v11 = v9;
  v18 = v11;
  if ((objc_msgSend_activateWithError_operationBlock_(self, v12, (uint64_t)a4, v16) & 1) != 0)
  {

    v13 = *((_BYTE *)v22 + 24) != 0;
  }
  else
  {
    v14 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SEMDatabaseReader enumerateRowResultsOfSelect:error:usingBlock:]";
      _os_log_error_impl(&dword_2462C4000, v14, OS_LOG_TYPE_ERROR, "%s Failed to activate database connection.", buf, 0xCu);
    }

    v13 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (BOOL)enumerateRowResultsOfSelect:(id)a3 batchSize:(unint64_t)a4 offset:(unint64_t)a5 enumerateAll:(BOOL)a6 error:(id *)a7 usingBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  BOOL v19;
  NSObject *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  id *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a8;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_24630B5C0;
  v22[3] = &unk_251783350;
  v25 = &v30;
  v22[4] = self;
  v16 = v14;
  v23 = v16;
  v26 = a4;
  v27 = a5;
  v29 = a6;
  v28 = a7;
  v17 = v15;
  v24 = v17;
  if ((objc_msgSend_activateWithError_operationBlock_(self, v18, (uint64_t)a7, v22) & 1) != 0)
  {

    v19 = *((_BYTE *)v31 + 24) != 0;
  }
  else
  {
    v20 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[SEMDatabaseReader enumerateRowResultsOfSelect:batchSize:offset:enumerateAll:error:usingBlock:]";
      _os_log_error_impl(&dword_2462C4000, v20, OS_LOG_TYPE_ERROR, "%s Failed to activate database connection.", buf, 0xCu);
    }

    v19 = 0;
  }
  _Block_object_dispose(&v30, 8);

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
