@implementation ALCLNatalieDataDeprecated

- (void)setRecordId:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRecordId
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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

- (void)setMets:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mets = a3;
}

- (void)setHasMets:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMets
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBasalMETs:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_basalMETs = a3;
}

- (void)setHasBasalMETs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBasalMETs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBasalNatalies:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_basalNatalies = a3;
}

- (void)setHasBasalNatalies:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBasalNatalies
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLNatalieDataDeprecated;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLNatalieDataDeprecated description](&v3, "description"), -[ALCLNatalieDataDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  int activityType;
  const __CFString *v5;
  double v6;
  char has;
  char v8;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
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
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_mets), CFSTR("mets"));
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(float *)&v6 = self->_basalMETs;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("basalMETs"));
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_natalies), CFSTR("natalies"));
  v8 = (char)self->_has;
  if ((v8 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_88;
LABEL_92:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp), CFSTR("timestamp"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_90;
    goto LABEL_89;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_basalNatalies), CFSTR("basalNatalies"));
  v8 = (char)self->_has;
  if ((v8 & 8) != 0)
    goto LABEL_92;
LABEL_88:
  if ((v8 & 2) != 0)
LABEL_89:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_duration), CFSTR("duration"));
LABEL_90:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry), CFSTR("regularEntry"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_101063454((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v6;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field(a3, self->_recordId, 1);
  PBDataWriterWriteInt32Field(a3, self->_activityType, 2);
  PBDataWriterWriteBOOLField(a3, self->_isStanding, 3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 4, self->_mets);
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteFloatField(a3, 5, self->_basalMETs);
  PBDataWriterWriteInt64Field(a3, self->_natalies, 6);
  v6 = (char)self->_has;
  if ((v6 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_13:
    PBDataWriterWriteDoubleField(a3, 8, self->_timestamp);
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteInt64Field(a3, self->_basalNatalies, 7);
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v6 & 2) != 0)
LABEL_10:
    PBDataWriterWriteDoubleField(a3, 9, self->_duration);
LABEL_11:
  PBDataWriterWriteBOOLField(a3, self->_regularEntry, 10);
}

- (void)copyTo:(id)a3
{
  char has;
  char v4;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_recordId;
    *((_BYTE *)a3 + 64) |= 0x20u;
  }
  *((_DWORD *)a3 + 12) = self->_activityType;
  *((_BYTE *)a3 + 60) = self->_isStanding;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_mets;
    *((_BYTE *)a3 + 64) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 13) = LODWORD(self->_basalMETs);
    *((_BYTE *)a3 + 64) |= 0x10u;
  }
  *((_QWORD *)a3 + 4) = self->_natalies;
  v4 = (char)self->_has;
  if ((v4 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_13:
    *((_QWORD *)a3 + 5) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)a3 + 64) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_QWORD *)a3 + 1) = self->_basalNatalies;
  *((_BYTE *)a3 + 64) |= 1u;
  v4 = (char)self->_has;
  if ((v4 & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v4 & 2) != 0)
  {
LABEL_10:
    *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_duration;
    *((_BYTE *)a3 + 64) |= 2u;
  }
LABEL_11:
  *((_BYTE *)a3 + 61) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;
  char v6;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)result + 14) = self->_recordId;
    *((_BYTE *)result + 64) |= 0x20u;
  }
  *((_DWORD *)result + 12) = self->_activityType;
  *((_BYTE *)result + 60) = self->_isStanding;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_mets;
    *((_BYTE *)result + 64) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 13) = LODWORD(self->_basalMETs);
    *((_BYTE *)result + 64) |= 0x10u;
  }
  *((_QWORD *)result + 4) = self->_natalies;
  v6 = (char)self->_has;
  if ((v6 & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_13:
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 64) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_QWORD *)result + 1) = self->_basalNatalies;
  *((_BYTE *)result + 64) |= 1u;
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v6 & 2) != 0)
  {
LABEL_10:
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_duration;
    *((_BYTE *)result + 64) |= 2u;
  }
