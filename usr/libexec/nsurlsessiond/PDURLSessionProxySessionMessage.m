@implementation PDURLSessionProxySessionMessage

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIdsPriority:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_idsPriority = a3;
}

- (void)setHasIdsPriority:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIdsPriority
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLaunchUUID
{
  return self->_launchUUID != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxySessionMessage;
  v3 = -[PDURLSessionProxySessionMessage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxySessionMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionIdentifier;
  NSString *uuidString;
  char has;
  void *v8;
  void *v9;
  NSString *launchUUID;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v4, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_sequenceNumber));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("sequenceNumber"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_idsPriority));
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("idsPriority"));

  }
  launchUUID = self->_launchUUID;
  if (launchUUID)
    objc_msgSend(v4, "setObject:forKey:", launchUUID, CFSTR("launchUUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000640A8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *sessionIdentifier;
  NSString *uuidString;
  char has;
  NSString *launchUUID;
  id v9;

  v4 = a3;
  sessionIdentifier = self->_sessionIdentifier;
  v9 = v4;
  if (sessionIdentifier)
  {
    PBDataWriterWriteStringField(v4, sessionIdentifier, 1);
    v4 = v9;
  }
  uuidString = self->_uuidString;
  if (uuidString)
  {
    PBDataWriterWriteStringField(v9, uuidString, 2);
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v9, self->_sequenceNumber, 3);
    v4 = v9;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field(v9, self->_idsPriority, 4);
    v4 = v9;
  }
  launchUUID = self->_launchUUID;
  if (launchUUID)
  {
    PBDataWriterWriteStringField(v9, launchUUID, 5);
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v4, "setSessionIdentifier:");
    v4 = v6;
  }
  if (self->_uuidString)
  {
    objc_msgSend(v6, "setUuidString:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_sequenceNumber;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_idsPriority;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_launchUUID)
  {
    objc_msgSend(v6, "setLaunchUUID:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;
  id v11;
  void *v12;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = self->_sequenceNumber;
    *((_BYTE *)v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v5[1] = self->_idsPriority;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_launchUUID, "copyWithZone:", a3);
  v12 = (void *)v5[3];
  v5[3] = v11;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sessionIdentifier;
  NSString *uuidString;
  NSString *launchUUID;
  unsigned __int8 v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_18;
  sessionIdentifier = self->_sessionIdentifier;
  if ((unint64_t)sessionIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionIdentifier, "isEqual:"))
      goto LABEL_18;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_sequenceNumber != *((_QWORD *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_idsPriority != *((_QWORD *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_18;
  }
  launchUUID = self->_launchUUID;
  if ((unint64_t)launchUUID | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](launchUUID, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_sessionIdentifier, "hash");
  v4 = -[NSString hash](self->_uuidString, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761u * self->_sequenceNumber;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_launchUUID, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_idsPriority;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_launchUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[PDURLSessionProxySessionMessage setSessionIdentifier:](self, "setSessionIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PDURLSessionProxySessionMessage setUuidString:](self, "setUuidString:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_sequenceNumber = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 1) != 0)
  {
    self->_idsPriority = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PDURLSessionProxySessionMessage setLaunchUUID:](self, "setLaunchUUID:");
    v4 = v6;
  }

}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_storeStrong((id *)&self->_uuidString, a3);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int64_t)idsPriority
{
  return self->_idsPriority;
}

- (NSString)launchUUID
{
  return self->_launchUUID;
}

- (void)setLaunchUUID:(id)a3
{
  objc_storeStrong((id *)&self->_launchUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_launchUUID, 0);
}

@end
