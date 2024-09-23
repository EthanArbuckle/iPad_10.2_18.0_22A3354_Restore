@implementation KCSharingPBRemoteItem

- (BOOL)hasPrivateKey
{
  return self->_privateKey != 0;
}

- (BOOL)hasInternetPassword
{
  return self->_internetPassword != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCSharingPBRemoteItem;
  v3 = -[KCSharingPBRemoteItem description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBRemoteItem dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  KCSharingPBPrivateKeyCredential *privateKey;
  void *v5;
  KCSharingPBInternetPasswordCredential *internetPassword;
  void *v7;
  PBUnknownFields *unknownFields;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  privateKey = self->_privateKey;
  if (privateKey)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBPrivateKeyCredential dictionaryRepresentation](privateKey, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("privateKey"));

  }
  internetPassword = self->_internetPassword;
  if (internetPassword)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBInternetPasswordCredential dictionaryRepresentation](internetPassword, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("internetPassword"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v11;
  uint64_t v12;
  unint64_t v14;
  KCSharingPBPrivateKeyCredential *v15;
  PBUnknownFields *unknownFields;
  PBUnknownFields *v17;
  PBUnknownFields *v18;
  unint64_t v20;
  unint64_t v21;

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
      v12 = v7 & 7;
      if (v11 || (_DWORD)v12 == 4)
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      v14 = v7 >> 3;
      if ((v7 >> 3) == 3)
        break;
      if ((_DWORD)v14 == 2)
      {
        v15 = objc_alloc_init(KCSharingPBPrivateKeyCredential);
        objc_storeStrong((id *)&self->_privateKey, v15);
        v20 = 0xAAAAAAAAAAAAAAAALL;
        v21 = 0xAAAAAAAAAAAAAAAALL;
        if (!PBReaderPlaceMark(a3, &v20) || (sub_1000CA354((uint64_t)v15, (uint64_t)a3) & 1) == 0)
          goto LABEL_30;
LABEL_24:
        PBReaderRecallMark(a3, &v20);

        goto LABEL_28;
      }
      unknownFields = self->_unknownFields;
      if (!unknownFields)
      {
        v17 = (PBUnknownFields *)objc_alloc_init((Class)PBUnknownFields);
        v18 = self->_unknownFields;
        self->_unknownFields = v17;

        unknownFields = self->_unknownFields;
      }
      if ((PBUnknownFieldAdd(unknownFields, v14, v12, a3) & 1) == 0)
        return 0;
LABEL_28:
      if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v15 = objc_alloc_init(KCSharingPBInternetPasswordCredential);
    objc_storeStrong((id *)&self->_internetPassword, v15);
    v20 = 0xAAAAAAAAAAAAAAAALL;
    v21 = 0xAAAAAAAAAAAAAAAALL;
    if (!PBReaderPlaceMark(a3, &v20) || (sub_1001600AC((uint64_t)v15, (uint64_t)a3) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_24;
  }
  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;
  KCSharingPBPrivateKeyCredential *privateKey;
  KCSharingPBInternetPasswordCredential *internetPassword;
  id v8;

  v4 = a3;
  v5 = v4;
  privateKey = self->_privateKey;
  v8 = v4;
  if (privateKey)
  {
    PBDataWriterWriteSubmessage(v4, privateKey, 2);
    v5 = v8;
  }
  internetPassword = self->_internetPassword;
  if (internetPassword)
  {
    PBDataWriterWriteSubmessage(v5, internetPassword, 3);
    v5 = v8;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[KCSharingPBPrivateKeyCredential copyWithZone:](self->_privateKey, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v6;

  v8 = -[KCSharingPBInternetPasswordCredential copyWithZone:](self->_internetPassword, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v8;

  objc_storeStrong((id *)v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  KCSharingPBPrivateKeyCredential *privateKey;
  KCSharingPBInternetPasswordCredential *internetPassword;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((privateKey = self->_privateKey, !((unint64_t)privateKey | v4[3]))
     || -[KCSharingPBPrivateKeyCredential isEqual:](privateKey, "isEqual:")))
  {
    internetPassword = self->_internetPassword;
    if ((unint64_t)internetPassword | v4[2])
      v7 = -[KCSharingPBInternetPasswordCredential isEqual:](internetPassword, "isEqual:");
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
  unint64_t v3;

  v3 = -[KCSharingPBPrivateKeyCredential hash](self->_privateKey, "hash");
  return -[KCSharingPBInternetPasswordCredential hash](self->_internetPassword, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  KCSharingPBPrivateKeyCredential *privateKey;
  uint64_t v6;
  KCSharingPBInternetPasswordCredential *internetPassword;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  privateKey = self->_privateKey;
  v6 = v4[3];
  v9 = v4;
  if (privateKey)
  {
    if (!v6)
      goto LABEL_7;
    -[KCSharingPBPrivateKeyCredential mergeFrom:](privateKey, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[KCSharingPBRemoteItem setPrivateKey:](self, "setPrivateKey:");
  }
  v4 = v9;
LABEL_7:
  internetPassword = self->_internetPassword;
  v8 = v4[2];
  if (internetPassword)
  {
    if (v8)
    {
      -[KCSharingPBInternetPasswordCredential mergeFrom:](internetPassword, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[KCSharingPBRemoteItem setInternetPassword:](self, "setInternetPassword:");
    goto LABEL_12;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (KCSharingPBPrivateKeyCredential)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_privateKey, a3);
}

- (KCSharingPBInternetPasswordCredential)internetPassword
{
  return self->_internetPassword;
}

- (void)setInternetPassword:(id)a3
{
  objc_storeStrong((id *)&self->_internetPassword, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_internetPassword, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
