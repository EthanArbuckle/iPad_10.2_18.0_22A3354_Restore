@implementation ALCLMotionActivity

- (id)typeAsString:(int)a3
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

- (int)StringAsType:(id)a3
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

- (int)confidence
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_confidence;
  else
    return 0;
}

- (void)setConfidence:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConfidence
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10213ECF8 + a3);
}

- (int)StringAsConfidence:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kConfidenceLow")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kConfidenceMedium")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kConfidenceHigh")))
    return 2;
  return 0;
}

- (int)mountedState
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_mountedState;
  else
    return 0;
}

- (void)setMountedState:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_mountedState = a3;
}

- (void)setHasMountedState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMountedState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)mountedStateAsString:(int)a3
{
  if (!a3)
    return CFSTR("kNotMounted");
  if (a3 == 1)
    return CFSTR("kMounted");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsMountedState:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kNotMounted")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("kMounted"));
}

- (int)mountedConfidence
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_mountedConfidence;
  else
    return 0;
}

- (void)setMountedConfidence:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mountedConfidence = a3;
}

- (void)setHasMountedConfidence:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMountedConfidence
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)mountedConfidenceAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10213ECF8 + a3);
}

- (int)StringAsMountedConfidence:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kConfidenceLow")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kConfidenceMedium")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kConfidenceHigh")))
    return 2;
  return 0;
}

- (void)setIsStanding:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isStanding = a3;
}

- (void)setHasIsStanding:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsStanding
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTilt:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_tilt = a3;
}

- (void)setHasTilt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTilt
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)exitState
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_exitState;
  else
    return 0;
}

- (void)setExitState:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_exitState = a3;
}

- (void)setHasExitState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasExitState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)exitStateAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10213ED10 + a3);
}

- (int)StringAsExitState:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kNoDetection")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kExitPreheat")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kExitDetected")))
    return 2;
  return 0;
}

- (void)setEstExitTime:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_estExitTime = a3;
}

- (void)setHasEstExitTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEstExitTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setStartTime:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsVehicleConnected:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isVehicleConnected = a3;
}

- (void)setHasIsVehicleConnected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsVehicleConnected
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLMotionActivity;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLMotionActivity description](&v3, "description"), -[ALCLMotionActivity dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  int type;
  const __CFString *v5;
  double v6;
  __int16 has;
  uint64_t confidence;
  NSString *v9;
  int mountedState;
  const __CFString *v11;
  uint64_t mountedConfidence;
  NSString *v13;
  __int16 v14;
  uint64_t exitState;
  NSString *v17;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  type = self->_type;
  if (type > 2023)
  {
    if (type <= 11804)
    {
      if (type <= 2070)
      {
        if (type > 2060)
        {
          if (type == 2061)
          {
            v5 = CFSTR("kTypeCrossTraining");
            goto LABEL_80;
          }
          if (type == 2065)
          {
            v5 = CFSTR("kTypeStairClimbing");
            goto LABEL_80;
          }
        }
        else
        {
          if (type == 2024)
          {
            v5 = CFSTR("kTypeCoreTraining");
            goto LABEL_80;
          }
          if (type == 2048)
          {
            v5 = CFSTR("kTypeElliptical");
            goto LABEL_80;
          }
        }
      }
      else if (type <= 2104)
      {
        if (type == 2071)
        {
          v5 = CFSTR("kTypeRowing");
          goto LABEL_80;
        }
        if (type == 2101)
        {
          v5 = CFSTR("kTypeCoolDown");
          goto LABEL_80;
        }
      }
      else
      {
        switch(type)
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
    else if (type > 17149)
    {
      if (type <= 18239)
      {
        if (type == 17150)
        {
          v5 = CFSTR("kTypeIndoorWalking");
          goto LABEL_80;
        }
        if (type == 18200)
        {
          v5 = CFSTR("kTypeScubaDiving");
          goto LABEL_80;
        }
      }
      else
      {
        switch(type)
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
    else if (type <= 15109)
    {
      if (type == 11805)
      {
        v5 = CFSTR("kTypePushingWheelchair");
        goto LABEL_80;
      }
      if (type == 12150)
      {
        v5 = CFSTR("kTypeIndoorRunning");
        goto LABEL_80;
      }
    }
    else
    {
      switch(type)
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
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    goto LABEL_80;
  }
  if (type > 40)
  {
    if (type > 99)
    {
      if (type > 2019)
      {
        if (type == 2020)
        {
          v5 = CFSTR("kTypeCalisthenics");
          goto LABEL_80;
        }
        if (type == 2022)
        {
          v5 = CFSTR("kTypeFunctionalStrength");
          goto LABEL_80;
        }
      }
      else
      {
        if (type == 100)
        {
          v5 = CFSTR("kTypeCyclingLeg");
          goto LABEL_80;
        }
        if (type == 2010)
        {
          v5 = CFSTR("kTypeStationaryCycling");
          goto LABEL_80;
        }
      }
    }
    else if (type > 55)
    {
      if (type == 56)
      {
        v5 = CFSTR("kTypeDrivingOther");
        goto LABEL_80;
      }
      if (type == 63)
      {
        v5 = CFSTR("kTypeMultiSportTransition");
        goto LABEL_80;
      }
    }
    else
    {
      if (type == 41)
      {
        v5 = CFSTR("kTypeWalkingSlow");
        goto LABEL_80;
      }
      if (type == 52)
      {
        v5 = CFSTR("kTypeVehicularInHand");
        goto LABEL_80;
      }
    }
    goto LABEL_79;
  }
  v5 = CFSTR("kTypeUnknown");
  switch(type)
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
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    confidence = self->_confidence;
    if (confidence >= 3)
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_confidence);
    else
      v9 = (NSString *)*(&off_10213ECF8 + confidence);
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("confidence"));
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_82:
      if ((has & 0x10) == 0)
        goto LABEL_98;
      goto LABEL_94;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_82;
  }
  mountedState = self->_mountedState;
  if (mountedState)
  {
    if (mountedState == 1)
      v11 = CFSTR("kMounted");
    else
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mountedState);
  }
  else
  {
    v11 = CFSTR("kNotMounted");
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mountedState"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
LABEL_94:
    mountedConfidence = self->_mountedConfidence;
    if (mountedConfidence >= 3)
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mountedConfidence);
    else
      v13 = (NSString *)*(&off_10213ECF8 + mountedConfidence);
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("mountedConfidence"));
    has = (__int16)self->_has;
  }
