@implementation APPBSegmentUpdateRequest

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  PBRepeatedInt32Clear(&self->_deviceModes, a2);
  PBRepeatedInt32Clear(&self->_accountTypes, v3);
  PBRepeatedInt32Clear(&self->_accountStates, v4);
  v5.receiver = self;
  v5.super_class = (Class)APPBSegmentUpdateRequest;
  -[APPBSegmentUpdateRequest dealloc](&v5, "dealloc");
}

+ (id)options
{
  if (qword_1002698E0 != -1)
    dispatch_once(&qword_1002698E0, &stru_100215030);
  return (id)qword_1002698D8;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasSegmentInfo
{
  return self->_segmentInfo != 0;
}

- (void)setIsFirstPartyIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isFirstPartyIdentifier = a3;
}

- (void)setHasIsFirstPartyIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsFirstPartyIdentifier
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasAdvertisingIdentifier
{
  return self->_advertisingIdentifier != 0;
}

- (void)setITunesRefreshTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_iTunesRefreshTime = a3;
}

- (void)setHasITunesRefreshTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasITunesRefreshTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUpdateSentTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_updateSentTime = a3;
}

- (void)setHasUpdateSentTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdateSentTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimezone:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timezone = a3;
}

- (void)setHasTimezone:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimezone
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAdvertisingIdentifierMonthResetCount:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_advertisingIdentifierMonthResetCount = a3;
}

- (void)setHasAdvertisingIdentifierMonthResetCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAdvertisingIdentifierMonthResetCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasOsVersionAndBuild
{
  return self->_osVersionAndBuild != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (unint64_t)deviceModesCount
{
  return self->_deviceModes.count;
}

- (int)deviceModes
{
  return self->_deviceModes.list;
}

- (void)clearDeviceModes
{
  PBRepeatedInt32Clear(&self->_deviceModes, a2);
}

- (void)addDeviceMode:(int)a3
{
  PBRepeatedInt32Add(&self->_deviceModes, *(_QWORD *)&a3);
}

- (int)deviceModeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_deviceModes;
  unint64_t count;
  void *v6;
  void *v7;

  p_deviceModes = &self->_deviceModes;
  count = self->_deviceModes.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_deviceModes->list[a3];
}

- (void)setDeviceModes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set(&self->_deviceModes, a3, a4);
}

- (id)deviceModesAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215050 + a3);
}

- (int)StringAsDeviceModes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EducationMode")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GuestMode")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)accountTypesCount
{
  return self->_accountTypes.count;
}

- (int)accountTypes
{
  return self->_accountTypes.list;
}

- (void)clearAccountTypes
{
  PBRepeatedInt32Clear(&self->_accountTypes, a2);
}

- (void)addAccountType:(int)a3
{
  PBRepeatedInt32Add(&self->_accountTypes, *(_QWORD *)&a3);
}

- (int)accountTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountTypes;
  unint64_t count;
  void *v6;
  void *v7;

  p_accountTypes = &self->_accountTypes;
  count = self->_accountTypes.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_accountTypes->list[a3];
}

- (void)setAccountTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set(&self->_accountTypes, a3, a4);
}

- (id)accountTypesAsString:(int)a3
{
  if (a3 >= 8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215068 + a3);
}

- (int)StringAsAccountTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoAccount")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Consumer")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ManagedAccount")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U13")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("T13")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U18")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown_Age")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SensitiveContentEligible")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)accountStatesCount
{
  return self->_accountStates.count;
}

- (int)accountStates
{
  return self->_accountStates.list;
}

- (void)clearAccountStates
{
  PBRepeatedInt32Clear(&self->_accountStates, a2);
}

- (void)addAccountState:(int)a3
{
  PBRepeatedInt32Add(&self->_accountStates, *(_QWORD *)&a3);
}

- (int)accountStateAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountStates;
  unint64_t count;
  void *v6;
  void *v7;

  p_accountStates = &self->_accountStates;
  count = self->_accountStates.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_accountStates->list[a3];
}

- (void)setAccountStates:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set(&self->_accountStates, a3, a4);
}

- (id)accountStatesAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002150A8 + a3);
}

