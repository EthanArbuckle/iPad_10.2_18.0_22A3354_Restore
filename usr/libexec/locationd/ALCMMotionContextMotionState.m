@implementation ALCMMotionContextMotionState

- (id)typeAsString:(int)a3
{
  id result;

  if (a3 >= 0x4000)
  {
    if (a3 < 462848)
    {
      if (a3 < 196608)
      {
        switch(a3)
        {
          case 16384:
            return CFSTR("kTypeDrivingMounted");
          case 65664:
            return CFSTR("kTypeCyclingSeat");
          case 131200:
            return CFSTR("kTypeCyclingChassis");
        }
      }
      else if (a3 > 327807)
      {
        if (a3 == 327808)
          return CFSTR("kTypeCyclingTorso");
        if (a3 == 397312)
          return CFSTR("kTypeDrivingSeat");
      }
      else
      {
        if (a3 == 196608)
          return CFSTR("kTypeCyclingLeg");
        if (a3 == 262272)
          return CFSTR("kTypeCyclingArm");
      }
    }
    else if (a3 > 720911)
    {
      if (a3 > 851979)
      {
        if (a3 == 851980)
          return CFSTR("kTypeSemiStationaryPocket");
        if (a3 == 917516)
          return CFSTR("kTypeSemiStationaryArm");
      }
      else
      {
        if (a3 == 720912)
          return CFSTR("kTypeWalkingLeg");
        if (a3 == 786448)
          return CFSTR("kTypeWalkingArm");
      }
    }
    else if (a3 > 589887)
    {
      if (a3 == 589888)
        return CFSTR("kTypeRunningLeg");
      if (a3 == 655424)
        return CFSTR("kTypeRunningArm");
    }
    else
    {
      if (a3 == 462848)
        return CFSTR("kTypeDrivingArm");
      if (a3 == 528384)
        return CFSTR("kTypeDrivingStowed");
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  if (a3 > 127)
  {
    if (a3 <= 4095)
    {
      switch(a3)
      {
        case 128:
          return CFSTR("kTypeCycling");
        case 256:
          return CFSTR("kTypeInVehicleFrozen");
        case 512:
          return CFSTR("kTypeInVehicleStatic");
      }
    }
    else if (a3 >= 0x2000)
    {
      if (a3 == 0x2000)
        return CFSTR("kTypeVehicularInHand");
      if (a3 == 12288)
        return CFSTR("kTypeDrivingOther");
    }
    else
    {
      if (a3 == 4096)
        return CFSTR("kTypeDriving");
      if (a3 == 4128)
        return CFSTR("kTypeDrivingOrWalkingSlow");
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  if (a3 > 11)
  {
    if (a3 > 31)
    {
      if (a3 == 32)
        return CFSTR("kTypeWalkingSlow");
      if (a3 == 64)
        return CFSTR("kTypeRunning");
    }
    else
    {
      if (a3 == 12)
        return CFSTR("kTypeSemiStationary");
      if (a3 == 16)
        return CFSTR("kTypeWalking");
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
    case 4:
      result = CFSTR("kTypeMoving");
      break;
    default:
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  return result;
}

- (int)StringAsType:(id)a3
{
  int result;
  unsigned __int8 v5;
  int v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeUnknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeFrozen")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeStatic")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeMoving")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeSemiStationary")) & 1) != 0)
    return 12;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeWalking")) & 1) != 0)
    return 16;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeWalkingSlow")) & 1) != 0)
    return 32;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeRunning")) & 1) != 0)
    return 64;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCycling")) & 1) != 0)
    return 128;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeInVehicleFrozen")) & 1) != 0)
    return 256;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeInVehicleStatic")) & 1) != 0)
    return 512;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDriving")) & 1) != 0)
    return 4096;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeVehicularInHand")) & 1) != 0)
    return 0x2000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDrivingOther")) & 1) != 0)
    return 12288;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDrivingMounted")) & 1) != 0)
    return 0x4000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDrivingOrWalkingSlow")) & 1) != 0)
    return 4128;
  v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCyclingSeat"));
  result = 65664;
  if ((v5 & 1) == 0)
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCyclingChassis")) & 1) != 0)
    {
      v6 = 65664;
      return v6 + 0x10000;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCyclingLeg")) & 1) != 0)
    {
      return 196608;
    }
    else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCyclingArm")) & 1) != 0)
    {
      return 262272;
    }
    else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeCyclingTorso")) & 1) != 0)
    {
      return 327808;
    }
    else
    {
      v7 = objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDrivingSeat"));
      result = 397312;
      if ((v7 & 1) == 0)
      {
        if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDrivingArm")) & 1) != 0)
        {
          v6 = 397312;
          return v6 + 0x10000;
        }
        if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeDrivingStowed")) & 1) != 0)
        {
          return 528384;
        }
        else
        {
          v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeRunningLeg"));
          result = 589888;
          if ((v8 & 1) == 0)
          {
            if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeRunningArm")) & 1) != 0)
            {
              v6 = 589888;
              return v6 + 0x10000;
            }
            v9 = objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeWalkingLeg"));
            result = 720912;
            if ((v9 & 1) == 0)
            {
              if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeWalkingArm")) & 1) != 0)
              {
                v6 = 720912;
                return v6 + 0x10000;
              }
              v10 = objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeSemiStationaryPocket"));
              result = 851980;
              if ((v10 & 1) == 0)
              {
                if (objc_msgSend(a3, "isEqualToString:", CFSTR("kTypeSemiStationaryArm")))
                  return 917516;
                else
                  return 0;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10213E568 + a3);
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

- (int)mounted
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_mounted;
  else
    return 0;
}

- (void)setMounted:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mounted = a3;
}

- (void)setHasMounted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMounted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)mountedAsString:(int)a3
{
  if (!a3)
    return CFSTR("kNotMounted");
  if (a3 == 1)
    return CFSTR("kMounted");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsMounted:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kNotMounted")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("kMounted"));
}

- (int)mountedConfidence
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_mountedConfidence;
  else
    return 0;
}

- (void)setMountedConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mountedConfidence = a3;
}

- (void)setHasMountedConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMountedConfidence
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)mountedConfidenceAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10213E568 + a3);
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

- (int)turn
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_turn;
  else
    return 0;
}