LABEL_98:
  if ((has & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isStanding), CFSTR("isStanding"));
    has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *(float *)&v6 = self->_tilt;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("tilt"));
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp), CFSTR("timestamp"));
  v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    exitState = self->_exitState;
    if (exitState >= 3)
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_exitState);
    else
      v17 = (NSString *)*(&off_10213ED10 + exitState);
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("exitState"));
    v14 = (__int16)self->_has;
    if ((v14 & 1) == 0)
    {
LABEL_104:
      if ((v14 & 2) == 0)
        goto LABEL_105;
LABEL_113:
      objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime), CFSTR("startTime"));
      if ((*(_WORD *)&self->_has & 0x100) == 0)
        return v3;
      goto LABEL_106;
    }
  }
  else if ((v14 & 1) == 0)
  {
    goto LABEL_104;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_estExitTime), CFSTR("estExitTime"));
  v14 = (__int16)self->_has;
  if ((v14 & 2) != 0)
    goto LABEL_113;
LABEL_105:
  if ((v14 & 0x100) != 0)
LABEL_106:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isVehicleConnected), CFSTR("isVehicleConnected"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004D2970((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v6;

  PBDataWriterWriteInt32Field(a3, self->_type, 1);
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_confidence, 2);
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_mountedState, 3);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field(a3, self->_mountedConfidence, 4);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  PBDataWriterWriteBOOLField(a3, self->_isStanding, 5);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_6:
    PBDataWriterWriteFloatField(a3, 6, self->_tilt);
LABEL_7:
  PBDataWriterWriteDoubleField(a3, 7, self->_timestamp);
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_exitState, 8);
    v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField(a3, 9, self->_estExitTime);
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 0x100) == 0)
      return;
LABEL_20:
    PBDataWriterWriteBOOLField(a3, self->_isVehicleConnected, 11);
    return;
  }
LABEL_19:
  PBDataWriterWriteDoubleField(a3, 10, self->_startTime);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    goto LABEL_20;
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v4;

  *((_DWORD *)a3 + 13) = self->_type;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_confidence;
    *((_WORD *)a3 + 30) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 11) = self->_mountedState;
  *((_WORD *)a3 + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 10) = self->_mountedConfidence;
  *((_WORD *)a3 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  *((_BYTE *)a3 + 56) = self->_isStanding;
  *((_WORD *)a3 + 30) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 12) = LODWORD(self->_tilt);
    *((_WORD *)a3 + 30) |= 0x40u;
  }
