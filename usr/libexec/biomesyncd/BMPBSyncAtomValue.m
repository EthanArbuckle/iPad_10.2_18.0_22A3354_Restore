@implementation BMPBSyncAtomValue

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMPBSyncAtomValue;
  v3 = -[BMPBSyncAtomValue description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMPBSyncAtomValue dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  __CFString *v5;
  BMPBStoreEventAtomValue *value;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type >= 5)
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type));
    else
      v5 = off_100069148[type];
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  value = self->_value;
  if (value)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMPBStoreEventAtomValue dictionaryRepresentation](value, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("value"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100019CA0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  BMPBStoreEventAtomValue *value;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_type, 1);
    v4 = v6;
  }
  value = self->_value;
  if (value)
  {
    PBDataWriterWriteSubmessage(v6, value, 2);
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_type;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  v7 = -[BMPBStoreEventAtomValue copyWithZone:](self->_value, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BMPBStoreEventAtomValue *value;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 2))
    v7 = -[BMPBStoreEventAtomValue isEqual:](value, "isEqual:");
  else
    v7 = 1;
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_type;
  else
    v2 = 0;
  return -[BMPBStoreEventAtomValue hash](self->_value, "hash") ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
