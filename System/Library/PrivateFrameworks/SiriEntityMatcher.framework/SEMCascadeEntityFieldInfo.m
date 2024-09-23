@implementation SEMCascadeEntityFieldInfo

- (SEMCascadeEntityFieldInfo)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (SEMCascadeEntityFieldInfo)initWithFieldType:(unsigned __int16)a3
{
  SEMCascadeEntityFieldInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SEMCascadeEntityFieldInfo;
  result = -[SEMCascadeEntityFieldInfo init](&v5, sel_init);
  if (result)
    result->_fieldType = a3;
  return result;
}

- (unsigned)entityType
{
  return 1;
}

- (unsigned)fieldType
{
  return self->_fieldType;
}

- (int64_t)toKVFieldType:(id *)a3
{
  const char *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = KVFieldTypeFromCascadeFieldType();
  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0BA0];
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v5, self->_fieldType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v8, v10, (uint64_t)CFSTR("No conversion from Cascade fieldType: %@ to KVFieldType"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v7, v14, (uint64_t)CFSTR("com.apple.siri.inference.SEMSpanMatcher"), 2, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a3 && v15)
      *a3 = objc_retainAutorelease(v15);

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  id result;

  v5 = (void *)objc_opt_class();
  result = (id)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  *((_WORD *)result + 4) = self->_fieldType;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SEMCascadeEntityFieldInfo *v4;
  SEMCascadeEntityFieldInfo *v5;
  const char *v6;
  char isEqualToCascadeEntityFieldInfo;

  v4 = (SEMCascadeEntityFieldInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToCascadeEntityFieldInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToCascadeEntityFieldInfo = objc_msgSend_isEqualToCascadeEntityFieldInfo_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToCascadeEntityFieldInfo = 0;
  }

  return isEqualToCascadeEntityFieldInfo;
}

- (BOOL)isEqualToCascadeEntityFieldInfo:(id)a3
{
  int fieldType;

  fieldType = self->_fieldType;
  return fieldType == objc_msgSend_fieldType(a3, a2, (uint64_t)a3);
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SEMCascadeEntityFieldInfo;
  -[SEMCascadeEntityFieldInfo description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v4, self->_fieldType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v6, (uint64_t)CFSTR(" fieldType: %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  const char *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], a2, self->_fieldType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_hash(v2, v3, v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMCascadeEntityFieldInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  SEMCascadeEntityFieldInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SEMCascadeEntityFieldInfo;
  v6 = -[SEMCascadeEntityFieldInfo init](&v8, sel_init);
  if (v6)
    v6->_fieldType = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("fieldType"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_fieldType, CFSTR("fieldType"));
}

@end