LABEL_7:
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_timestamp;
  v4 = (__int16)self->_has;
  if ((v4 & 8) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_exitState;
    *((_WORD *)a3 + 30) |= 8u;
    v4 = (__int16)self->_has;
    if ((v4 & 1) == 0)
    {
LABEL_9:
      if ((v4 & 2) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_estExitTime;
  *((_WORD *)a3 + 30) |= 1u;
  v4 = (__int16)self->_has;
  if ((v4 & 2) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0)
      return;
LABEL_20:
    *((_BYTE *)a3 + 57) = self->_isVehicleConnected;
    *((_WORD *)a3 + 30) |= 0x100u;
    return;
  }
LABEL_19:
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_startTime;
  *((_WORD *)a3 + 30) |= 2u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    goto LABEL_20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;
  __int16 v6;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 13) = self->_type;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 8) = self->_confidence;
    *((_WORD *)result + 30) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 11) = self->_mountedState;
  *((_WORD *)result + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_mountedConfidence;
  *((_WORD *)result + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_16:
  *((_BYTE *)result + 56) = self->_isStanding;
  *((_WORD *)result + 30) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)result + 12) = LODWORD(self->_tilt);
    *((_WORD *)result + 30) |= 0x40u;
  }
LABEL_7:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_timestamp;
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)result + 9) = self->_exitState;
    *((_WORD *)result + 30) |= 8u;
    v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
      goto LABEL_20;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_estExitTime;
  *((_WORD *)result + 30) |= 1u;
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 0x100) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_20:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_startTime;
  *((_WORD *)result + 30) |= 2u;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    return result;
LABEL_11:
  *((_BYTE *)result + 57) = self->_isVehicleConnected;
  *((_WORD *)result + 30) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!v5)
    return v5;
  if (self->_type != *((_DWORD *)a3 + 13))
    goto LABEL_49;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 30);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_confidence != *((_DWORD *)a3 + 8))
      goto LABEL_49;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mountedState != *((_DWORD *)a3 + 11))
      goto LABEL_49;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_mountedConfidence != *((_DWORD *)a3 + 10))
      goto LABEL_49;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_49;
    if (self->_isStanding)
    {
      if (!*((_BYTE *)a3 + 56))
        goto LABEL_49;
    }
    else if (*((_BYTE *)a3 + 56))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_tilt != *((float *)a3 + 12))
      goto LABEL_49;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if (self->_timestamp != *((double *)a3 + 3))
  {
LABEL_49:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_exitState != *((_DWORD *)a3 + 9))
      goto LABEL_49;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_estExitTime != *((double *)a3 + 1))
      goto LABEL_49;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_startTime != *((double *)a3 + 2))
      goto LABEL_49;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_49;
  }
  LOBYTE(v5) = (v7 & 0x100) == 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 30) & 0x100) == 0)
      goto LABEL_49;
    if (self->_isVehicleConnected)
    {
      if (!*((_BYTE *)a3 + 57))
        goto LABEL_49;
    }
    else if (*((_BYTE *)a3 + 57))
    {
      goto LABEL_49;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t type;
  unint64_t v7;
  float tilt;
  float v9;
  float v10;
  float v11;
  float v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double timestamp;
  double v17;
  long double v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  double estExitTime;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  unint64_t v31;
  double startTime;
  double v33;
  long double v34;
  double v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v39 = 2654435761 * self->_confidence;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  else
  {
    v39 = 0;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v38 = 2654435761 * self->_mountedState;
      goto LABEL_6;
    }
  }
  v38 = 0;
