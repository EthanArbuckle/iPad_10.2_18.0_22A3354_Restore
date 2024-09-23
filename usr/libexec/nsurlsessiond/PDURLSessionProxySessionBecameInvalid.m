@implementation PDURLSessionProxySessionBecameInvalid

- (BOOL)hasSession
{
  return self->_session != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxySessionBecameInvalid;
  v3 = -[PDURLSessionProxySessionBecameInvalid description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxySessionBecameInvalid dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxySessionMessage *session;
  void *v5;
  PDURLSessionProxyError *error;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  session = self->_session;
  if (session)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxySessionMessage dictionaryRepresentation](session, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("session"));

  }
  error = self->_error;
  if (error)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyError dictionaryRepresentation](error, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("error"));

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
  PDURLSessionProxySessionMessage *v13;
  uint64_t v15;
  uint64_t v16;

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
      if ((v7 >> 3) == 2)
        break;
      if ((v7 >> 3) == 1)
      {
        v13 = objc_alloc_init(PDURLSessionProxySessionMessage);
        objc_storeStrong((id *)&self->_session, v13);
        v15 = 0;
        v16 = 0;
        if (!PBReaderPlaceMark(a3, &v15) || (sub_1000640A8((uint64_t)v13, (uint64_t)a3) & 1) == 0)
          goto LABEL_28;
LABEL_24:
        PBReaderRecallMark(a3, &v15);

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v13 = objc_alloc_init(PDURLSessionProxyError);
    objc_storeStrong((id *)&self->_error, v13);
    v15 = 0;
    v16 = 0;
    if (!PBReaderPlaceMark(a3, &v15) || (sub_10005DD0C((uint64_t)v13, (uint64_t)a3) & 1) == 0)
    {
LABEL_28:

      return 0;
    }
    goto LABEL_24;
  }
  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  PDURLSessionProxyError *error;
  id v7;

  v4 = a3;
  session = self->_session;
  v7 = v4;
  if (session)
  {
    PBDataWriterWriteSubmessage(v4, session, 1);
    v4 = v7;
  }
  error = self->_error;
  if (error)
  {
    PBDataWriterWriteSubmessage(v7, error, 2);
    v4 = v7;
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
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
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
  v6 = -[PDURLSessionProxySessionMessage copyWithZone:](self->_session, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[PDURLSessionProxyError copyWithZone:](self->_error, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxySessionMessage *session;
  PDURLSessionProxyError *error;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((session = self->_session, !((unint64_t)session | v4[2]))
     || -[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1])
      v7 = -[PDURLSessionProxyError isEqual:](error, "isEqual:");
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

  v3 = -[PDURLSessionProxySessionMessage hash](self->_session, "hash");
  return -[PDURLSessionProxyError hash](self->_error, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxySessionMessage *session;
  uint64_t v6;
  PDURLSessionProxyError *error;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  session = self->_session;
  v6 = v4[2];
  v9 = v4;
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
    -[PDURLSessionProxySessionBecameInvalid setSession:](self, "setSession:");
  }
  v4 = v9;
LABEL_7:
  error = self->_error;
  v8 = v4[1];
  if (error)
  {
    if (v8)
    {
      -[PDURLSessionProxyError mergeFrom:](error, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PDURLSessionProxySessionBecameInvalid setError:](self, "setError:");
    goto LABEL_12;
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

- (PDURLSessionProxyError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
