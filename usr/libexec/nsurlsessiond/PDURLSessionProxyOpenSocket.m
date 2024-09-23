@implementation PDURLSessionProxyOpenSocket

- (BOOL)hasSession
{
  return self->_session != 0;
}

- (BOOL)hasSocketUUID
{
  return self->_socketUUID != 0;
}

- (BOOL)hasHost
{
  return self->_host != 0;
}

- (void)setPort:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_port = a3;
}

- (void)setHasPort:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPort
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyOpenSocket;
  v3 = -[PDURLSessionProxyOpenSocket description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyOpenSocket dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxySessionMessage *session;
  void *v5;
  NSString *socketUUID;
  NSString *host;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  session = self->_session;
  if (session)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxySessionMessage dictionaryRepresentation](session, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("session"));

  }
  socketUUID = self->_socketUUID;
  if (socketUUID)
    objc_msgSend(v3, "setObject:forKey:", socketUUID, CFSTR("socketUUID"));
  host = self->_host;
  if (host)
    objc_msgSend(v3, "setObject:forKey:", host, CFSTR("host"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_port));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("port"));

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
  BOOL v10;
  int v11;
  PDURLSessionProxySessionMessage *v13;
  int v14;
  uint64_t String;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  _QWORD v26[2];

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
    switch((v7 >> 3))
    {
      case 1u:
        v13 = objc_alloc_init(PDURLSessionProxySessionMessage);
        objc_storeStrong((id *)&self->_session, v13);
        v26[0] = 0;
        v26[1] = 0;
        if (PBReaderPlaceMark(a3, v26) && (sub_1000640A8((uint64_t)v13, (uint64_t)a3) & 1) != 0)
        {
          PBReaderRecallMark(a3, v26);

          continue;
        }

        LOBYTE(v14) = 0;
        return v14;
      case 2u:
        String = PBReaderReadString(a3);
        v16 = objc_claimAutoreleasedReturnValue(String);
        v17 = 32;
        goto LABEL_25;
      case 3u:
        v18 = PBReaderReadString(a3);
        v16 = objc_claimAutoreleasedReturnValue(v18);
        v17 = 8;
LABEL_25:
        v19 = *(void **)&self->PBCodable_opaque[v17];
        *(_QWORD *)&self->PBCodable_opaque[v17] = v16;

        continue;
      case 4u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)&self->_has |= 1u;
        break;
      default:
        v14 = PBReaderSkipValueWithTag(a3);
        if (!v14)
          return v14;
        continue;
    }
    while (1)
    {
      v23 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v23 == -1 || v23 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v24 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v23);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
      v22 |= (unint64_t)(v24 & 0x7F) << v20;
      if ((v24 & 0x80) == 0)
        goto LABEL_34;
      v20 += 7;
      v10 = v21++ >= 9;
      if (v10)
      {
        LODWORD(v22) = 0;
        goto LABEL_36;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v22) = 0;
LABEL_36:
    self->_port = v22;
  }
  LOBYTE(v14) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  NSString *socketUUID;
  NSString *host;
  id v8;

  v4 = a3;
  session = self->_session;
  v8 = v4;
  if (session)
  {
    PBDataWriterWriteSubmessage(v4, session, 1);
    v4 = v8;
  }
  socketUUID = self->_socketUUID;
  if (socketUUID)
  {
    PBDataWriterWriteStringField(v8, socketUUID, 2);
    v4 = v8;
  }
  host = self->_host;
  if (host)
  {
    PBDataWriterWriteStringField(v8, host, 3);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_port, 4);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_session)
  {
    objc_msgSend(v4, "setSession:");
    v4 = v5;
  }
  if (self->_socketUUID)
  {
    objc_msgSend(v5, "setSocketUUID:");
    v4 = v5;
  }
  if (self->_host)
  {
    objc_msgSend(v5, "setHost:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_port;
    *((_BYTE *)v4 + 40) |= 1u;
  }

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
  v6 = -[PDURLSessionProxySessionMessage copyWithZone:](self->_session, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_socketUUID, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_host, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_port;
    *((_BYTE *)v5 + 40) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  NSString *socketUUID;
  NSString *host;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_12;
  session = self->_session;
  if ((unint64_t)session | *((_QWORD *)v4 + 3))
  {
    if (!-[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:"))
      goto LABEL_12;
  }
  socketUUID = self->_socketUUID;
  if ((unint64_t)socketUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](socketUUID, "isEqual:"))
      goto LABEL_12;
  }
  host = self->_host;
  if ((unint64_t)host | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](host, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_port == *((_DWORD *)v4 + 4))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[PDURLSessionProxySessionMessage hash](self->_session, "hash");
  v4 = -[NSString hash](self->_socketUUID, "hash");
  v5 = -[NSString hash](self->_host, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_port;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  uint64_t v6;
  id v7;

  v4 = a3;
  session = self->_session;
  v6 = *((_QWORD *)v4 + 3);
  v7 = v4;
  if (session)
  {
    if (!v6)
      goto LABEL_7;
    -[PDURLSessionProxySessionMessage mergeFrom:](session, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PDURLSessionProxyOpenSocket setSession:](self, "setSession:");
  }
  v4 = v7;
LABEL_7:
  if (*((_QWORD *)v4 + 4))
  {
    -[PDURLSessionProxyOpenSocket setSocketUUID:](self, "setSocketUUID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PDURLSessionProxyOpenSocket setHost:](self, "setHost:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_port = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (PDURLSessionProxySessionMessage)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSString)socketUUID
{
  return self->_socketUUID;
}

- (void)setSocketUUID:(id)a3
{
  objc_storeStrong((id *)&self->_socketUUID, a3);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (unsigned)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketUUID, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
