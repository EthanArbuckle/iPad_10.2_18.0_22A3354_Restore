@implementation SecDbKeychainSerializedItemV7

- (void)writeTo:(id)a3
{
  NSData *encryptedSecretData;
  id v5;

  encryptedSecretData = self->_encryptedSecretData;
  v5 = a3;
  PBDataWriterWriteDataField(v5, encryptedSecretData, 1);
  PBDataWriterWriteDataField(v5, self->_encryptedMetadata, 2);
  PBDataWriterWriteInt32Field(v5, self->_keyclass, 3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedSecretData, 0);
  objc_storeStrong((id *)&self->_encryptedMetadata, 0);
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
      v21 = 16;
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
          self->_keyclass = v16;
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

- (int)keyclass
{
  return self->_keyclass;
}

- (NSData)encryptedSecretData
{
  return self->_encryptedSecretData;
}

- (NSData)encryptedMetadata
{
  return self->_encryptedMetadata;
}

- (void)setKeyclass:(int)a3
{
  self->_keyclass = a3;
}

- (void)setEncryptedSecretData:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedSecretData, a3);
}

- (void)setEncryptedMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedMetadata, a3);
}

- (id)keyclassAsString:(int)a3
{
  if ((a3 - 6) >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_1002E9D80[a3 - 6];
}

- (int)StringAsKeyclass:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEYCLASS_AK")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEYCLASS_CK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEYCLASS_DK")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEYCLASS_AKU")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEYCLASS_CKU")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEYCLASS_DKU")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KEYCLASS_AKPU")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 6;
  }

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SecDbKeychainSerializedItemV7;
  v3 = -[SecDbKeychainSerializedItemV7 description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedItemV7 dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encryptedSecretData;
  NSData *encryptedMetadata;
  unsigned int v7;
  __CFString *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  encryptedSecretData = self->_encryptedSecretData;
  if (encryptedSecretData)
    objc_msgSend(v3, "setObject:forKey:", encryptedSecretData, CFSTR("encryptedSecretData"));
  encryptedMetadata = self->_encryptedMetadata;
  if (encryptedMetadata)
    objc_msgSend(v4, "setObject:forKey:", encryptedMetadata, CFSTR("encryptedMetadata"));
  v7 = self->_keyclass - 6;
  if (v7 >= 7)
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_keyclass));
  else
    v8 = off_1002E9D80[v7];
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("keyclass"));

  return v4;
}

- (void)copyTo:(id)a3
{
  NSData *encryptedSecretData;
  _DWORD *v5;

  encryptedSecretData = self->_encryptedSecretData;
  v5 = a3;
  objc_msgSend(v5, "setEncryptedSecretData:", encryptedSecretData);
  objc_msgSend(v5, "setEncryptedMetadata:", self->_encryptedMetadata);
  v5[6] = self->_keyclass;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_encryptedSecretData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_encryptedMetadata, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  *((_DWORD *)v5 + 6) = self->_keyclass;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *encryptedSecretData;
  NSData *encryptedMetadata;
  BOOL v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((encryptedSecretData = self->_encryptedSecretData, !((unint64_t)encryptedSecretData | *((_QWORD *)v4 + 2)))
     || -[NSData isEqual:](encryptedSecretData, "isEqual:"))
    && ((encryptedMetadata = self->_encryptedMetadata, !((unint64_t)encryptedMetadata | *((_QWORD *)v4 + 1)))
     || -[NSData isEqual:](encryptedMetadata, "isEqual:"))
    && self->_keyclass == *((_DWORD *)v4 + 6);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSData hash](self->_encryptedSecretData, "hash");
  return (unint64_t)-[NSData hash](self->_encryptedMetadata, "hash") ^ v3 ^ (2654435761 * self->_keyclass);
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[SecDbKeychainSerializedItemV7 setEncryptedSecretData:](self, "setEncryptedSecretData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[SecDbKeychainSerializedItemV7 setEncryptedMetadata:](self, "setEncryptedMetadata:");
    v4 = v5;
  }
  self->_keyclass = v4[6];

}

@end