LABEL_6:
  if ((has & 0x10) != 0)
    v4 = 2654435761 * self->_mountedConfidence;
  else
    v4 = 0;
  if ((has & 0x80) != 0)
    v5 = 2654435761 * self->_isStanding;
  else
    v5 = 0;
  type = self->_type;
  if ((has & 0x40) != 0)
  {
    tilt = self->_tilt;
    v9 = -tilt;
    if (tilt >= 0.0)
      v9 = self->_tilt;
    v10 = floorf(v9 + 0.5);
    v11 = (float)(v9 - v10) * 1.8447e19;
    v12 = fmodf(v10, 1.8447e19);
    v13 = 2654435761u * (unint64_t)v12;
    v14 = v13 + (unint64_t)v11;
    if (v11 <= 0.0)
      v14 = 2654435761u * (unint64_t)v12;
    v15 = v13 - (unint64_t)fabsf(v11);
    if (v11 < 0.0)
      v7 = v15;
    else
      v7 = v14;
  }
  else
  {
    v7 = 0;
  }
  timestamp = self->_timestamp;
  v17 = -timestamp;
  if (timestamp >= 0.0)
    v17 = self->_timestamp;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = fmod(v18, 1.84467441e19);
  v21 = 2654435761u * (unint64_t)v20;
  v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0)
    v22 = 2654435761u * (unint64_t)v20;
  v23 = v21 - (unint64_t)fabs(v19);
  if (v19 < 0.0)
    v24 = v23;
  else
    v24 = v22;
  if ((has & 8) != 0)
  {
    v25 = 2654435761 * self->_exitState;
    if ((has & 1) != 0)
      goto LABEL_30;
LABEL_35:
    v30 = 0;
    goto LABEL_38;
  }
  v25 = 0;
  if ((has & 1) == 0)
    goto LABEL_35;
LABEL_30:
  estExitTime = self->_estExitTime;
  v27 = -estExitTime;
  if (estExitTime >= 0.0)
    v27 = self->_estExitTime;
  v28 = floor(v27 + 0.5);
  v29 = (v27 - v28) * 1.84467441e19;
  v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
  if (v29 >= 0.0)
  {
    if (v29 > 0.0)
      v30 += (unint64_t)v29;
  }
  else
  {
    v30 -= (unint64_t)fabs(v29);
  }
LABEL_38:
  if ((has & 2) != 0)
  {
    startTime = self->_startTime;
    v33 = -startTime;
    if (startTime >= 0.0)
      v33 = self->_startTime;
    v34 = floor(v33 + 0.5);
    v35 = (v33 - v34) * 1.84467441e19;
    v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0)
        v31 += (unint64_t)v35;
      if ((has & 0x100) == 0)
        goto LABEL_49;
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
      if ((has & 0x100) == 0)
      {
LABEL_49:
        v36 = 0;
        return v39 ^ v38 ^ v4 ^ v5 ^ v7 ^ v25 ^ v30 ^ v31 ^ v36 ^ (2654435761 * type) ^ v24;
      }
    }
  }
  else
  {
    v31 = 0;
    if ((has & 0x100) == 0)
      goto LABEL_49;
  }
  v36 = 2654435761 * self->_isVehicleConnected;
  return v39 ^ v38 ^ v4 ^ v5 ^ v7 ^ v25 ^ v30 ^ v31 ^ v36 ^ (2654435761 * type) ^ v24;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;
  __int16 v4;

  self->_type = *((_DWORD *)a3 + 13);
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 4) != 0)
  {
    self->_confidence = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 4u;
    v3 = *((_WORD *)a3 + 30);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_mountedState = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_mountedConfidence = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  self->_isStanding = *((_BYTE *)a3 + 56);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 30) & 0x40) != 0)
  {
LABEL_6:
    self->_tilt = *((float *)a3 + 12);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_7:
  self->_timestamp = *((double *)a3 + 3);
  v4 = *((_WORD *)a3 + 30);
  if ((v4 & 8) != 0)
  {
    self->_exitState = *((_DWORD *)a3 + 9);
    *(_WORD *)&self->_has |= 8u;
    v4 = *((_WORD *)a3 + 30);
    if ((v4 & 1) == 0)
    {
LABEL_9:
      if ((v4 & 2) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_estExitTime = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v4 = *((_WORD *)a3 + 30);
  if ((v4 & 2) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0)
      return;
LABEL_20:
    self->_isVehicleConnected = *((_BYTE *)a3 + 57);
    *(_WORD *)&self->_has |= 0x100u;
    return;
  }
LABEL_19:
  self->_startTime = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 30) & 0x100) != 0)
    goto LABEL_20;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)isStanding
{
  return self->_isStanding;
}

- (float)tilt
{
  return self->_tilt;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)estExitTime
{
  return self->_estExitTime;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)isVehicleConnected
{
  return self->_isVehicleConnected;
}

@end
