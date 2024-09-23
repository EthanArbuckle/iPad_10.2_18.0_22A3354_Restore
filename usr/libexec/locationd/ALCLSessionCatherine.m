@implementation ALCLSessionCatherine

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

- (void)setNCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_nCatherine = a3;
}

- (void)setHasNCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNCatherine
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setNVeryLowCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_nVeryLowCatherine = a3;
}

- (void)setHasNVeryLowCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasNVeryLowCatherine
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setNLowCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_nLowCatherine = a3;
}

- (void)setHasNLowCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNLowCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setNHighCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_nHighCatherine = a3;
}

- (void)setHasNHighCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNHighCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setNVeryHighCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_nVeryHighCatherine = a3;
}

- (void)setHasNVeryHighCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasNVeryHighCatherine
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNGoodCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_nGoodCatherine = a3;
}

- (void)setHasNGoodCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNGoodCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setNInterpolatedCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_nInterpolatedCatherine = a3;
}

- (void)setHasNInterpolatedCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNInterpolatedCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNSampleAndHoldCatherine:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_nSampleAndHoldCatherine = a3;
}

- (void)setHasNSampleAndHoldCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNSampleAndHoldCatherine
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMinGoodCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_minGoodCatherine = a3;
}

- (void)setHasMinGoodCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMinGoodCatherine
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setMaxGoodCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_maxGoodCatherine = a3;
}

- (void)setHasMaxGoodCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasMaxGoodCatherine
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setMeanCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_meanCatherine = a3;
}

- (void)setHasMeanCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMeanCatherine
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setMeanGoodCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_meanGoodCatherine = a3;
}

- (void)setHasMeanGoodCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMeanGoodCatherine
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setFirstCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_firstCatherine = a3;
}

- (void)setHasFirstCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasFirstCatherine
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFirstCatherineStartTime:(float)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_firstCatherineStartTime = a3;
}

- (void)setHasFirstCatherineStartTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasFirstCatherineStartTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLongestDropout:(float)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_longestDropout = a3;
}

- (void)setHasLongestDropout:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasLongestDropout
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTotalDropoutTime:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_totalDropoutTime = a3;
}

- (void)setHasTotalDropoutTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTotalDropoutTime
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNDropout:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_nDropout = a3;
}

- (void)setHasNDropout:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNDropout
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setStartTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasStartTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)onsetReason
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_onsetReason;
  else
    return -1;
}

- (void)setOnsetReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_onsetReason = a3;
}

- (void)setHasOnsetReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasOnsetReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)onsetReasonAsString:(int)a3
{
  if ((a3 + 1) >= 5)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_102152BD0[a3 + 1];
}

- (int)StringAsOnsetReason:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kOnsetNotSet")) & 1) != 0)
    return -1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kOnsetElevated")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kOnsetActive")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kOnsetNotElevated")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kOnsetTimeout")))
    return 3;
  return -1;
}

- (void)setOnsetCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_onsetCatherine = a3;
}

- (void)setHasOnsetCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasOnsetCatherine
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setUserMaxCatherine:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_userMaxCatherine = a3;
}

- (void)setHasUserMaxCatherine:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUserMaxCatherine
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setPersistedMinHR:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_persistedMinHR = a3;
}

- (void)setHasPersistedMinHR:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($16169639337E07BB51B78E1150F773F4)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPersistedMinHR
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLSessionCatherine;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLSessionCatherine description](&v3, "description"), -[ALCLSessionCatherine dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  int activityType;
  const __CFString *v5;
  double v6;
  $16169639337E07BB51B78E1150F773F4 has;
  unsigned int v9;
  __CFString *v10;

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
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nCatherine), CFSTR("nCatherine"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_82:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_83;
      goto LABEL_106;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_82;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nVeryLowCatherine), CFSTR("nVeryLowCatherine"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_83:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_84;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nLowCatherine), CFSTR("nLowCatherine"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_84:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_85;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nHighCatherine), CFSTR("nHighCatherine"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_85:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_86;
    goto LABEL_109;
  }
LABEL_108:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nVeryHighCatherine), CFSTR("nVeryHighCatherine"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_86:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_87;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nGoodCatherine), CFSTR("nGoodCatherine"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_87:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_88;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nInterpolatedCatherine), CFSTR("nInterpolatedCatherine"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_88:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_89;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nSampleAndHoldCatherine), CFSTR("nSampleAndHoldCatherine"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_89:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_90;
    goto LABEL_113;
  }
