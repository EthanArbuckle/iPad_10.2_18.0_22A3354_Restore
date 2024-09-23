@implementation PDURLSessionProxyResumeTask

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasAdditionalProperties
{
  return self->_additionalProperties != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyResumeTask;
  v3 = -[PDURLSessionProxyResumeTask description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyResumeTask dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxyTaskMessage *task;
  void *v5;
  NSData *additionalProperties;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  task = self->_task;
  if (task)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskMessage dictionaryRepresentation](task, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("task"));

  }
  additionalProperties = self->_additionalProperties;
  if (additionalProperties)
    objc_msgSend(v3, "setObject:forKey:", additionalProperties, CFSTR("additionalProperties"));
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
  PDURLSessionProxyTaskMessage *additionalProperties;
  uint64_t Data;
  NSData *v15;
  _QWORD v17[2];

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
        additionalProperties = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, additionalProperties);
        v17[0] = 0;
        v17[1] = 0;
        if (!PBReaderPlaceMark(a3, v17)
          || (sub_10005C020((uint64_t)additionalProperties, (uint64_t)a3) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark(a3, v17);
        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
        return 0;
LABEL_25:
      if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    Data = PBReaderReadData(a3);
    v15 = (NSData *)objc_claimAutoreleasedReturnValue(Data);
    additionalProperties = (PDURLSessionProxyTaskMessage *)self->_additionalProperties;
    self->_additionalProperties = v15;
LABEL_23:

    goto LABEL_25;
  }
  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  NSData *additionalProperties;
  id v7;

  v4 = a3;
  task = self->_task;
  v7 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v7;
  }
  additionalProperties = self->_additionalProperties;
  if (additionalProperties)
  {
    PBDataWriterWriteDataField(v7, additionalProperties, 2);
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
  if (self->_additionalProperties)
  {
    objc_msgSend(v5, "setAdditionalProperties:");
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

  v8 = -[NSData copyWithZone:](self->_additionalProperties, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  NSData *additionalProperties;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((task = self->_task, !((unint64_t)task | v4[2]))
     || -[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")))
  {
    additionalProperties = self->_additionalProperties;
    if ((unint64_t)additionalProperties | v4[1])
      v7 = -[NSData isEqual:](additionalProperties, "isEqual:");
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
  return (unint64_t)-[NSData hash](self->_additionalProperties, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  task = self->_task;
  v6 = v4[2];
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
    -[PDURLSessionProxyResumeTask setTask:](self, "setTask:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[PDURLSessionProxyResumeTask setAdditionalProperties:](self, "setAdditionalProperties:");
    v4 = v7;
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

- (NSData)additionalProperties
{
  return self->_additionalProperties;
}

- (void)setAdditionalProperties:(id)a3
{
  objc_storeStrong((id *)&self->_additionalProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_additionalProperties, 0);
}

- (NSDictionary)_actualAdditionalProperties
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyResumeTask additionalProperties](self, "additionalProperties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:](NSKeyedUnarchiver, "_nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:", v3, v4));

  return (NSDictionary *)v5;
}

- (void)_setActualAdditionalProperties:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver _nsurlsessionproxy_secureArchivedDataWithRootObject:](NSKeyedArchiver, "_nsurlsessionproxy_secureArchivedDataWithRootObject:", a3));
  -[PDURLSessionProxyResumeTask setAdditionalProperties:](self, "setAdditionalProperties:");

}

@end
