@implementation ALCMCalorieData

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

- (int)userMetsSource
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_userMetsSource;
  else
    return 0;
}

- (void)setUserMetsSource:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_userMetsSource = a3;
}

- (void)setHasUserMetsSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUserMetsSource
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)userMetsSourceAsString:(int)a3
{
  if (a3 >= 5)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_102152F90[a3];
}

- (int)StringAsUserMetsSource:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kWorkRate")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kHeartRate")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kCalibratedWorkRate")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDefaultValue")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kFitnessMachine")))
    return 4;
  return 0;
}

- (int)truthMetsSource
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_truthMetsSource;
  else
    return 0;
}

- (void)setTruthMetsSource:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_truthMetsSource = a3;
}

- (void)setHasTruthMetsSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTruthMetsSource
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)truthMetsSourceAsString:(int)a3
{
  if (a3 >= 5)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_102152F90[a3];
}

- (int)StringAsTruthMetsSource:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kWorkRate")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kHeartRate")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kCalibratedWorkRate")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDefaultValue")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kFitnessMachine")))
    return 4;
  return 0;
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

- (void)setMetsFM:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_metsFM = a3;
}

- (void)setHasMetsFM:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMetsFM
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMCalorieData;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMCalorieData description](&v3, "description"), -[ALCMCalorieData dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  int activityType;
  const __CFString *v5;
  double v6;
  char has;
  uint64_t userMetsSource;
  __CFString *v10;
  uint64_t truthMetsSource;
  __CFString *v12;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
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
            goto LABEL_80;
          }
          if (activityType == 2065)
          {
            v5 = CFSTR("kTypeStairClimbing");
            goto LABEL_80;
          }
        }
        else
        {
          if (activityType == 2024)
          {
            v5 = CFSTR("kTypeCoreTraining");
            goto LABEL_80;
          }
          if (activityType == 2048)
          {
            v5 = CFSTR("kTypeElliptical");
            goto LABEL_80;
          }
        }
      }
      else if (activityType <= 2104)
      {
        if (activityType == 2071)
        {
          v5 = CFSTR("kTypeRowing");
          goto LABEL_80;
        }
        if (activityType == 2101)
        {
          v5 = CFSTR("kTypeCoolDown");
          goto LABEL_80;
        }
      }
      else
      {
        switch(activityType)
        {
          case 2105:
            v5 = CFSTR("kTypePilates");
            goto LABEL_80;
          case 2150:
            v5 = CFSTR("kTypeYoga");
            goto LABEL_80;
          case 3015:
            v5 = CFSTR("kTypeDancing");
            goto LABEL_80;
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
          goto LABEL_80;
        }
        if (activityType == 18200)
        {
          v5 = CFSTR("kTypeScubaDiving");
          goto LABEL_80;
        }
      }
      else
      {
        switch(activityType)
        {
          case 18240:
            v5 = CFSTR("kTypeSwimming");
            goto LABEL_80;
          case 19150:
            v5 = CFSTR("kTypeSummer");
            goto LABEL_80;
          case 90603:
            v5 = CFSTR("kTypeOutdoorWheelchair");
            goto LABEL_80;
        }
      }
    }
    else if (activityType <= 15109)
    {
      if (activityType == 11805)
      {
        v5 = CFSTR("kTypePushingWheelchair");
        goto LABEL_80;
      }
      if (activityType == 12150)
      {
        v5 = CFSTR("kTypeIndoorRunning");
        goto LABEL_80;
      }
    }
    else
    {
      switch(activityType)
      {
        case 15110:
          v5 = CFSTR("kTypeKickboxing");
          goto LABEL_80;
        case 15255:
          v5 = CFSTR("kTypeGolfing");
          goto LABEL_80;
        case 15670:
          v5 = CFSTR("kTypeTaiChi");
          goto LABEL_80;
      }
    }
