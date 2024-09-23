@implementation PDURLSessionProxyCreateSession

- (BOOL)hasSession
{
  return self->_session != 0;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (void)setSupportsRedirects:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_supportsRedirects = a3;
}

- (void)setHasSupportsRedirects:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSupportsRedirects
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDelegateImplementsWillSendRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_delegateImplementsWillSendRequest = a3;
}

- (void)setHasDelegateImplementsWillSendRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDelegateImplementsWillSendRequest
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDelegateImplementsSessionAuthChallenge:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_delegateImplementsSessionAuthChallenge = a3;
}

- (void)setHasDelegateImplementsSessionAuthChallenge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDelegateImplementsSessionAuthChallenge
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDelegateImplementsTaskAuthChallenge:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_delegateImplementsTaskAuthChallenge = a3;
}

- (void)setHasDelegateImplementsTaskAuthChallenge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDelegateImplementsTaskAuthChallenge
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDelegateImplementsWillPerformRedirection:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_delegateImplementsWillPerformRedirection = a3;
}

- (void)setHasDelegateImplementsWillPerformRedirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDelegateImplementsWillPerformRedirection
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDelegateImplementsDidReceiveResponse:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_delegateImplementsDidReceiveResponse = a3;
}

- (void)setHasDelegateImplementsDidReceiveResponse:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDelegateImplementsDidReceiveResponse
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
  v8.super_class = (Class)PDURLSessionProxyCreateSession;
  v3 = -[PDURLSessionProxyCreateSession description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyCreateSession dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDURLSessionProxySessionMessage *session;
  void *v5;
  NSData *configuration;
  char has;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  session = self->_session;
  if (session)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxySessionMessage dictionaryRepresentation](session, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("session"));

  }
  configuration = self->_configuration;
  if (configuration)
    objc_msgSend(v3, "setObject:forKey:", configuration, CFSTR("configuration"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_supportsRedirects));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("supportsRedirects"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_delegateImplementsWillSendRequest));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("delegateImplementsWillSendRequest"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_delegateImplementsSessionAuthChallenge));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("delegateImplementsSessionAuthChallenge"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_17:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_delegateImplementsWillPerformRedirection));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("delegateImplementsWillPerformRedirection"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_16:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_delegateImplementsTaskAuthChallenge));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("delegateImplementsTaskAuthChallenge"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_10:
  if ((has & 1) != 0)
  {
LABEL_11:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_delegateImplementsDidReceiveResponse));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("delegateImplementsDidReceiveResponse"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  void **p_cache;
  char **v6;
  char **v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  BOOL v13;
  int v14;
  char **v16;
  void **v17;
  id v18;
  int v19;
  uint64_t Data;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  BOOL v54;
  uint64_t v55;
  _QWORD v57[2];

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    p_cache = &OBJC_METACLASS___PDURLSessionProxyGetAuthHeadersReply.cache;
    v6 = &selRef_version;
    v7 = &selRef_version;
    do
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v11 == -1 || v11 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v12 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v11);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v11 + 1;
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v13 = v9++ >= 9;
        if (v13)
        {
          v10 = 0;
          v14 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
      v14 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v10 = 0;
LABEL_14:
      if (v14 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v16 = v6;
          v17 = p_cache;
          v18 = objc_alloc_init((Class)(p_cache + 503));
          objc_storeStrong((id *)&self->_session, v18);
          v57[0] = 0;
          v57[1] = 0;
          if (PBReaderPlaceMark(a3, v57) && (sub_1000640A8((uint64_t)v18, (uint64_t)a3) & 1) != 0)
          {
            PBReaderRecallMark(a3, v57);

            p_cache = v17;
            v6 = v16;
            goto LABEL_25;
          }

          LOBYTE(v19) = 0;
          return v19;
        case 2u:
          Data = PBReaderReadData(a3);
          v21 = objc_claimAutoreleasedReturnValue(Data);
          v22 = *((int *)v6 + 439);
          v23 = *(void **)&self->PBCodable_opaque[v22];
          *(_QWORD *)&self->PBCodable_opaque[v22] = v21;

LABEL_25:
          v7 = &selRef_version;
          continue;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          self->PBCodable_opaque[*((int *)v7 + 440)] |= 0x20u;
          while (2)
          {
            v27 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v27 == -1 || v27 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v27);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
              v26 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v13 = v25++ >= 9;
                if (v13)
                {
                  v26 = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v26 = 0;
LABEL_71:
          v54 = v26 != 0;
          v55 = 29;
          goto LABEL_92;
        case 4u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          self->PBCodable_opaque[*((int *)v7 + 440)] |= 0x10u;
          while (2)
          {
            v32 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v32 == -1 || v32 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v32);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
              v31 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v13 = v30++ >= 9;
                if (v13)
                {
                  v31 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v31 = 0;
LABEL_75:
          v54 = v31 != 0;
          v55 = 28;
          goto LABEL_92;
        case 5u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          self->PBCodable_opaque[*((int *)v7 + 440)] |= 2u;
          while (2)
          {
            v37 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v37 == -1 || v37 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v37);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
              v36 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v13 = v35++ >= 9;
                if (v13)
                {
                  v36 = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v36 = 0;
LABEL_79:
          v54 = v36 != 0;
          v55 = 25;
          goto LABEL_92;
        case 6u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          self->PBCodable_opaque[*((int *)v7 + 440)] |= 4u;
          while (2)
          {
            v42 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v42 == -1 || v42 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v42 + 1;
              v41 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                v13 = v40++ >= 9;
                if (v13)
                {
                  v41 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v41 = 0;
LABEL_83:
          v54 = v41 != 0;
          v55 = 26;
          goto LABEL_92;
        case 7u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          self->PBCodable_opaque[*((int *)v7 + 440)] |= 8u;
          while (2)
          {
            v47 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v47 == -1 || v47 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v47);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v47 + 1;
              v46 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                v13 = v45++ >= 9;
                if (v13)
                {
                  v46 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v46 = 0;
LABEL_87:
          v54 = v46 != 0;
          v55 = 27;
          goto LABEL_92;
        case 8u:
          v49 = 0;
          v50 = 0;
          v51 = 0;
          self->PBCodable_opaque[*((int *)v7 + 440)] |= 1u;
          break;
        default:
          v19 = PBReaderSkipValueWithTag(a3);
          v7 = &selRef_version;
          if (!v19)
            return v19;
          continue;
      }
      while (1)
      {
        v52 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v52 == -1 || v52 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v53 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v52);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v52 + 1;
        v51 |= (unint64_t)(v53 & 0x7F) << v49;
        if ((v53 & 0x80) == 0)
          goto LABEL_89;
        v49 += 7;
        v13 = v50++ >= 9;
        if (v13)
        {
          v51 = 0;
          goto LABEL_91;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_89:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v51 = 0;
LABEL_91:
      v54 = v51 != 0;
      v55 = 24;
LABEL_92:
      self->PBCodable_opaque[v55] = v54;
    }
    while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length));
  }
  LOBYTE(v19) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v19;
}

- (void)writeTo:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  NSData *configuration;
  char has;
  id v8;

  v4 = a3;
  session = self->_session;
  v8 = v4;
  if (session)
  {
    PBDataWriterWriteSubmessage(v4, session, 1);
    v4 = v8;
  }
  configuration = self->_configuration;
  if (configuration)
  {
    PBDataWriterWriteDataField(v8, configuration, 2);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField(v8, self->_supportsRedirects, 3);
    v4 = v8;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField(v8, self->_delegateImplementsWillSendRequest, 4);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField(v8, self->_delegateImplementsSessionAuthChallenge, 5);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_17:
    PBDataWriterWriteBOOLField(v8, self->_delegateImplementsWillPerformRedirection, 7);
    v4 = v8;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_16:
  PBDataWriterWriteBOOLField(v8, self->_delegateImplementsTaskAuthChallenge, 6);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_10:
  if ((has & 1) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField(v8, self->_delegateImplementsDidReceiveResponse, 8);
    v4 = v8;
  }
LABEL_12:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  v6 = v4;
  if (self->_session)
  {
    objc_msgSend(v4, "setSession:");
    v4 = v6;
  }
  if (self->_configuration)
  {
    objc_msgSend(v6, "setConfiguration:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[29] = self->_supportsRedirects;
    v4[32] |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  v4[28] = self->_delegateImplementsWillSendRequest;
  v4[32] |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  v4[25] = self->_delegateImplementsSessionAuthChallenge;
  v4[32] |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_17:
    v4[27] = self->_delegateImplementsWillPerformRedirection;
    v4[32] |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_16:
  v4[26] = self->_delegateImplementsTaskAuthChallenge;
  v4[32] |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_10:
  if ((has & 1) != 0)
  {
LABEL_11:
    v4[24] = self->_delegateImplementsDidReceiveResponse;
    v4[32] |= 1u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[PDURLSessionProxySessionMessage copyWithZone:](self->_session, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_configuration, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v5 + 29) = self->_supportsRedirects;
    *((_BYTE *)v5 + 32) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v5 + 28) = self->_delegateImplementsWillSendRequest;
  *((_BYTE *)v5 + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)v5 + 25) = self->_delegateImplementsSessionAuthChallenge;
  *((_BYTE *)v5 + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_13:
    *((_BYTE *)v5 + 27) = self->_delegateImplementsWillPerformRedirection;
    *((_BYTE *)v5 + 32) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v5;
    goto LABEL_7;
  }
LABEL_12:
  *((_BYTE *)v5 + 26) = self->_delegateImplementsTaskAuthChallenge;
  *((_BYTE *)v5 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    *((_BYTE *)v5 + 24) = self->_delegateImplementsDidReceiveResponse;
    *((_BYTE *)v5 + 32) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  NSData *configuration;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_48;
  session = self->_session;
  if ((unint64_t)session | *((_QWORD *)v4 + 2))
  {
    if (!-[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:"))
      goto LABEL_48;
  }
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](configuration, "isEqual:"))
      goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x20) == 0)
      goto LABEL_48;
    if (self->_supportsRedirects)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
      goto LABEL_48;
    if (self->_delegateImplementsWillSendRequest)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
      goto LABEL_48;
    if (self->_delegateImplementsSessionAuthChallenge)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_48;
    if (self->_delegateImplementsTaskAuthChallenge)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0)
      goto LABEL_48;
    if (self->_delegateImplementsWillPerformRedirection)
    {
      if (!*((_BYTE *)v4 + 27))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 27))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_48;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0)
    {
      if (self->_delegateImplementsDidReceiveResponse)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_48;
      }
      else if (*((_BYTE *)v4 + 24))
      {
        goto LABEL_48;
      }
      v7 = 1;
      goto LABEL_49;
    }
