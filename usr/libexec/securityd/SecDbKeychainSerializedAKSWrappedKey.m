@implementation SecDbKeychainSerializedAKSWrappedKey

- (void)writeTo:(id)a3
{
  NSData *refKeyBlob;
  id v5;

  v5 = a3;
  ((void (*)(void))PBDataWriterWriteDataField)();
  refKeyBlob = self->_refKeyBlob;
  if (refKeyBlob)
    PBDataWriterWriteDataField(v5, refKeyBlob, 2);
  PBDataWriterWriteUint32Field(v5, self->_type, 3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_refKeyBlob, 0);
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  unint64_t v13;
  char v14;
  unsigned int v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t Data;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;

  while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      break;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v5 += 7;
      v10 = v6++ >= 9;
      if (v10)
      {
        v7 = 0;
        v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v7 = 0;
LABEL_13:
    if (v11 || (v7 & 7) == 4)
      break;
    v13 = v7 >> 3;
    if ((v7 >> 3) == 1)
    {
      Data = PBReaderReadData(a3);
      v20 = objc_claimAutoreleasedReturnValue(Data);
      v21 = 24;
    }
    else
    {
      if ((_DWORD)v13 != 2)
      {
        if ((_DWORD)v13 == 3)
        {
          v14 = 0;
          v15 = 0;
          v16 = 0;
          while (1)
          {
            v17 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v17 == -1 || v17 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
              break;
            v18 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if ((v18 & 0x80) == 0)
              goto LABEL_33;
            v14 += 7;
            v10 = v15++ >= 9;
            if (v10)
            {
              LODWORD(v16) = 0;
              goto LABEL_35;
            }
          }
          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            LODWORD(v16) = 0;
LABEL_35:
          self->_type = v16;
        }
        else
        {
          v24 = PBReaderSkipValueWithTag(a3);
          if (!v24)
            return v24;
        }
        continue;
      }
      v22 = PBReaderReadData(a3);
      v20 = objc_claimAutoreleasedReturnValue(v22);
      v21 = 8;
    }
    v23 = *(void **)&self->PBCodable_opaque[v21];
    *(_QWORD *)&self->PBCodable_opaque[v21] = v20;

  }
  LOBYTE(v24) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v24;
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setWrappedKey:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedKey, a3);
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (BOOL)hasRefKeyBlob
{
  return self->_refKeyBlob != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SecDbKeychainSerializedAKSWrappedKey;
  v3 = -[SecDbKeychainSerializedAKSWrappedKey description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedAKSWrappedKey dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *wrappedKey;
  NSData *refKeyBlob;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  wrappedKey = self->_wrappedKey;
  if (wrappedKey)
    objc_msgSend(v3, "setObject:forKey:", wrappedKey, CFSTR("wrappedKey"));
  refKeyBlob = self->_refKeyBlob;
  if (refKeyBlob)
    objc_msgSend(v4, "setObject:forKey:", refKeyBlob, CFSTR("refKeyBlob"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_type));
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

  return v4;
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "setWrappedKey:", self->_wrappedKey);
  if (self->_refKeyBlob)
    objc_msgSend(v4, "setRefKeyBlob:");
  v4[4] = self->_type;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_wrappedKey, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSData copyWithZone:](self->_refKeyBlob, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  *((_DWORD *)v5 + 4) = self->_type;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *wrappedKey;
  NSData *refKeyBlob;
  BOOL v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((wrappedKey = self->_wrappedKey, !((unint64_t)wrappedKey | *((_QWORD *)v4 + 3)))
     || -[NSData isEqual:](wrappedKey, "isEqual:"))
    && ((refKeyBlob = self->_refKeyBlob, !((unint64_t)refKeyBlob | *((_QWORD *)v4 + 1)))
     || -[NSData isEqual:](refKeyBlob, "isEqual:"))
    && self->_type == *((_DWORD *)v4 + 4);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSData hash](self->_wrappedKey, "hash");
  return (unint64_t)-[NSData hash](self->_refKeyBlob, "hash") ^ v3 ^ (2654435761 * self->_type);
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SecDbKeychainSerializedAKSWrappedKey setWrappedKey:](self, "setWrappedKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[SecDbKeychainSerializedAKSWrappedKey setRefKeyBlob:](self, "setRefKeyBlob:");
    v4 = v5;
  }
  self->_type = v4[4];

}

- (NSData)refKeyBlob
{
  return self->_refKeyBlob;
}

- (void)setRefKeyBlob:(id)a3
{
  objc_storeStrong((id *)&self->_refKeyBlob, a3);
}

@end
