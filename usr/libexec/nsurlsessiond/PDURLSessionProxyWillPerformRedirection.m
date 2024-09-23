@implementation PDURLSessionProxyWillPerformRedirection

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyWillPerformRedirection;
  v3 = -[PDURLSessionProxyWillPerformRedirection description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyWillPerformRedirection dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  PDURLSessionProxyResponse *response;
  void *v9;

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
  response = self->_response;
  if (response)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyResponse dictionaryRepresentation](response, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("response"));

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
  unint64_t v13;
  PDURLSessionProxyResponse *v14;
  uint64_t v16;
  uint64_t v17;

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
      v13 = v7 >> 3;
      if ((v7 >> 3) == 3)
      {
        v14 = objc_alloc_init(PDURLSessionProxyResponse);
        objc_storeStrong((id *)&self->_response, v14);
        v16 = 0;
        v17 = 0;
        if (!PBReaderPlaceMark(a3, &v16) || (sub_10004916C((uint64_t)v14, (uint64_t)a3) & 1) == 0)
        {
LABEL_32:

          return 0;
        }
        goto LABEL_28;
      }
      if ((_DWORD)v13 == 2)
        break;
      if ((_DWORD)v13 == 1)
      {
        v14 = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, v14);
        v16 = 0;
        v17 = 0;
        if (!PBReaderPlaceMark(a3, &v16) || (sub_10005C020((uint64_t)v14, (uint64_t)a3) & 1) == 0)
          goto LABEL_32;
LABEL_28:
        PBReaderRecallMark(a3, &v16);

        goto LABEL_30;
      }
      if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
        return 0;
LABEL_30:
      if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v14 = objc_alloc_init(PDURLSessionProxyRequest);
    objc_storeStrong((id *)&self->_request, v14);
    v16 = 0;
    v17 = 0;
    if (!PBReaderPlaceMark(a3, &v16) || (sub_10004E570((uint64_t)v14, (uint64_t)a3) & 1) == 0)
      goto LABEL_32;
    goto LABEL_28;
  }
  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyRequest *request;
  PDURLSessionProxyResponse *response;
  id v8;

  v4 = a3;
  task = self->_task;
  v8 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v8;
  }
  request = self->_request;
  if (request)
  {
    PBDataWriterWriteSubmessage(v8, request, 2);
    v4 = v8;
  }
  response = self->_response;
  if (response)
  {
    PBDataWriterWriteSubmessage(v8, response, 3);
    v4 = v8;
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
  if (self->_response)
  {
    objc_msgSend(v5, "setResponse:");
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
  id v10;
  void *v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[PDURLSessionProxyTaskMessage copyWithZone:](self->_task, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[PDURLSessionProxyRequest copyWithZone:](self->_request, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[PDURLSessionProxyResponse copyWithZone:](self->_response, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyRequest *request;
  PDURLSessionProxyResponse *response;
  unsigned __int8 v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((task = self->_task, !((unint64_t)task | v4[3]))
     || -[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:"))
    && ((request = self->_request, !((unint64_t)request | v4[1]))
     || -[PDURLSessionProxyRequest isEqual:](request, "isEqual:")))
  {
    response = self->_response;
    if ((unint64_t)response | v4[2])
      v8 = -[PDURLSessionProxyResponse isEqual:](response, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[PDURLSessionProxyTaskMessage hash](self->_task, "hash");
  v4 = -[PDURLSessionProxyRequest hash](self->_request, "hash") ^ v3;
  return v4 ^ -[PDURLSessionProxyResponse hash](self->_response, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  PDURLSessionProxyRequest *request;
  uint64_t v8;
  PDURLSessionProxyResponse *response;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  task = self->_task;
  v6 = v4[3];
  v11 = v4;
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
    -[PDURLSessionProxyWillPerformRedirection setTask:](self, "setTask:");
  }
  v4 = v11;
LABEL_7:
  request = self->_request;
  v8 = v4[1];
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
    -[PDURLSessionProxyWillPerformRedirection setRequest:](self, "setRequest:");
  }
  v4 = v11;
LABEL_13:
  response = self->_response;
  v10 = v4[2];
  if (response)
  {
    if (v10)
    {
      -[PDURLSessionProxyResponse mergeFrom:](response, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[PDURLSessionProxyWillPerformRedirection setResponse:](self, "setResponse:");
    goto LABEL_18;
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

- (PDURLSessionProxyResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
