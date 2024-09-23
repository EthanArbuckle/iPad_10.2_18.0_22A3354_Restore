@implementation PDURLSessionProxyWillPerformRedirectionReply

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyWillPerformRedirectionReply;
  v3 = -[PDURLSessionProxyWillPerformRedirectionReply description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyWillPerformRedirectionReply dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  PDURLSessionProxyTaskMessage *v13;
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
        v13 = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, v13);
        v15 = 0;
        v16 = 0;
        if (!PBReaderPlaceMark(a3, &v15) || (sub_10005C020((uint64_t)v13, (uint64_t)a3) & 1) == 0)
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
    v13 = objc_alloc_init(PDURLSessionProxyRequest);
    objc_storeStrong((id *)&self->_request, v13);
    v15 = 0;
    v16 = 0;
    if (!PBReaderPlaceMark(a3, &v15) || (sub_10004E570((uint64_t)v13, (uint64_t)a3) & 1) == 0)
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
  if (self->_request)
  {
    objc_msgSend(v5, "setRequest:");
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
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[PDURLSessionProxyRequest copyWithZone:](self->_request, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyRequest *request;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((task = self->_task, !((unint64_t)task | v4[2]))
     || -[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")))
  {
    request = self->_request;
    if ((unint64_t)request | v4[1])
      v7 = -[PDURLSessionProxyRequest isEqual:](request, "isEqual:");
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

  v3 = -[PDURLSessionProxyTaskMessage hash](self->_task, "hash");
  return -[PDURLSessionProxyRequest hash](self->_request, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  PDURLSessionProxyRequest *request;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  task = self->_task;
  v6 = v4[2];
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
    -[PDURLSessionProxyWillPerformRedirectionReply setTask:](self, "setTask:");
  }
  v4 = v9;
LABEL_7:
  request = self->_request;
  v8 = v4[1];
  if (request)
  {
    if (v8)
    {
      -[PDURLSessionProxyRequest mergeFrom:](request, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PDURLSessionProxyWillPerformRedirectionReply setRequest:](self, "setRequest:");
    goto LABEL_12;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
