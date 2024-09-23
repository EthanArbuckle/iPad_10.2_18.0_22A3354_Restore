@implementation PBBProtoPerformanceResult

+ (void)initialize
{
  objc_method *InstanceMethod;
  objc_method *v4;

  InstanceMethod = class_getInstanceMethod((Class)a1, sel_description);
  v4 = class_getInstanceMethod((Class)a1, sel_detailedDescription);
  method_exchangeImplementations(InstanceMethod, v4);
}

- (id)detailedDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("< %p Activity: %@ (%@), time delta: %f (%f / %f)>"), self, self->_activityType, self->_identifier, *(_QWORD *)&self->_timeDelta, *(_QWORD *)&self->_timeStarted, *(_QWORD *)&self->_timeEnded);
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setTimeDelta:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeDelta = a3;
}

- (void)setHasTimeDelta:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeDelta
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTimeStarted:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timeStarted = a3;
}

- (void)setHasTimeStarted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeStarted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTimeEnded:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timeEnded = a3;
}

- (void)setHasTimeEnded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeEnded
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoPerformanceResult;
  -[PBBProtoPerformanceResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoPerformanceResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *activityType;
  NSString *identifier;
  char has;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  activityType = self->_activityType;
  if (activityType)
    objc_msgSend(v3, "setObject:forKey:", activityType, CFSTR("activityType"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeStarted);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timeStarted"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v4;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeDelta);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("timeDelta"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeEnded);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("timeEnded"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoPerformanceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_activityType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_9:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_activityType)
  {
    objc_msgSend(v4, "setActivityType:");
    v4 = v6;
  }
  if (self->_identifier)
  {
    objc_msgSend(v6, "setIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_timeStarted;
    *((_BYTE *)v4 + 48) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timeDelta;
  *((_BYTE *)v4 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_timeEnded;
    *((_BYTE *)v4 + 48) |= 2u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_activityType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 24) = self->_timeStarted;
    *(_BYTE *)(v5 + 48) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_timeDelta;
  *(_BYTE *)(v5 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_timeEnded;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *activityType;
  NSString *identifier;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:"))
      goto LABEL_20;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timeDelta != *((double *)v4 + 1))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_timeStarted != *((double *)v4 + 3))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_20;
  }
  v7 = (*((_BYTE *)v4 + 48) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_timeEnded != *((double *)v4 + 2))
      goto LABEL_20;
    v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double timeDelta;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double timeStarted;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double timeEnded;
  double v18;
  long double v19;
  double v20;

  v3 = -[NSString hash](self->_activityType, "hash");
  v4 = -[NSString hash](self->_identifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    timeDelta = self->_timeDelta;
    v8 = -timeDelta;
    if (timeDelta >= 0.0)
      v8 = self->_timeDelta;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 4) != 0)
  {
    timeStarted = self->_timeStarted;
    v13 = -timeStarted;
    if (timeStarted >= 0.0)
      v13 = self->_timeStarted;
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
  if ((has & 2) != 0)
  {
    timeEnded = self->_timeEnded;
    v18 = -timeEnded;
    if (timeEnded >= 0.0)
      v18 = self->_timeEnded;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  char v5;
  double *v6;

  v4 = (double *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[PBBProtoPerformanceResult setActivityType:](self, "setActivityType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PBBProtoPerformanceResult setIdentifier:](self, "setIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) == 0)
  {
    if (((_BYTE)v4[6] & 4) == 0)
      goto LABEL_7;
LABEL_11:
    self->_timeStarted = v4[3];
    *(_BYTE *)&self->_has |= 4u;
    if (((_BYTE)v4[6] & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  self->_timeDelta = v4[1];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v5 & 2) != 0)
  {
LABEL_8:
    self->_timeEnded = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_9:

}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)timeDelta
{
  return self->_timeDelta;
}

- (double)timeStarted
{
  return self->_timeStarted;
}

- (double)timeEnded
{
  return self->_timeEnded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
