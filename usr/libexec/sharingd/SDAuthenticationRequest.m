@implementation SDAuthenticationRequest

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasAwdlInfo
{
  return self->_awdlInfo != 0;
}

- (BOOL)hasRangingToken
{
  return self->_rangingToken != 0;
}

- (void)setUnlockDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_unlockDate = a3;
}

- (void)setHasUnlockDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUnlockDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAksToken
{
  return self->_aksToken != 0;
}

- (void)setSessionStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionStartDate = a3;
}

- (void)setHasSessionStartDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionStartDate
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
  v8.super_class = (Class)SDAuthenticationRequest;
  v3 = -[SDAuthenticationRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAuthenticationRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *sessionID;
  NSData *awdlInfo;
  NSData *rangingToken;
  void *v10;
  NSData *aksToken;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_type));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  awdlInfo = self->_awdlInfo;
  if (awdlInfo)
    objc_msgSend(v3, "setObject:forKey:", awdlInfo, CFSTR("awdlInfo"));
  rangingToken = self->_rangingToken;
  if (rangingToken)
    objc_msgSend(v3, "setObject:forKey:", rangingToken, CFSTR("rangingToken"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_unlockDate));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("unlockDate"));

  }
  aksToken = self->_aksToken;
  if (aksToken)
    objc_msgSend(v3, "setObject:forKey:", aksToken, CFSTR("aksToken"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_sessionStartDate));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sessionStartDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSString *sessionID;
  NSData *awdlInfo;
  NSData *rangingToken;
  NSData *aksToken;
  id v9;

  v9 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_version, 1);
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field(v9, self->_type, 2);
  sessionID = self->_sessionID;
  if (sessionID)
    PBDataWriterWriteStringField(v9, sessionID, 3);
  awdlInfo = self->_awdlInfo;
  if (awdlInfo)
    PBDataWriterWriteDataField(v9, awdlInfo, 4);
  rangingToken = self->_rangingToken;
  if (rangingToken)
    PBDataWriterWriteDataField(v9, rangingToken, 5);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField(v9, 6, self->_unlockDate);
  aksToken = self->_aksToken;
  if (aksToken)
    PBDataWriterWriteDataField(v9, aksToken, 7);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField(v9, 8, self->_sessionStartDate);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[15] = self->_version;
    *((_BYTE *)v4 + 64) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[14] = self->_type;
    *((_BYTE *)v4 + 64) |= 4u;
  }
  v6 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    v4 = v6;
  }
  if (self->_awdlInfo)
  {
    objc_msgSend(v6, "setAwdlInfo:");
    v4 = v6;
  }
  if (self->_rangingToken)
  {
    objc_msgSend(v6, "setRangingToken:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_unlockDate;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  if (self->_aksToken)
  {
    objc_msgSend(v6, "setAksToken:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_sessionStartDate;
    *((_BYTE *)v4 + 64) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[15] = self->_version;
    *((_BYTE *)v5 + 64) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v5[14] = self->_type;
    *((_BYTE *)v5 + 64) |= 4u;
  }
  v8 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v9 = (void *)v6[6];
  v6[6] = v8;

  v10 = -[NSData copyWithZone:](self->_awdlInfo, "copyWithZone:", a3);
  v11 = (void *)v6[4];
  v6[4] = v10;

  v12 = -[NSData copyWithZone:](self->_rangingToken, "copyWithZone:", a3);
  v13 = (void *)v6[5];
  v6[5] = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6[2] = *(_QWORD *)&self->_unlockDate;
    *((_BYTE *)v6 + 64) |= 2u;
  }
  v14 = -[NSData copyWithZone:](self->_aksToken, "copyWithZone:", a3);
  v15 = (void *)v6[3];
  v6[3] = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[1] = *(_QWORD *)&self->_sessionStartDate;
    *((_BYTE *)v6 + 64) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sessionID;
  NSData *awdlInfo;
  NSData *rangingToken;
  char has;
  NSData *aksToken;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_version != *((_DWORD *)v4 + 15))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_30;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](sessionID, "isEqual:"))
    goto LABEL_30;
  awdlInfo = self->_awdlInfo;
  if ((unint64_t)awdlInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](awdlInfo, "isEqual:"))
      goto LABEL_30;
  }
  rangingToken = self->_rangingToken;
  if ((unint64_t)rangingToken | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](rangingToken, "isEqual:"))
      goto LABEL_30;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_unlockDate != *((double *)v4 + 2))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_30;
  }
  aksToken = self->_aksToken;
  if ((unint64_t)aksToken | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](aksToken, "isEqual:"))
    {
LABEL_30:
      v10 = 0;
      goto LABEL_31;
    }
    has = (char)self->_has;
  }
  v10 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_sessionStartDate != *((double *)v4 + 1))
      goto LABEL_30;
    v10 = 1;
  }
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double unlockDate;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double sessionStartDate;
  double v16;
  long double v17;
  double v18;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_sessionID, "hash");
  v6 = (unint64_t)-[NSData hash](self->_awdlInfo, "hash");
  v7 = (unint64_t)-[NSData hash](self->_rangingToken, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    unlockDate = self->_unlockDate;
    v10 = -unlockDate;
    if (unlockDate >= 0.0)
      v10 = self->_unlockDate;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  v13 = (unint64_t)-[NSData hash](self->_aksToken, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    sessionStartDate = self->_sessionStartDate;
    v16 = -sessionStartDate;
    if (sessionStartDate >= 0.0)
      v16 = self->_sessionStartDate;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 64);
  }
  if ((v5 & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 4u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[SDAuthenticationRequest setSessionID:](self, "setSessionID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SDAuthenticationRequest setAwdlInfo:](self, "setAwdlInfo:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[SDAuthenticationRequest setRangingToken:](self, "setRangingToken:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    self->_unlockDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SDAuthenticationRequest setAksToken:](self, "setAksToken:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_sessionStartDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSData)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
  objc_storeStrong((id *)&self->_awdlInfo, a3);
}

- (NSData)rangingToken
{
  return self->_rangingToken;
}

- (void)setRangingToken:(id)a3
{
  objc_storeStrong((id *)&self->_rangingToken, a3);
}

- (double)unlockDate
{
  return self->_unlockDate;
}

- (NSData)aksToken
{
  return self->_aksToken;
}

- (void)setAksToken:(id)a3
{
  objc_storeStrong((id *)&self->_aksToken, a3);
}

- (double)sessionStartDate
{
  return self->_sessionStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_rangingToken, 0);
  objc_storeStrong((id *)&self->_awdlInfo, 0);
  objc_storeStrong((id *)&self->_aksToken, 0);
}

@end