- (int)StringAsAccountStates:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("No_iCloud")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Same_iCloud")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Diff_iCloud")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBSegmentUpdateRequest;
  v3 = -[APPBSegmentUpdateRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBSegmentUpdateRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSData *iAdID;
  NSString *segmentInfo;
  void *v8;
  NSString *advertisingIdentifier;
  char has;
  void *v11;
  NSString *osVersionAndBuild;
  NSString *localeIdentifier;
  NSData *dPID;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_deviceModes;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountTypes;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountStates;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = v3;
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v3, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  segmentInfo = self->_segmentInfo;
  if (segmentInfo)
    objc_msgSend(v5, "setObject:forKey:", segmentInfo, CFSTR("segmentInfo"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isFirstPartyIdentifier));
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("isFirstPartyIdentifier"));

  }
  advertisingIdentifier = self->_advertisingIdentifier;
  if (advertisingIdentifier)
    objc_msgSend(v5, "setObject:forKey:", advertisingIdentifier, CFSTR("advertisingIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_iTunesRefreshTime));
    objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("iTunesRefreshTime"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_47;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_updateSentTime));
  objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("updateSentTime"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_47:
  *(float *)&v4 = self->_timezone;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  objc_msgSend(v5, "setObject:forKey:", v33, CFSTR("timezone"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_advertisingIdentifierMonthResetCount));
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("advertisingIdentifierMonthResetCount"));

  }
LABEL_14:
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild)
    objc_msgSend(v5, "setObject:forKey:", osVersionAndBuild, CFSTR("osVersionAndBuild"));
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v5, "setObject:forKey:", localeIdentifier, CFSTR("localeIdentifier"));
  dPID = self->_dPID;
  if (dPID)
    objc_msgSend(v5, "setObject:forKey:", dPID, CFSTR("DPID"));
  p_deviceModes = &self->_deviceModes;
  if (self->_deviceModes.count)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:"));
    if (self->_deviceModes.count)
    {
      v17 = 0;
      do
      {
        v18 = p_deviceModes->list[v17];
        if (v18 >= 3)
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), p_deviceModes->list[v17]));
        else
          v19 = *(&off_100215050 + v18);
        objc_msgSend(v16, "addObject:", v19);

        ++v17;
      }
      while (v17 < self->_deviceModes.count);
    }
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("deviceMode"));

  }
  p_accountTypes = &self->_accountTypes;
  if (self->_accountTypes.count)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:"));
    if (self->_accountTypes.count)
    {
      v22 = 0;
      do
      {
        v23 = p_accountTypes->list[v22];
        if (v23 >= 8)
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), p_accountTypes->list[v22]));
        else
          v24 = *(&off_100215068 + v23);
        objc_msgSend(v21, "addObject:", v24);

        ++v22;
      }
      while (v22 < self->_accountTypes.count);
    }
    objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("accountType"));

  }
  p_accountStates = &self->_accountStates;
  if (self->_accountStates.count)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:"));
    if (p_accountStates->count)
    {
      v27 = 0;
      do
      {
        v28 = p_accountStates->list[v27];
        if (v28 >= 3)
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), p_accountStates->list[v27]));
        else
          v29 = *(&off_1002150A8 + v28);
        objc_msgSend(v26, "addObject:", v29);

        ++v27;
      }
      while (v27 < p_accountStates->count);
    }
    objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("accountState"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return APPBSegmentUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *iAdID;
  NSString *segmentInfo;
  NSString *advertisingIdentifier;
  char has;
  NSString *osVersionAndBuild;
  NSString *localeIdentifier;
  NSData *dPID;
  unint64_t v12;
  unint64_t v13;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountStates;
  unint64_t v15;
  id v16;

  v4 = a3;
  iAdID = self->_iAdID;
  v16 = v4;
  if (iAdID)
  {
    PBDataWriterWriteDataField(v4, iAdID, 2);
    v4 = v16;
  }
  segmentInfo = self->_segmentInfo;
  if (segmentInfo)
  {
    PBDataWriterWriteStringField(v16, segmentInfo, 3);
    v4 = v16;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField(v16, self->_isFirstPartyIdentifier, 4);
    v4 = v16;
  }
  advertisingIdentifier = self->_advertisingIdentifier;
  if (advertisingIdentifier)
  {
    PBDataWriterWriteStringField(v16, advertisingIdentifier, 5);
    v4 = v16;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v16, 8, self->_iTunesRefreshTime);
    v4 = v16;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField(v16, 9, self->_updateSentTime);
  v4 = v16;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_32:
  PBDataWriterWriteFloatField(v16, 10, self->_timezone);
  v4 = v16;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field(v16, self->_advertisingIdentifierMonthResetCount, 11);
    v4 = v16;
  }
