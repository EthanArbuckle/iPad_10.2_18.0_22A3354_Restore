@implementation PDURLSessionProxyTaskCompleted

- (__NSCFURLSessionTaskInfo)_actualTaskInfo
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(__NSCFURLSessionTaskInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskCompleted taskInfo](self, "taskInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:](NSKeyedUnarchiver, "_nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:", v3, v4));

  return (__NSCFURLSessionTaskInfo *)v5;
}

- (void)_setActualTaskInfo:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver _nsurlsessionproxy_secureArchivedDataWithRootObject:](NSKeyedArchiver, "_nsurlsessionproxy_secureArchivedDataWithRootObject:", a3));
  -[PDURLSessionProxyTaskCompleted setTaskInfo:](self, "setTaskInfo:");

}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasTaskInfo
{
  return self->_taskInfo != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyTaskCompleted;
  v3 = -[PDURLSessionProxyTaskCompleted description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskCompleted dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxyTaskMessage *task;
  void *v5;
  PDURLSessionProxyError *error;
  void *v7;
  NSData *taskInfo;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  task = self->_task;
  if (task)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskMessage dictionaryRepresentation](task, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("task"));

  }
  error = self->_error;
  if (error)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyError dictionaryRepresentation](error, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("error"));

  }
  taskInfo = self->_taskInfo;
  if (taskInfo)
    objc_msgSend(v3, "setObject:forKey:", taskInfo, CFSTR("taskInfo"));
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
  PDURLSessionProxyError *taskInfo;
  uint64_t Data;
  NSData *v16;
  uint64_t v18;
  uint64_t v19;

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
        break;
      if ((_DWORD)v13 == 2)
      {
        taskInfo = objc_alloc_init(PDURLSessionProxyError);
        objc_storeStrong((id *)&self->_error, taskInfo);
        v18 = 0;
        v19 = 0;
        if (!PBReaderPlaceMark(a3, &v18) || (sub_10005DD0C((uint64_t)taskInfo, (uint64_t)a3) & 1) == 0)
        {
LABEL_31:

          return 0;
        }
LABEL_26:
        PBReaderRecallMark(a3, &v18);
LABEL_27:

        goto LABEL_29;
      }
      if ((_DWORD)v13 == 1)
      {
        taskInfo = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, taskInfo);
        v18 = 0;
        v19 = 0;
        if (!PBReaderPlaceMark(a3, &v18) || (sub_10005C020((uint64_t)taskInfo, (uint64_t)a3) & 1) == 0)
          goto LABEL_31;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    Data = PBReaderReadData(a3);
    v16 = (NSData *)objc_claimAutoreleasedReturnValue(Data);
    taskInfo = (PDURLSessionProxyError *)self->_taskInfo;
    self->_taskInfo = v16;
    goto LABEL_27;
  }
  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyError *error;
  NSData *taskInfo;
  id v8;

  v4 = a3;
  task = self->_task;
  v8 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v8;
  }
  error = self->_error;
  if (error)
  {
    PBDataWriterWriteSubmessage(v8, error, 2);
    v4 = v8;
  }
  taskInfo = self->_taskInfo;
  if (taskInfo)
  {
    PBDataWriterWriteDataField(v8, taskInfo, 3);
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
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    v4 = v5;
  }
  if (self->_taskInfo)
  {
    objc_msgSend(v5, "setTaskInfo:");
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
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[PDURLSessionProxyError copyWithZone:](self->_error, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSData copyWithZone:](self->_taskInfo, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  PDURLSessionProxyError *error;
  NSData *taskInfo;
  unsigned __int8 v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((task = self->_task, !((unint64_t)task | v4[2]))
     || -[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:"))
    && ((error = self->_error, !((unint64_t)error | v4[1]))
     || -[PDURLSessionProxyError isEqual:](error, "isEqual:")))
  {
    taskInfo = self->_taskInfo;
    if ((unint64_t)taskInfo | v4[3])
      v8 = -[NSData isEqual:](taskInfo, "isEqual:");
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
  v4 = -[PDURLSessionProxyError hash](self->_error, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_taskInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  PDURLSessionProxyError *error;
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
    -[PDURLSessionProxyTaskCompleted setTask:](self, "setTask:");
  }
  v4 = v9;
LABEL_7:
  error = self->_error;
  v8 = v4[1];
  if (error)
  {
    if (!v8)
      goto LABEL_13;
    -[PDURLSessionProxyError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[PDURLSessionProxyTaskCompleted setError:](self, "setError:");
  }
  v4 = v9;
LABEL_13:
  if (v4[3])
  {
    -[PDURLSessionProxyTaskCompleted setTaskInfo:](self, "setTaskInfo:");
    v4 = v9;
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

- (PDURLSessionProxyError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSData)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
  objc_storeStrong((id *)&self->_taskInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
