@implementation PDURLSessionProxyTaskMessage

- (BOOL)hasSession
{
  return self->_session != 0;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_taskIdentifier = a3;
}

- (void)setHasTaskIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTaskIdentifier
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
  v8.super_class = (Class)PDURLSessionProxyTaskMessage;
  v3 = -[PDURLSessionProxyTaskMessage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxySessionMessage *session;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  session = self->_session;
  if (session)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxySessionMessage dictionaryRepresentation](session, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("session"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_taskIdentifier));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("taskIdentifier"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005C020((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  id v6;

  v4 = a3;
  session = self->_session;
  v6 = v4;
  if (session)
  {
    PBDataWriterWriteSubmessage(v4, session, 1);
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v6, self->_taskIdentifier, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_session)
  {
    v5 = v4;
    objc_msgSend(v4, "setSession:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_taskIdentifier;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[PDURLSessionProxySessionMessage copyWithZone:](self->_session, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_taskIdentifier;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_8;
  session = self->_session;
  if ((unint64_t)session | *((_QWORD *)v4 + 2))
  {
    if (!-[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_taskIdentifier == *((_QWORD *)v4 + 1))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[PDURLSessionProxySessionMessage hash](self->_session, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_taskIdentifier;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxySessionMessage *session;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  session = self->_session;
  v6 = v4[2];
  if (session)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[PDURLSessionProxySessionMessage mergeFrom:](session, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[PDURLSessionProxyTaskMessage setSession:](self, "setSession:");
  }
  v4 = v7;
LABEL_7:
  if ((v4[3] & 1) != 0)
  {
    self->_taskIdentifier = v4[1];
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

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
