@implementation APPBNumericParameter

+ (id)options
{
  if (qword_100269960 != -1)
    dispatch_once(&qword_100269960, &stru_100215338);
  return (id)qword_100269958;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBNumericParameter;
  v3 = -[APPBNumericParameter description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBNumericParameter dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_value));
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("value"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBNumericParameterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *key;
  id v6;

  v4 = a3;
  key = self->_key;
  if (!key)
    sub_10017BCBC();
  v6 = v4;
  PBDataWriterWriteStringField(v4, key, 1);
  PBDataWriterWriteInt32Field(v6, self->_value, 2);

}

- (void)copyTo:(id)a3
{
  NSString *key;
  _DWORD *v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "setKey:", key);
  v5[4] = self->_value;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  *((_DWORD *)v5 + 4) = self->_value;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((key = self->_key, !((unint64_t)key | *((_QWORD *)v4 + 1)))
     || -[NSString isEqual:](key, "isEqual:"))
    && self->_value == *((_DWORD *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_value) ^ -[NSString hash](self->_key, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[APPBNumericParameter setKey:](self, "setKey:");
    v4 = v5;
  }
  self->_value = v4[4];

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (int)value
{
  return self->_value;
}

- (void)setValue:(int)a3
{
  self->_value = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
