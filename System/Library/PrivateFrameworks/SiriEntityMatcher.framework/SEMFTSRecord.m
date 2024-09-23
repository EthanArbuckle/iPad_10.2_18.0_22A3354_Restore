@implementation SEMFTSRecord

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)objc_msgSend_initWithDatabaseValueRow_(v4, v5, (uint64_t)v3);

  return v6;
}

+ (id)tableName
{
  return CFSTR("item_fts");
}

+ (id)genSQLCreateStatements
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (void *)objc_opt_class();
  objc_msgSend_tableName(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v7, (uint64_t)CFSTR("CREATE VIRTUAL TABLE IF NOT EXISTS \"%@\" USING fts5(\"%@\", \"%@\", \"%@\", \"%@\");"),
    v6,
    0x251783870,
    0x251783890,
    0x2517838B0,
    0x2517838D0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, (uint64_t)v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)encodedExternalIdString:(id)a3
{
  return (id)objc_msgSend_sem_base64EncodedStringNoPadding(a3, a2, (uint64_t)a3);
}

- (SEMFTSRecord)initWithFieldType:(unsigned __int16)a3 fieldValue:(id)a4 originAppId:(id)a5 externalId:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  SEMFTSRecord *v13;
  const char *v14;
  SEMFTSRecord *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *fieldValue;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *originAppId;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSUUID *externalId;
  SEMFTSRecord *v30;
  void *v31;
  void *v32;
  uint64_t fieldType;
  NSObject *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  NSObject *v46;
  uint32_t v47;
  void *v48;
  void *v50;
  uint64_t v51;
  const char *v52;
  NSString *v53;
  objc_super v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  NSString *v60;
  uint64_t v61;

  v8 = a3;
  v61 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v54.receiver = self;
  v54.super_class = (Class)SEMFTSRecord;
  v13 = -[SEMFTSRecord init](&v54, sel_init);
  v15 = v13;
  if (!v13)
    goto LABEL_6;
  v13->_fieldType = v8;
  if ((objc_msgSend_isValidFieldType_(MEMORY[0x24BE5B238], v14, v8) & 1) == 0)
  {
    v31 = (void *)qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v32 = (void *)MEMORY[0x24BE5B238];
    fieldType = v15->_fieldType;
    v34 = v31;
    objc_msgSend_descriptionForTypeIdentifier_(v32, v35, fieldType);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v56 = "-[SEMFTSRecord initWithFieldType:fieldValue:originAppId:externalId:]";
    v57 = 2112;
    v58 = v36;
    v37 = "%s Cannot create record with invalid fieldType: %@";
LABEL_13:
    v46 = v34;
    v47 = 22;
LABEL_14:
    _os_log_error_impl(&dword_2462C4000, v46, OS_LOG_TYPE_ERROR, v37, buf, v47);

    goto LABEL_16;
  }
  v18 = objc_msgSend_copy(v10, v16, v17);
  fieldValue = v15->_fieldValue;
  v15->_fieldValue = (NSString *)v18;

  if (!objc_msgSend_length(v15->_fieldValue, v20, v21))
  {
    v38 = (void *)qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v39 = (void *)MEMORY[0x24BE5B238];
    v40 = v15->_fieldType;
    v34 = v38;
    objc_msgSend_descriptionForTypeIdentifier_(v39, v41, v40);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v56 = "-[SEMFTSRecord initWithFieldType:fieldValue:originAppId:externalId:]";
    v57 = 2112;
    v58 = v36;
    v37 = "%s Cannot create record with nil / empty fieldValue. fieldType: %@";
    goto LABEL_13;
  }
  v24 = objc_msgSend_copy(v11, v22, v23);
  originAppId = v15->_originAppId;
  v15->_originAppId = (NSString *)v24;

  if (!v15->_originAppId)
  {
    v42 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v43 = (void *)MEMORY[0x24BE5B238];
      v44 = v15->_fieldType;
      v34 = v42;
      objc_msgSend_descriptionForTypeIdentifier_(v43, v45, v44);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v56 = "-[SEMFTSRecord initWithFieldType:fieldValue:originAppId:externalId:]";
      v57 = 2112;
      v58 = v36;
      v37 = "%s Cannot create record with nil originAppId. fieldType: %@";
      goto LABEL_13;
    }
LABEL_16:
    v30 = 0;
    goto LABEL_17;
  }
  v28 = objc_msgSend_copy(v12, v26, v27);
  externalId = v15->_externalId;
  v15->_externalId = (NSUUID *)v28;

  if (!v15->_externalId)
  {
    v48 = (void *)qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v50 = (void *)MEMORY[0x24BE5B238];
    v51 = v15->_fieldType;
    v34 = v48;
    objc_msgSend_descriptionForTypeIdentifier_(v50, v52, v51);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v15->_originAppId;
    *(_DWORD *)buf = 136315650;
    v56 = "-[SEMFTSRecord initWithFieldType:fieldValue:originAppId:externalId:]";
    v57 = 2112;
    v58 = v36;
    v59 = 2112;
    v60 = v53;
    v37 = "%s Cannot create record with nil externalId. fieldType: %@, originApp: %@";
    v46 = v34;
    v47 = 32;
    goto LABEL_14;
  }
