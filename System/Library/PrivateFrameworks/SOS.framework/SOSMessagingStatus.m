@implementation SOSMessagingStatus

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setTrigger:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTrigger
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTimeOfDetection:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeOfDetection = a3;
}

- (void)setHasTimeOfDetection:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeOfDetection
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTimeOfResolution:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timeOfResolution = a3;
}

- (void)setHasTimeOfResolution:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeOfResolution
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setResolution:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_resolution = a3;
}

- (void)setHasResolution:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResolution
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setFlowState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_flowState = a3;
}

- (void)setHasFlowState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFlowState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsPairedDeviceStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isPairedDeviceStatus = a3;
}

- (void)setHasIsPairedDeviceStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsPairedDeviceStatus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SOSMessagingStatus;
  -[SOSMessagingStatus description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSMessagingStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trigger);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("trigger"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeOfDetection);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("timeOfDetection"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeOfResolution);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timeOfResolution"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_flowState);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("flowState"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v4;
    goto LABEL_9;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_resolution);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("resolution"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPairedDeviceStatus);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("isPairedDeviceStatus"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SOSMessagingStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_15:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_10:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_uuid)
  {
    v6 = v4;
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_trigger;
    *((_BYTE *)v4 + 52) |= 0x10u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timeOfDetection;
  *((_BYTE *)v4 + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_timeOfResolution;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_15:
    *((_DWORD *)v4 + 6) = self->_flowState;
    *((_BYTE *)v4 + 52) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  *((_DWORD *)v4 + 7) = self->_resolution;
  *((_BYTE *)v4 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    *((_BYTE *)v4 + 48) = self->_isPairedDeviceStatus;
    *((_BYTE *)v4 + 52) |= 0x20u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_trigger;
    *(_BYTE *)(v5 + 52) |= 0x10u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 8) = self->_timeOfDetection;
  *(_BYTE *)(v5 + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(double *)(v5 + 16) = self->_timeOfResolution;
  *(_BYTE *)(v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
LABEL_13:
    *(_DWORD *)(v5 + 24) = self->_flowState;
    *(_BYTE *)(v5 + 52) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v5;
    goto LABEL_7;
  }
LABEL_12:
  *(_DWORD *)(v5 + 28) = self->_resolution;
  *(_BYTE *)(v5 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *(_BYTE *)(v5 + 48) = self->_isPairedDeviceStatus;
    *(_BYTE *)(v5 + 52) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuid;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0 || self->_trigger != *((_DWORD *)v4 + 8))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_timeOfDetection != *((double *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_timeOfResolution != *((double *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_resolution != *((_DWORD *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_flowState != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_31;
  }
  v6 = (*((_BYTE *)v4 + 52) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x20) == 0)
    {
LABEL_31:
      v6 = 0;
      goto LABEL_32;
    }
    if (self->_isPairedDeviceStatus)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_31;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_31;
    }
    v6 = 1;
  }
LABEL_32:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  double timeOfDetection;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double timeOfResolution;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = -[NSString hash](self->_uuid, "hash");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v5 = 2654435761 * self->_trigger;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  timeOfDetection = self->_timeOfDetection;
  v7 = -timeOfDetection;
  if (timeOfDetection >= 0.0)
    v7 = self->_timeOfDetection;
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
  if ((has & 2) != 0)
  {
    timeOfResolution = self->_timeOfResolution;
    v13 = -timeOfResolution;
    if (timeOfResolution >= 0.0)
      v13 = self->_timeOfResolution;
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
  if ((has & 8) == 0)
  {
    v16 = 0;
    if ((has & 4) != 0)
      goto LABEL_21;
LABEL_24:
    v17 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_22;
LABEL_25:
    v18 = 0;
    return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18;
  }
  v16 = 2654435761 * self->_resolution;
  if ((has & 4) == 0)
    goto LABEL_24;
LABEL_21:
  v17 = 2654435761 * self->_flowState;
  if ((has & 0x20) == 0)
    goto LABEL_25;
LABEL_22:
  v18 = 2654435761 * self->_isPairedDeviceStatus;
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 5))
  {
    v6 = v4;
    -[SOSMessagingStatus setUuid:](self, "setUuid:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 0x10) != 0)
  {
    self->_trigger = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_timeOfDetection = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_timeOfResolution = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
LABEL_15:
    self->_flowState = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 52) & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  self->_resolution = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) != 0)
    goto LABEL_15;
LABEL_8:
  if ((v5 & 0x20) != 0)
  {
LABEL_9:
    self->_isPairedDeviceStatus = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_10:

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (int)trigger
{
  return self->_trigger;
}

- (double)timeOfDetection
{
  return self->_timeOfDetection;
}

- (double)timeOfResolution
{
  return self->_timeOfResolution;
}

- (int)resolution
{
  return self->_resolution;
}

- (int)flowState
{
  return self->_flowState;
}

- (BOOL)isPairedDeviceStatus
{
  return self->_isPairedDeviceStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (SOSMessagingStatus)initWithSOSStatus:(id)a3
{
  id v4;
  SOSMessagingStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SOSMessagingStatus *v10;
  NSObject *v11;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)SOSMessagingStatus;
    v5 = -[SOSMessagingStatus init](&v13, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOSMessagingStatus setUuid:](v5, "setUuid:", v7);

      -[SOSMessagingStatus setTrigger:](v5, "setTrigger:", objc_msgSend(v4, "trigger"));
      objc_msgSend(v4, "timeOfDetection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSince1970");
      -[SOSMessagingStatus setTimeOfDetection:](v5, "setTimeOfDetection:");

      objc_msgSend(v4, "timeOfResolution");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      -[SOSMessagingStatus setTimeOfResolution:](v5, "setTimeOfResolution:");

      -[SOSMessagingStatus setResolution:](v5, "setResolution:", objc_msgSend(v4, "resolution"));
      -[SOSMessagingStatus setFlowState:](v5, "setFlowState:", objc_msgSend(v4, "flowState"));
      -[SOSMessagingStatus setIsPairedDeviceStatus:](v5, "setIsPairedDeviceStatus:", objc_msgSend(v4, "isPairedDeviceStatus"));
    }
    self = v5;
    v10 = self;
  }
  else
  {
    sos_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SOSMessagingStatus(Additions) initWithSOSStatus:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (SOSStatus)sosStatus
{
  SOSStatus *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  v3 = objc_alloc_init(SOSStatus);
  if (!-[SOSMessagingStatus hasUuid](self, "hasUuid"))
  {
    sos_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SOSMessagingStatus(Additions) sosStatus].cold.3();
    goto LABEL_12;
  }
  if (!-[SOSMessagingStatus hasTrigger](self, "hasTrigger"))
  {
    sos_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SOSMessagingStatus(Additions) sosStatus].cold.2();
    goto LABEL_12;
  }
  if (!-[SOSMessagingStatus hasTimeOfDetection](self, "hasTimeOfDetection"))
  {
    sos_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SOSMessagingStatus(Additions) sosStatus].cold.1();
LABEL_12:

    v12 = 0;
    goto LABEL_13;
  }
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[SOSMessagingStatus uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);
  -[SOSStatus setUuid:](v3, "setUuid:", v6);

  -[SOSStatus setTrigger:](v3, "setTrigger:", -[SOSMessagingStatus trigger](self, "trigger"));
  v7 = objc_alloc(MEMORY[0x1E0C99D68]);
  -[SOSMessagingStatus timeOfDetection](self, "timeOfDetection");
  v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSince1970:");
  -[SOSStatus setTimeOfDetection:](v3, "setTimeOfDetection:", v8);

  if (-[SOSMessagingStatus hasTimeOfResolution](self, "hasTimeOfResolution"))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[SOSMessagingStatus timeOfResolution](self, "timeOfResolution");
    v10 = (void *)objc_msgSend(v9, "initWithTimeIntervalSince1970:");
    -[SOSStatus setTimeOfResolution:](v3, "setTimeOfResolution:", v10);

  }
  else
  {
    -[SOSStatus setTimeOfResolution:](v3, "setTimeOfResolution:", 0);
  }
  if (-[SOSMessagingStatus hasResolution](self, "hasResolution"))
    v14 = -[SOSMessagingStatus resolution](self, "resolution");
  else
    v14 = 0;
  -[SOSStatus setResolution:](v3, "setResolution:", v14);
  if (-[SOSMessagingStatus hasFlowState](self, "hasFlowState"))
    v15 = -[SOSMessagingStatus flowState](self, "flowState");
  else
    v15 = 0;
  -[SOSStatus setFlowState:](v3, "setFlowState:", v15);
  -[SOSStatus setIsPairedDeviceStatus:](v3, "setIsPairedDeviceStatus:", -[SOSMessagingStatus isPairedDeviceStatus](self, "isPairedDeviceStatus"));
  v12 = (void *)-[SOSStatus copy](v3, "copy");
LABEL_13:

  return (SOSStatus *)v12;
}

@end