- (void)setTurn:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_turn = a3;
}

- (void)setHasTurn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTurn
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)turnAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10213E580 + a3);
}

- (int)StringAsTurn:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTurnStateUnknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kTurnStateStatic")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kTurnStateTurning")))
    return 2;
  return 0;
}

- (void)setIsVehicular:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isVehicular = a3;
}

- (void)setHasIsVehicular:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsVehicular
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsMoving:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isMoving = a3;
}

- (void)setHasIsMoving:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsMoving
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)exitState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_exitState;
  else
    return 0;
}

- (void)setExitState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_exitState = a3;
}

- (void)setHasExitState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExitState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)exitStateAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10213E598 + a3);
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

- (void)setStartTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMMotionContextMotionState;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMMotionContextMotionState description](&v3, "description"), -[ALCMMotionContextMotionState dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  int type;
  const __CFString *v5;
  uint64_t confidence;
  NSString *v7;
  char has;
  int mounted;
  const __CFString *v11;
  uint64_t mountedConfidence;
  NSString *v13;
  uint64_t turn;
  NSString *v15;
  uint64_t exitState;
  NSString *v17;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  type = self->_type;
  if (type >= 0x4000)
  {
    if (type < 462848)
    {
      if (type < 196608)
      {
        switch(type)
        {
          case 16384:
            v5 = CFSTR("kTypeDrivingMounted");
            goto LABEL_70;
          case 65664:
            v5 = CFSTR("kTypeCyclingSeat");
            goto LABEL_70;
          case 131200:
            v5 = CFSTR("kTypeCyclingChassis");
            goto LABEL_70;
        }
      }
      else if (type > 327807)
      {
        if (type == 327808)
        {
          v5 = CFSTR("kTypeCyclingTorso");
          goto LABEL_70;
        }
        if (type == 397312)
        {
          v5 = CFSTR("kTypeDrivingSeat");
          goto LABEL_70;
        }
      }
      else
      {
        if (type == 196608)
        {
          v5 = CFSTR("kTypeCyclingLeg");
          goto LABEL_70;
        }
        if (type == 262272)
        {
          v5 = CFSTR("kTypeCyclingArm");
          goto LABEL_70;
        }
      }
    }
    else if (type > 720911)
    {
      if (type > 851979)
      {
        if (type == 851980)
        {
          v5 = CFSTR("kTypeSemiStationaryPocket");
          goto LABEL_70;
        }
        if (type == 917516)
        {
          v5 = CFSTR("kTypeSemiStationaryArm");
          goto LABEL_70;
        }
      }
      else
      {
        if (type == 720912)
        {
          v5 = CFSTR("kTypeWalkingLeg");
          goto LABEL_70;
        }
        if (type == 786448)
        {
          v5 = CFSTR("kTypeWalkingArm");
          goto LABEL_70;
        }
      }
    }
    else if (type > 589887)
    {
      if (type == 589888)
      {
        v5 = CFSTR("kTypeRunningLeg");
        goto LABEL_70;
      }
      if (type == 655424)
      {
        v5 = CFSTR("kTypeRunningArm");
        goto LABEL_70;
      }
    }
    else
    {
      if (type == 462848)
      {
        v5 = CFSTR("kTypeDrivingArm");
        goto LABEL_70;
      }
      if (type == 528384)
      {
        v5 = CFSTR("kTypeDrivingStowed");
        goto LABEL_70;
      }
    }
    goto LABEL_69;
  }
  if (type > 127)
  {
    if (type <= 4095)
    {
      switch(type)
      {
        case 128:
          v5 = CFSTR("kTypeCycling");
          goto LABEL_70;
        case 256:
          v5 = CFSTR("kTypeInVehicleFrozen");
          goto LABEL_70;
        case 512:
          v5 = CFSTR("kTypeInVehicleStatic");
          goto LABEL_70;
      }
    }
    else if (type >= 0x2000)
    {
      if (type == 0x2000)
      {
        v5 = CFSTR("kTypeVehicularInHand");
        goto LABEL_70;
      }
      if (type == 12288)
      {
        v5 = CFSTR("kTypeDrivingOther");
        goto LABEL_70;
      }
    }
    else
    {
      if (type == 4096)
      {
        v5 = CFSTR("kTypeDriving");
        goto LABEL_70;
      }
      if (type == 4128)
      {
        v5 = CFSTR("kTypeDrivingOrWalkingSlow");
        goto LABEL_70;
      }
    }
LABEL_69:
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    goto LABEL_70;
  }
  if (type > 11)
  {
    if (type > 31)
    {
      if (type == 32)
      {
        v5 = CFSTR("kTypeWalkingSlow");
        goto LABEL_70;
      }
      if (type == 64)
      {
        v5 = CFSTR("kTypeRunning");
        goto LABEL_70;
      }
    }
    else
    {
      if (type == 12)
      {
        v5 = CFSTR("kTypeSemiStationary");
        goto LABEL_70;
      }
      if (type == 16)
      {
        v5 = CFSTR("kTypeWalking");
        goto LABEL_70;
      }
    }
    goto LABEL_69;
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
    case 4:
      v5 = CFSTR("kTypeMoving");
      break;
    default:
      goto LABEL_69;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));
  confidence = self->_confidence;
  if (confidence >= 3)
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_confidence);
  else
    v7 = (NSString *)*(&off_10213E568 + confidence);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("confidence"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    mounted = self->_mounted;
    if (mounted)
    {
      if (mounted == 1)
        v11 = CFSTR("kMounted");
      else
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mounted);
    }
    else
    {
      v11 = CFSTR("kNotMounted");
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mounted"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_75:
      if ((has & 0x10) == 0)
        goto LABEL_76;
      goto LABEL_92;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_75;
  }
  mountedConfidence = self->_mountedConfidence;
  if (mountedConfidence >= 3)
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mountedConfidence);
  else
    v13 = (NSString *)*(&off_10213E568 + mountedConfidence);
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("mountedConfidence"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_76:
    if ((has & 0x40) == 0)
      goto LABEL_77;
    goto LABEL_96;
  }
