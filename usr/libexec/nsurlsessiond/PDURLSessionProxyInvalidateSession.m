@implementation PDURLSessionProxyInvalidateSession

- (BOOL)hasSession
{
  return self->_session != 0;
}

- (void)setShouldCancel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldCancel = a3;
}

- (void)setHasShouldCancel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldCancel
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
  v8.super_class = (Class)PDURLSessionProxyInvalidateSession;
  v3 = -[PDURLSessionProxyInvalidateSession description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyInvalidateSession dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_shouldCancel));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("shouldCancel"));

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
  char v14;
  unsigned int v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  int v19;
  _QWORD v21[2];

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
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_BYTE *)&self->_has |= 1u;
      while (1)
      {
        v17 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v17 == -1 || v17 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v18 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
        v16 |= (unint64_t)(v18 & 0x7F) << v14;
        if ((v18 & 0x80) == 0)
          goto LABEL_32;
        v14 += 7;
        v10 = v15++ >= 9;
        if (v10)
        {
          v16 = 0;
          goto LABEL_34;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v16 = 0;
LABEL_34:
      self->_shouldCancel = v16 != 0;
    }
    else if ((v7 >> 3) == 1)
    {
      v13 = objc_alloc_init(PDURLSessionProxySessionMessage);
      objc_storeStrong((id *)&self->_session, v13);
      v21[0] = 0;
      v21[1] = 0;
      if (!PBReaderPlaceMark(a3, v21) || (sub_1000640A8((uint64_t)v13, (uint64_t)a3) & 1) == 0)
      {

        LOBYTE(v19) = 0;
        return v19;
      }
      PBReaderRecallMark(a3, v21);

    }
    else
    {
      v19 = PBReaderSkipValueWithTag(a3);
      if (!v19)
        return v19;
    }
  }
  LOBYTE(v19) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v19;
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
    PBDataWriterWriteBOOLField(v6, self->_shouldCancel, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if (self->_session)
  {
    v5 = v4;
    objc_msgSend(v4, "setSession:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_shouldCancel;
    v4[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[PDURLSessionProxySessionMessage copyWithZone:](self->_session, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v5 + 16) = self->_shouldCancel;
    *((_BYTE *)v5 + 20) |= 1u;
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
    goto LABEL_6;
  session = self->_session;
  if ((unint64_t)session | *((_QWORD *)v4 + 1))
  {
    if (!-[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:"))
      goto LABEL_6;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_7;
    }
    if (self->_shouldCancel)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_6;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_6;
    }
    v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[PDURLSessionProxySessionMessage hash](self->_session, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_shouldCancel;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  uint64_t v6;
  id v7;

  v4 = a3;
  session = self->_session;
  v6 = *((_QWORD *)v4 + 1);
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
    -[PDURLSessionProxyInvalidateSession setSession:](self, "setSession:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_shouldCancel = *((_BYTE *)v4 + 16);
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

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
