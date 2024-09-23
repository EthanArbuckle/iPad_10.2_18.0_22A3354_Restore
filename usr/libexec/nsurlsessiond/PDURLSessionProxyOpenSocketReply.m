@implementation PDURLSessionProxyOpenSocketReply

- (void)setStreamErrorDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_streamErrorDomain = a3;
}

- (void)setHasStreamErrorDomain:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStreamErrorDomain
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStreamErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_streamErrorCode = a3;
}

- (void)setHasStreamErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStreamErrorCode
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
  v8.super_class = (Class)PDURLSessionProxyOpenSocketReply;
  v3 = -[PDURLSessionProxyOpenSocketReply description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyOpenSocketReply dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_streamErrorDomain));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("streamErrorDomain"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_streamErrorCode));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("streamErrorCode"));

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
  char v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int *v19;
  char v20;
  unsigned int v21;
  unint64_t v22;
  char v23;

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
        v13 = 0;
        v14 = 0;
        v15 = 0;
        *(_BYTE *)&self->_has |= 2u;
        while (1)
        {
          v16 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorDomain;
            goto LABEL_37;
          }
          v17 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0)
            break;
          v13 += 7;
          v18 = v14++ > 8;
          if (v18)
          {
            LODWORD(v15) = 0;
            v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorDomain;
            goto LABEL_40;
          }
        }
        v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorDomain;
LABEL_38:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v15) = 0;
LABEL_40:
        *(_DWORD *)&self->PBCodable_opaque[*v19] = v15;
        goto LABEL_41;
      }
      if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
        return 0;
LABEL_41:
      if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v20 = 0;
    v21 = 0;
    v15 = 0;
    *(_BYTE *)&self->_has |= 1u;
    while (1)
    {
      v22 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
      v15 |= (unint64_t)(v23 & 0x7F) << v20;
      if ((v23 & 0x80) == 0)
      {
        v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorCode;
        goto LABEL_38;
      }
      v20 += 7;
      v18 = v21++ > 8;
      if (v18)
      {
        LODWORD(v15) = 0;
        v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorCode;
        goto LABEL_40;
      }
    }
    v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorCode;
LABEL_37:
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
    goto LABEL_38;
  }
  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_streamErrorDomain, 1);
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v6, self->_streamErrorCode, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_streamErrorDomain;
    *((_BYTE *)v4 + 16) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[2] = self->_streamErrorCode;
    *((_BYTE *)v4 + 16) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_streamErrorDomain;
    *((_BYTE *)result + 16) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_streamErrorCode;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_streamErrorDomain != *((_DWORD *)v4 + 3))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_streamErrorCode != *((_DWORD *)v4 + 2))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_streamErrorDomain;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_streamErrorCode;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_streamErrorDomain = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 16);
  }
  if ((v5 & 1) != 0)
  {
    self->_streamErrorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (int)streamErrorDomain
{
  return self->_streamErrorDomain;
}

- (int)streamErrorCode
{
  return self->_streamErrorCode;
}

@end
