@implementation APPBOptOutRequest

+ (id)options
{
  if (qword_1002697D0 != -1)
    dispatch_once(&qword_1002697D0, &stru_100214A18);
  return (id)qword_1002697C8;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (void)setOptedOutStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_optedOutStatus = a3;
}

- (void)setHasOptedOutStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOptedOutStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTransmitTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_transmitTimestamp = a3;
}

- (void)setHasTransmitTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTransmitTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStatusChangeTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_statusChangeTimestamp = a3;
}

- (void)setHasStatusChangeTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatusChangeTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTimezone:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timezone = a3;
}

- (void)setHasTimezone:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimezone
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBOptOutRequest;
  v3 = -[APPBOptOutRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBOptOutRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSData *iAdID;
  char has;
  void *v8;
  NSData *dPID;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = v3;
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v3, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_optedOutStatus));
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("optedOutStatus"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_transmitTimestamp));
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("transmitTimestamp"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_statusChangeTimestamp));
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("statusChangeTimestamp"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    *(float *)&v4 = self->_timezone;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("timezone"));

  }
LABEL_8:
  dPID = self->_dPID;
  if (dPID)
    objc_msgSend(v5, "setObject:forKey:", dPID, CFSTR("DPID"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return APPBOptOutRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *iAdID;
  char has;
  NSData *dPID;
  id v8;

  v4 = a3;
  iAdID = self->_iAdID;
  v8 = v4;
  if (iAdID)
  {
    PBDataWriterWriteDataField(v4, iAdID, 1);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField(v8, self->_optedOutStatus, 2);
    v4 = v8;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField(v8, 3, self->_transmitTimestamp);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteDoubleField(v8, 4, self->_statusChangeTimestamp);
  v4 = v8;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    PBDataWriterWriteFloatField(v8, 5, self->_timezone);
    v4 = v8;
  }
LABEL_8:
  dPID = self->_dPID;
  if (dPID)
  {
    PBDataWriterWriteDataField(v8, dPID, 6);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_iAdID)
  {
    objc_msgSend(v4, "setIAdID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 44) = self->_optedOutStatus;
    *((_BYTE *)v4 + 48) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_transmitTimestamp;
  *((_BYTE *)v4 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_statusChangeTimestamp;
  *((_BYTE *)v4 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 10) = LODWORD(self->_timezone);
    *((_BYTE *)v4 + 48) |= 4u;
  }
LABEL_8:
  if (self->_dPID)
  {
    objc_msgSend(v6, "setDPID:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;
  id v9;
  void *v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v5 + 44) = self->_optedOutStatus;
    *((_BYTE *)v5 + 48) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v5[1] = *(_QWORD *)&self->_statusChangeTimestamp;
      *((_BYTE *)v5 + 48) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = *(_QWORD *)&self->_transmitTimestamp;
  *((_BYTE *)v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 10) = LODWORD(self->_timezone);
    *((_BYTE *)v5 + 48) |= 4u;
  }
LABEL_6:
  v9 = -[NSData copyWithZone:](self->_dPID, "copyWithZone:", a3);
  v10 = (void *)v5[3];
  v5[3] = v9;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *iAdID;
  NSData *dPID;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_29;
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) != 0)
    {
      if (self->_optedOutStatus)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_29;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_12;
    }
LABEL_29:
    v7 = 0;
    goto LABEL_30;
  }
  if ((*((_BYTE *)v4 + 48) & 8) != 0)
    goto LABEL_29;
LABEL_12:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_transmitTimestamp != *((double *)v4 + 2))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_statusChangeTimestamp != *((double *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_timezone != *((float *)v4 + 10))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_29;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((_QWORD *)v4 + 3))
    v7 = -[NSData isEqual:](dPID, "isEqual:");
  else
    v7 = 1;
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  uint64_t v5;
  double transmitTimestamp;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double statusChangeTimestamp;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  float timezone;
  float v18;
  float v19;
  float v20;

  v3 = (unint64_t)-[NSData hash](self->_iAdID, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = 2654435761 * self->_optedOutStatus;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  transmitTimestamp = self->_transmitTimestamp;
  v7 = -transmitTimestamp;
  if (transmitTimestamp >= 0.0)
    v7 = self->_transmitTimestamp;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 1) != 0)
  {
    statusChangeTimestamp = self->_statusChangeTimestamp;
    v13 = -statusChangeTimestamp;
    if (statusChangeTimestamp >= 0.0)
      v13 = self->_statusChangeTimestamp;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 4) != 0)
  {
    timezone = self->_timezone;
    v18 = -timezone;
    if (timezone >= 0.0)
      v18 = self->_timezone;
    v19 = floorf(v18 + 0.5);
    v20 = (float)(v18 - v19) * 1.8447e19;
    v16 = 2654435761u * (unint64_t)fmodf(v19, 1.8447e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabsf(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ (unint64_t)-[NSData hash](self->_dPID, "hash");
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
    -[APPBOptOutRequest setIAdID:](self, "setIAdID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 8) != 0)
  {
    self->_optedOutStatus = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_transmitTimestamp = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  self->_statusChangeTimestamp = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_7:
    self->_timezone = *((float *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 3))
  {
    -[APPBOptOutRequest setDPID:](self, "setDPID:");
    v4 = v6;
  }

}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
  objc_storeStrong((id *)&self->_iAdID, a3);
}

- (BOOL)optedOutStatus
{
  return self->_optedOutStatus;
}

- (double)transmitTimestamp
{
  return self->_transmitTimestamp;
}

- (double)statusChangeTimestamp
{
  return self->_statusChangeTimestamp;
}

- (float)timezone
{
  return self->_timezone;
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
  objc_storeStrong((id *)&self->_dPID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
}

@end
