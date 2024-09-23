@implementation CLAuthSyncVectorClock

- (void)dealloc
{
  objc_super v3;

  -[CLAuthSyncVectorClock setKey:](self, "setKey:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLAuthSyncVectorClock;
  -[CLAuthSyncVectorClock dealloc](&v3, "dealloc");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setValue:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAuthSyncVectorClock;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CLAuthSyncVectorClock description](&v3, "description"), -[CLAuthSyncVectorClock dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *key;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_value), CFSTR("value"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10094D534((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *key;

  key = self->_key;
  if (key)
    PBDataWriterWriteStringField(a3, key, 1);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(a3, self->_value, 2);
}

- (void)copyTo:(id)a3
{
  if (self->_key)
    objc_msgSend(a3, "setKey:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_value;
    *((_BYTE *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");

  v5[1] = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_value;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *key;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    key = self->_key;
    if (!((unint64_t)key | *((_QWORD *)a3 + 1))
      || (v5 = -[NSString isEqual:](key, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) != 0 && self->_value == *((_DWORD *)a3 + 4);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_value;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[CLAuthSyncVectorClock setKey:](self, "setKey:");
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_value = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unsigned)value
{
  return self->_value;
}

@end