LABEL_112:
  *(float *)&v6 = self->_minGoodCatherine;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("minGoodCatherine"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_90:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_91;
    goto LABEL_114;
  }
LABEL_113:
  *(float *)&v6 = self->_maxGoodCatherine;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("maxGoodCatherine"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_91:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_92;
    goto LABEL_115;
  }
LABEL_114:
  *(float *)&v6 = self->_meanCatherine;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("meanCatherine"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_92:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_93;
    goto LABEL_116;
  }
LABEL_115:
  *(float *)&v6 = self->_meanGoodCatherine;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("meanGoodCatherine"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_93:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_94;
    goto LABEL_117;
  }
LABEL_116:
  *(float *)&v6 = self->_firstCatherine;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("firstCatherine"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_94:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_95;
    goto LABEL_118;
  }
LABEL_117:
  *(float *)&v6 = self->_firstCatherineStartTime;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("firstCatherineStartTime"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_95:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_96;
    goto LABEL_119;
  }
LABEL_118:
  *(float *)&v6 = self->_longestDropout;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("longestDropout"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_96:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_97;
    goto LABEL_120;
  }
LABEL_119:
  *(float *)&v6 = self->_totalDropoutTime;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("totalDropoutTime"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_97:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_98;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nDropout), CFSTR("nDropout"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_98:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_99;
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime), CFSTR("startTime"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_99:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_100;
    goto LABEL_126;
  }
LABEL_122:
  v9 = self->_onsetReason + 1;
  if (v9 >= 5)
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_onsetReason);
  else
    v10 = off_102152BD0[v9];
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("onsetReason"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_100:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_101;
LABEL_127:
    *(float *)&v6 = self->_userMaxCatherine;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("userMaxCatherine"));
    if ((*(_DWORD *)&self->_has & 0x80000) == 0)
      return v3;
    goto LABEL_102;
  }
LABEL_126:
  *(float *)&v6 = self->_onsetCatherine;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("onsetCatherine"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    goto LABEL_127;
LABEL_101:
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_102:
    *(float *)&v6 = self->_persistedMinHR;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("persistedMinHR"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100798B88((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $16169639337E07BB51B78E1150F773F4 has;

  PBDataWriterWriteInt32Field(a3, self->_activityType, 1);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_nCatherine, 2);
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(a3, self->_nVeryLowCatherine, 3);
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(a3, self->_nLowCatherine, 4);
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field(a3, self->_nHighCatherine, 5);
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field(a3, self->_nVeryHighCatherine, 6);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(a3, self->_nGoodCatherine, 7);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field(a3, self->_nInterpolatedCatherine, 8);
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field(a3, self->_nSampleAndHoldCatherine, 9);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteFloatField(a3, 10, self->_minGoodCatherine);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteFloatField(a3, 11, self->_maxGoodCatherine);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteFloatField(a3, 12, self->_meanCatherine);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteFloatField(a3, 13, self->_meanGoodCatherine);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteFloatField(a3, 14, self->_firstCatherine);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteFloatField(a3, 15, self->_firstCatherineStartTime);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteFloatField(a3, 16, self->_longestDropout);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteFloatField(a3, 17, self->_totalDropoutTime);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(a3, self->_nDropout, 18);
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField(a3, 19, self->_startTime);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field(a3, self->_onsetReason, 20);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteFloatField(a3, 21, self->_onsetCatherine);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      return;
LABEL_45:
    PBDataWriterWriteFloatField(a3, 23, self->_persistedMinHR);
    return;
  }
LABEL_44:
  PBDataWriterWriteFloatField(a3, 22, self->_userMaxCatherine);
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
    goto LABEL_45;
}

- (void)copyTo:(id)a3
{
  $16169639337E07BB51B78E1150F773F4 has;

  *((_DWORD *)a3 + 4) = self->_activityType;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_nCatherine;
    *((_DWORD *)a3 + 26) |= 0x100u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 20) = self->_nVeryLowCatherine;
  *((_DWORD *)a3 + 26) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 17) = self->_nLowCatherine;
  *((_DWORD *)a3 + 26) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 15) = self->_nHighCatherine;
  *((_DWORD *)a3 + 26) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 19) = self->_nVeryHighCatherine;
  *((_DWORD *)a3 + 26) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 14) = self->_nGoodCatherine;
  *((_DWORD *)a3 + 26) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 16) = self->_nInterpolatedCatherine;
  *((_DWORD *)a3 + 26) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 18) = self->_nSampleAndHoldCatherine;
  *((_DWORD *)a3 + 26) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 11) = LODWORD(self->_minGoodCatherine);
  *((_DWORD *)a3 + 26) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 8) = LODWORD(self->_maxGoodCatherine);
  *((_DWORD *)a3 + 26) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 9) = LODWORD(self->_meanCatherine);
  *((_DWORD *)a3 + 26) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 10) = LODWORD(self->_meanGoodCatherine);
  *((_DWORD *)a3 + 26) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 5) = LODWORD(self->_firstCatherine);
  *((_DWORD *)a3 + 26) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 6) = LODWORD(self->_firstCatherineStartTime);
  *((_DWORD *)a3 + 26) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 7) = LODWORD(self->_longestDropout);
  *((_DWORD *)a3 + 26) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 24) = LODWORD(self->_totalDropoutTime);
  *((_DWORD *)a3 + 26) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 13) = self->_nDropout;
  *((_DWORD *)a3 + 26) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_startTime;
  *((_DWORD *)a3 + 26) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 22) = self->_onsetReason;
  *((_DWORD *)a3 + 26) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 21) = LODWORD(self->_onsetCatherine);
  *((_DWORD *)a3 + 26) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      return;
