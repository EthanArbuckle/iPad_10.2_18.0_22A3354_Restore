@implementation APPBThirdPartySegmentUpdateRequest

+ (id)options
{
  if (qword_100269950 != -1)
    dispatch_once(&qword_100269950, &stru_1002152E0);
  return (id)qword_100269948;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasAppID
{
  return self->_appID != 0;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (int)runState
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_runState;
  else
    return 0;
}

- (void)setRunState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_runState = a3;
}

- (void)setHasRunState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRunState
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)runStateAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215300 + a3);
}

- (int)StringAsRunState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Simulator")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DevelopmentDevice")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ConsumerDevice")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setResetSegmentMembership:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_resetSegmentMembership = a3;
}

- (void)setHasResetSegmentMembership:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResetSegmentMembership
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearSegmentIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_segmentIdentifiers, "removeAllObjects");
}

- (void)addSegmentIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *segmentIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  segmentIdentifiers = self->_segmentIdentifiers;
  v8 = v4;
  if (!segmentIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_segmentIdentifiers;
    self->_segmentIdentifiers = v6;

    v4 = v8;
    segmentIdentifiers = self->_segmentIdentifiers;
  }
  -[NSMutableArray addObject:](segmentIdentifiers, "addObject:", v4);

}

- (unint64_t)segmentIdentifiersCount
{
  return (unint64_t)-[NSMutableArray count](self->_segmentIdentifiers, "count");
}

- (id)segmentIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_segmentIdentifiers, "objectAtIndex:", a3);
}

+ (Class)segmentIdentifiersType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)setPrivateSegment:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_privateSegment = a3;
}

- (void)setHasPrivateSegment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrivateSegment
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasToroID
{
  return self->_toroID != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBThirdPartySegmentUpdateRequest;
  v3 = -[APPBThirdPartySegmentUpdateRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBThirdPartySegmentUpdateRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *iAdID;
  NSString *appID;
  NSString *appVersion;
  char has;
  uint64_t runState;
  void *v10;
  void *v11;
  NSMutableArray *segmentIdentifiers;
  void *v13;
  NSData *toroID;
  NSData *dPID;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v3, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  appID = self->_appID;
  if (appID)
    objc_msgSend(v4, "setObject:forKey:", appID, CFSTR("appID"));
  appVersion = self->_appVersion;
  if (appVersion)
    objc_msgSend(v4, "setObject:forKey:", appVersion, CFSTR("appVersion"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    runState = self->_runState;
    if (runState >= 3)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_runState));
    else
      v10 = *(&off_100215300 + runState);
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("runState"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_resetSegmentMembership));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("resetSegmentMembership"));

  }
  segmentIdentifiers = self->_segmentIdentifiers;
  if (segmentIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", segmentIdentifiers, CFSTR("segmentIdentifiers"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_privateSegment));
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("privateSegment"));

  }
  toroID = self->_toroID;
  if (toroID)
    objc_msgSend(v4, "setObject:forKey:", toroID, CFSTR("toroID"));
  dPID = self->_dPID;
  if (dPID)
    objc_msgSend(v4, "setObject:forKey:", dPID, CFSTR("DPID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBThirdPartySegmentUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSData *iAdID;
  NSString *appID;
  NSString *appVersion;
  char has;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  NSData *toroID;
  NSData *dPID;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = v4;
  iAdID = self->_iAdID;
  if (iAdID)
    PBDataWriterWriteDataField(v4, iAdID, 1);
  appID = self->_appID;
  if (appID)
    PBDataWriterWriteStringField(v5, appID, 2);
  appVersion = self->_appVersion;
  if (appVersion)
    PBDataWriterWriteStringField(v5, appVersion, 3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_runState, 4);
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteBOOLField(v5, self->_resetSegmentMembership, 5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_segmentIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), 6);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField(v5, self->_privateSegment, 7);
  toroID = self->_toroID;
  if (toroID)
    PBDataWriterWriteDataField(v5, toroID, 8);
  dPID = self->_dPID;
  if (dPID)
    PBDataWriterWriteDataField(v5, dPID, 9);

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BYTE *v11;

  v4 = a3;
  v11 = v4;
  if (self->_iAdID)
  {
    objc_msgSend(v4, "setIAdID:");
    v4 = v11;
  }
  if (self->_appID)
  {
    objc_msgSend(v11, "setAppID:");
    v4 = v11;
  }
  if (self->_appVersion)
  {
    objc_msgSend(v11, "setAppVersion:");
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_runState;
    v4[68] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[65] = self->_resetSegmentMembership;
    v4[68] |= 4u;
  }
  if (-[APPBThirdPartySegmentUpdateRequest segmentIdentifiersCount](self, "segmentIdentifiersCount"))
  {
    objc_msgSend(v11, "clearSegmentIdentifiers");
    v6 = -[APPBThirdPartySegmentUpdateRequest segmentIdentifiersCount](self, "segmentIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[APPBThirdPartySegmentUpdateRequest segmentIdentifiersAtIndex:](self, "segmentIdentifiersAtIndex:", i));
        objc_msgSend(v11, "addSegmentIdentifiers:", v9);

      }
    }
  }
  v10 = v11;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11[64] = self->_privateSegment;
    v11[68] |= 2u;
  }
  if (self->_toroID)
  {
    objc_msgSend(v11, "setToroID:");
    v10 = v11;
  }
  if (self->_dPID)
  {
    objc_msgSend(v11, "setDPID:");
    v10 = v11;
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
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_appID, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_appVersion, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_runState;
    *((_BYTE *)v5 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)v5 + 65) = self->_resetSegmentMembership;
    *((_BYTE *)v5 + 68) |= 4u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = self->_segmentIdentifiers;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v5, "addSegmentIdentifiers:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v5 + 64) = self->_privateSegment;
    *((_BYTE *)v5 + 68) |= 2u;
  }
  v19 = -[NSData copyWithZone:](self->_toroID, "copyWithZone:", a3, (_QWORD)v24);
  v20 = (void *)v5[7];
  v5[7] = v19;

  v21 = -[NSData copyWithZone:](self->_dPID, "copyWithZone:", a3);
  v22 = (void *)v5[3];
  v5[3] = v21;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *iAdID;
  NSString *appID;
  NSString *appVersion;
  char has;
  NSMutableArray *segmentIdentifiers;
  NSData *toroID;
  NSData *dPID;
  unsigned __int8 v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_36;
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:"))
      goto LABEL_36;
  }
  appID = self->_appID;
  if ((unint64_t)appID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](appID, "isEqual:"))
      goto LABEL_36;
  }
  appVersion = self->_appVersion;
  if ((unint64_t)appVersion | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appVersion, "isEqual:"))
      goto LABEL_36;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_runState != *((_DWORD *)v4 + 10))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0)
      goto LABEL_36;
    if (self->_resetSegmentMembership)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_36;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_36;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_36;
  }
  segmentIdentifiers = self->_segmentIdentifiers;
  if ((unint64_t)segmentIdentifiers | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](segmentIdentifiers, "isEqual:"))
      goto LABEL_36;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) != 0)
    {
      if (self->_privateSegment)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_36;
        goto LABEL_32;
      }
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_32;
    }
