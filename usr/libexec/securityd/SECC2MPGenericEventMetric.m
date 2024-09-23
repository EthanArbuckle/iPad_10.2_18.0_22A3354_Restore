@implementation SECC2MPGenericEventMetric

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SECC2MPGenericEventMetric;
  v3 = -[SECC2MPGenericEventMetric description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEventMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  SECC2MPGenericEventMetricValue *value;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  value = self->_value;
  if (value)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEventMetricValue dictionaryRepresentation](value, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("value"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000887A4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *key;
  SECC2MPGenericEventMetricValue *value;
  id v7;

  v4 = a3;
  key = self->_key;
  v7 = v4;
  if (key)
  {
    PBDataWriterWriteStringField(v4, key, 101);
    v4 = v7;
  }
  value = self->_value;
  if (value)
  {
    PBDataWriterWriteSubmessage(v7, value, 201);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if (self->_value)
  {
    objc_msgSend(v5, "setValue:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SECC2MPGenericEventMetricValue copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  SECC2MPGenericEventMetricValue *value;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2])
      v7 = -[SECC2MPGenericEventMetricValue isEqual:](value, "isEqual:");
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

  v3 = -[NSString hash](self->_key, "hash");
  return -[SECC2MPGenericEventMetricValue hash](self->_value, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SECC2MPGenericEventMetricValue *value;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[SECC2MPGenericEventMetric setKey:](self, "setKey:");
    v4 = v7;
  }
  value = self->_value;
  v6 = v4[2];
  if (value)
  {
    if (v6)
    {
      -[SECC2MPGenericEventMetricValue mergeFrom:](value, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[SECC2MPGenericEventMetric setValue:](self, "setValue:");
    goto LABEL_8;
  }

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (SECC2MPGenericEventMetricValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
