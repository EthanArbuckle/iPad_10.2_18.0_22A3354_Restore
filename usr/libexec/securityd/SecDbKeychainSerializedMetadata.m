@implementation SecDbKeychainSerializedMetadata

- (void)writeTo:(id)a3
{
  NSData *ciphertext;
  id v5;

  ciphertext = self->_ciphertext;
  v5 = a3;
  PBDataWriterWriteDataField(v5, ciphertext, 1);
  PBDataWriterWriteDataField(v5, self->_wrappedKey, 2);
  PBDataWriterWriteStringField(v5, self->_tamperCheck, 3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_tamperCheck, 0);
  objc_storeStrong((id *)&self->_ciphertext, 0);
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t String;
  uint64_t Data;
  void *v19;

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
        if (v6++ >= 9)
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
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      v13 = v7 >> 3;
      if ((v7 >> 3) == 3)
        break;
      if ((_DWORD)v13 == 2)
      {
        Data = PBReaderReadData(a3);
        v15 = objc_claimAutoreleasedReturnValue(Data);
        v16 = 24;
        goto LABEL_23;
      }
      if ((_DWORD)v13 == 1)
      {
        v14 = PBReaderReadData(a3);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        v16 = 8;
LABEL_23:
        v19 = *(void **)&self->PBCodable_opaque[v16];
        *(_QWORD *)&self->PBCodable_opaque[v16] = v15;

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
        return 0;
LABEL_25:
      if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    String = PBReaderReadString(a3);
    v15 = objc_claimAutoreleasedReturnValue(String);
    v16 = 16;
    goto LABEL_23;
  }
  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (NSString)tamperCheck
{
  return self->_tamperCheck;
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (NSData)ciphertext
{
  return self->_ciphertext;
}

- (void)setWrappedKey:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedKey, a3);
}

- (void)setTamperCheck:(id)a3
{
  objc_storeStrong((id *)&self->_tamperCheck, a3);
}

- (void)setCiphertext:(id)a3
{
  objc_storeStrong((id *)&self->_ciphertext, a3);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SecDbKeychainSerializedMetadata;
  v3 = -[SecDbKeychainSerializedMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *ciphertext;
  NSData *wrappedKey;
  NSString *tamperCheck;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  ciphertext = self->_ciphertext;
  if (ciphertext)
    objc_msgSend(v3, "setObject:forKey:", ciphertext, CFSTR("ciphertext"));
  wrappedKey = self->_wrappedKey;
  if (wrappedKey)
    objc_msgSend(v4, "setObject:forKey:", wrappedKey, CFSTR("wrappedKey"));
  tamperCheck = self->_tamperCheck;
  if (tamperCheck)
    objc_msgSend(v4, "setObject:forKey:", tamperCheck, CFSTR("tamperCheck"));
  return v4;
}

- (void)copyTo:(id)a3
{
  NSData *ciphertext;
  id v5;

  ciphertext = self->_ciphertext;
  v5 = a3;
  objc_msgSend(v5, "setCiphertext:", ciphertext);
  objc_msgSend(v5, "setWrappedKey:", self->_wrappedKey);
  objc_msgSend(v5, "setTamperCheck:", self->_tamperCheck);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_ciphertext, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_wrappedKey, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_tamperCheck, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *ciphertext;
  NSData *wrappedKey;
  NSString *tamperCheck;
  unsigned __int8 v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((ciphertext = self->_ciphertext, !((unint64_t)ciphertext | v4[1]))
     || -[NSData isEqual:](ciphertext, "isEqual:"))
    && ((wrappedKey = self->_wrappedKey, !((unint64_t)wrappedKey | v4[3]))
     || -[NSData isEqual:](wrappedKey, "isEqual:")))
  {
    tamperCheck = self->_tamperCheck;
    if ((unint64_t)tamperCheck | v4[2])
      v8 = -[NSString isEqual:](tamperCheck, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = (unint64_t)-[NSData hash](self->_ciphertext, "hash");
  v4 = (unint64_t)-[NSData hash](self->_wrappedKey, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_tamperCheck, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[SecDbKeychainSerializedMetadata setCiphertext:](self, "setCiphertext:");
  if (v4[3])
    -[SecDbKeychainSerializedMetadata setWrappedKey:](self, "setWrappedKey:");
  if (v4[2])
    -[SecDbKeychainSerializedMetadata setTamperCheck:](self, "setTamperCheck:");

}

@end
