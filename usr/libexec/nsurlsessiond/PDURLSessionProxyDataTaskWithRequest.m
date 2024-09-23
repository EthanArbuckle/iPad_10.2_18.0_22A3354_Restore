@implementation PDURLSessionProxyDataTaskWithRequest

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasOriginalRequest
{
  return self->_originalRequest != 0;
}

- (BOOL)hasCurrentRequest
{
  return self->_currentRequest != 0;
}

- (void)setTaskSequenceNumber:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_taskSequenceNumber = a3;
}

- (void)setHasTaskSequenceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTaskSequenceNumber
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
  v8.super_class = (Class)PDURLSessionProxyDataTaskWithRequest;
  v3 = -[PDURLSessionProxyDataTaskWithRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyDataTaskWithRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxyTaskMessage *task;
  void *v5;
  PDURLSessionProxyRequest *originalRequest;
  void *v7;
  PDURLSessionProxyRequest *currentRequest;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  task = self->_task;
  if (task)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskMessage dictionaryRepresentation](task, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("task"));

  }
  originalRequest = self->_originalRequest;
  if (originalRequest)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyRequest dictionaryRepresentation](originalRequest, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("originalRequest"));

  }
  currentRequest = self->_currentRequest;
  if (currentRequest)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyRequest dictionaryRepresentation](currentRequest, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("currentRequest"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_taskSequenceNumber));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("taskSequenceNumber"));

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
  PDURLSessionProxyTaskMessage *v13;
  int v14;
  uint64_t v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v22;
  uint64_t v23;

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
    {
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
          v13 = objc_alloc_init(PDURLSessionProxyTaskMessage);
          objc_storeStrong((id *)&self->_task, v13);
          v22 = 0;
          v23 = 0;
          if (PBReaderPlaceMark(a3, &v22) && (sub_10005C020((uint64_t)v13, (uint64_t)a3) & 1) != 0)
            goto LABEL_27;
          goto LABEL_41;
        case 2u:
          v13 = objc_alloc_init(PDURLSessionProxyRequest);
          v15 = 24;
          goto LABEL_25;
        case 3u:
          v13 = objc_alloc_init(PDURLSessionProxyRequest);
          v15 = 16;
LABEL_25:
          objc_storeStrong((id *)&self->PBRequest_opaque[v15], v13);
          v22 = 0;
          v23 = 0;
          if (!PBReaderPlaceMark(a3, &v22) || (sub_10004E570((uint64_t)v13, (uint64_t)a3) & 1) == 0)
          {
LABEL_41:

            LOBYTE(v14) = 0;
            return v14;
          }
LABEL_27:
          PBReaderRecallMark(a3, &v22);

LABEL_39:
          if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_40;
          break;
        case 4u:
          v16 = 0;
          v17 = 0;
          v18 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v19 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v19 == -1 || v19 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v20 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
              v18 |= (unint64_t)(v20 & 0x7F) << v16;
              if (v20 < 0)
              {
                v16 += 7;
                v10 = v17++ >= 9;
                if (v10)
                {
                  v18 = 0;
                  goto LABEL_38;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v18 = 0;
LABEL_38:
          self->_taskSequenceNumber = v18;
          goto LABEL_39;
        default:
          v14 = PBReaderSkipValueWithTag(a3);
          if (!v14)
            return v14;
          goto LABEL_39;
      }
    }
  }
LABEL_40:
  LOBYTE(v14) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyRequest *originalRequest;
  PDURLSessionProxyRequest *currentRequest;
  id v8;

  v4 = a3;
  task = self->_task;
  v8 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v8;
  }
  originalRequest = self->_originalRequest;
  if (originalRequest)
  {
    PBDataWriterWriteSubmessage(v8, originalRequest, 2);
    v4 = v8;
  }
  currentRequest = self->_currentRequest;
  if (currentRequest)
  {
    PBDataWriterWriteSubmessage(v8, currentRequest, 3);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v8, self->_taskSequenceNumber, 4);
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
  if (self->_originalRequest)
  {
    objc_msgSend(v5, "setOriginalRequest:");
    v4 = v5;
  }
  if (self->_currentRequest)
  {
    objc_msgSend(v5, "setCurrentRequest:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_taskSequenceNumber;
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
  v6 = -[PDURLSessionProxyTaskMessage copyWithZone:](self->_task, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[PDURLSessionProxyRequest copyWithZone:](self->_originalRequest, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[PDURLSessionProxyRequest copyWithZone:](self->_currentRequest, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_taskSequenceNumber;
    *((_BYTE *)v5 + 40) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyRequest *originalRequest;
  PDURLSessionProxyRequest *currentRequest;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_12;
  task = self->_task;
  if ((unint64_t)task | *((_QWORD *)v4 + 4))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:"))
      goto LABEL_12;
  }
  originalRequest = self->_originalRequest;
  if ((unint64_t)originalRequest | *((_QWORD *)v4 + 3))
  {
    if (!-[PDURLSessionProxyRequest isEqual:](originalRequest, "isEqual:"))
      goto LABEL_12;
  }
  currentRequest = self->_currentRequest;
  if ((unint64_t)currentRequest | *((_QWORD *)v4 + 2))
  {
    if (!-[PDURLSessionProxyRequest isEqual:](currentRequest, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_taskSequenceNumber == *((_QWORD *)v4 + 1))
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
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[PDURLSessionProxyTaskMessage hash](self->_task, "hash");
  v4 = -[PDURLSessionProxyRequest hash](self->_originalRequest, "hash");
  v5 = -[PDURLSessionProxyRequest hash](self->_currentRequest, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_taskSequenceNumber;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  PDURLSessionProxyRequest *originalRequest;
  uint64_t v8;
  PDURLSessionProxyRequest *currentRequest;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  task = self->_task;
  v6 = v4[4];
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
    -[PDURLSessionProxyDataTaskWithRequest setTask:](self, "setTask:");
  }
  v4 = v11;
LABEL_7:
  originalRequest = self->_originalRequest;
  v8 = v4[3];
  if (originalRequest)
  {
    if (!v8)
      goto LABEL_13;
    -[PDURLSessionProxyRequest mergeFrom:](originalRequest, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[PDURLSessionProxyDataTaskWithRequest setOriginalRequest:](self, "setOriginalRequest:");
  }
  v4 = v11;
LABEL_13:
  currentRequest = self->_currentRequest;
  v10 = v4[2];
  if (currentRequest)
  {
    if (!v10)
      goto LABEL_19;
    -[PDURLSessionProxyRequest mergeFrom:](currentRequest, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[PDURLSessionProxyDataTaskWithRequest setCurrentRequest:](self, "setCurrentRequest:");
  }
  v4 = v11;
LABEL_19:
  if ((v4[5] & 1) != 0)
  {
    self->_taskSequenceNumber = v4[1];
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

- (PDURLSessionProxyRequest)originalRequest
{
  return self->_originalRequest;
}

- (void)setOriginalRequest:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequest, a3);
}

- (PDURLSessionProxyRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (unint64_t)taskSequenceNumber
{
  return self->_taskSequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end