LABEL_79:
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_activityType);
    goto LABEL_80;
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
          goto LABEL_80;
        }
        if (activityType == 2022)
        {
          v5 = CFSTR("kTypeFunctionalStrength");
          goto LABEL_80;
        }
      }
      else
      {
        if (activityType == 100)
        {
          v5 = CFSTR("kTypeCyclingLeg");
          goto LABEL_80;
        }
        if (activityType == 2010)
        {
          v5 = CFSTR("kTypeStationaryCycling");
          goto LABEL_80;
        }
      }
    }
    else if (activityType > 55)
    {
      if (activityType == 56)
      {
        v5 = CFSTR("kTypeDrivingOther");
        goto LABEL_80;
      }
      if (activityType == 63)
      {
        v5 = CFSTR("kTypeMultiSportTransition");
        goto LABEL_80;
      }
    }
    else
    {
      if (activityType == 41)
      {
        v5 = CFSTR("kTypeWalkingSlow");
        goto LABEL_80;
      }
      if (activityType == 52)
      {
        v5 = CFSTR("kTypeVehicularInHand");
        goto LABEL_80;
      }
    }
    goto LABEL_79;
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
      goto LABEL_79;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("activityType"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isStanding), CFSTR("isStanding"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_userMets), CFSTR("userMets"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_truthMets), CFSTR("truthMets"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    userMetsSource = self->_userMetsSource;
    if (userMetsSource >= 5)
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_userMetsSource);
    else
      v10 = off_102152F90[userMetsSource];
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("userMetsSource"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_82:
      if ((has & 2) == 0)
        goto LABEL_83;
      goto LABEL_95;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_82;
  }
  truthMetsSource = self->_truthMetsSource;
  if (truthMetsSource >= 5)
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_truthMetsSource);
  else
    v12 = off_102152F90[truthMetsSource];
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("truthMetsSource"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_83:
    if ((has & 4) == 0)
      goto LABEL_84;
LABEL_96:
    *(float *)&v6 = self->_metsWR;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("metsWR"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_85;
  }
LABEL_95:
  *(float *)&v6 = self->_metsHR;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("metsHR"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_96;
LABEL_84:
  if ((has & 1) != 0)
  {
LABEL_85:
    *(float *)&v6 = self->_metsFM;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("metsFM"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1007A5C94((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  PBDataWriterWriteInt32Field(a3, self->_activityType, 1);
  PBDataWriterWriteBOOLField(a3, self->_isStanding, 2);
  PBDataWriterWriteDoubleField(a3, 3, self->_userMets);
  PBDataWriterWriteDoubleField(a3, 4, self->_truthMets);
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_userMetsSource, 5);
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_truthMetsSource, 6);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteFloatField(a3, 7, self->_metsHR);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      return;
LABEL_11:
    PBDataWriterWriteFloatField(a3, 9, self->_metsFM);
    return;
  }
LABEL_10:
  PBDataWriterWriteFloatField(a3, 8, self->_metsWR);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  *((_DWORD *)a3 + 6) = self->_activityType;
  *((_BYTE *)a3 + 48) = self->_isStanding;
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_userMets;
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_truthMets;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_userMetsSource;
    *((_BYTE *)a3 + 52) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_truthMetsSource;
  *((_BYTE *)a3 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 8) = LODWORD(self->_metsHR);
  *((_BYTE *)a3 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      return;
LABEL_11:
    *((_DWORD *)a3 + 7) = LODWORD(self->_metsFM);
    *((_BYTE *)a3 + 52) |= 1u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 9) = LODWORD(self->_metsWR);
  *((_BYTE *)a3 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 6) = self->_activityType;
  *((_BYTE *)result + 48) = self->_isStanding;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_userMets;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_truthMets;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 11) = self->_userMetsSource;
    *((_BYTE *)result + 52) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_truthMetsSource;
  *((_BYTE *)result + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 8) = LODWORD(self->_metsHR);
  *((_BYTE *)result + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 9) = LODWORD(self->_metsWR);
  *((_BYTE *)result + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 7) = LODWORD(self->_metsFM);
  *((_BYTE *)result + 52) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!v5)
    return v5;
  if (self->_activityType != *((_DWORD *)a3 + 6))
    goto LABEL_33;
  if (self->_isStanding)
  {
    if (!*((_BYTE *)a3 + 48))
      goto LABEL_33;
    goto LABEL_7;
  }
  if (*((_BYTE *)a3 + 48))
  {
LABEL_33:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_7:
  if (self->_userMets != *((double *)a3 + 2) || self->_truthMets != *((double *)a3 + 1))
    goto LABEL_33;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 0x10) == 0 || self->_userMetsSource != *((_DWORD *)a3 + 11))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_truthMetsSource != *((_DWORD *)a3 + 10))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)a3 + 52) & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_metsHR != *((float *)a3 + 8))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_metsWR != *((float *)a3 + 9))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)a3 + 52) & 4) != 0)
  {
    goto LABEL_33;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_metsFM != *((float *)a3 + 7))
      goto LABEL_33;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  _BOOL4 isStanding;
  double userMets;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double truthMets;
  double v14;
  long double v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char has;
  uint64_t v23;
  uint64_t v24;
  float metsHR;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  unint64_t v30;
  float metsWR;
  float v32;
  float v33;
  float v34;
  float v35;
  unint64_t v36;
  float metsFM;
  float v38;
  float v39;
  float v40;
  float v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t activityType;

  activityType = self->_activityType;
  isStanding = self->_isStanding;
  userMets = self->_userMets;
  v5 = -userMets;
  if (userMets >= 0.0)
    v5 = self->_userMets;
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
  truthMets = self->_truthMets;
  v14 = -truthMets;
  if (truthMets >= 0.0)
    v14 = self->_truthMets;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = fmod(v15, 1.84467441e19);
  v18 = 2654435761u * (unint64_t)v17;
  v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0)
    v19 = 2654435761u * (unint64_t)v17;
  v20 = v18 - (unint64_t)fabs(v16);
  if (v16 < 0.0)
    v21 = v20;
  else
    v21 = v19;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    v23 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_17;
