@implementation ALCMWorkoutEventDeprecated

- (void)dealloc
{
  objc_super v3;

  -[ALCMWorkoutEventDeprecated setSessionId:](self, "setSessionId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALCMWorkoutEventDeprecated;
  -[ALCMWorkoutEventDeprecated dealloc](&v3, "dealloc");
}

- (id)workoutEventAsString:(int)a3
{
  if (a3 >= 6)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_10219C088[a3];
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
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kSuggestedStart")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kSuggestedStop")))
    return 5;
  return 0;
}

- (int)workoutType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_workoutType;
  else
    return 0;
}

- (void)setWorkoutType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWorkoutType
{
  return *(_BYTE *)&self->_has & 1;
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

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMWorkoutEventDeprecated;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMWorkoutEventDeprecated description](&v3, "description"), -[ALCMWorkoutEventDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  uint64_t workoutEvent;
  __CFString *v5;
  int workoutType;
  const __CFString *v7;
  NSData *sessionId;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  workoutEvent = self->_workoutEvent;
  if (workoutEvent >= 6)
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_workoutEvent);
  else
    v5 = off_10219C088[workoutEvent];
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("workoutEvent"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    workoutType = self->_workoutType;
    if (workoutType <= 2023)
    {
      if (workoutType <= 40)
      {
        v7 = CFSTR("kTypeUnknown");
        switch(workoutType)
        {
          case 0:
            goto LABEL_84;
          case 1:
            v7 = CFSTR("kTypeFrozen");
            break;
          case 2:
            v7 = CFSTR("kTypeStatic");
            break;
          case 3:
            v7 = CFSTR("kTypeMoving");
            break;
          case 4:
            v7 = CFSTR("kTypeWalking");
            break;
          case 5:
            v7 = CFSTR("kTypeDriving");
            break;
          case 6:
            v7 = CFSTR("kTypeCycling");
            break;
          case 7:
            v7 = CFSTR("kTypeSemiStationary");
            break;
          case 8:
            v7 = CFSTR("kTypeRunning");
            break;
          case 9:
            v7 = CFSTR("kTypeMovingCoarse");
            break;
          case 10:
            v7 = CFSTR("kTypeInVehicleFrozen");
            break;
          case 11:
            v7 = CFSTR("kTypeInVehicleStatic");
            break;
          default:
            goto LABEL_83;
        }
        goto LABEL_84;
      }
      if (workoutType > 99)
      {
        if (workoutType > 2019)
        {
          if (workoutType == 2020)
          {
            v7 = CFSTR("kTypeCalisthenics");
            goto LABEL_84;
          }
          if (workoutType == 2022)
          {
            v7 = CFSTR("kTypeFunctionalStrength");
            goto LABEL_84;
          }
        }
        else
        {
          if (workoutType == 100)
          {
            v7 = CFSTR("kTypeCyclingLeg");
            goto LABEL_84;
          }
          if (workoutType == 2010)
          {
            v7 = CFSTR("kTypeStationaryCycling");
            goto LABEL_84;
          }
        }
      }
      else if (workoutType > 55)
      {
        if (workoutType == 56)
        {
          v7 = CFSTR("kTypeDrivingOther");
          goto LABEL_84;
        }
        if (workoutType == 63)
        {
          v7 = CFSTR("kTypeMultiSportTransition");
          goto LABEL_84;
        }
      }
      else
      {
        if (workoutType == 41)
        {
          v7 = CFSTR("kTypeWalkingSlow");
          goto LABEL_84;
        }
        if (workoutType == 52)
        {
          v7 = CFSTR("kTypeVehicularInHand");
          goto LABEL_84;
        }
      }
LABEL_83:
      v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_workoutType);
      goto LABEL_84;
    }
    if (workoutType <= 11804)
    {
      if (workoutType <= 2070)
      {
        if (workoutType > 2060)
        {
          if (workoutType == 2061)
          {
            v7 = CFSTR("kTypeCrossTraining");
            goto LABEL_84;
          }
          if (workoutType == 2065)
          {
            v7 = CFSTR("kTypeStairClimbing");
            goto LABEL_84;
          }
        }
        else
        {
          if (workoutType == 2024)
          {
            v7 = CFSTR("kTypeCoreTraining");
            goto LABEL_84;
          }
          if (workoutType == 2048)
          {
            v7 = CFSTR("kTypeElliptical");
            goto LABEL_84;
          }
        }
        goto LABEL_83;
      }
      if (workoutType <= 2104)
      {
        if (workoutType == 2071)
        {
          v7 = CFSTR("kTypeRowing");
          goto LABEL_84;
        }
        if (workoutType == 2101)
        {
          v7 = CFSTR("kTypeCoolDown");
          goto LABEL_84;
        }
        goto LABEL_83;
      }
      if (workoutType == 2105)
      {
        v7 = CFSTR("kTypePilates");
        goto LABEL_84;
      }
      if (workoutType == 2150)
      {
        v7 = CFSTR("kTypeYoga");
        goto LABEL_84;
      }
      if (workoutType != 3015)
        goto LABEL_83;
      v7 = CFSTR("kTypeDancing");
    }
    else
    {
      if (workoutType > 17149)
      {
        if (workoutType <= 18239)
        {
          if (workoutType == 17150)
          {
            v7 = CFSTR("kTypeIndoorWalking");
            goto LABEL_84;
          }
          if (workoutType == 18200)
          {
            v7 = CFSTR("kTypeScubaDiving");
            goto LABEL_84;
          }
        }
        else
        {
          switch(workoutType)
          {
            case 18240:
              v7 = CFSTR("kTypeSwimming");
              goto LABEL_84;
            case 19150:
              v7 = CFSTR("kTypeSummer");
              goto LABEL_84;
            case 90603:
              v7 = CFSTR("kTypeOutdoorWheelchair");
              goto LABEL_84;
          }
        }
        goto LABEL_83;
      }
      if (workoutType <= 15109)
      {
        if (workoutType == 11805)
        {
          v7 = CFSTR("kTypePushingWheelchair");
          goto LABEL_84;
        }
        if (workoutType == 12150)
        {
          v7 = CFSTR("kTypeIndoorRunning");
          goto LABEL_84;
        }
        goto LABEL_83;
      }
      if (workoutType == 15110)
      {
        v7 = CFSTR("kTypeKickboxing");
        goto LABEL_84;
      }
      if (workoutType == 15255)
      {
        v7 = CFSTR("kTypeGolfing");
        goto LABEL_84;
      }
      if (workoutType != 15670)
        goto LABEL_83;
      v7 = CFSTR("kTypeTaiChi");
    }