LABEL_36:
    v12 = 0;
    goto LABEL_37;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
    goto LABEL_36;
LABEL_32:
  toroID = self->_toroID;
  if ((unint64_t)toroID | *((_QWORD *)v4 + 7) && !-[NSData isEqual:](toroID, "isEqual:"))
    goto LABEL_36;
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((_QWORD *)v4 + 3))
    v12 = -[NSData isEqual:](dPID, "isEqual:");
  else
    v12 = 1;
LABEL_37:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  unint64_t v11;

  v3 = (unint64_t)-[NSData hash](self->_iAdID, "hash");
  v4 = -[NSString hash](self->_appID, "hash");
  v5 = -[NSString hash](self->_appVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_runState;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_resetSegmentMembership;
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:
  v8 = (unint64_t)-[NSMutableArray hash](self->_segmentIdentifiers, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_privateSegment;
  else
    v9 = 0;
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v11 = (unint64_t)-[NSData hash](self->_toroID, "hash");
  return v10 ^ v11 ^ (unint64_t)-[NSData hash](self->_dPID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[APPBThirdPartySegmentUpdateRequest setIAdID:](self, "setIAdID:");
  if (*((_QWORD *)v4 + 1))
    -[APPBThirdPartySegmentUpdateRequest setAppID:](self, "setAppID:");
  if (*((_QWORD *)v4 + 2))
    -[APPBThirdPartySegmentUpdateRequest setAppVersion:](self, "setAppVersion:");
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_runState = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 68);
  }
  if ((v5 & 4) != 0)
  {
    self->_resetSegmentMembership = *((_BYTE *)v4 + 65);
    *(_BYTE *)&self->_has |= 4u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[APPBThirdPartySegmentUpdateRequest addSegmentIdentifiers:](self, "addSegmentIdentifiers:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_privateSegment = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 7))
    -[APPBThirdPartySegmentUpdateRequest setToroID:](self, "setToroID:");
  if (*((_QWORD *)v4 + 3))
    -[APPBThirdPartySegmentUpdateRequest setDPID:](self, "setDPID:");

}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
  objc_storeStrong((id *)&self->_iAdID, a3);
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_storeStrong((id *)&self->_appID, a3);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_appVersion, a3);
}

- (BOOL)resetSegmentMembership
{
  return self->_resetSegmentMembership;
}

- (NSMutableArray)segmentIdentifiers
{
  return self->_segmentIdentifiers;
}

- (void)setSegmentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_segmentIdentifiers, a3);
}

- (BOOL)privateSegment
{
  return self->_privateSegment;
}

- (NSData)toroID
{
  return self->_toroID;
}

- (void)setToroID:(id)a3
{
  objc_storeStrong((id *)&self->_toroID, a3);
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
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_segmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

@end
