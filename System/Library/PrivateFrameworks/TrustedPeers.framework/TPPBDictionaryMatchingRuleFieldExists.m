@implementation TPPBDictionaryMatchingRuleFieldExists

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TPPBDictionaryMatchingRuleFieldExists;
  -[TPPBDictionaryMatchingRuleFieldExists description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBDictionaryMatchingRuleFieldExists dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *fieldName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fieldName = self->_fieldName;
  if (fieldName)
    objc_msgSend(v3, "setObject:forKey:", fieldName, CFSTR("fieldName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDictionaryMatchingRuleFieldExistsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_fieldName)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *fieldName;

  fieldName = self->_fieldName;
  if (fieldName)
    objc_msgSend(a3, "setFieldName:", fieldName);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_fieldName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *fieldName;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    fieldName = self->_fieldName;
    if ((unint64_t)fieldName | v4[1])
      v6 = -[NSString isEqual:](fieldName, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_fieldName, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[TPPBDictionaryMatchingRuleFieldExists setFieldName:](self, "setFieldName:");
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
}

- (BOOL)matches:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  if (-[TPPBDictionaryMatchingRuleFieldExists hasFieldName](self, "hasFieldName")
    && (-[TPPBDictionaryMatchingRuleFieldExists fieldName](self, "fieldName"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8))
  {
    -[TPPBDictionaryMatchingRuleFieldExists fieldName](self, "fieldName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10 != 0;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("CKKSMatcherError"), 1, CFSTR("Rule missing field name"));
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