LABEL_14:
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild)
  {
    PBDataWriterWriteStringField(v16, osVersionAndBuild, 39);
    v4 = v16;
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
  {
    PBDataWriterWriteStringField(v16, localeIdentifier, 40);
    v4 = v16;
  }
  dPID = self->_dPID;
  if (dPID)
  {
    PBDataWriterWriteDataField(v16, dPID, 41);
    v4 = v16;
  }
  if (self->_deviceModes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field(v16, self->_deviceModes.list[v12], 42);
      v4 = v16;
      ++v12;
    }
    while (v12 < self->_deviceModes.count);
  }
  if (self->_accountTypes.count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field(v16, self->_accountTypes.list[v13], 43);
      v4 = v16;
      ++v13;
    }
    while (v13 < self->_accountTypes.count);
  }
  p_accountStates = &self->_accountStates;
  if (p_accountStates->count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteInt32Field(v16, p_accountStates->list[v15], 44);
      v4 = v16;
      ++v15;
    }
    while (v15 < p_accountStates->count);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  id v15;

  v4 = a3;
  v15 = v4;
  if (self->_iAdID)
  {
    objc_msgSend(v4, "setIAdID:");
    v4 = v15;
  }
  if (self->_segmentInfo)
  {
    objc_msgSend(v15, "setSegmentInfo:");
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 156) = self->_isFirstPartyIdentifier;
    *((_BYTE *)v4 + 160) |= 0x10u;
  }
  if (self->_advertisingIdentifier)
  {
    objc_msgSend(v15, "setAdvertisingIdentifier:");
    v4 = v15;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_iTunesRefreshTime;
    *((_BYTE *)v4 + 160) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_updateSentTime;
  *((_BYTE *)v4 + 160) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_35:
  *((_DWORD *)v4 + 38) = LODWORD(self->_timezone);
  *((_BYTE *)v4 + 160) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 26) = self->_advertisingIdentifierMonthResetCount;
    *((_BYTE *)v4 + 160) |= 4u;
  }
LABEL_14:
  if (self->_osVersionAndBuild)
    objc_msgSend(v15, "setOsVersionAndBuild:");
  if (self->_localeIdentifier)
    objc_msgSend(v15, "setLocaleIdentifier:");
  if (self->_dPID)
    objc_msgSend(v15, "setDPID:");
  if (-[APPBSegmentUpdateRequest deviceModesCount](self, "deviceModesCount"))
  {
    objc_msgSend(v15, "clearDeviceModes");
    v6 = -[APPBSegmentUpdateRequest deviceModesCount](self, "deviceModesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v15, "addDeviceMode:", -[APPBSegmentUpdateRequest deviceModeAtIndex:](self, "deviceModeAtIndex:", i));
    }
  }
  if (-[APPBSegmentUpdateRequest accountTypesCount](self, "accountTypesCount"))
  {
    objc_msgSend(v15, "clearAccountTypes");
    v9 = -[APPBSegmentUpdateRequest accountTypesCount](self, "accountTypesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v15, "addAccountType:", -[APPBSegmentUpdateRequest accountTypeAtIndex:](self, "accountTypeAtIndex:", j));
    }
  }
  if (-[APPBSegmentUpdateRequest accountStatesCount](self, "accountStatesCount"))
  {
    objc_msgSend(v15, "clearAccountStates");
    v12 = -[APPBSegmentUpdateRequest accountStatesCount](self, "accountStatesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(v15, "addAccountState:", -[APPBSegmentUpdateRequest accountStateAtIndex:](self, "accountStateAtIndex:", k));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char has;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3);
  v7 = (void *)v5[15];
  v5[15] = v6;

  v8 = -[NSString copyWithZone:](self->_segmentInfo, "copyWithZone:", a3);
  v9 = (void *)v5[18];
  v5[18] = v8;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v5 + 156) = self->_isFirstPartyIdentifier;
    *((_BYTE *)v5 + 160) |= 0x10u;
  }
  v10 = -[NSString copyWithZone:](self->_advertisingIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[12];
  v5[12] = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[10] = *(_QWORD *)&self->_iTunesRefreshTime;
    *((_BYTE *)v5 + 160) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
LABEL_11:
      *((_DWORD *)v5 + 38) = LODWORD(self->_timezone);
      *((_BYTE *)v5 + 160) |= 8u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v5[11] = *(_QWORD *)&self->_updateSentTime;
  *((_BYTE *)v5 + 160) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 26) = self->_advertisingIdentifierMonthResetCount;
    *((_BYTE *)v5 + 160) |= 4u;
  }