LABEL_84:
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("workoutType"));
  }
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10104CC14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *sessionId;

  PBDataWriterWriteInt32Field(a3, self->_workoutEvent, 1);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field(a3, self->_workoutType, 2);
  sessionId = self->_sessionId;
  if (sessionId)
    PBDataWriterWriteDataField(a3, sessionId, 3);
}

- (void)copyTo:(id)a3
{
  NSData *sessionId;

  *((_DWORD *)a3 + 4) = self->_workoutEvent;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_workoutType;
    *((_BYTE *)a3 + 24) |= 1u;
  }
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(a3, "setSessionId:", sessionId);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  _QWORD *v6;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  *((_DWORD *)v5 + 4) = self->_workoutEvent;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_workoutType;
    *((_BYTE *)v5 + 24) |= 1u;
  }

  v6[1] = -[NSData copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSData *sessionId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_workoutEvent != *((_DWORD *)a3 + 4))
    {
LABEL_10:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_workoutType != *((_DWORD *)a3 + 5))
        goto LABEL_10;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
      goto LABEL_10;
    }
    sessionId = self->_sessionId;
    if ((unint64_t)sessionId | *((_QWORD *)a3 + 1))
      LOBYTE(v5) = -[NSData isEqual:](sessionId, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_workoutType;
  else
    v2 = 0;
  v3 = 2654435761 * self->_workoutEvent;
  return v2 ^ (unint64_t)-[NSData hash](self->_sessionId, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  self->_workoutEvent = *((_DWORD *)a3 + 4);
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_workoutType = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 1))
    -[ALCMWorkoutEventDeprecated setSessionId:](self, "setSessionId:");
}

- (int)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(int)a3
{
  self->_workoutEvent = a3;
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
