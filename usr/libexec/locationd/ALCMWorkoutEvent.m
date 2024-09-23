@implementation ALCMWorkoutEvent

- (void)dealloc
{
  objc_super v3;

  -[ALCMWorkoutEvent setSessionId:](self, "setSessionId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALCMWorkoutEvent;
  -[ALCMWorkoutEvent dealloc](&v3, "dealloc");
}

- (id)workoutEventAsString:(int)a3
{
  if (a3 >= 6)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_1021B2968 + a3);
}

- (int)StringAsWorkoutEvent:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDidStart")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDidStop")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kWillPause")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kWillResume")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kSuggestedStop")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kPrediction")))
    return 5;
  return 0;
}

- (void)setEndTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)workoutType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_workoutType;
  else
    return 0;
}

- (void)setWorkoutType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)workoutTypeAsString:(int)a3
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

- (int)StringAsWorkoutType:(id)a3
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

- (int)locationType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_locationType;
  else
    return 0;
}

- (void)setLocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_1021B2998 + a3);
}

- (int)StringAsLocationType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kUnknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kIndoor")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kOutdoor")))
    return 2;
  return 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMWorkoutEvent;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMWorkoutEvent description](&v3, "description"), -[ALCMWorkoutEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  uint64_t workoutEvent;
  NSString *v5;
  char has;
  int workoutType;
  const __CFString *v8;
  uint64_t locationType;
  NSString *v10;
  NSData *sessionId;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  workoutEvent = self->_workoutEvent;
  if (workoutEvent >= 6)
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_workoutEvent);
  else
    v5 = (NSString *)*(&off_1021B2968 + workoutEvent);
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("workoutEvent"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime), CFSTR("startTime"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_6;
LABEL_9:
    workoutType = self->_workoutType;
    if (workoutType > 2023)
    {
      if (workoutType <= 11804)
      {
        if (workoutType <= 2070)
        {
          if (workoutType > 2060)
          {
            if (workoutType == 2061)
            {
              v8 = CFSTR("kTypeCrossTraining");
              goto LABEL_88;
            }
            if (workoutType == 2065)
            {
              v8 = CFSTR("kTypeStairClimbing");
              goto LABEL_88;
            }
          }
          else
          {
            if (workoutType == 2024)
            {
              v8 = CFSTR("kTypeCoreTraining");
              goto LABEL_88;
            }
            if (workoutType == 2048)
            {
              v8 = CFSTR("kTypeElliptical");
              goto LABEL_88;
            }
          }
        }
        else if (workoutType <= 2104)
        {
          if (workoutType == 2071)
          {
            v8 = CFSTR("kTypeRowing");
            goto LABEL_88;
          }
          if (workoutType == 2101)
          {
            v8 = CFSTR("kTypeCoolDown");
            goto LABEL_88;
          }
        }
        else
        {
          switch(workoutType)
          {
            case 2105:
              v8 = CFSTR("kTypePilates");
              goto LABEL_88;
            case 2150:
              v8 = CFSTR("kTypeYoga");
              goto LABEL_88;
            case 3015:
              v8 = CFSTR("kTypeDancing");
              goto LABEL_88;
          }
        }
      }
      else if (workoutType > 17149)
      {
        if (workoutType <= 18239)
        {
          if (workoutType == 17150)
          {
            v8 = CFSTR("kTypeIndoorWalking");
            goto LABEL_88;
          }
          if (workoutType == 18200)
          {
            v8 = CFSTR("kTypeScubaDiving");
            goto LABEL_88;
          }
        }
        else
        {
          switch(workoutType)
          {
            case 18240:
              v8 = CFSTR("kTypeSwimming");
              goto LABEL_88;
            case 19150:
              v8 = CFSTR("kTypeSummer");
              goto LABEL_88;
            case 90603:
              v8 = CFSTR("kTypeOutdoorWheelchair");
              goto LABEL_88;
          }
        }
      }
      else if (workoutType <= 15109)
      {
        if (workoutType == 11805)
        {
          v8 = CFSTR("kTypePushingWheelchair");
          goto LABEL_88;
        }
        if (workoutType == 12150)
        {
          v8 = CFSTR("kTypeIndoorRunning");
          goto LABEL_88;
        }
      }
      else
      {
        switch(workoutType)
        {
          case 15110:
            v8 = CFSTR("kTypeKickboxing");
            goto LABEL_88;
          case 15255:
            v8 = CFSTR("kTypeGolfing");
            goto LABEL_88;
          case 15670:
            v8 = CFSTR("kTypeTaiChi");
            goto LABEL_88;
        }
      }
    }
    else
    {
      if (workoutType <= 40)
      {
        v8 = CFSTR("kTypeUnknown");
        switch(workoutType)
        {
          case 0:
            break;
          case 1:
            v8 = CFSTR("kTypeFrozen");
            break;
          case 2:
            v8 = CFSTR("kTypeStatic");
            break;
          case 3:
            v8 = CFSTR("kTypeMoving");
            break;
          case 4:
            v8 = CFSTR("kTypeWalking");
            break;
          case 5:
            v8 = CFSTR("kTypeDriving");
            break;
          case 6:
            v8 = CFSTR("kTypeCycling");
            break;
          case 7:
            v8 = CFSTR("kTypeSemiStationary");
            break;
          case 8:
            v8 = CFSTR("kTypeRunning");
            break;
          case 9:
            v8 = CFSTR("kTypeMovingCoarse");
            break;
          case 10:
            v8 = CFSTR("kTypeInVehicleFrozen");
            break;
          case 11:
            v8 = CFSTR("kTypeInVehicleStatic");
            break;
          default:
            goto LABEL_87;
        }
LABEL_88:
        objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("workoutType"));
        if ((*(_BYTE *)&self->_has & 2) == 0)
          goto LABEL_93;
LABEL_89:
        locationType = self->_locationType;
        if (locationType >= 3)
          v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_locationType);
        else
          v10 = (NSString *)*(&off_1021B2998 + locationType);
        objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("locationType"));
        goto LABEL_93;
      }
      if (workoutType > 99)
      {
        if (workoutType > 2019)
        {
          if (workoutType == 2020)
          {
            v8 = CFSTR("kTypeCalisthenics");
            goto LABEL_88;
          }
          if (workoutType == 2022)
          {
            v8 = CFSTR("kTypeFunctionalStrength");
            goto LABEL_88;
          }
        }
        else
        {
          if (workoutType == 100)
          {
            v8 = CFSTR("kTypeCyclingLeg");
            goto LABEL_88;
          }
          if (workoutType == 2010)
          {
            v8 = CFSTR("kTypeStationaryCycling");
            goto LABEL_88;
          }
        }
      }
      else if (workoutType > 55)
      {
        if (workoutType == 56)
        {
          v8 = CFSTR("kTypeDrivingOther");
          goto LABEL_88;
        }
        if (workoutType == 63)
        {
          v8 = CFSTR("kTypeMultiSportTransition");
          goto LABEL_88;
        }
      }
      else
      {
        if (workoutType == 41)
        {
          v8 = CFSTR("kTypeWalkingSlow");
          goto LABEL_88;
        }
        if (workoutType == 52)
        {
          v8 = CFSTR("kTypeVehicularInHand");
          goto LABEL_88;
        }
      }
    }