LABEL_8:
  v13 = -[NSString copyWithZone:](self->_osVersionAndBuild, "copyWithZone:", a3);
  v14 = (void *)v5[17];
  v5[17] = v13;

  v15 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v16 = (void *)v5[16];
  v5[16] = v15;

  v17 = -[NSData copyWithZone:](self->_dPID, "copyWithZone:", a3);
  v18 = (void *)v5[14];
  v5[14] = v17;

  PBRepeatedInt32Copy(v5 + 7, &self->_deviceModes);
  PBRepeatedInt32Copy(v5 + 4, &self->_accountTypes);
  PBRepeatedInt32Copy(v5 + 1, &self->_accountStates);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSData *iAdID;
  NSString *segmentInfo;
  char has;
  NSString *advertisingIdentifier;
  NSString *osVersionAndBuild;
  NSString *localeIdentifier;
  NSData *dPID;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_46;
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((_QWORD *)v4 + 15))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:"))
      goto LABEL_46;
  }
  segmentInfo = self->_segmentInfo;
  if ((unint64_t)segmentInfo | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](segmentInfo, "isEqual:"))
      goto LABEL_46;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((v4[160] & 0x10) == 0)
      goto LABEL_46;
    if (self->_isFirstPartyIdentifier)
    {
      if (!v4[156])
        goto LABEL_46;
    }
    else if (v4[156])
    {
      goto LABEL_46;
    }
  }
  else if ((v4[160] & 0x10) != 0)
  {
    goto LABEL_46;
  }
  advertisingIdentifier = self->_advertisingIdentifier;
  if (!((unint64_t)advertisingIdentifier | *((_QWORD *)v4 + 12)))
    goto LABEL_17;
  if (!-[NSString isEqual:](advertisingIdentifier, "isEqual:"))
  {
LABEL_46:
    IsEqual = 0;
    goto LABEL_47;
  }
  has = (char)self->_has;