LABEL_45:
    *((_DWORD *)a3 + 23) = LODWORD(self->_persistedMinHR);
    *((_DWORD *)a3 + 26) |= 0x80000u;
    return;
  }
LABEL_44:
  *((_DWORD *)a3 + 25) = LODWORD(self->_userMaxCatherine);
  *((_DWORD *)a3 + 26) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
    goto LABEL_45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $16169639337E07BB51B78E1150F773F4 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_activityType;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((_DWORD *)result + 12) = self->_nCatherine;
    *((_DWORD *)result + 26) |= 0x100u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 20) = self->_nVeryLowCatherine;
  *((_DWORD *)result + 26) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 17) = self->_nLowCatherine;
  *((_DWORD *)result + 26) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 15) = self->_nHighCatherine;
  *((_DWORD *)result + 26) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 19) = self->_nVeryHighCatherine;
  *((_DWORD *)result + 26) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 14) = self->_nGoodCatherine;
  *((_DWORD *)result + 26) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 16) = self->_nInterpolatedCatherine;
  *((_DWORD *)result + 26) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 18) = self->_nSampleAndHoldCatherine;
  *((_DWORD *)result + 26) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 11) = LODWORD(self->_minGoodCatherine);
  *((_DWORD *)result + 26) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 8) = LODWORD(self->_maxGoodCatherine);
  *((_DWORD *)result + 26) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 9) = LODWORD(self->_meanCatherine);
  *((_DWORD *)result + 26) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 10) = LODWORD(self->_meanGoodCatherine);
  *((_DWORD *)result + 26) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 5) = LODWORD(self->_firstCatherine);
  *((_DWORD *)result + 26) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 6) = LODWORD(self->_firstCatherineStartTime);
  *((_DWORD *)result + 26) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 7) = LODWORD(self->_longestDropout);
  *((_DWORD *)result + 26) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 24) = LODWORD(self->_totalDropoutTime);
  *((_DWORD *)result + 26) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 13) = self->_nDropout;
  *((_DWORD *)result + 26) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_startTime;
  *((_DWORD *)result + 26) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 22) = self->_onsetReason;
  *((_DWORD *)result + 26) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 21) = LODWORD(self->_onsetCatherine);
  *((_DWORD *)result + 26) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      return result;
    goto LABEL_23;
  }
LABEL_45:
  *((_DWORD *)result + 25) = LODWORD(self->_userMaxCatherine);
  *((_DWORD *)result + 26) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
    return result;
