@implementation PDURLSessionProxyDidReceiveChallengeReply

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (int)disposition
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_disposition;
  else
    return 1;
}

- (void)setDisposition:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_disposition = a3;
}

- (void)setHasDisposition:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisposition
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)dispositionAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1000B0F00 + a3);
}

- (int)StringAsDisposition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UseCredential")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PerformDefaultHandling")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CancelAuthenticationChallenge")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RejectProtectionSpace")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCredential
{
  return self->_credential != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyDidReceiveChallengeReply;
  v3 = -[PDURLSessionProxyDidReceiveChallengeReply description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyDidReceiveChallengeReply dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxyTaskMessage *task;
  void *v5;
  uint64_t disposition;
  void *v7;
  PDURLSessionProxyCredential *credential;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  task = self->_task;
  if (task)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskMessage dictionaryRepresentation](task, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("task"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    disposition = self->_disposition;
    if (disposition >= 4)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_disposition));
    else
      v7 = *(&off_1000B0F00 + disposition);
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("disposition"));

  }
  credential = self->_credential;
  if (credential)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyCredential dictionaryRepresentation](credential, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("credential"));

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
  unint64_t v13;
  PDURLSessionProxyCredential *v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  int v20;
  uint64_t v22;
  uint64_t v23;

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
    if ((v7 >> 3) == 3)
    {
      v14 = objc_alloc_init(PDURLSessionProxyCredential);
      objc_storeStrong((id *)&self->_credential, v14);
      v22 = 0;
      v23 = 0;
      if (!PBReaderPlaceMark(a3, &v22) || (sub_10004EC90((uint64_t)v14, (uint64_t)a3) & 1) == 0)
      {
LABEL_41:

        LOBYTE(v20) = 0;
        return v20;
      }
    }
    else
    {
      if ((_DWORD)v13 == 2)
      {
        v15 = 0;
        v16 = 0;
        v17 = 0;
        *(_BYTE *)&self->_has |= 1u;
        while (1)
        {
          v18 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v18 == -1 || v18 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            break;
          v19 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
          *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
          v17 |= (unint64_t)(v19 & 0x7F) << v15;
          if ((v19 & 0x80) == 0)
            goto LABEL_36;
          v15 += 7;
          v10 = v16++ >= 9;
          if (v10)
          {
            LODWORD(v17) = 0;
            goto LABEL_38;
          }
        }
        *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v17) = 0;
LABEL_38:
        self->_disposition = v17;
        continue;
      }
      if ((_DWORD)v13 != 1)
      {
        v20 = PBReaderSkipValueWithTag(a3);
        if (!v20)
          return v20;
        continue;
      }
      v14 = objc_alloc_init(PDURLSessionProxyTaskMessage);
      objc_storeStrong((id *)&self->_task, v14);
      v22 = 0;
      v23 = 0;
      if (!PBReaderPlaceMark(a3, &v22) || (sub_10005C020((uint64_t)v14, (uint64_t)a3) & 1) == 0)
        goto LABEL_41;
    }
    PBReaderRecallMark(a3, &v22);

  }
  LOBYTE(v20) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyCredential *credential;
  id v7;

  v4 = a3;
  task = self->_task;
  v7 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v7, self->_disposition, 2);
    v4 = v7;
  }
  credential = self->_credential;
  if (credential)
  {
    PBDataWriterWriteSubmessage(v7, credential, 3);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_task)
  {
    objc_msgSend(v4, "setTask:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_disposition;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_credential)
  {
    objc_msgSend(v5, "setCredential:");
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
  v6 = -[PDURLSessionProxyTaskMessage copyWithZone:](self->_task, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_disposition;
    *((_BYTE *)v5 + 32) |= 1u;
  }
  v8 = -[PDURLSessionProxyCredential copyWithZone:](self->_credential, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyCredential *credential;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_11;
  task = self->_task;
  if ((unint64_t)task | *((_QWORD *)v4 + 3))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_disposition != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  credential = self->_credential;
  if ((unint64_t)credential | *((_QWORD *)v4 + 1))
    v7 = -[PDURLSessionProxyCredential isEqual:](credential, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[PDURLSessionProxyTaskMessage hash](self->_task, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_disposition;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[PDURLSessionProxyCredential hash](self->_credential, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  PDURLSessionProxyCredential *credential;
  uint64_t v8;
  id v9;

  v4 = a3;
  task = self->_task;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (task)
  {
    if (!v6)
      goto LABEL_7;
    -[PDURLSessionProxyTaskMessage mergeFrom:](task, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PDURLSessionProxyDidReceiveChallengeReply setTask:](self, "setTask:");
  }
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_disposition = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  credential = self->_credential;
  v8 = *((_QWORD *)v4 + 1);
  if (credential)
  {
    if (v8)
    {
      -[PDURLSessionProxyCredential mergeFrom:](credential, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PDURLSessionProxyDidReceiveChallengeReply setCredential:](self, "setCredential:");
    goto LABEL_14;
  }

}

- (PDURLSessionProxyTaskMessage)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (PDURLSessionProxyCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