LABEL_48:
    v7 = 0;
  }
LABEL_49:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[PDURLSessionProxySessionMessage hash](self->_session, "hash");
  v4 = (unint64_t)-[NSData hash](self->_configuration, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v5 = 2654435761 * self->_supportsRedirects;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_delegateImplementsWillSendRequest;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_delegateImplementsSessionAuthChallenge;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_delegateImplementsTaskAuthChallenge;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_12:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_11:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v9 = 2654435761 * self->_delegateImplementsWillPerformRedirection;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_7:
  v10 = 2654435761 * self->_delegateImplementsDidReceiveResponse;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PDURLSessionProxySessionMessage *session;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  session = self->_session;
  v6 = *((_QWORD *)v4 + 2);
  v8 = v4;
  if (session)
  {
    if (!v6)
      goto LABEL_7;
    -[PDURLSessionProxySessionMessage mergeFrom:](session, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PDURLSessionProxyCreateSession setSession:](self, "setSession:");
  }
  v4 = v8;
LABEL_7:
  if (*((_QWORD *)v4 + 1))
  {
    -[PDURLSessionProxyCreateSession setConfiguration:](self, "setConfiguration:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 0x20) != 0)
  {
    self->_supportsRedirects = *((_BYTE *)v4 + 29);
    *(_BYTE *)&self->_has |= 0x20u;
    v7 = *((_BYTE *)v4 + 32);
    if ((v7 & 0x10) == 0)
    {
LABEL_11:
      if ((v7 & 2) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_delegateImplementsWillSendRequest = *((_BYTE *)v4 + 28);
  *(_BYTE *)&self->_has |= 0x10u;
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 2) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0)
      goto LABEL_13;
    goto LABEL_20;
  }
LABEL_19:
  self->_delegateImplementsSessionAuthChallenge = *((_BYTE *)v4 + 25);
  *(_BYTE *)&self->_has |= 2u;
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 4) == 0)
  {
LABEL_13:
    if ((v7 & 8) == 0)
      goto LABEL_14;
LABEL_21:
    self->_delegateImplementsWillPerformRedirection = *((_BYTE *)v4 + 27);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 32) & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_20:
  self->_delegateImplementsTaskAuthChallenge = *((_BYTE *)v4 + 26);
  *(_BYTE *)&self->_has |= 4u;
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 8) != 0)
    goto LABEL_21;