LABEL_17:
  if ((has & 1) != 0)
  {
    if ((v4[160] & 1) == 0 || self->_iTunesRefreshTime != *((double *)v4 + 10))
      goto LABEL_46;
  }
  else if ((v4[160] & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 2) != 0)
  {
    if ((v4[160] & 2) == 0 || self->_updateSentTime != *((double *)v4 + 11))
      goto LABEL_46;
  }
  else if ((v4[160] & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((v4[160] & 8) == 0 || self->_timezone != *((float *)v4 + 38))
      goto LABEL_46;
  }
  else if ((v4[160] & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 4) != 0)
  {
    if ((v4[160] & 4) == 0 || self->_advertisingIdentifierMonthResetCount != *((_DWORD *)v4 + 26))
      goto LABEL_46;
  }
  else if ((v4[160] & 4) != 0)
  {
    goto LABEL_46;
  }
  osVersionAndBuild = self->_osVersionAndBuild;
  if ((unint64_t)osVersionAndBuild | *((_QWORD *)v4 + 17)
    && !-[NSString isEqual:](osVersionAndBuild, "isEqual:"))
  {
    goto LABEL_46;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_46;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:"))
      goto LABEL_46;
  }
  if (!PBRepeatedInt32IsEqual(&self->_deviceModes, v4 + 56)
    || !PBRepeatedInt32IsEqual(&self->_accountTypes, v4 + 32))
  {
    goto LABEL_46;
  }
  IsEqual = PBRepeatedInt32IsEqual(&self->_accountStates, v4 + 8);
LABEL_47:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  char has;
  unint64_t v8;
  double iTunesRefreshTime;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  double updateSentTime;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  float timezone;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  NSUInteger v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = (unint64_t)-[NSData hash](self->_iAdID, "hash");
  v4 = -[NSString hash](self->_segmentInfo, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v5 = 2654435761 * self->_isFirstPartyIdentifier;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_advertisingIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    iTunesRefreshTime = self->_iTunesRefreshTime;
    v10 = -iTunesRefreshTime;
    if (iTunesRefreshTime >= 0.0)
      v10 = self->_iTunesRefreshTime;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((has & 2) != 0)
  {
    updateSentTime = self->_updateSentTime;
    v15 = -updateSentTime;
    if (updateSentTime >= 0.0)
      v15 = self->_updateSentTime;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((has & 8) != 0)
  {
    timezone = self->_timezone;
    v20 = -timezone;
    if (timezone >= 0.0)
      v20 = self->_timezone;
    v21 = floorf(v20 + 0.5);
    v22 = (float)(v20 - v21) * 1.8447e19;
    v18 = 2654435761u * (unint64_t)fmodf(v21, 1.8447e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabsf(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((has & 4) != 0)
    v23 = 2654435761 * self->_advertisingIdentifierMonthResetCount;
  else
    v23 = 0;
  v24 = v4 ^ v3 ^ v5 ^ v6;
  v25 = v8 ^ v13 ^ v18 ^ v23 ^ -[NSString hash](self->_osVersionAndBuild, "hash");
  v26 = v24 ^ v25 ^ -[NSString hash](self->_localeIdentifier, "hash");
  v27 = (unint64_t)-[NSData hash](self->_dPID, "hash");
  v28 = v27 ^ PBRepeatedInt32Hash(&self->_deviceModes);
  v29 = v28 ^ PBRepeatedInt32Hash(&self->_accountTypes);
  return v26 ^ v29 ^ PBRepeatedInt32Hash(&self->_accountStates);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char *v6;
  char *v7;
  char *i;
  char *v9;
  char *v10;
  char *j;
  char *v12;
  char *v13;
  char *k;
  id v15;

  v4 = a3;
  v15 = v4;
  if (*((_QWORD *)v4 + 15))
  {
    -[APPBSegmentUpdateRequest setIAdID:](self, "setIAdID:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 18))
  {
    -[APPBSegmentUpdateRequest setSegmentInfo:](self, "setSegmentInfo:");
    v4 = v15;
  }
  if ((*((_BYTE *)v4 + 160) & 0x10) != 0)
  {
    self->_isFirstPartyIdentifier = *((_BYTE *)v4 + 156);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[APPBSegmentUpdateRequest setAdvertisingIdentifier:](self, "setAdvertisingIdentifier:");
    v4 = v15;
  }
  v5 = *((_BYTE *)v4 + 160);
  if ((v5 & 1) != 0)
  {
    self->_iTunesRefreshTime = *((double *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 160);
    if ((v5 & 2) == 0)
    {
LABEL_11:
      if ((v5 & 8) == 0)
        goto LABEL_12;
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 160) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_updateSentTime = *((double *)v4 + 11);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 160);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_32:
  self->_timezone = *((float *)v4 + 38);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 160) & 4) != 0)
  {
LABEL_13:
    self->_advertisingIdentifierMonthResetCount = *((_DWORD *)v4 + 26);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 17))
  {
    -[APPBSegmentUpdateRequest setOsVersionAndBuild:](self, "setOsVersionAndBuild:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[APPBSegmentUpdateRequest setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[APPBSegmentUpdateRequest setDPID:](self, "setDPID:");
    v4 = v15;
  }
  v6 = (char *)objc_msgSend(v4, "deviceModesCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[APPBSegmentUpdateRequest addDeviceMode:](self, "addDeviceMode:", objc_msgSend(v15, "deviceModeAtIndex:", i));
  }
  v9 = (char *)objc_msgSend(v15, "accountTypesCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[APPBSegmentUpdateRequest addAccountType:](self, "addAccountType:", objc_msgSend(v15, "accountTypeAtIndex:", j));
  }
  v12 = (char *)objc_msgSend(v15, "accountStatesCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[APPBSegmentUpdateRequest addAccountState:](self, "addAccountState:", objc_msgSend(v15, "accountStateAtIndex:", k));
  }

}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
  objc_storeStrong((id *)&self->_iAdID, a3);
}

- (NSString)segmentInfo
{
  return self->_segmentInfo;
}

- (void)setSegmentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_segmentInfo, a3);
}

- (BOOL)isFirstPartyIdentifier
{
  return self->_isFirstPartyIdentifier;
}

- (NSString)advertisingIdentifier
{
  return self->_advertisingIdentifier;
}

- (void)setAdvertisingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_advertisingIdentifier, a3);
}

- (double)iTunesRefreshTime
{
  return self->_iTunesRefreshTime;
}

- (double)updateSentTime
{
  return self->_updateSentTime;
}

- (float)timezone
{
  return self->_timezone;
}

- (int)advertisingIdentifierMonthResetCount
{
  return self->_advertisingIdentifierMonthResetCount;
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (void)setOsVersionAndBuild:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionAndBuild, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
  objc_storeStrong((id *)&self->_dPID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentInfo, 0);
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_advertisingIdentifier, 0);
}

@end
