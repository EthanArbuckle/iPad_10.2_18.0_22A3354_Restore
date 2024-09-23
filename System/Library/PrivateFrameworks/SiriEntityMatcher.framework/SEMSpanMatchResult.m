@implementation SEMSpanMatchResult

- (SEMSpanMatchResult)initWithEntityInfo:(id)a3 spanInfo:(id)a4 fieldMatches:(id)a5 duplicateIndex:(unsigned int)a6
{
  id v11;
  id v12;
  id v13;
  SEMSpanMatchResult *v14;
  SEMSpanMatchResult *v15;
  void **p_entityInfo;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  SEMSpanMatchResult *v21;
  uint64_t v22;
  SEMSpanInfo *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  SEMSpanInfo *spanInfo;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  SEMSpanInfo *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v30.receiver = self;
  v30.super_class = (Class)SEMSpanMatchResult;
  v14 = -[SEMSpanMatchResult init](&v30, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_6;
  p_entityInfo = (void **)&v14->_entityInfo;
  objc_storeStrong((id *)&v14->_entityInfo, a3);
  if (objc_msgSend_entityType(*p_entityInfo, v17, v18) != 1)
  {
    v22 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v23 = (SEMSpanInfo *)*p_entityInfo;
      *(_DWORD *)buf = 136315394;
      v32 = "-[SEMSpanMatchResult initWithEntityInfo:spanInfo:fieldMatches:duplicateIndex:]";
      v33 = 2112;
      v34 = v23;
      v24 = "%s entityInfo invalid: %@";
LABEL_9:
      v25 = v22;
      v26 = 22;
LABEL_12:
      _os_log_error_impl(&dword_2462C4000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
    }
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v15->_spanInfo, a4);
  if (!v15->_spanInfo)
  {
    v27 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[SEMSpanMatchResult initWithEntityInfo:spanInfo:fieldMatches:duplicateIndex:]";
      v24 = "%s spanInfo cannot be nil";
      v25 = v27;
      v26 = 12;
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v15->_fieldMatches, a5);
  if (!objc_msgSend_count(v15->_fieldMatches, v19, v20))
  {
    v22 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    spanInfo = v15->_spanInfo;
    *(_DWORD *)buf = 136315394;
    v32 = "-[SEMSpanMatchResult initWithEntityInfo:spanInfo:fieldMatches:duplicateIndex:]";
    v33 = 2112;
    v34 = spanInfo;
    v24 = "%s fieldMatches cannot be nil / empty. spanInfo: %@";
    goto LABEL_9;
  }
  v15->_score = 0.0;
  v15->_duplicateIndex = a6;
LABEL_6:
  v21 = v15;
LABEL_15:

  return v21;
}

- (void)setScore:(float)a3
{
  if (a3 >= 0.0 && a3 <= 1.0)
    self->_score = a3;
}

- (SEMSpanMatchResult)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)entityInfo
{
  return self->_entityInfo;
}

- (id)spanInfo
{
  return self->_spanInfo;
}

- (id)spanValue
{
  uint64_t v2;

  return (id)objc_msgSend_value(self->_spanInfo, a2, v2);
}

- (id)fieldMatches
{
  return self->_fieldMatches;
}

- (float)score
{
  return self->_score;
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SEMSpanMatchResult;
  -[SEMSpanMatchResult description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" entityInfo: %@, spanInfo: %@, fieldMatches: %@, duplicate: %u, score: %f"), self->_entityInfo, self->_spanInfo, self->_fieldMatches, self->_duplicateIndex, self->_score);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v9 = objc_msgSend_copyWithZone_(self->_entityInfo, v8, (uint64_t)a3);
  v10 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = v9;

  v12 = objc_msgSend_copyWithZone_(self->_spanInfo, v11, (uint64_t)a3);
  v13 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_fieldMatches, v14, (uint64_t)a3);
  v16 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v15;

  *(_DWORD *)(v7 + 36) = self->_duplicateIndex;
  *(float *)(v7 + 32) = self->_score;
  return (id)v7;
}

- (BOOL)isEqual:(id)a3
{
  SEMSpanMatchResult *v4;
  SEMSpanMatchResult *v5;
  const char *v6;
  char isEqualToSpanMatchResult;

  v4 = (SEMSpanMatchResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToSpanMatchResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToSpanMatchResult = objc_msgSend_isEqualToSpanMatchResult_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToSpanMatchResult = 0;
  }

  return isEqualToSpanMatchResult;
}

