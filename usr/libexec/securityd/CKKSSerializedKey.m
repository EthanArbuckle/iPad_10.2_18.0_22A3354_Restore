@implementation CKKSSerializedKey

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKKSSerializedKey;
  v3 = -[CKKSSerializedKey description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  NSString *zoneName;
  NSString *keyclass;
  NSData *key;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  zoneName = self->_zoneName;
  if (zoneName)
    objc_msgSend(v4, "setObject:forKey:", zoneName, CFSTR("zoneName"));
  keyclass = self->_keyclass;
  if (keyclass)
    objc_msgSend(v4, "setObject:forKey:", keyclass, CFSTR("keyclass"));
  key = self->_key;
  if (key)
    objc_msgSend(v4, "setObject:forKey:", key, CFSTR("key"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v11;
  uint64_t String;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
      switch((v7 >> 3))
      {
        case 1u:
          String = PBReaderReadString(a3);
          v14 = objc_claimAutoreleasedReturnValue(String);
          v15 = 24;
          goto LABEL_24;
        case 2u:
          v16 = PBReaderReadString(a3);
          v14 = objc_claimAutoreleasedReturnValue(v16);
          v15 = 32;
          goto LABEL_24;
        case 3u:
          v17 = PBReaderReadString(a3);
          v14 = objc_claimAutoreleasedReturnValue(v17);
          v15 = 16;
          goto LABEL_24;
        case 4u:
          Data = PBReaderReadData(a3);
          v14 = objc_claimAutoreleasedReturnValue(Data);
          v15 = 8;
LABEL_24:
          v19 = *(void **)&self->PBCodable_opaque[v15];
          *(_QWORD *)&self->PBCodable_opaque[v15] = v14;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
            return 0;
LABEL_25:
          if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          break;
      }
    }
  }
  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  NSString *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  PBDataWriterWriteStringField(v5, uuid, 1);
  PBDataWriterWriteStringField(v5, self->_zoneName, 2);
  PBDataWriterWriteStringField(v5, self->_keyclass, 3);
  PBDataWriterWriteDataField(v5, self->_key, 4);

}

- (void)copyTo:(id)a3
{
  NSString *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "setUuid:", uuid);
  objc_msgSend(v5, "setZoneName:", self->_zoneName);
  objc_msgSend(v5, "setKeyclass:", self->_keyclass);
  objc_msgSend(v5, "setKey:", self->_key);

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
  id v12;
  void *v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_keyclass, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSData copyWithZone:](self->_key, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuid;
  NSString *zoneName;
  NSString *keyclass;
  NSData *key;
  unsigned __int8 v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[3])) || -[NSString isEqual:](uuid, "isEqual:"))
    && ((zoneName = self->_zoneName, !((unint64_t)zoneName | v4[4]))
     || -[NSString isEqual:](zoneName, "isEqual:"))
    && ((keyclass = self->_keyclass, !((unint64_t)keyclass | v4[2]))
     || -[NSString isEqual:](keyclass, "isEqual:")))
  {
    key = self->_key;
    if ((unint64_t)key | v4[1])
      v9 = -[NSData isEqual:](key, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_uuid, "hash");
  v4 = -[NSString hash](self->_zoneName, "hash") ^ v3;
  v5 = -[NSString hash](self->_keyclass, "hash");
  return v4 ^ v5 ^ (unint64_t)-[NSData hash](self->_key, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[CKKSSerializedKey setUuid:](self, "setUuid:");
  if (v4[4])
    -[CKKSSerializedKey setZoneName:](self, "setZoneName:");
  if (v4[2])
    -[CKKSSerializedKey setKeyclass:](self, "setKeyclass:");
  if (v4[1])
    -[CKKSSerializedKey setKey:](self, "setKey:");

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_zoneName, a3);
}

- (NSString)keyclass
{
  return self->_keyclass;
}

- (void)setKeyclass:(id)a3
{
  objc_storeStrong((id *)&self->_keyclass, a3);
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_keyclass, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
