@implementation ALCMCalorieDataDeprecated

- (void)setRecordId:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRecordId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)activityTypeAsString:(int)a3
{
  id result;

  if (a3 > 2023)
  {
    if (a3 <= 11804)
    {
      if (a3 <= 2070)
      {
        if (a3 > 2060)
        {
          if (a3 == 2061)
            return CFSTR("kTypeCrossTraining");
          if (a3 == 2065)
            return CFSTR("kTypeStairClimbing");
        }
        else
        {
          if (a3 == 2024)
            return CFSTR("kTypeCoreTraining");
          if (a3 == 2048)
            return CFSTR("kTypeElliptical");
        }
      }
      else if (a3 <= 2104)
      {
        if (a3 == 2071)
          return CFSTR("kTypeRowing");
        if (a3 == 2101)
          return CFSTR("kTypeCoolDown");
      }
      else
      {
        switch(a3)
        {
          case 2105:
            return CFSTR("kTypePilates");
          case 2150:
            return CFSTR("kTypeYoga");
          case 3015:
            return CFSTR("kTypeDancing");
        }
      }
    }
    else if (a3 > 17149)
    {
      if (a3 <= 18239)
      {
        if (a3 == 17150)
          return CFSTR("kTypeIndoorWalking");
        if (a3 == 18200)
          return CFSTR("kTypeScubaDiving");
      }
      else
      {
        switch(a3)
        {
          case 18240:
            return CFSTR("kTypeSwimming");
          case 19150:
            return CFSTR("kTypeSummer");
          case 90603:
            return CFSTR("kTypeOutdoorWheelchair");
        }
      }
    }
    else if (a3 <= 15109)
    {
      if (a3 == 11805)
        return CFSTR("kTypePushingWheelchair");
      if (a3 == 12150)
        return CFSTR("kTypeIndoorRunning");
    }
    else
    {
      switch(a3)
      {
        case 15110:
          return CFSTR("kTypeKickboxing");
        case 15255:
          return CFSTR("kTypeGolfing");
        case 15670:
          return CFSTR("kTypeTaiChi");
      }
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  if (a3 > 40)
  {
    if (a3 > 99)
    {
      if (a3 > 2019)
      {
        if (a3 == 2020)
          return CFSTR("kTypeCalisthenics");
        if (a3 == 2022)
          return CFSTR("kTypeFunctionalStrength");
      }
      else
      {
        if (a3 == 100)
          return CFSTR("kTypeCyclingLeg");
        if (a3 == 2010)
          return CFSTR("kTypeStationaryCycling");
      }
    }
    else if (a3 > 55)
    {
      if (a3 == 56)
        return CFSTR("kTypeDrivingOther");
      if (a3 == 63)
        return CFSTR("kTypeMultiSportTransition");
    }
    else
    {
      if (a3 == 41)
        return CFSTR("kTypeWalkingSlow");
      if (a3 == 52)
        return CFSTR("kTypeVehicularInHand");
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  result = CFSTR("kTypeUnknown");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("kTypeFrozen");
      break;
    case 2:
      result = CFSTR("kTypeStatic");
      break;
    case 3:
      result = CFSTR("kTypeMoving");
      break;
    case 4:
      result = CFSTR("kTypeWalking");
      break;
    case 5:
      result = CFSTR("kTypeDriving");
      break;
    case 6:
      result = CFSTR("kTypeCycling");
      break;
    case 7:
      result = CFSTR("kTypeSemiStationary");
      break;
    case 8:
      result = CFSTR("kTypeRunning");
      break;
    case 9:
      result = CFSTR("kTypeMovingCoarse");
      break;
    case 10:
      result = CFSTR("kTypeInVehicleFrozen");
      break;
    case 11:
      result = CFSTR("kTypeInVehicleStatic");
      break;
    default:
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  return result;
}

- (int)StringAsActivityType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeUnknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeFrozen")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeStatic")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeMoving")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeWalking")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDriving")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCycling")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeSemiStationary")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeRunning")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeMovingCoarse")) & 1) != 0)
    return 9;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeInVehicleFrozen")) & 1) != 0)
    return 10;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeInVehicleStatic")) & 1) != 0)
    return 11;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeWalkingSlow")) & 1) != 0)
    return 41;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeVehicularInHand")) & 1) != 0)
    return 52;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDrivingOther")) & 1) != 0)
    return 56;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCyclingLeg")) & 1) != 0)
    return 100;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeStationaryCycling")) & 1) != 0)
    return 2010;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCalisthenics")) & 1) != 0)
    return 2020;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeElliptical")) & 1) != 0)
    return 2048;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCrossTraining")) & 1) != 0)
    return 2061;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeStairClimbing")) & 1) != 0)
    return 2065;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeRowing")) & 1) != 0)
    return 2071;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeYoga")) & 1) != 0)
    return 2150;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDancing")) & 1) != 0)
    return 3015;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypePushingWheelchair")) & 1) != 0)
    return 11805;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeIndoorRunning")) & 1) != 0)
    return 12150;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeGolfing")) & 1) != 0)
    return 15255;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeIndoorWalking")) & 1) != 0)
    return 17150;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeSwimming")) & 1) != 0)
    return 18240;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeSummer")) & 1) != 0)
    return 19150;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeOutdoorWheelchair")) & 1) != 0)
    return 90603;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeFunctionalStrength")) & 1) != 0)
    return 2022;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCoolDown")) & 1) != 0)
    return 2101;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCoreTraining")) & 1) != 0)
    return 2024;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeTaiChi")) & 1) != 0)
    return 15670;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypePilates")) & 1) != 0)
    return 2105;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeMultiSportTransition")) & 1) != 0)
    return 63;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeScubaDiving")) & 1) != 0)
    return 18200;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeKickboxing")))
    return 15110;
  return 0;
}