- (BOOL)isEqualToSpanMatchResult:(id)a3
{
  id v4;
  SEMEntityInfo *entityInfo;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  SEMSpanInfo *spanInfo;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  NSArray *fieldMatches;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  unsigned int duplicateIndex;
  const char *v23;
  uint64_t v24;
  float score;
  float v26;
  BOOL v27;

  v4 = a3;
  entityInfo = self->_entityInfo;
  objc_msgSend_entityInfo(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(entityInfo, v9, (uint64_t)v8))
  {
    spanInfo = self->_spanInfo;
    objc_msgSend_spanInfo(v4, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(spanInfo, v14, (uint64_t)v13))
    {
      fieldMatches = self->_fieldMatches;
      objc_msgSend_fieldMatches(v4, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(fieldMatches, v19, (uint64_t)v18)
        && (duplicateIndex = self->_duplicateIndex,
            duplicateIndex == objc_msgSend_duplicateIndex(v4, v20, v21)))
      {
        score = self->_score;
        objc_msgSend_score(v4, v23, v24);
        v27 = score == v26;
      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;

  v4 = objc_msgSend_hash(self->_entityInfo, a2, v2);
  v7 = objc_msgSend_hash(self->_spanInfo, v5, v6);
  v10 = objc_msgSend_hash(self->_fieldMatches, v8, v9);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v11, self->_duplicateIndex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_hash(v12, v13, v14);
  *(float *)&v16 = self->_score;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v17, v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7 ^ v4 ^ v10 ^ v15 ^ objc_msgSend_hash(v19, v20, v21);

  return v22;
}

- (id)toOntologyGraph:(id *)a3
{
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend_ontologyGraphFromSpanMatch_(SEMOntologyMapper, a2, (uint64_t)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("No ontology mapping defined for result: %@"), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462CE41C(0, 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3 && v8)
      *a3 = objc_retainAutorelease(v8);

  }
  return v6;
}

- (id)toOntologyGraphData:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v15;
  _BYTE v16[66];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_toOntologyGraph_(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_getCppGraph(v4, v5, v6);
    siri::ontology::UsoGraphProtoWriter::toProtobuf();
    v8 = *(_QWORD *)v16;
    PB::Writer::Writer((PB::Writer *)v16);
    (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v8 + 24))(v8, v16);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v9, *(uint64_t *)&v16[8], *(_QWORD *)v16 - *(_QWORD *)&v16[8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PB::Writer::~Writer((PB::Writer *)v16);
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  else
  {
    v11 = (id)qword_25441F970;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(self, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v16 = 136315394;
      *(_QWORD *)&v16[4] = "-[SEMSpanMatchResult toOntologyGraphData:]";
      *(_WORD *)&v16[12] = 2112;
      *(_QWORD *)&v16[14] = v15;
      _os_log_error_impl(&dword_2462C4000, v11, OS_LOG_TYPE_ERROR, "%s No ontology graph found for result: %@", v16, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMSpanMatchResult)initWithCoder:(id)a3
{
  id v4;
  SEMSpanMatchResult *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  SEMEntityInfo *entityInfo;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  SEMSpanInfo *spanInfo;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSArray *fieldMatches;
  const char *v22;
  const char *v23;
  float v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SEMSpanMatchResult;
  v5 = -[SEMSpanMatchResult init](&v26, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v27[0] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v7, (uint64_t)v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, CFSTR("entityInfo"));
    v12 = objc_claimAutoreleasedReturnValue();
    entityInfo = v5->_entityInfo;
    v5->_entityInfo = (SEMEntityInfo *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("spanInfo"));
    v16 = objc_claimAutoreleasedReturnValue();
    spanInfo = v5->_spanInfo;
    v5->_spanInfo = (SEMSpanInfo *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v19, v18, CFSTR("fieldMatches"));
    v20 = objc_claimAutoreleasedReturnValue();
    fieldMatches = v5->_fieldMatches;
    v5->_fieldMatches = (NSArray *)v20;

    v5->_duplicateIndex = objc_msgSend_decodeInt32ForKey_(v4, v22, (uint64_t)CFSTR("duplicateIndex"));
    objc_msgSend_decodeFloatForKey_(v4, v23, (uint64_t)CFSTR("score"));
    v5->_score = v24;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  double v8;
  const char *v9;
  id v10;

  v10 = a3;
  objc_msgSend_encodeObject_forKey_(v10, v4, (uint64_t)self->_entityInfo, CFSTR("entityInfo"));
  objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)self->_spanInfo, CFSTR("spanInfo"));
  objc_msgSend_encodeObject_forKey_(v10, v6, (uint64_t)self->_fieldMatches, CFSTR("fieldMatches"));
  objc_msgSend_encodeInt32_forKey_(v10, v7, self->_duplicateIndex, CFSTR("duplicateIndex"));
  *(float *)&v8 = self->_score;
  objc_msgSend_encodeFloat_forKey_(v10, v9, (uint64_t)CFSTR("score"), v8);

}

- (unsigned)duplicateIndex
{
  return self->_duplicateIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldMatches, 0);
  objc_storeStrong((id *)&self->_spanInfo, 0);
  objc_storeStrong((id *)&self->_entityInfo, 0);
}

@end
