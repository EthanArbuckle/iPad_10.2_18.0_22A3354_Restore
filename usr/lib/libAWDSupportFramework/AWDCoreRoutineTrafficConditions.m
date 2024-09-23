@implementation AWDCoreRoutineTrafficConditions

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setVehicleConnected:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_vehicleConnected = a3;
}

- (void)setHasVehicleConnected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVehicleConnected
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPredictedLocationOfInterest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_predictedLocationOfInterest = a3;
}

- (void)setHasPredictedLocationOfInterest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPredictedLocationOfInterest
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)trafficDensity
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_trafficDensity;
  else
    return 0;
}

- (void)setTrafficDensity:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_trafficDensity = a3;
}

- (void)setHasTrafficDensity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTrafficDensity
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)trafficDensityAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D990[a3];
}

- (int)StringAsTrafficDensity:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineTrafficDensityUnknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineTrafficDensityLight")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineTrafficDensityNormal")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineTrafficDensityHeavy")))
    return 3;
  return 0;
}

- (int)precisionRecall
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_precisionRecall;
  else
    return 0;
}

- (void)setPrecisionRecall:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_precisionRecall = a3;
}

- (void)setHasPrecisionRecall:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrecisionRecall
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)precisionRecallAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D9B0[a3];
}

- (int)StringAsPrecisionRecall:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutinePrecisionRecallUnknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutinePrecisionRecallTruePositive")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutinePrecisionRecallFalsePositive")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutinePrecisionRecallTrueNegative")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutinePrecisionRecallFalseNegative")))
    return 4;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineTrafficConditions;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineTrafficConditions description](&v3, sel_description), -[AWDCoreRoutineTrafficConditions dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t trafficDensity;
  __CFString *v6;
  uint64_t precisionRecall;
  __CFString *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_vehicleConnected), CFSTR("vehicleConnected"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_predictedLocationOfInterest), CFSTR("predictedLocationOfInterest"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return v3;
    goto LABEL_14;
  }
LABEL_10:
  trafficDensity = self->_trafficDensity;
  if (trafficDensity >= 4)
    v6 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_trafficDensity);
  else
    v6 = off_24C10D990[trafficDensity];
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("trafficDensity"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_14:
    precisionRecall = self->_precisionRecall;
    if (precisionRecall >= 5)
      v8 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_precisionRecall);
    else
      v8 = off_24C10D9B0[precisionRecall];
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("precisionRecall"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineTrafficConditionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return;
LABEL_11:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 25) = self->_vehicleConnected;
  *((_BYTE *)a3 + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_BYTE *)a3 + 24) = self->_predictedLocationOfInterest;
  *((_BYTE *)a3 + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return;
LABEL_11:
    *((_DWORD *)a3 + 4) = self->_precisionRecall;
    *((_BYTE *)a3 + 28) |= 2u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 5) = self->_trafficDensity;
  *((_BYTE *)a3 + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 25) = self->_vehicleConnected;
  *((_BYTE *)result + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)result + 24) = self->_predictedLocationOfInterest;
  *((_BYTE *)result + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_trafficDensity;
  *((_BYTE *)result + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 4) = self->_precisionRecall;
  *((_BYTE *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 28) & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 0x10) == 0)
      goto LABEL_32;
    if (self->_vehicleConnected)
    {
      if (!*((_BYTE *)a3 + 25))
        goto LABEL_32;
    }
    else if (*((_BYTE *)a3 + 25))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)a3 + 28) & 8) != 0)
      goto LABEL_32;
    goto LABEL_23;
  }
  if ((*((_BYTE *)a3 + 28) & 8) == 0)
    goto LABEL_32;
  if (self->_predictedLocationOfInterest)
  {
    if (!*((_BYTE *)a3 + 24))
      goto LABEL_32;
    goto LABEL_23;
  }
  if (*((_BYTE *)a3 + 24))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_23:
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 4) == 0 || self->_trafficDensity != *((_DWORD *)a3 + 5))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)a3 + 28) & 4) != 0)
  {
    goto LABEL_32;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_precisionRecall != *((_DWORD *)a3 + 4))
      goto LABEL_32;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_vehicleConnected;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_predictedLocationOfInterest;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_trafficDensity;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_precisionRecall;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 28);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_vehicleConnected = *((_BYTE *)a3 + 25);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_predictedLocationOfInterest = *((_BYTE *)a3 + 24);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      return;
LABEL_11:
    self->_precisionRecall = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_trafficDensity = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 28) & 2) != 0)
    goto LABEL_11;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)vehicleConnected
{
  return self->_vehicleConnected;
}

- (BOOL)predictedLocationOfInterest
{
  return self->_predictedLocationOfInterest;
}

@end
