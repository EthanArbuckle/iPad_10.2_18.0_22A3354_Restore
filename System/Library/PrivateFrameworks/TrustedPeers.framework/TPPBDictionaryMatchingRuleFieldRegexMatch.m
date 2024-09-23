@implementation TPPBDictionaryMatchingRuleFieldRegexMatch

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (BOOL)hasRegex
{
  return self->_regex != 0;
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
  v8.super_class = (Class)TPPBDictionaryMatchingRuleFieldRegexMatch;
  -[TPPBDictionaryMatchingRuleFieldRegexMatch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBDictionaryMatchingRuleFieldRegexMatch dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *regex;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fieldName = self->_fieldName;
  if (fieldName)
    objc_msgSend(v3, "setObject:forKey:", fieldName, CFSTR("fieldName"));
  regex = self->_regex;
  if (regex)
    objc_msgSend(v4, "setObject:forKey:", regex, CFSTR("regex"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDictionaryMatchingRuleFieldRegexMatchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_fieldName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_regex)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_fieldName)
  {
    objc_msgSend(v4, "setFieldName:");
    v4 = v5;
  }
  if (self->_regex)
  {
    objc_msgSend(v5, "setRegex:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_fieldName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_regex, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *fieldName;
  NSString *regex;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((fieldName = self->_fieldName, !((unint64_t)fieldName | v4[1]))
     || -[NSString isEqual:](fieldName, "isEqual:")))
  {
    regex = self->_regex;
    if ((unint64_t)regex | v4[2])
      v7 = -[NSString isEqual:](regex, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_fieldName, "hash");
  return -[NSString hash](self->_regex, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch setFieldName:](self, "setFieldName:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch setRegex:](self, "setRegex:");
    v4 = v5;
  }

}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (NSString)regex
{
  return self->_regex;
}

- (void)setRegex:(id)a3
{
  objc_storeStrong((id *)&self->_regex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regex, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

- (BOOL)matches:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v17;

  v6 = a3;
  if (-[TPPBDictionaryMatchingRuleFieldRegexMatch hasFieldName](self, "hasFieldName"))
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch fieldName](self, "fieldName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "length");

  }
  v8 = objc_alloc(MEMORY[0x1E0CB38E8]);
  -[TPPBDictionaryMatchingRuleFieldRegexMatch regex](self, "regex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = (void *)objc_msgSend(v8, "initWithPattern:options:error:", v9, 0, &v17);
  v11 = v17;

  if (v10)
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch fieldName](self, "fieldName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "numberOfMatchesInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length")) != 0;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
    if (a4 && v11)
    {
      v15 = 0;
      *a4 = objc_retainAutorelease(v11);
    }
  }

  return v15;
}

@end
