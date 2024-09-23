@implementation STSCHNdefRecordBundle

- (BOOL)isEqual:(id)a3
{
  STSCHNdefRecordBundle *v4;
  STSCHNdefRecordBundle *v5;
  STSCHNdefRecordBundle *v6;
  const char *v7;
  uint64_t v8;
  STSCHNdefRecordBundle *v9;
  uint64_t v10;
  void *v11;
  STSNDEFRecord *alternativeRecord;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  STSNDEFRecord *configurationRecord;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSArray *auxiliaryRecords;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  STSNDEFRecord *v39;
  void *v40;
  const char *v41;
  void *v42;

  v4 = (STSCHNdefRecordBundle *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v18 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v9 = v6;
    if (self->_alternativeRecord)
    {
      objc_msgSend_alternativeRecord(v6, v7, v8);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        alternativeRecord = self->_alternativeRecord;
        objc_msgSend_alternativeRecord(v9, v7, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(alternativeRecord) = objc_msgSend_isEqual_(alternativeRecord, v14, (uint64_t)v13);

        if (!(_DWORD)alternativeRecord)
          goto LABEL_9;
      }
      if (self->_alternativeRecord)
        goto LABEL_9;
    }
    objc_msgSend_alternativeRecord(v9, v7, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_9;
    if (!self->_configurationRecord)
      goto LABEL_9;
    objc_msgSend_configurationRecord(v9, v16, v17);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v23 = (void *)v20;
      configurationRecord = self->_configurationRecord;
      objc_msgSend_configurationRecord(v9, v21, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(configurationRecord) = objc_msgSend_isEqual_(configurationRecord, v26, (uint64_t)v25);

      if (!(_DWORD)configurationRecord)
        goto LABEL_9;
    }
    if (!self->_configurationRecord)
      goto LABEL_9;
    objc_msgSend_configurationRecord(v9, v21, v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      goto LABEL_9;
    auxiliaryRecords = self->_auxiliaryRecords;
    objc_msgSend_auxiliaryRecords(v9, v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(auxiliaryRecords) = objc_msgSend_isEqualToArray_(auxiliaryRecords, v32, (uint64_t)v31);

    if (!(_DWORD)auxiliaryRecords)
      goto LABEL_9;
    if (!self->_errorRecord)
      goto LABEL_9;
    objc_msgSend_errorRecord(v9, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v38 = (void *)v35;
      v39 = self->_configurationRecord;
      objc_msgSend_errorRecord(v9, v36, v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v39) = objc_msgSend_isEqual_(v39, v41, (uint64_t)v40);

      if (!(_DWORD)v39)
        goto LABEL_9;
    }
    if (self->_errorRecord)
    {
      objc_msgSend_errorRecord(v9, v36, v37);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v42 != 0;

    }
    else
    {
LABEL_9:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (STSCHNdefRecordBundle)initWithAlternativeRecord:(id)a3 configurationRecord:(id)a4 auxiliaryRecords:(id)a5 errorRecord:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  STSCHNdefRecordBundle *v15;
  STSCHNdefRecordBundle *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)STSCHNdefRecordBundle;
  v15 = -[STSCHNdefRecordBundle init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_alternativeRecord, a3);
    objc_storeStrong((id *)&v16->_configurationRecord, a4);
    objc_storeStrong((id *)&v16->_auxiliaryRecords, a5);
    objc_storeStrong((id *)&v16->_errorRecord, a6);
  }

  return v16;
}

- (STSNDEFRecord)alternativeRecord
{
  return self->_alternativeRecord;
}

- (void)setAlternativeRecord:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeRecord, a3);
}

- (STSNDEFRecord)configurationRecord
{
  return self->_configurationRecord;
}

- (void)setConfigurationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_configurationRecord, a3);
}

- (NSArray)auxiliaryRecords
{
  return self->_auxiliaryRecords;
}

- (void)setAuxiliaryRecords:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryRecords, a3);
}

- (STSNDEFRecord)errorRecord
{
  return self->_errorRecord;
}

- (void)setErrorRecord:(id)a3
{
  objc_storeStrong((id *)&self->_errorRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorRecord, 0);
  objc_storeStrong((id *)&self->_auxiliaryRecords, 0);
  objc_storeStrong((id *)&self->_configurationRecord, 0);
  objc_storeStrong((id *)&self->_alternativeRecord, 0);
}

@end
