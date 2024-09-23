@implementation PDURLSessionProxyWillSendRequest

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (void)setHasBodyStream:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hasBodyStream = a3;
}

- (void)setHasHasBodyStream:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasBodyStream
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
  v8.super_class = (Class)PDURLSessionProxyWillSendRequest;
  v3 = -[PDURLSessionProxyWillSendRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyWillSendRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxyTaskMessage *task;
  void *v5;
  PDURLSessionProxyRequest *request;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  task = self->_task;
  if (task)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskMessage dictionaryRepresentation](task, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("task"));

  }
  request = self->_request;
  if (request)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyRequest dictionaryRepresentation](request, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("request"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasBodyStream));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("hasBodyStream"));

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
  PDURLSessionProxyRequest *v14;
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
          v17 = 0;
          goto LABEL_38;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v17 = 0;
LABEL_38:
      self->_hasBodyStream = v17 != 0;
    }
    else
    {
      if ((_DWORD)v13 == 2)
      {
        v14 = objc_alloc_init(PDURLSessionProxyRequest);
        objc_storeStrong((id *)&self->_request, v14);
        v22 = 0;
        v23 = 0;
        if (!PBReaderPlaceMark(a3, &v22) || (sub_10004E570((uint64_t)v14, (uint64_t)a3) & 1) == 0)
        {
LABEL_41:

          LOBYTE(v20) = 0;
          return v20;
        }
      }
      else
      {
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
  }
  LOBYTE(v20) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyRequest *request;
  id v7;

  v4 = a3;
  task = self->_task;
  v7 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v7;
  }
  request = self->_request;
  if (request)
  {
    PBDataWriterWriteSubmessage(v7, request, 2);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v7, self->_hasBodyStream, 3);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_task)
  {
    objc_msgSend(v4, "setTask:");
    v4 = v5;
  }
  if (self->_request)
  {
    objc_msgSend(v5, "setRequest:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_hasBodyStream;
    v4[28] |= 1u;
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
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[PDURLSessionProxyRequest copyWithZone:](self->_request, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v5 + 24) = self->_hasBodyStream;
    *((_BYTE *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyRequest *request;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_8;
  task = self->_task;
  if ((unint64_t)task | *((_QWORD *)v4 + 2))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:"))
      goto LABEL_8;
  }
  request = self->_request;
  if ((unint64_t)request | *((_QWORD *)v4 + 1))
  {
    if (!-[PDURLSessionProxyRequest isEqual:](request, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_hasBodyStream)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[PDURLSessionProxyTaskMessage hash](self->_task, "hash");
  v4 = -[PDURLSessionProxyRequest hash](self->_request, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_hasBodyStream;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  PDURLSessionProxyRequest *request;
  uint64_t v8;
  id v9;

  v4 = a3;
  task = self->_task;
  v6 = *((_QWORD *)v4 + 2);
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
    -[PDURLSessionProxyWillSendRequest setTask:](self, "setTask:");
  }
  v4 = v9;
LABEL_7:
  request = self->_request;
  v8 = *((_QWORD *)v4 + 1);
  if (request)
  {
    if (!v8)
      goto LABEL_13;
    -[PDURLSessionProxyRequest mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[PDURLSessionProxyWillSendRequest setRequest:](self, "setRequest:");
  }
  v4 = v9;
LABEL_13:
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_hasBodyStream = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
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

- (PDURLSessionProxyRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (BOOL)hasBodyStream
{
  return self->_hasBodyStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