LABEL_23:
  *((_DWORD *)result + 23) = LODWORD(self->_persistedMinHR);
  *((_DWORD *)result + 26) |= 0x80000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  $16169639337E07BB51B78E1150F773F4 has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_activityType != *((_DWORD *)a3 + 4))
    {
LABEL_112:
      LOBYTE(v5) = 0;
      return v5;
    }
    has = self->_has;
    v7 = *((_DWORD *)a3 + 26);
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_nCatherine != *((_DWORD *)a3 + 12))
        goto LABEL_112;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_nVeryLowCatherine != *((_DWORD *)a3 + 20))
        goto LABEL_112;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_nLowCatherine != *((_DWORD *)a3 + 17))
        goto LABEL_112;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_nHighCatherine != *((_DWORD *)a3 + 15))
        goto LABEL_112;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_nVeryHighCatherine != *((_DWORD *)a3 + 19))
        goto LABEL_112;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_nGoodCatherine != *((_DWORD *)a3 + 14))
        goto LABEL_112;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_nInterpolatedCatherine != *((_DWORD *)a3 + 16))
        goto LABEL_112;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_nSampleAndHoldCatherine != *((_DWORD *)a3 + 18))
        goto LABEL_112;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_minGoodCatherine != *((float *)a3 + 11))
        goto LABEL_112;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_maxGoodCatherine != *((float *)a3 + 8))
        goto LABEL_112;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_meanCatherine != *((float *)a3 + 9))
        goto LABEL_112;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_meanGoodCatherine != *((float *)a3 + 10))
        goto LABEL_112;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_firstCatherine != *((float *)a3 + 5))
        goto LABEL_112;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_firstCatherineStartTime != *((float *)a3 + 6))
        goto LABEL_112;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_longestDropout != *((float *)a3 + 7))
        goto LABEL_112;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_totalDropoutTime != *((float *)a3 + 24))
        goto LABEL_112;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_nDropout != *((_DWORD *)a3 + 13))
        goto LABEL_112;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_startTime != *((double *)a3 + 1))
        goto LABEL_112;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_onsetReason != *((_DWORD *)a3 + 22))
        goto LABEL_112;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_onsetCatherine != *((float *)a3 + 21))
        goto LABEL_112;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_112;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_userMaxCatherine != *((float *)a3 + 25))
        goto LABEL_112;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_112;
    }
    LOBYTE(v5) = (v7 & 0x80000) == 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_persistedMinHR != *((float *)a3 + 23))
        goto LABEL_112;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $16169639337E07BB51B78E1150F773F4 has;
  unint64_t v4;
  float minGoodCatherine;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  float maxGoodCatherine;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float meanCatherine;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float meanGoodCatherine;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  float firstCatherine;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  float firstCatherineStartTime;
  float v31;
  float v32;
  float v33;
  unint64_t v34;
  float longestDropout;
  float v36;
  float v37;
  float v38;
  unint64_t v39;
  float totalDropoutTime;
  float v41;
  float v42;
  float v43;
  unint64_t v44;
  double startTime;
  double v46;
  long double v47;
  double v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  float onsetCatherine;
  float v54;
  float v55;
  float v56;
  unint64_t v57;
  unint64_t v58;
  float userMaxCatherine;
  float v60;
  float v61;
  float v62;
  unint64_t v63;
  float persistedMinHR;
  float v65;
  float v66;
  float v67;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t activityType;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    v82 = 2654435761 * self->_nCatherine;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_3:
      v81 = 2654435761 * self->_nVeryLowCatherine;
      if ((*(_WORD *)&has & 0x2000) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v82 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_3;
  }
  v81 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_4:
    v80 = 2654435761 * self->_nLowCatherine;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v80 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_5:
    v79 = 2654435761 * self->_nHighCatherine;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_6;
LABEL_12:
    v78 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v79 = 0;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_12;
LABEL_6:
  v78 = 2654435761 * self->_nVeryHighCatherine;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_7:
    v77 = 2654435761 * self->_nGoodCatherine;
    goto LABEL_14;
  }
LABEL_13:
  v77 = 0;
