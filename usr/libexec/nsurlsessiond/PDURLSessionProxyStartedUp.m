@implementation PDURLSessionProxyStartedUp

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLaunchUUID
{
  return self->_launchUUID != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyStartedUp;
  v3 = -[PDURLSessionProxyStartedUp description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyStartedUp dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *launchUUID;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  launchUUID = self->_launchUUID;
  if (launchUUID)
    objc_msgSend(v3, "setObject:forKey:", launchUUID, CFSTR("launchUUID"));
  return v3;
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
  char v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t String;
  NSString *v19;
  NSString *launchUUID;
  int v21;

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
    if ((v7 >> 3) == 2)
    {
      String = PBReaderReadString(a3);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue(String);
      launchUUID = self->_launchUUID;
      self->_launchUUID = v19;

    }
    else if ((v7 >> 3) == 1)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_BYTE *)&self->_has |= 1u;
      while (1)
      {
        v16 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v16 == -1 || v16 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v17 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
        v15 |= (unint64_t)(v17 & 0x7F) << v13;
        if ((v17 & 0x80) == 0)
          goto LABEL_30;
        v13 += 7;
        v10 = v14++ >= 9;
        if (v10)
        {
          LODWORD(v15) = 0;
          goto LABEL_32;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v15) = 0;
LABEL_32:
      self->_version = v15;
    }
    else
    {
      v21 = PBReaderSkipValueWithTag(a3);
      if (!v21)
        return v21;
    }
  }
  LOBYTE(v21) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v21;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *launchUUID;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1);
    v4 = v6;
  }
  launchUUID = self->_launchUUID;
  if (launchUUID)
  {
    PBDataWriterWriteStringField(v6, launchUUID, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_version;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  if (self->_launchUUID)
  {
    v5 = v4;
    objc_msgSend(v4, "setLaunchUUID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_version;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_launchUUID, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *launchUUID;
  unsigned __int8 v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  launchUUID = self->_launchUUID;
  if ((unint64_t)launchUUID | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](launchUUID, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_version;
  else
    v2 = 0;
  return -[NSString hash](self->_launchUUID, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_version = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[PDURLSessionProxyStartedUp setLaunchUUID:](self, "setLaunchUUID:");
    v4 = v5;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (NSString)launchUUID
{
  return self->_launchUUID;
}

- (void)setLaunchUUID:(id)a3
{
  objc_storeStrong((id *)&self->_launchUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchUUID, 0);
}

@end