LABEL_6:
  v30 = v15;
LABEL_17:

  return v30;
}

- (SEMFTSRecord)initWithDatabaseValueRow:(id)a3
{
  id v4;
  const char *v5;
  SEMFTSRecord *v6;
  uint64_t v7;
  NSString *originAppId;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSUUID *externalId;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSString *fieldValue;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SEMFTSRecord;
  v6 = -[SEMFTSRecord init](&v23, sel_init);
  if (v6)
  {
    objc_msgSend_stringValueAtColumnIndex_(v4, v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    originAppId = v6->_originAppId;
    v6->_originAppId = (NSString *)v7;

    v9 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend_stringValueAtColumnIndex_(v4, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sem_initWithBase64EncodedString_(v9, v12, (uint64_t)v11);
    v13 = objc_claimAutoreleasedReturnValue();
    externalId = v6->_externalId;
    v6->_externalId = (NSUUID *)v13;

    objc_msgSend_numberValueAtColumnIndex_(v4, v15, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_fieldType = objc_msgSend_unsignedShortValue(v16, v17, v18);

    objc_msgSend_stringValueAtColumnIndex_(v4, v19, 3);
    v20 = objc_claimAutoreleasedReturnValue();
    fieldValue = v6->_fieldValue;
    v6->_fieldValue = (NSString *)v20;

  }
  return v6;
}

- (SEMFTSRecord)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("You must use supported initializer"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)description
{
  void *v3;
  const char *v4;
  void *v5;
  NSString *fieldValue;
  NSString *originAppId;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SEMFTSRecord;
  -[SEMFTSRecord description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v4, self->_fieldType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fieldValue = self->_fieldValue;
  originAppId = self->_originAppId;
  objc_msgSend_UUIDString(self->_externalId, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v11, (uint64_t)CFSTR(" fieldType: %@ fieldValue: %@ originAppId: %@ externalId: %@"), v5, fieldValue, originAppId, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  SEMFTSRecord *v4;
  SEMFTSRecord *v5;
  const char *v6;
  char isEqualToFTSRecord;

  v4 = (SEMFTSRecord *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToFTSRecord = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToFTSRecord = objc_msgSend_isEqualToFTSRecord_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToFTSRecord = 0;
  }

  return isEqualToFTSRecord;
}

- (BOOL)isEqualToFTSRecord:(id)a3
{
  void *v3;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t fieldType;
  const char *v10;
  uint64_t v11;
  NSString *fieldValue;
  NSString *v13;
  const char *v14;
  int v15;
  char isEqual;
  NSString *originAppId;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  NSUUID *externalId;
  void *v23;
  const char *v24;

  v5 = a3;
  v8 = v5;
  if (!v5 || (fieldType = self->_fieldType, (_DWORD)fieldType != objc_msgSend_fieldType(v5, v6, v7)))
  {
    isEqual = 0;
    goto LABEL_16;
  }
  fieldValue = self->_fieldValue;
  v13 = fieldValue;
  if (!fieldValue)
  {
    objc_msgSend_fieldValue(v8, v10, v11);
    fieldType = objc_claimAutoreleasedReturnValue();
    if (!fieldType)
    {
      v15 = 0;
      goto LABEL_11;
    }
    v13 = self->_fieldValue;
  }
  objc_msgSend_fieldValue(v8, v10, v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqual_(v13, v14, (uint64_t)v3))
  {
    isEqual = 0;
    goto LABEL_13;
  }
  v15 = 1;
LABEL_11:
  originAppId = self->_originAppId;
  objc_msgSend_originAppId(v8, v10, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(originAppId, v19, (uint64_t)v18))
  {
    externalId = self->_externalId;
    objc_msgSend_externalId(v8, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(externalId, v24, (uint64_t)v23);

    if ((v15 & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }

  isEqual = 0;
  if (v15)
LABEL_13:

LABEL_14:
  if (!fieldValue)

LABEL_16:
  return isEqual;
}

- (unint64_t)hash
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], a2, self->_fieldType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_hash(v3, v4, v5);
  v9 = objc_msgSend_hash(self->_fieldValue, v7, v8);
  v12 = v9 ^ objc_msgSend_hash(self->_originAppId, v10, v11);
  v15 = v12 ^ objc_msgSend_hash(self->_externalId, v13, v14) ^ v6;

  return v15;
}

- (unsigned)fieldType
{
  return self->_fieldType;
}

- (NSString)fieldValue
{
  return self->_fieldValue;
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (NSUUID)externalId
{
  return self->_externalId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalId, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_fieldValue, 0);
}

@end
