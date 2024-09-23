@implementation PDURLSessionProxyDidReceiveResponseReply

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (int)disposition
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_disposition;
  else
    return 0;
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
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1000B19A0 + a3);
}

- (int)StringAsDisposition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cancel")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Allow")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BecomeDownload")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyDidReceiveResponseReply;
  v3 = -[PDURLSessionProxyDidReceiveResponseReply description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyDidReceiveResponseReply dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    if (disposition >= 3)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_disposition));
    else
      v7 = *(&off_1000B19A0 + disposition);
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("disposition"));

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
          LODWORD(v16) = 0;
          goto LABEL_34;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v16) = 0;
LABEL_34:
      self->_disposition = v16;
    }
    else if ((v7 >> 3) == 1)
    {
      v13 = objc_alloc_init(PDURLSessionProxyTaskMessage);
      objc_storeStrong((id *)&self->_task, v13);
      v21[0] = 0;
      v21[1] = 0;
      if (!PBReaderPlaceMark(a3, v21) || (sub_10005C020((uint64_t)v13, (uint64_t)a3) & 1) == 0)
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
  PDURLSessionProxyTaskMessage *task;
  id v6;

  v4 = a3;
  task = self->_task;
  v6 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v6, self->_disposition, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_task)
  {
    v5 = v4;
    objc_msgSend(v4, "setTask:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_disposition;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[PDURLSessionProxyTaskMessage copyWithZone:](self->_task, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_disposition;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_8;
  task = self->_task;
  if ((unint64_t)task | *((_QWORD *)v4 + 2))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_disposition == *((_DWORD *)v4 + 2))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
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
  return v4 ^ v3;
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
  if (task)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[PDURLSessionProxyTaskMessage mergeFrom:](task, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[PDURLSessionProxyDidReceiveResponseReply setTask:](self, "setTask:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_disposition = *((_DWORD *)v4 + 2);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
}

@end