LABEL_23:
    v24 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_18;
LABEL_24:
    v29 = 0;
    goto LABEL_27;
  }
  v23 = 2654435761 * self->_userMetsSource;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_23;
LABEL_17:
  v24 = 2654435761 * self->_truthMetsSource;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_24;
LABEL_18:
  metsHR = self->_metsHR;
  v26 = -metsHR;
  if (metsHR >= 0.0)
    v26 = self->_metsHR;
  v27 = floorf(v26 + 0.5);
  v28 = (float)(v26 - v27) * 1.8447e19;
  v29 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0)
      v29 += (unint64_t)v28;
  }
  else
  {
    v29 -= (unint64_t)fabsf(v28);
  }
LABEL_27:
  if ((has & 4) != 0)
  {
    metsWR = self->_metsWR;
    v32 = -metsWR;
    if (metsWR >= 0.0)
      v32 = self->_metsWR;
    v33 = floorf(v32 + 0.5);
    v34 = (float)(v32 - v33) * 1.8447e19;
    v35 = fmodf(v33, 1.8447e19);
    v36 = 2654435761u * (unint64_t)v35;
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 = v36 + (unint64_t)v34;
      else
        v30 = 2654435761u * (unint64_t)v35;
      if ((has & 1) == 0)
        goto LABEL_45;
    }
    else
    {
      v30 = v36 - (unint64_t)fabsf(v34);
      if ((has & 1) == 0)
      {
LABEL_45:
        v44 = 0;
        return (2654435761 * isStanding) ^ v21 ^ (2654435761 * activityType) ^ v12 ^ v23 ^ v24 ^ v29 ^ v30 ^ v44;
      }
    }
  }
  else
  {
    v30 = 0;
    if ((has & 1) == 0)
      goto LABEL_45;
  }
  metsFM = self->_metsFM;
  v38 = -metsFM;
  if (metsFM >= 0.0)
    v38 = self->_metsFM;
  v39 = floorf(v38 + 0.5);
  v40 = (float)(v38 - v39) * 1.8447e19;
  v41 = fmodf(v39, 1.8447e19);
  v42 = 2654435761u * (unint64_t)v41;
  v43 = v42 + (unint64_t)v40;
  if (v40 <= 0.0)
    v43 = 2654435761u * (unint64_t)v41;
  v44 = v42 - (unint64_t)fabsf(v40);
  if (v40 >= 0.0)
    v44 = v43;
  return (2654435761 * isStanding) ^ v21 ^ (2654435761 * activityType) ^ v12 ^ v23 ^ v24 ^ v29 ^ v30 ^ v44;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  self->_activityType = *((_DWORD *)a3 + 6);
  self->_isStanding = *((_BYTE *)a3 + 48);
  self->_userMets = *((double *)a3 + 2);
  self->_truthMets = *((double *)a3 + 1);
  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 0x10) != 0)
  {
    self->_userMetsSource = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 0x10u;
    v3 = *((_BYTE *)a3 + 52);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 52) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_truthMetsSource = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_metsHR = *((float *)a3 + 8);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0)
      return;
LABEL_11:
    self->_metsFM = *((float *)a3 + 7);
    *(_BYTE *)&self->_has |= 1u;
    return;
  }
LABEL_10:
  self->_metsWR = *((float *)a3 + 9);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 52) & 1) != 0)
    goto LABEL_11;
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

- (double)userMets
{
  return self->_userMets;
}

- (void)setUserMets:(double)a3
{
  self->_userMets = a3;
}

- (double)truthMets
{
  return self->_truthMets;
}

- (void)setTruthMets:(double)a3
{
  self->_truthMets = a3;
}

- (float)metsHR
{
  return self->_metsHR;
}

- (float)metsWR
{
  return self->_metsWR;
}

- (float)metsFM
{
  return self->_metsFM;
}

@end