- (id)metSourceAsString:(int)a3
{
  if (a3 >= 4)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_102173A40 + a3);
}

- (int)StringAsMetSource:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kWorkRate")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kHeartRate")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kCalibratedWorkRate")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kDefaultValue")))
    return 3;
  return 0;
}

- (void)setTimestamp:(double)a3
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

- (void)setMetsHR:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_metsHR = a3;
}

- (void)setHasMetsHR:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMetsHR
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMetsWR:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_metsWR = a3;
}

- (void)setHasMetsWR:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMetsWR
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMCalorieDataDeprecated;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMCalorieDataDeprecated description](&v3, "description"), -[ALCMCalorieDataDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  int activityType;
  const __CFString *v5;
  uint64_t metSource;
  NSString *v7;
  double v8;
  double v9;
  double v10;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordId), CFSTR("recordId"));
  activityType = self->_activityType;
  if (activityType > 2023)
  {
    if (activityType <= 11804)
    {
      if (activityType <= 2070)
      {
        if (activityType > 2060)
        {
          if (activityType == 2061)
          {
            v5 = CFSTR("kTypeCrossTraining");
            goto LABEL_82;
          }
          if (activityType == 2065)
          {
            v5 = CFSTR("kTypeStairClimbing");
            goto LABEL_82;
          }
        }
        else
        {
          if (activityType == 2024)
          {
            v5 = CFSTR("kTypeCoreTraining");
            goto LABEL_82;
          }
          if (activityType == 2048)
          {
            v5 = CFSTR("kTypeElliptical");
            goto LABEL_82;
          }
        }
      }
      else if (activityType <= 2104)
      {
        if (activityType == 2071)
        {
          v5 = CFSTR("kTypeRowing");
          goto LABEL_82;
        }
        if (activityType == 2101)
        {
          v5 = CFSTR("kTypeCoolDown");
          goto LABEL_82;
        }
      }
      else
      {
        switch(activityType)
        {
          case 2105:
            v5 = CFSTR("kTypePilates");
            goto LABEL_82;
          case 2150:
            v5 = CFSTR("kTypeYoga");
            goto LABEL_82;
          case 3015:
            v5 = CFSTR("kTypeDancing");
            goto LABEL_82;
        }
      }
    }
    else if (activityType > 17149)
    {
      if (activityType <= 18239)
      {
        if (activityType == 17150)
        {
          v5 = CFSTR("kTypeIndoorWalking");
          goto LABEL_82;
        }
        if (activityType == 18200)
        {
          v5 = CFSTR("kTypeScubaDiving");
          goto LABEL_82;
        }
      }
      else
      {
        switch(activityType)
        {
          case 18240:
            v5 = CFSTR("kTypeSwimming");
            goto LABEL_82;
          case 19150:
            v5 = CFSTR("kTypeSummer");
            goto LABEL_82;
          case 90603:
            v5 = CFSTR("kTypeOutdoorWheelchair");
            goto LABEL_82;
        }
      }
    }
    else if (activityType <= 15109)
    {
      if (activityType == 11805)
      {
        v5 = CFSTR("kTypePushingWheelchair");
        goto LABEL_82;
      }
      if (activityType == 12150)
      {
        v5 = CFSTR("kTypeIndoorRunning");
        goto LABEL_82;
      }
    }
    else
    {
      switch(activityType)
      {
        case 15110:
          v5 = CFSTR("kTypeKickboxing");
          goto LABEL_82;
        case 15255:
          v5 = CFSTR("kTypeGolfing");
          goto LABEL_82;
        case 15670:
          v5 = CFSTR("kTypeTaiChi");
          goto LABEL_82;
      }
    }
LABEL_81:
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_activityType);
    goto LABEL_82;
  }
  if (activityType > 40)
  {
    if (activityType > 99)
    {
      if (activityType > 2019)
      {
        if (activityType == 2020)
        {
          v5 = CFSTR("kTypeCalisthenics");
          goto LABEL_82;
        }
        if (activityType == 2022)
        {
          v5 = CFSTR("kTypeFunctionalStrength");
          goto LABEL_82;
        }
      }
      else
      {
        if (activityType == 100)
        {
          v5 = CFSTR("kTypeCyclingLeg");
          goto LABEL_82;
        }
        if (activityType == 2010)
        {
          v5 = CFSTR("kTypeStationaryCycling");
          goto LABEL_82;
        }
      }
    }
    else if (activityType > 55)
    {
      if (activityType == 56)
      {
        v5 = CFSTR("kTypeDrivingOther");
        goto LABEL_82;
      }
      if (activityType == 63)
      {
        v5 = CFSTR("kTypeMultiSportTransition");
        goto LABEL_82;
      }
    }
    else
    {
      if (activityType == 41)
      {
        v5 = CFSTR("kTypeWalkingSlow");
        goto LABEL_82;
      }
      if (activityType == 52)
      {
        v5 = CFSTR("kTypeVehicularInHand");
        goto LABEL_82;
      }
    }
    goto LABEL_81;
  }
  v5 = CFSTR("kTypeUnknown");
  switch(activityType)
  {
    case 0:
      break;
    case 1:
      v5 = CFSTR("kTypeFrozen");
      break;
    case 2:
      v5 = CFSTR("kTypeStatic");
      break;
    case 3:
      v5 = CFSTR("kTypeMoving");
      break;
    case 4:
      v5 = CFSTR("kTypeWalking");
      break;
    case 5:
      v5 = CFSTR("kTypeDriving");
      break;
    case 6:
      v5 = CFSTR("kTypeCycling");
      break;
    case 7:
      v5 = CFSTR("kTypeSemiStationary");
      break;
    case 8:
      v5 = CFSTR("kTypeRunning");
      break;
    case 9:
      v5 = CFSTR("kTypeMovingCoarse");
      break;
    case 10:
      v5 = CFSTR("kTypeInVehicleFrozen");
      break;
    case 11:
      v5 = CFSTR("kTypeInVehicleStatic");
      break;
    default:
      goto LABEL_81;
  }
