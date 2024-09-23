@implementation ALCMFitnessTracking

- (int)powerSource
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_powerSource;
  else
    return 0;
}

- (void)setPowerSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_powerSource = a3;
}

- (void)setHasPowerSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPowerSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)powerSourceAsString:(int)a3
{
  if (a3 >= 4)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_1021B6DB8 + a3);
}

- (int)StringAsPowerSource:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kChargerTypeUnknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kChargerTypeNone")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kChargerTypeUsb")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kChargerTypeExternal")))
    return 3;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMFitnessTracking;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMFitnessTracking description](&v3, "description"), -[ALCMFitnessTracking dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  uint64_t powerSource;
  NSString *v5;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_fitnessTrackingEnabled), CFSTR("fitnessTrackingEnabled"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    powerSource = self->_powerSource;
    if (powerSource >= 4)
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_powerSource);
    else
      v5 = (NSString *)*(&off_1021B6DB8 + powerSource);
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("powerSource"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_101445F80((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteBOOLField(a3, self->_fitnessTrackingEnabled, 1);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field(a3, self->_powerSource, 2);
}

- (void)copyTo:(id)a3
{
  *((_BYTE *)a3 + 12) = self->_fitnessTrackingEnabled;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_powerSource;
    *((_BYTE *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_BYTE *)result + 12) = self->_fitnessTrackingEnabled;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_powerSource;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_fitnessTrackingEnabled)
    {
      if (!*((_BYTE *)a3 + 12))
        goto LABEL_10;
    }
    else if (*((_BYTE *)a3 + 12))
    {
LABEL_10:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 16) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 16) & 1) == 0 || self->_powerSource != *((_DWORD *)a3 + 2))
        goto LABEL_10;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_powerSource;
  else
    v2 = 0;
  return v2 ^ (2654435761 * self->_fitnessTrackingEnabled);
}

- (void)mergeFrom:(id)a3
{
  self->_fitnessTrackingEnabled = *((_BYTE *)a3 + 12);
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_powerSource = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (BOOL)fitnessTrackingEnabled
{
  return self->_fitnessTrackingEnabled;
}

- (void)setFitnessTrackingEnabled:(BOOL)a3
{
  self->_fitnessTrackingEnabled = a3;
}

@end