LABEL_11:
  *((_BYTE *)result + 61) = self->_regularEntry;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 64) & 0x20) == 0 || self->_recordId != *((_DWORD *)a3 + 14))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 64) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  if (self->_activityType != *((_DWORD *)a3 + 12))
    goto LABEL_40;
  if (self->_isStanding)
  {
    if (!*((_BYTE *)a3 + 60))
      goto LABEL_40;
  }
  else if (*((_BYTE *)a3 + 60))
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 64) & 4) == 0 || self->_mets != *((double *)a3 + 3))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 64) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 64) & 0x10) == 0 || self->_basalMETs != *((float *)a3 + 13))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 64) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if (self->_natalies != *((_QWORD *)a3 + 4))
  {
LABEL_40:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_basalNatalies != *((_QWORD *)a3 + 1))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 64) & 1) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 64) & 8) == 0 || self->_timestamp != *((double *)a3 + 5))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 64) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_duration != *((double *)a3 + 2))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)a3 + 64) & 2) != 0)
  {
    goto LABEL_40;
  }
  v6 = *((unsigned __int8 *)a3 + 61);
  if (self->_regularEntry)
    LOBYTE(v5) = v6 != 0;
  else
    LOBYTE(v5) = v6 == 0;
  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t activityType;
  _BOOL4 isStanding;
  unint64_t v6;
  double mets;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  float basalMETs;
  float v13;
  float v14;
  float v15;
  uint64_t v16;
  int64_t natalies;
  unint64_t v18;
  double timestamp;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  double duration;
  double v25;
  long double v26;
  double v27;
  uint64_t v29;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    v29 = 2654435761 * self->_recordId;
  else
    v29 = 0;
  activityType = self->_activityType;
  isStanding = self->_isStanding;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    mets = self->_mets;
    v8 = -mets;
    if (mets >= 0.0)
      v8 = self->_mets;
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
  if ((has & 0x10) != 0)
  {
    basalMETs = self->_basalMETs;
    v13 = -basalMETs;
    if (basalMETs >= 0.0)
      v13 = self->_basalMETs;
    v14 = floorf(v13 + 0.5);
    v15 = (float)(v13 - v14) * 1.8447e19;
    v11 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabsf(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 1) != 0)
    v16 = 2654435761 * self->_basalNatalies;
  else
    v16 = 0;
  natalies = self->_natalies;
  if ((has & 8) != 0)
  {
    timestamp = self->_timestamp;
    v20 = -timestamp;
    if (timestamp >= 0.0)
      v20 = self->_timestamp;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((has & 2) != 0)
  {
    duration = self->_duration;
    v25 = -duration;
    if (duration >= 0.0)
      v25 = self->_duration;
    v26 = floor(v25 + 0.5);
    v27 = (v25 - v26) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0)
        v23 += (unint64_t)v27;
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    v23 = 0;
  }
  return (2654435761 * activityType) ^ v29 ^ (2654435761 * isStanding) ^ v6 ^ v11 ^ (2654435761 * natalies) ^ v16 ^ v18 ^ v23 ^ (2654435761 * self->_regularEntry);
}

- (void)mergeFrom:(id)a3
{
  char v3;
  char v4;

  if ((*((_BYTE *)a3 + 64) & 0x20) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 14);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  self->_activityType = *((_DWORD *)a3 + 12);
  self->_isStanding = *((_BYTE *)a3 + 60);
  v3 = *((_BYTE *)a3 + 64);
  if ((v3 & 4) != 0)
  {
    self->_mets = *((double *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 64);
  }
  if ((v3 & 0x10) != 0)
  {
    self->_basalMETs = *((float *)a3 + 13);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  self->_natalies = *((_QWORD *)a3 + 4);
  v4 = *((_BYTE *)a3 + 64);
  if ((v4 & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 64) & 8) == 0)
      goto LABEL_9;
LABEL_13:
    self->_timestamp = *((double *)a3 + 5);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)a3 + 64) & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_basalNatalies = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v4 = *((_BYTE *)a3 + 64);
  if ((v4 & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v4 & 2) != 0)
  {
LABEL_10:
    self->_duration = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_11:
  self->_regularEntry = *((_BYTE *)a3 + 61);
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

- (float)basalMETs
{
  return self->_basalMETs;
}

- (int64_t)natalies
{
  return self->_natalies;
}

- (void)setNatalies:(int64_t)a3
{
  self->_natalies = a3;
}

- (int64_t)basalNatalies
{
  return self->_basalNatalies;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_regularEntry = a3;
}

@end