LABEL_82:
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("activityType"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isStanding), CFSTR("isStanding"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_mets), CFSTR("mets"));
  metSource = self->_metSource;
  if (metSource >= 4)
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_metSource);
  else
    v7 = (NSString *)*(&off_102173A40 + metSource);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("metSource"));
  *(float *)&v8 = self->_meanAngleX;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8), CFSTR("meanAngleX"));
  *(float *)&v9 = self->_energyMagnitude;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9), CFSTR("energyMagnitude"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry), CFSTR("regularEntry"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&v10 = self->_metsHR;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10), CFSTR("metsHR"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(float *)&v10 = self->_metsWR;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10), CFSTR("metsWR"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B58FD4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field(a3, self->_recordId, 1);
  PBDataWriterWriteInt32Field(a3, self->_activityType, 2);
  PBDataWriterWriteBOOLField(a3, self->_isStanding, 3);
  PBDataWriterWriteDoubleField(a3, 4, self->_mets);
  PBDataWriterWriteInt32Field(a3, self->_metSource, 5);
  PBDataWriterWriteFloatField(a3, 6, self->_meanAngleX);
  PBDataWriterWriteFloatField(a3, 7, self->_energyMagnitude);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField(a3, 9, self->_timestamp);
  PBDataWriterWriteBOOLField(a3, self->_regularEntry, 10);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField(a3, 11, self->_metsHR);
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteFloatField(a3, 12, self->_metsWR);
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_recordId;
    *((_BYTE *)a3 + 56) |= 8u;
  }
  *((_DWORD *)a3 + 6) = self->_activityType;
  *((_BYTE *)a3 + 52) = self->_isStanding;
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_mets;
  *((_DWORD *)a3 + 9) = self->_metSource;
  *((_DWORD *)a3 + 8) = LODWORD(self->_meanAngleX);
  *((_DWORD *)a3 + 7) = LODWORD(self->_energyMagnitude);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)a3 + 56) |= 1u;
  }
  *((_BYTE *)a3 + 53) = self->_regularEntry;
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return;
LABEL_9:
    *((_DWORD *)a3 + 11) = LODWORD(self->_metsWR);
    *((_BYTE *)a3 + 56) |= 4u;
    return;
  }
  *((_DWORD *)a3 + 10) = LODWORD(self->_metsHR);
  *((_BYTE *)a3 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)result + 12) = self->_recordId;
    *((_BYTE *)result + 56) |= 8u;
  }
  *((_DWORD *)result + 6) = self->_activityType;
  *((_BYTE *)result + 52) = self->_isStanding;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_mets;
  *((_DWORD *)result + 9) = self->_metSource;
  *((_DWORD *)result + 8) = LODWORD(self->_meanAngleX);
  *((_DWORD *)result + 7) = LODWORD(self->_energyMagnitude);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 56) |= 1u;
  }
  *((_BYTE *)result + 53) = self->_regularEntry;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 10) = LODWORD(self->_metsHR);
    *((_BYTE *)result + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 11) = LODWORD(self->_metsWR);
    *((_BYTE *)result + 56) |= 4u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_recordId != *((_DWORD *)a3 + 12))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 56) & 8) != 0)
  {
    goto LABEL_34;
  }
  if (self->_activityType != *((_DWORD *)a3 + 6))
    goto LABEL_34;
  if (self->_isStanding)
  {
    if (!*((_BYTE *)a3 + 52))
      goto LABEL_34;
  }
  else if (*((_BYTE *)a3 + 52))
  {
    goto LABEL_34;
  }
  if (self->_mets != *((double *)a3 + 1)
    || self->_metSource != *((_DWORD *)a3 + 9)
    || self->_meanAngleX != *((float *)a3 + 8)
    || self->_energyMagnitude != *((float *)a3 + 7))
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_timestamp != *((double *)a3 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 56) & 1) != 0)
  {
    goto LABEL_34;
  }
  if (self->_regularEntry)
  {
    if (!*((_BYTE *)a3 + 53))
      goto LABEL_34;
    goto LABEL_25;
  }
  if (*((_BYTE *)a3 + 53))
  {
LABEL_34:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_25:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_metsHR != *((float *)a3 + 10))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 56) & 2) != 0)
  {
    goto LABEL_34;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_metsWR != *((float *)a3 + 11))
      goto LABEL_34;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  double mets;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t metSource;
  float meanAngleX;
  float v15;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  float energyMagnitude;
  float v24;
  float v25;
  float v26;
  float v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  double timestamp;
  double v34;
  long double v35;
  double v36;
  _BOOL4 regularEntry;
  unint64_t v38;
  float metsHR;
  float v40;
  float v41;
  float v42;
  float v43;
  unint64_t v44;
  float metsWR;
  float v46;
  float v47;
  float v48;
  float v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  _BOOL4 isStanding;
  uint64_t activityType;
  uint64_t v56;

  has = (char)self->_has;
  if ((has & 8) != 0)
    v56 = 2654435761 * self->_recordId;
  else
    v56 = 0;
  isStanding = self->_isStanding;
  activityType = self->_activityType;
  mets = self->_mets;
  v5 = -mets;
  if (mets >= 0.0)
    v5 = self->_mets;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  metSource = self->_metSource;
  meanAngleX = self->_meanAngleX;
  v15 = -meanAngleX;
  if (meanAngleX >= 0.0)
    v15 = self->_meanAngleX;
  v16 = floorf(v15 + 0.5);
  v17 = (float)(v15 - v16) * 1.8447e19;
  v18 = fmodf(v16, 1.8447e19);
  v19 = 2654435761u * (unint64_t)v18;
  v20 = v19 + (unint64_t)v17;
  if (v17 <= 0.0)
    v20 = 2654435761u * (unint64_t)v18;
  v21 = v19 - (unint64_t)fabsf(v17);
  if (v17 < 0.0)
    v22 = v21;
  else
    v22 = v20;
  energyMagnitude = self->_energyMagnitude;
  v24 = -energyMagnitude;
  if (energyMagnitude >= 0.0)
    v24 = self->_energyMagnitude;
  v25 = floorf(v24 + 0.5);
  v26 = (float)(v24 - v25) * 1.8447e19;
  v27 = fmodf(v25, 1.8447e19);
  v28 = 2654435761u * (unint64_t)v27;
  v29 = v28 + (unint64_t)v26;
  if (v26 <= 0.0)
    v29 = 2654435761u * (unint64_t)v27;
  v30 = v28 - (unint64_t)fabsf(v26);
  if (v26 < 0.0)
    v31 = v30;
  else
    v31 = v29;
  if ((has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v34 = -timestamp;
    if (timestamp >= 0.0)
      v34 = self->_timestamp;
    v35 = floor(v34 + 0.5);
    v36 = (v34 - v35) * 1.84467441e19;
    v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0)
        v32 += (unint64_t)v36;
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    v32 = 0;
  }
  regularEntry = self->_regularEntry;
  if ((has & 2) != 0)
  {
    metsHR = self->_metsHR;
    v40 = -metsHR;
    if (metsHR >= 0.0)
      v40 = self->_metsHR;
    v41 = floorf(v40 + 0.5);
    v42 = (float)(v40 - v41) * 1.8447e19;
    v43 = fmodf(v41, 1.8447e19);
    v44 = 2654435761u * (unint64_t)v43;
    if (v42 >= 0.0)
    {
      if (v42 > 0.0)
        v38 = v44 + (unint64_t)v42;
      else
        v38 = 2654435761u * (unint64_t)v43;
      if ((has & 4) == 0)
        goto LABEL_51;
    }
    else
    {
      v38 = v44 - (unint64_t)fabsf(v42);
      if ((has & 4) == 0)
      {
LABEL_51:
        v52 = 0;
        return (2654435761 * activityType) ^ (2654435761 * metSource) ^ v22 ^ v31 ^ v56 ^ (2654435761 * isStanding) ^ v12 ^ v32 ^ (2654435761 * regularEntry) ^ v38 ^ v52;
      }
    }
  }
  else
  {
    v38 = 0;
    if ((has & 4) == 0)
      goto LABEL_51;
  }
  metsWR = self->_metsWR;
  v46 = -metsWR;
  if (metsWR >= 0.0)
    v46 = self->_metsWR;
  v47 = floorf(v46 + 0.5);
  v48 = (float)(v46 - v47) * 1.8447e19;
  v49 = fmodf(v47, 1.8447e19);
  v50 = 2654435761u * (unint64_t)v49;
  v51 = v50 + (unint64_t)v48;
  if (v48 <= 0.0)
    v51 = 2654435761u * (unint64_t)v49;
  v52 = v50 - (unint64_t)fabsf(v48);
  if (v48 >= 0.0)
    v52 = v51;
  return (2654435761 * activityType) ^ (2654435761 * metSource) ^ v22 ^ v31 ^ v56 ^ (2654435761 * isStanding) ^ v12 ^ v32 ^ (2654435761 * regularEntry) ^ v38 ^ v52;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 56) & 8) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 8u;
  }
  self->_activityType = *((_DWORD *)a3 + 6);
  self->_isStanding = *((_BYTE *)a3 + 52);
  self->_mets = *((double *)a3 + 1);
  self->_metSource = *((_DWORD *)a3 + 9);
  self->_meanAngleX = *((float *)a3 + 8);
  self->_energyMagnitude = *((float *)a3 + 7);
  if ((*((_BYTE *)a3 + 56) & 1) != 0)
  {
    self->_timestamp = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  self->_regularEntry = *((_BYTE *)a3 + 53);
  if ((*((_BYTE *)a3 + 56) & 2) == 0)
  {
    if ((*((_BYTE *)a3 + 56) & 4) == 0)
      return;
LABEL_9:
    self->_metsWR = *((float *)a3 + 11);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }
  self->_metsHR = *((float *)a3 + 10);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 56) & 4) != 0)
    goto LABEL_9;
}

- (int)recordId
{
  return self->_recordId;
}

- (int)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int)a3
{
  self->_activityType = a3;
}

- (BOOL)isStanding
{
  return self->_isStanding;
}

- (void)setIsStanding:(BOOL)a3
{
  self->_isStanding = a3;
}

- (double)mets
{
  return self->_mets;
}

- (void)setMets:(double)a3
{
  self->_mets = a3;
}

- (int)metSource
{
  return self->_metSource;
}

- (void)setMetSource:(int)a3
{
  self->_metSource = a3;
}

- (float)meanAngleX
{
  return self->_meanAngleX;
}

- (void)setMeanAngleX:(float)a3
{
  self->_meanAngleX = a3;
}

- (float)energyMagnitude
{
  return self->_energyMagnitude;
}

- (void)setEnergyMagnitude:(float)a3
{
  self->_energyMagnitude = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_regularEntry = a3;
}

- (float)metsHR
{
  return self->_metsHR;
}

- (float)metsWR
{
  return self->_metsWR;
}

@end