LABEL_87:
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_workoutType);
    goto LABEL_88;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_endTime), CFSTR("endTime"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_6:
  if ((has & 2) != 0)
    goto LABEL_89;
LABEL_93:
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1013AD924((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSData *sessionId;

  PBDataWriterWriteInt32Field(a3, self->_workoutEvent, 1);
  PBDataWriterWriteDoubleField(a3, 2, self->_startTime);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 3, self->_endTime);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_workoutType, 4);
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field(a3, self->_locationType, 5);
LABEL_5:
  sessionId = self->_sessionId;
  if (sessionId)
    PBDataWriterWriteDataField(a3, sessionId, 6);
}

- (void)copyTo:(id)a3
{
  char has;
  NSData *sessionId;

  *((_DWORD *)a3 + 10) = self->_workoutEvent;
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_startTime;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_endTime;
    *((_BYTE *)a3 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 11) = self->_workoutType;
  *((_BYTE *)a3 + 48) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 6) = self->_locationType;
    *((_BYTE *)a3 + 48) |= 2u;
  }
LABEL_5:
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(a3, "setSessionId:", sessionId);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  *((_DWORD *)v5 + 10) = self->_workoutEvent;
  *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_startTime;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v5 + 11) = self->_workoutType;
    *((_BYTE *)v5 + 48) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_endTime;
  *((_BYTE *)v5 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 6) = self->_locationType;
    *((_BYTE *)v5 + 48) |= 2u;
  }
LABEL_5:

  v6[4] = -[NSData copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSData *sessionId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_workoutEvent != *((_DWORD *)a3 + 10) || self->_startTime != *((double *)a3 + 2))
      goto LABEL_21;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_endTime != *((double *)a3 + 1))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_workoutType != *((_DWORD *)a3 + 11))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
      goto LABEL_21;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_locationType != *((_DWORD *)a3 + 6))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
      goto LABEL_21;
    }
    sessionId = self->_sessionId;
    if ((unint64_t)sessionId | *((_QWORD *)a3 + 4))
      LOBYTE(v5) = -[NSData isEqual:](sessionId, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t workoutEvent;
  double startTime;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char has;
  unint64_t v14;
  double endTime;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;

  workoutEvent = self->_workoutEvent;
  startTime = self->_startTime;
  v5 = -startTime;
  if (startTime >= 0.0)
    v5 = self->_startTime;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    endTime = self->_endTime;
    v16 = -endTime;
    if (endTime >= 0.0)
      v16 = self->_endTime;
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
  if ((has & 4) != 0)
  {
    v19 = 2654435761 * self->_workoutType;
    if ((has & 2) != 0)
      goto LABEL_18;
LABEL_20:
    v20 = 0;
    return v12 ^ (2654435761 * workoutEvent) ^ v14 ^ v19 ^ v20 ^ (unint64_t)-[NSData hash](self->_sessionId, "hash");
  }
  v19 = 0;
  if ((has & 2) == 0)
    goto LABEL_20;
LABEL_18:
  v20 = 2654435761 * self->_locationType;
  return v12 ^ (2654435761 * workoutEvent) ^ v14 ^ v19 ^ v20 ^ (unint64_t)-[NSData hash](self->_sessionId, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;

  self->_workoutEvent = *((_DWORD *)a3 + 10);
  self->_startTime = *((double *)a3 + 2);
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 1) != 0)
  {
    self->_endTime = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 48);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_workoutType = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 48) & 2) != 0)
  {
LABEL_4:
    self->_locationType = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 4))
    -[ALCMWorkoutEvent setSessionId:](self, "setSessionId:");
}

- (int)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(int)a3
{
  self->_workoutEvent = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