LABEL_14:
  if ((v7 & 1) != 0)
  {
LABEL_15:
    self->_delegateImplementsDidReceiveResponse = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_16:

}

- (PDURLSessionProxySessionMessage)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSData)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)supportsRedirects
{
  return self->_supportsRedirects;
}

- (BOOL)delegateImplementsWillSendRequest
{
  return self->_delegateImplementsWillSendRequest;
}

- (BOOL)delegateImplementsSessionAuthChallenge
{
  return self->_delegateImplementsSessionAuthChallenge;
}

- (BOOL)delegateImplementsTaskAuthChallenge
{
  return self->_delegateImplementsTaskAuthChallenge;
}

- (BOOL)delegateImplementsWillPerformRedirection
{
  return self->_delegateImplementsWillPerformRedirection;
}

- (BOOL)delegateImplementsDidReceiveResponse
{
  return self->_delegateImplementsDidReceiveResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (NSURLSessionConfiguration)_actualConfiguration
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(NSURLSessionConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyCreateSession configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:](NSKeyedUnarchiver, "_nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:", v3, v4));

  return (NSURLSessionConfiguration *)v5;
}

- (void)_setActualConfiguration:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver _nsurlsessionproxy_secureArchivedDataWithRootObject:](NSKeyedArchiver, "_nsurlsessionproxy_secureArchivedDataWithRootObject:", a3));
  -[PDURLSessionProxyCreateSession setConfiguration:](self, "setConfiguration:");

}

@end
