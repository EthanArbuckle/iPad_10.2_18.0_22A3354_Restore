@implementation SEMFieldMatch

- (SEMFieldMatch)initWithSpanInfo:(id)a3 entityFieldInfo:(id)a4
{
  id v7;
  id v8;
  SEMFieldMatch *v9;
  SEMFieldMatch *v10;
  const char *v11;
  uint64_t v12;
  SEMFieldMatch *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  SEMEntityFieldInfo *entityFieldInfo;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  SEMEntityFieldInfo *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SEMFieldMatch;
  v9 = -[SEMFieldMatch init](&v21, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  objc_storeStrong((id *)&v9->_spanInfo, a3);
  if (!v10->_spanInfo)
  {
    v14 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v13 = 0;
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v23 = "-[SEMFieldMatch initWithSpanInfo:entityFieldInfo:]";
    v15 = "%s Cannot initialize span match field with nil span info.";
    v16 = v14;
    v17 = 12;
LABEL_11:
    _os_log_error_impl(&dword_2462C4000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v10->_entityFieldInfo, a4);
  if (objc_msgSend_entityType(v10->_entityFieldInfo, v11, v12) != 1)
  {
    v18 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    entityFieldInfo = v10->_entityFieldInfo;
    *(_DWORD *)buf = 136315394;
    v23 = "-[SEMFieldMatch initWithSpanInfo:entityFieldInfo:]";
    v24 = 2112;
    v25 = entityFieldInfo;
    v15 = "%s Cannot initalize span match field with invalid entityFieldInfo: %@";
    v16 = v18;
    v17 = 22;
    goto LABEL_11;
  }
LABEL_4:
  v13 = v10;
LABEL_9:

  return v13;
}

- (SEMFieldMatch)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)entityFieldInfo
{
  return self->_entityFieldInfo;
}

- (id)fieldSpanInfo
{
  return self->_spanInfo;
}

- (id)fieldSpanValue
{
  uint64_t v2;

  return (id)objc_msgSend_value(self->_spanInfo, a2, v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  _QWORD *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)objc_opt_class();
  v7 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v9 = objc_msgSend_copyWithZone_(self->_spanInfo, v8, (uint64_t)a3);
  v10 = (void *)v7[1];
  v7[1] = v9;

  v12 = objc_msgSend_copyWithZone_(self->_entityFieldInfo, v11, (uint64_t)a3);
  v13 = (void *)v7[2];
  v7[2] = v12;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SEMFieldMatch *v4;
  SEMFieldMatch *v5;
  const char *v6;
  char isEqualToSpanMatchField;

  v4 = (SEMFieldMatch *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToSpanMatchField = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToSpanMatchField = objc_msgSend_isEqualToSpanMatchField_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToSpanMatchField = 0;
  }

  return isEqualToSpanMatchField;
}

- (BOOL)isEqualToSpanMatchField:(id)a3
{
  id v4;
  SEMSpanInfo *spanInfo;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  SEMEntityFieldInfo *entityFieldInfo;
  void *v13;
  const char *v14;
  char isEqual;

  v4 = a3;
  spanInfo = self->_spanInfo;
  objc_msgSend_fieldSpanInfo(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(spanInfo, v9, (uint64_t)v8))
  {
    entityFieldInfo = self->_entityFieldInfo;
    objc_msgSend_entityFieldInfo(v4, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(entityFieldInfo, v14, (uint64_t)v13);

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SEMFieldMatch;
  -[SEMFieldMatch description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" spanInfo: %@, entityFieldInfo: %@"), self->_spanInfo, self->_entityFieldInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_spanInfo, a2, v2);
  return objc_msgSend_hash(self->_entityFieldInfo, v5, v6) ^ v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMFieldMatch)initWithCoder:(id)a3
{
  id v4;
  SEMFieldMatch *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  SEMSpanInfo *spanInfo;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  SEMEntityFieldInfo *entityFieldInfo;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SEMFieldMatch;
  v5 = -[SEMFieldMatch init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("spanInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    spanInfo = v5->_spanInfo;
    v5->_spanInfo = (SEMSpanInfo *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v11, (uint64_t)v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, CFSTR("entityFieldInfo"));
    v16 = objc_claimAutoreleasedReturnValue();
    entityFieldInfo = v5->_entityFieldInfo;
    v5->_entityFieldInfo = (SEMEntityFieldInfo *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SEMSpanInfo *spanInfo;
  const char *v5;
  const char *v6;
  id v7;

  spanInfo = self->_spanInfo;
  v7 = a3;
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)spanInfo, CFSTR("spanInfo"));
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_entityFieldInfo, CFSTR("entityFieldInfo"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityFieldInfo, 0);
  objc_storeStrong((id *)&self->_spanInfo, 0);
}

@end
