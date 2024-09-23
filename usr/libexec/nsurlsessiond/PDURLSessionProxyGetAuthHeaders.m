@implementation PDURLSessionProxyGetAuthHeaders

- (BOOL)hasTask
{
  return self->_task != 0;
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
  v8.super_class = (Class)PDURLSessionProxyGetAuthHeaders;
  v3 = -[PDURLSessionProxyGetAuthHeaders description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyGetAuthHeaders dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxyTaskMessage *task;
  void *v5;
  PDURLSessionProxyResponse *response;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  task = self->_task;
  if (task)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskMessage dictionaryRepresentation](task, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("task"));

  }
  response = self->_response;
  if (response)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyResponse dictionaryRepresentation](response, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("response"));

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
    v13 = objc_alloc_init(PDURLSessionProxyResponse);
    objc_storeStrong((id *)&self->_response, v13);
    v15 = 0;
    v16 = 0;
    if (!PBReaderPlaceMark(a3, &v15) || (sub_10004916C((uint64_t)v13, (uint64_t)a3) & 1) == 0)
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
  PDURLSessionProxyResponse *response;
  id v7;

  v4 = a3;
  task = self->_task;
  v7 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v7;
  }
  response = self->_response;
  if (response)
  {
    PBDataWriterWriteSubmessage(v7, response, 2);
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

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[PDURLSessionProxyTaskMessage copyWithZone:](self->_task, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[PDURLSessionProxyResponse copyWithZone:](self->_response, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyResponse *response;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((task = self->_task, !((unint64_t)task | v4[2]))
     || -[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")))
  {
    response = self->_response;
    if ((unint64_t)response | v4[1])
      v7 = -[PDURLSessionProxyResponse isEqual:](response, "isEqual:");
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
  return -[PDURLSessionProxyResponse hash](self->_response, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  PDURLSessionProxyResponse *response;
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
    -[PDURLSessionProxyGetAuthHeaders setTask:](self, "setTask:");
  }
  v4 = v9;
LABEL_7:
  response = self->_response;
  v8 = v4[1];
  if (response)
  {
    if (v8)
    {
      -[PDURLSessionProxyResponse mergeFrom:](response, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PDURLSessionProxyGetAuthHeaders setResponse:](self, "setResponse:");
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
}

@end