LABEL_92:
  turn = self->_turn;
  if (turn >= 3)
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_turn);
  else
    v15 = (NSString *)*(&off_10213E580 + turn);
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("turn"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_77:
    if ((has & 0x20) == 0)
      goto LABEL_78;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isVehicular), CFSTR("isVehicular"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_78:
    if ((has & 2) == 0)
      goto LABEL_79;
LABEL_98:
    exitState = self->_exitState;
    if (exitState >= 3)
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_exitState);
    else
      v17 = (NSString *)*(&off_10213E598 + exitState);
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("exitState"));
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_80;
    return v3;
  }
LABEL_97:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isMoving), CFSTR("isMoving"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_98;
LABEL_79:
  if ((has & 1) != 0)
LABEL_80:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_startTime), CFSTR("startTime"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004B9B2C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  PBDataWriterWriteInt32Field(a3, self->_type, 1);
  PBDataWriterWriteInt32Field(a3, self->_confidence, 2);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_mounted, 3);
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_mountedConfidence, 4);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field(a3, self->_turn, 5);
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField(a3, self->_isVehicular, 6);
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField(a3, self->_isMoving, 7);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      return;
LABEL_15:
    PBDataWriterWriteUint64Field(a3, self->_startTime, 9);
    return;
  }
LABEL_14:
  PBDataWriterWriteInt32Field(a3, self->_exitState, 8);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  *((_DWORD *)a3 + 9) = self->_type;
  *((_DWORD *)a3 + 4) = self->_confidence;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_mounted;
    *((_BYTE *)a3 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_mountedConfidence;
  *((_BYTE *)a3 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 8) = self->_turn;
  *((_BYTE *)a3 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)a3 + 41) = self->_isVehicular;
  *((_BYTE *)a3 + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)a3 + 40) = self->_isMoving;
  *((_BYTE *)a3 + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      return;
LABEL_15:
    *((_QWORD *)a3 + 1) = self->_startTime;
    *((_BYTE *)a3 + 44) |= 1u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_exitState;
  *((_BYTE *)a3 + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 9) = self->_type;
  *((_DWORD *)result + 4) = self->_confidence;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_mounted;
    *((_BYTE *)result + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_mountedConfidence;
  *((_BYTE *)result + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 8) = self->_turn;
  *((_BYTE *)result + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)result + 41) = self->_isVehicular;
  *((_BYTE *)result + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)result + 40) = self->_isMoving;
  *((_BYTE *)result + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_exitState;
  *((_BYTE *)result + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_8:
  *((_QWORD *)result + 1) = self->_startTime;
  *((_BYTE *)result + 44) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!v5)
    return v5;
  if (self->_type != *((_DWORD *)a3 + 9) || self->_confidence != *((_DWORD *)a3 + 4))
    goto LABEL_44;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_mounted != *((_DWORD *)a3 + 6))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 44) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_mountedConfidence != *((_DWORD *)a3 + 7))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 44) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_turn != *((_DWORD *)a3 + 8))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x40) == 0)
      goto LABEL_44;
    if (self->_isVehicular)
    {
      if (!*((_BYTE *)a3 + 41))
        goto LABEL_44;
    }
    else if (*((_BYTE *)a3 + 41))
    {
      goto LABEL_44;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x20) != 0)
      goto LABEL_44;
    goto LABEL_35;
  }
  if ((*((_BYTE *)a3 + 44) & 0x20) == 0)
    goto LABEL_44;
  if (self->_isMoving)
  {
    if (!*((_BYTE *)a3 + 40))
      goto LABEL_44;
    goto LABEL_35;
  }
  if (*((_BYTE *)a3 + 40))
  {
LABEL_44:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_35:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_exitState != *((_DWORD *)a3 + 5))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)a3 + 44) & 2) != 0)
  {
    goto LABEL_44;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_startTime != *((_QWORD *)a3 + 1))
      goto LABEL_44;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761 * self->_mounted;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_mountedConfidence;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_turn;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_isVehicular;
    goto LABEL_10;
  }
LABEL_9:
  v5 = 0;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v6 = 2654435761 * self->_isMoving;
  else
    v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_exitState;
  else
    v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761u * self->_startTime;
  else
    v8 = 0;
  return (2654435761 * self->_confidence) ^ (2654435761 * self->_type) ^ v2 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  self->_type = *((_DWORD *)a3 + 9);
  self->_confidence = *((_DWORD *)a3 + 4);
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 4) != 0)
  {
    self->_mounted = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 44);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_mountedConfidence = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_turn = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  self->_isVehicular = *((_BYTE *)a3 + 41);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 2) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_isMoving = *((_BYTE *)a3 + 40);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_7:
    if ((v3 & 1) == 0)
      return;
LABEL_15:
    self->_startTime = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    return;
  }
LABEL_14:
  self->_exitState = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 44) & 1) != 0)
    goto LABEL_15;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int)a3
{
  self->_confidence = a3;
}

- (BOOL)isVehicular
{
  return self->_isVehicular;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

@end