LABEL_14:
  if ((*(_WORD *)&has & 0x1000) != 0)
    v76 = 2654435761 * self->_nInterpolatedCatherine;
  else
    v76 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
    v75 = 2654435761 * self->_nSampleAndHoldCatherine;
  else
    v75 = 0;
  activityType = self->_activityType;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    minGoodCatherine = self->_minGoodCatherine;
    v6 = -minGoodCatherine;
    if (minGoodCatherine >= 0.0)
      v6 = self->_minGoodCatherine;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    maxGoodCatherine = self->_maxGoodCatherine;
    v11 = -maxGoodCatherine;
    if (maxGoodCatherine >= 0.0)
      v11 = self->_maxGoodCatherine;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    meanCatherine = self->_meanCatherine;
    v16 = -meanCatherine;
    if (meanCatherine >= 0.0)
      v16 = self->_meanCatherine;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    meanGoodCatherine = self->_meanGoodCatherine;
    v21 = -meanGoodCatherine;
    if (meanGoodCatherine >= 0.0)
      v21 = self->_meanGoodCatherine;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    firstCatherine = self->_firstCatherine;
    v26 = -firstCatherine;
    if (firstCatherine >= 0.0)
      v26 = self->_firstCatherine;
    v27 = floorf(v26 + 0.5);
    v28 = (float)(v26 - v27) * 1.8447e19;
    v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    firstCatherineStartTime = self->_firstCatherineStartTime;
    v31 = -firstCatherineStartTime;
    if (firstCatherineStartTime >= 0.0)
      v31 = self->_firstCatherineStartTime;
    v32 = floorf(v31 + 0.5);
    v33 = (float)(v31 - v32) * 1.8447e19;
    v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  v73 = v9;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    longestDropout = self->_longestDropout;
    v36 = -longestDropout;
    if (longestDropout >= 0.0)
      v36 = self->_longestDropout;
    v37 = floorf(v36 + 0.5);
    v38 = (float)(v36 - v37) * 1.8447e19;
    v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    totalDropoutTime = self->_totalDropoutTime;
    v41 = -totalDropoutTime;
    if (totalDropoutTime >= 0.0)
      v41 = self->_totalDropoutTime;
    v42 = floorf(v41 + 0.5);
    v43 = (float)(v41 - v42) * 1.8447e19;
    v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
    v69 = 2654435761 * self->_nDropout;
  else
    v69 = 0;
  v71 = v34;
  v72 = v24;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    startTime = self->_startTime;
    v46 = -startTime;
    if (startTime >= 0.0)
      v46 = self->_startTime;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v70 = v29;
  if ((*(_DWORD *)&has & 0x40000) != 0)
    v49 = 2654435761 * self->_onsetReason;
  else
    v49 = 0;
  v50 = v39;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    onsetCatherine = self->_onsetCatherine;
    v54 = -onsetCatherine;
    if (onsetCatherine >= 0.0)
      v54 = self->_onsetCatherine;
    v55 = floorf(v54 + 0.5);
    v56 = (float)(v54 - v55) * 1.8447e19;
    v52 = 2654435761u * (unint64_t)fmodf(v55, 1.8447e19);
    v51 = v19;
    if (v56 >= 0.0)
    {
      if (v56 > 0.0)
        v52 += (unint64_t)v56;
    }
    else
    {
      v52 -= (unint64_t)fabsf(v56);
    }
  }
  else
  {
    v51 = v19;
    v52 = 0;
  }
  v57 = v4;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    userMaxCatherine = self->_userMaxCatherine;
    v60 = -userMaxCatherine;
    if (userMaxCatherine >= 0.0)
      v60 = self->_userMaxCatherine;
    v61 = floorf(v60 + 0.5);
    v62 = (float)(v60 - v61) * 1.8447e19;
    v58 = 2654435761u * (unint64_t)fmodf(v61, 1.8447e19);
    if (v62 >= 0.0)
    {
      if (v62 > 0.0)
        v58 += (unint64_t)v62;
    }
    else
    {
      v58 -= (unint64_t)fabsf(v62);
    }
  }
  else
  {
    v58 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    persistedMinHR = self->_persistedMinHR;
    v65 = -persistedMinHR;
    if (persistedMinHR >= 0.0)
      v65 = self->_persistedMinHR;
    v66 = floorf(v65 + 0.5);
    v67 = (float)(v65 - v66) * 1.8447e19;
    v63 = 2654435761u * (unint64_t)fmodf(v66, 1.8447e19);
    if (v67 >= 0.0)
    {
      if (v67 > 0.0)
        v63 += (unint64_t)v67;
    }
    else
    {
      v63 -= (unint64_t)fabsf(v67);
    }
  }
  else
  {
    v63 = 0;
  }
  return v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v57 ^ v73 ^ v14 ^ v51 ^ v72 ^ v70 ^ v71 ^ v50 ^ (2654435761 * activityType) ^ v69 ^ v44 ^ v49 ^ v52 ^ v58 ^ v63;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  self->_activityType = *((_DWORD *)a3 + 4);
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x100) != 0)
  {
    self->_nCatherine = *((_DWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x100u;
    v3 = *((_DWORD *)a3 + 26);
    if ((v3 & 0x10000) == 0)
    {
LABEL_3:
      if ((v3 & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((v3 & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  self->_nVeryLowCatherine = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x2000) == 0)
  {
LABEL_4:
    if ((v3 & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  self->_nLowCatherine = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x800) == 0)
  {
LABEL_5:
    if ((v3 & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  self->_nHighCatherine = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x8000) == 0)
  {
LABEL_6:
    if ((v3 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  self->_nVeryHighCatherine = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x400) == 0)
  {
LABEL_7:
    if ((v3 & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  self->_nGoodCatherine = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x1000) == 0)
  {
LABEL_8:
    if ((v3 & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  self->_nInterpolatedCatherine = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x4000) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  self->_nSampleAndHoldCatherine = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  self->_minGoodCatherine = *((float *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_11:
    if ((v3 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  self->_maxGoodCatherine = *((float *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x20) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  self->_meanCatherine = *((float *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 2) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  self->_meanGoodCatherine = *((float *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 2) == 0)
  {
LABEL_14:
    if ((v3 & 4) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  self->_firstCatherine = *((float *)a3 + 5);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 4) == 0)
  {
LABEL_15:
    if ((v3 & 8) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  self->_firstCatherineStartTime = *((float *)a3 + 6);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 8) == 0)
  {
LABEL_16:
    if ((v3 & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  self->_longestDropout = *((float *)a3 + 7);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x100000) == 0)
  {
LABEL_17:
    if ((v3 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  self->_totalDropoutTime = *((float *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x100000u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x200) == 0)
  {
LABEL_18:
    if ((v3 & 1) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  self->_nDropout = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 1) == 0)
  {
LABEL_19:
    if ((v3 & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  self->_startTime = *((double *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x40000) == 0)
  {
LABEL_20:
    if ((v3 & 0x20000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  self->_onsetReason = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x40000u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x20000) == 0)
  {
LABEL_21:
    if ((v3 & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_44;
  }
LABEL_43:
  self->_onsetCatherine = *((float *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x20000u;
  v3 = *((_DWORD *)a3 + 26);
  if ((v3 & 0x200000) == 0)
  {
LABEL_22:
    if ((v3 & 0x80000) == 0)
      return;
LABEL_45:
    self->_persistedMinHR = *((float *)a3 + 23);
    *(_DWORD *)&self->_has |= 0x80000u;
    return;
  }
LABEL_44:
  self->_userMaxCatherine = *((float *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)a3 + 26) & 0x80000) != 0)
    goto LABEL_45;
}

- (int)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int)a3
{
  self->_activityType = a3;
}

- (unsigned)nCatherine
{
  return self->_nCatherine;
}

- (unsigned)nVeryLowCatherine
{
  return self->_nVeryLowCatherine;
}

- (unsigned)nLowCatherine
{
  return self->_nLowCatherine;
}

- (unsigned)nHighCatherine
{
  return self->_nHighCatherine;
}

- (unsigned)nVeryHighCatherine
{
  return self->_nVeryHighCatherine;
}

- (unsigned)nGoodCatherine
{
  return self->_nGoodCatherine;
}

- (unsigned)nInterpolatedCatherine
{
  return self->_nInterpolatedCatherine;
}

- (unsigned)nSampleAndHoldCatherine
{
  return self->_nSampleAndHoldCatherine;
}

- (float)minGoodCatherine
{
  return self->_minGoodCatherine;
}

- (float)maxGoodCatherine
{
  return self->_maxGoodCatherine;
}

- (float)meanCatherine
{
  return self->_meanCatherine;
}

- (float)meanGoodCatherine
{
  return self->_meanGoodCatherine;
}

- (float)firstCatherine
{
  return self->_firstCatherine;
}

- (float)firstCatherineStartTime
{
  return self->_firstCatherineStartTime;
}

- (float)longestDropout
{
  return self->_longestDropout;
}

- (float)totalDropoutTime
{
  return self->_totalDropoutTime;
}

- (unsigned)nDropout
{
  return self->_nDropout;
}

- (double)startTime
{
  return self->_startTime;
}

- (float)onsetCatherine
{
  return self->_onsetCatherine;
}

- (float)userMaxCatherine
{
  return self->_userMaxCatherine;
}

- (float)persistedMinHR
{
  return self->_persistedMinHR;
}

@end
