@implementation PDURLSessionProxyGetAuthHeadersReply

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasHeaderData
{
  return self->_headerData != 0;
}

- (void)setContinueLoad:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_continueLoad = a3;
}

- (void)setHasContinueLoad:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContinueLoad
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
  v8.super_class = (Class)PDURLSessionProxyGetAuthHeadersReply;
  v3 = -[PDURLSessionProxyGetAuthHeadersReply description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyGetAuthHeadersReply dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxyTaskMessage *task;
  void *v5;
  NSData *headerData;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  task = self->_task;
  if (task)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskMessage dictionaryRepresentation](task, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("task"));

  }
  headerData = self->_headerData;
  if (headerData)
    objc_msgSend(v3, "setObject:forKey:", headerData, CFSTR("headerData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_continueLoad));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("continueLoad"));

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
  PDURLSessionProxyTaskMessage *v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t Data;
  NSData *v21;
  NSData *headerData;
  int v23;
  _QWORD v25[2];

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
          goto LABEL_34;
        v15 += 7;
        v10 = v16++ >= 9;
        if (v10)
        {
          v17 = 0;
          goto LABEL_36;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v17 = 0;
LABEL_36:
      self->_continueLoad = v17 != 0;
    }
    else if ((_DWORD)v13 == 2)
    {
      Data = PBReaderReadData(a3);
      v21 = (NSData *)objc_claimAutoreleasedReturnValue(Data);
      headerData = self->_headerData;
      self->_headerData = v21;

    }
    else if ((_DWORD)v13 == 1)
    {
      v14 = objc_alloc_init(PDURLSessionProxyTaskMessage);
      objc_storeStrong((id *)&self->_task, v14);
      v25[0] = 0;
      v25[1] = 0;
      if (!PBReaderPlaceMark(a3, v25) || (sub_10005C020((uint64_t)v14, (uint64_t)a3) & 1) == 0)
      {

        LOBYTE(v23) = 0;
        return v23;
      }
      PBReaderRecallMark(a3, v25);

    }
    else
    {
      v23 = PBReaderSkipValueWithTag(a3);
      if (!v23)
        return v23;
    }
  }
  LOBYTE(v23) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v23;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  NSData *headerData;
  id v7;

  v4 = a3;
  task = self->_task;
  v7 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v7;
  }
  headerData = self->_headerData;
  if (headerData)
  {
    PBDataWriterWriteDataField(v7, headerData, 2);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v7, self->_continueLoad, 3);
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
  if (self->_headerData)
  {
    objc_msgSend(v5, "setHeaderData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_continueLoad;
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

  v8 = -[NSData copyWithZone:](self->_headerData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v5 + 24) = self->_continueLoad;
    *((_BYTE *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  NSData *headerData;
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
  headerData = self->_headerData;
  if ((unint64_t)headerData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](headerData, "isEqual:"))
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
    if (self->_continueLoad)
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
  v4 = (unint64_t)-[NSData hash](self->_headerData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_continueLoad;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  id v7;

  v4 = a3;
  task = self->_task;
  v6 = *((_QWORD *)v4 + 2);
  v7 = v4;
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
    -[PDURLSessionProxyGetAuthHeadersReply setTask:](self, "setTask:");
  }
  v4 = v7;
LABEL_7:
  if (*((_QWORD *)v4 + 1))
  {
    -[PDURLSessionProxyGetAuthHeadersReply setHeaderData:](self, "setHeaderData:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_continueLoad = *((_BYTE *)v4 + 24);
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

- (NSData)headerData
{
  return self->_headerData;
}

- (void)setHeaderData:(id)a3
{
  objc_storeStrong((id *)&self->_headerData, a3);
}

- (BOOL)continueLoad
{
  return self->_continueLoad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_headerData, 0);
}

- (NSDictionary)_actualAuthHeaders
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyGetAuthHeadersReply headerData](self, "headerData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyGetAuthHeadersReply headerData](self, "headerData"));
    v10 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 0, 0, &v10));
    v6 = v10;

    if (v6)
    {
      v7 = (id)qword_1000C7120;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(v6, "code");
        *(_DWORD *)buf = 138412546;
        v12 = v6;
        v13 = 2048;
        v14 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error %@ [%ld] deserializing auth headers", buf, 0x16u);
      }

    }
  }
  else
  {
    v5 = 0;
  }
  return (NSDictionary *)v5;
}

- (void)_setActualAuthHeaders:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 200, 0, 0));
    -[PDURLSessionProxyGetAuthHeadersReply setHeaderData:](self, "setHeaderData:", v5);

    v4 = v6;
  }

}

@end
