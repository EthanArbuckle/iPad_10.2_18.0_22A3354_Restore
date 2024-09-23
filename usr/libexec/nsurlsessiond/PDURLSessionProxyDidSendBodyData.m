@implementation PDURLSessionProxyDidSendBodyData

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (void)setBytesSent:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bytesSent = a3;
}

- (void)setHasBytesSent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBytesSent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTotalBytesSent:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalBytesSent = a3;
}

- (void)setHasTotalBytesSent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalBytesSent
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTotalBytesExpectedToSend:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_totalBytesExpectedToSend = a3;
}

- (void)setHasTotalBytesExpectedToSend:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalBytesExpectedToSend
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyDidSendBodyData;
  v3 = -[PDURLSessionProxyDidSendBodyData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyDidSendBodyData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxyTaskMessage *task;
  void *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  task = self->_task;
  if (task)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyTaskMessage dictionaryRepresentation](task, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("task"));

  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_totalBytesSent));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("totalBytesSent"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_bytesSent));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("bytesSent"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_totalBytesExpectedToSend));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("totalBytesExpectedToSend"));

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
  char v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  unsigned int v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  _QWORD v30[2];

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
    switch((v7 >> 3))
    {
      case 1u:
        v13 = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, v13);
        v30[0] = 0;
        v30[1] = 0;
        if (PBReaderPlaceMark(a3, v30) && (sub_10005C020((uint64_t)v13, (uint64_t)a3) & 1) != 0)
        {
          PBReaderRecallMark(a3, v30);

          continue;
        }

        LOBYTE(v14) = 0;
        return v14;
      case 2u:
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
            goto LABEL_45;
          v15 += 7;
          v10 = v16++ >= 9;
          if (v10)
          {
            v17 = 0;
            goto LABEL_47;
          }
        }
        *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_45:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v17 = 0;
LABEL_47:
        v28 = 8;
        goto LABEL_56;
      case 3u:
        v20 = 0;
        v21 = 0;
        v17 = 0;
        *(_BYTE *)&self->_has |= 4u;
        while (2)
        {
          v22 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v17 |= (unint64_t)(v23 & 0x7F) << v20;
            if (v23 < 0)
            {
              v20 += 7;
              v10 = v21++ >= 9;
              if (v10)
              {
                v17 = 0;
                goto LABEL_51;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v17 = 0;
LABEL_51:
        v28 = 24;
        goto LABEL_56;
      case 4u:
        v24 = 0;
        v25 = 0;
        v17 = 0;
        *(_BYTE *)&self->_has |= 2u;
        break;
      default:
        v14 = PBReaderSkipValueWithTag(a3);
        if (!v14)
          return v14;
        continue;
    }
    while (1)
    {
      v26 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v26 == -1 || v26 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v27 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
      v17 |= (unint64_t)(v27 & 0x7F) << v24;
      if ((v27 & 0x80) == 0)
        goto LABEL_53;
      v24 += 7;
      v10 = v25++ >= 9;
      if (v10)
      {
        v17 = 0;
        goto LABEL_55;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_53:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v17 = 0;
LABEL_55:
    v28 = 16;
LABEL_56:
    *(_QWORD *)&self->PBCodable_opaque[v28] = v17;
  }
  LOBYTE(v14) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxyTaskMessage *task;
  char has;
  id v7;

  v4 = a3;
  task = self->_task;
  v7 = v4;
  if (task)
  {
    PBDataWriterWriteSubmessage(v4, task, 1);
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteUint64Field(v7, self->_totalBytesSent, 3);
    v4 = v7;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field(v7, self->_bytesSent, 2);
  v4 = v7;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint64Field(v7, self->_totalBytesExpectedToSend, 4);
    v4 = v7;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_task)
  {
    v6 = v4;
    objc_msgSend(v4, "setTask:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *((_QWORD *)v4 + 3) = self->_totalBytesSent;
    *((_BYTE *)v4 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v4 + 1) = self->_bytesSent;
  *((_BYTE *)v4 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 2) = self->_totalBytesExpectedToSend;
    *((_BYTE *)v4 + 40) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[PDURLSessionProxyTaskMessage copyWithZone:](self->_task, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v5[3] = self->_totalBytesSent;
    *((_BYTE *)v5 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v5;
    goto LABEL_4;
  }
  v5[1] = self->_bytesSent;
  *((_BYTE *)v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5[2] = self->_totalBytesExpectedToSend;
    *((_BYTE *)v5 + 40) |= 2u;
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
    goto LABEL_18;
  task = self->_task;
  if ((unint64_t)task | *((_QWORD *)v4 + 4))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_bytesSent != *((_QWORD *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_totalBytesSent != *((_QWORD *)v4 + 3))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_totalBytesExpectedToSend != *((_QWORD *)v4 + 2))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[PDURLSessionProxyTaskMessage hash](self->_task, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761u * self->_bytesSent;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761u * self->_totalBytesSent;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761u * self->_totalBytesExpectedToSend;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDURLSessionProxyTaskMessage *task;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = a3;
  task = self->_task;
  v6 = v4[4];
  if (task)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[PDURLSessionProxyTaskMessage mergeFrom:](task, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[PDURLSessionProxyDidSendBodyData setTask:](self, "setTask:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 1) == 0)
  {
    if ((v4[5] & 4) == 0)
      goto LABEL_9;
LABEL_13:
    self->_totalBytesSent = v4[3];
    *(_BYTE *)&self->_has |= 4u;
    if ((v4[5] & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_bytesSent = v4[1];
  *(_BYTE *)&self->_has |= 1u;
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v7 & 2) != 0)
  {
LABEL_10:
    self->_totalBytesExpectedToSend = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_11:

}

- (PDURLSessionProxyTaskMessage)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (unint64_t)totalBytesSent
{
  return self->_totalBytesSent;
}

- (unint64_t)totalBytesExpectedToSend
{
  return self->_totalBytesExpectedToSend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
}

@end
