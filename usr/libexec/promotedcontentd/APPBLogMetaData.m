@implementation APPBLogMetaData

- (BOOL)hasBatchId
{
  return self->_batchId != 0;
}

- (void)setMessageSequence:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_messageSequence = a3;
}

- (void)setHasMessageSequence:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMessageSequence
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasImpressionIdentifierData
{
  return self->_impressionIdentifierData != 0;
}

- (void)setImpressionSequence:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_impressionSequence = a3;
}

- (void)setHasImpressionSequence:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasImpressionSequence
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setOverclickCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_overclickCount = a3;
}

- (void)setHasOverclickCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasOverclickCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)connectionType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_connectionType;
  else
    return 0;
}

- (void)setConnectionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 0xB)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214870 + a3);
}

- (int)StringAsConnectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownConnection")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WiFi")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_2_G")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_2_5G")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_G")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_5G")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_75G")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_H_Plus")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_4G")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_5G")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)adSpace
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_adSpace;
  else
    return 0;
}

- (void)setAdSpace:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_adSpace = a3;
}

- (void)setHasAdSpace:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAdSpace
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)adSpaceAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002148C8 + a3);
}

- (int)StringAsAdSpace:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("StationEntry")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SongSkip")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SongBreak")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FullScreenBanner")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ModalInterstitial")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTiltStationBlob
{
  return self->_tiltStationBlob != 0;
}

- (void)clearTiltTrackBlobs
{
  -[NSMutableArray removeAllObjects](self->_tiltTrackBlobs, "removeAllObjects");
}

- (void)addTiltTrackBlob:(id)a3
{
  id v4;
  NSMutableArray *tiltTrackBlobs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tiltTrackBlobs = self->_tiltTrackBlobs;
  v8 = v4;
  if (!tiltTrackBlobs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tiltTrackBlobs;
    self->_tiltTrackBlobs = v6;

    v4 = v8;
    tiltTrackBlobs = self->_tiltTrackBlobs;
  }
  -[NSMutableArray addObject:](tiltTrackBlobs, "addObject:", v4);

}

- (unint64_t)tiltTrackBlobsCount
{
  return (unint64_t)-[NSMutableArray count](self->_tiltTrackBlobs, "count");
}

- (id)tiltTrackBlobAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_tiltTrackBlobs, "objectAtIndex:", a3);
}

+ (Class)tiltTrackBlobType
{
  return (Class)objc_opt_class(NSData, a2);
}

- (void)setTimeStamp:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timeStamp = a3;
}

- (void)setHasTimeStamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimeStamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTimeSinceAppResume:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_timeSinceAppResume = a3;
}

- (void)setHasTimeSinceAppResume:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTimeSinceAppResume
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (int)impressionSource
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_impressionSource;
  else
    return 0;
}

- (void)setImpressionSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_impressionSource = a3;
}

- (void)setHasImpressionSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasImpressionSource
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)impressionSourceAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002148F0 + a3);
}

- (int)StringAsImpressionSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DefaultImpressionSource")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MiniPlayer")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MiniPlayerLamp")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FullsizePlayer")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HistoryView")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)clickSource
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_clickSource;
  else
    return 0;
}

- (void)setClickSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_clickSource = a3;
}

- (void)setHasClickSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasClickSource
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)clickSourceAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214918 + a3);
}

- (int)StringAsClickSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DefaultClickSource")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LogoImage")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BasicSlate")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AlphaSlate")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSlotIdentifier
{
  return self->_slotIdentifier != 0;
}

- (void)setSlotPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_slotPosition = a3;
}

- (void)setHasSlotPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSlotPosition
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSlotWasVisuallyEngaged:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_slotWasVisuallyEngaged = a3;
}

- (void)setHasSlotWasVisuallyEngaged:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSlotWasVisuallyEngaged
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (BOOL)hasScreenSize
{
  return self->_screenSize != 0;
}

- (void)setScreenScale:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_screenScale = a3;
}

- (void)setHasScreenScale:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasScreenScale
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasClientViewSize
{
  return self->_clientViewSize != 0;
}

- (BOOL)hasSelectedCreativeSize
{
  return self->_selectedCreativeSize != 0;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasAdDataResponseIdentifier
{
  return self->_adDataResponseIdentifier != 0;
}

- (int)buttonState
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_buttonState;
  else
    return 5000;
}

- (void)setButtonState:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_buttonState = a3;
}

- (void)setHasButtonState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasButtonState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)buttonStateAsString:(int)a3
{
  if ((a3 - 5000) >= 8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214938 + a3 - 5000);
}

- (int)StringAsButtonState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Get")) & 1) != 0)
  {
    v4 = 5000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Purchase")) & 1) != 0)
  {
    v4 = 5001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetArcade")) & 1) != 0)
  {
    v4 = 5002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetPreorder")) & 1) != 0)
  {
    v4 = 5003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PurchasePreorder")) & 1) != 0)
  {
    v4 = 5004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Update")) & 1) != 0)
  {
    v4 = 5005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Download")) & 1) != 0)
  {
    v4 = 5006;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Open")))
  {
    v4 = 5007;
  }
  else
  {
    v4 = 5000;
  }

  return v4;
}

- (void)setDuration:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBLogMetaData;
  v3 = -[APPBLogMetaData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *batchId;
  void *v6;
  NSData *impressionIdentifierData;
  __int16 has;
  void *v9;
  void *v10;
  uint64_t connectionType;
  void *v12;
  uint64_t adSpace;
  void *v14;
  NSData *tiltStationBlob;
  NSMutableArray *tiltTrackBlobs;
  __int16 v17;
  void *v18;
  void *v19;
  uint64_t impressionSource;
  void *v21;
  uint64_t clickSource;
  void *v23;
  NSString *slotIdentifier;
  __int16 v25;
  void *v26;
  void *v27;
  NSData *iAdID;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  NSData *dPID;
  APPBAdSize *screenSize;
  void *v33;
  void *v34;
  APPBAdSize *clientViewSize;
  void *v36;
  APPBAdSize *selectedCreativeSize;
  void *v38;
  NSString *actionIdentifier;
  NSString *adDataResponseIdentifier;
  __int16 v41;
  int v42;
  void *v43;
  void *v44;
  id v45;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  batchId = self->_batchId;
  if (batchId)
    objc_msgSend(v3, "setObject:forKey:", batchId, CFSTR("batchId"));
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_messageSequence));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("messageSequence"));

  }
  impressionIdentifierData = self->_impressionIdentifierData;
  if (impressionIdentifierData)
    objc_msgSend(v4, "setObject:forKey:", impressionIdentifierData, CFSTR("impressionIdentifierData"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_impressionSequence));
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("impressionSequence"));

    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_overclickCount));
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("overclickCount"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_22;
    goto LABEL_18;
  }
LABEL_14:
  connectionType = self->_connectionType;
  if (connectionType >= 0xB)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectionType));
  else
    v12 = *(&off_100214870 + connectionType);
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("connectionType"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_18:
    adSpace = self->_adSpace;
    if (adSpace >= 5)
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adSpace));
    else
      v14 = *(&off_1002148C8 + adSpace);
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("adSpace"));

  }
LABEL_22:
  tiltStationBlob = self->_tiltStationBlob;
  if (tiltStationBlob)
    objc_msgSend(v4, "setObject:forKey:", tiltStationBlob, CFSTR("tiltStationBlob"));
  tiltTrackBlobs = self->_tiltTrackBlobs;
  if (tiltTrackBlobs)
    objc_msgSend(v4, "setObject:forKey:", tiltTrackBlobs, CFSTR("tiltTrackBlob"));
  v17 = (__int16)self->_has;
  if ((v17 & 4) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeStamp));
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("timeStamp"));

    v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_28:
      if ((v17 & 0x200) == 0)
        goto LABEL_29;
      goto LABEL_33;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_28;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timeSinceAppResume));
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("timeSinceAppResume"));

  v17 = (__int16)self->_has;
  if ((v17 & 0x200) == 0)
  {
LABEL_29:
    if ((v17 & 0x20) == 0)
      goto LABEL_41;
    goto LABEL_37;
  }
LABEL_33:
  impressionSource = self->_impressionSource;
  if (impressionSource >= 5)
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_impressionSource));
  else
    v21 = *(&off_1002148F0 + impressionSource);
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("impressionSource"));

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_37:
    clickSource = self->_clickSource;
    if (clickSource >= 4)
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_clickSource));
    else
      v23 = *(&off_100214918 + clickSource);
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("clickSource"));

  }
LABEL_41:
  slotIdentifier = self->_slotIdentifier;
  if (slotIdentifier)
    objc_msgSend(v4, "setObject:forKey:", slotIdentifier, CFSTR("slotIdentifier"));
  v25 = (__int16)self->_has;
  if ((v25 & 0x1000) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_slotPosition));
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("slotPosition"));

    v25 = (__int16)self->_has;
  }
  if ((v25 & 0x2000) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_slotWasVisuallyEngaged));
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("slotWasVisuallyEngaged"));

  }
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v4, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
    objc_msgSend(v4, "setObject:forKey:", anonymousDemandiAdID, CFSTR("anonymousDemandiAdID"));
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
    objc_msgSend(v4, "setObject:forKey:", contentiAdID, CFSTR("contentiAdID"));
  dPID = self->_dPID;
  if (dPID)
    objc_msgSend(v4, "setObject:forKey:", dPID, CFSTR("DPID"));
  screenSize = self->_screenSize;
  if (screenSize)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdSize dictionaryRepresentation](screenSize, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("screenSize"));

  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_screenScale));
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("screenScale"));

  }
  clientViewSize = self->_clientViewSize;
  if (clientViewSize)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdSize dictionaryRepresentation](clientViewSize, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("clientViewSize"));

  }
  selectedCreativeSize = self->_selectedCreativeSize;
  if (selectedCreativeSize)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdSize dictionaryRepresentation](selectedCreativeSize, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("selectedCreativeSize"));

  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if (adDataResponseIdentifier)
    objc_msgSend(v4, "setObject:forKey:", adDataResponseIdentifier, CFSTR("adDataResponseIdentifier"));
  v41 = (__int16)self->_has;
  if ((v41 & 0x10) != 0)
  {
    v42 = self->_buttonState - 5000;
    if (v42 >= 8)
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_buttonState));
    else
      v43 = *(&off_100214938 + v42);
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("buttonState"));

    v41 = (__int16)self->_has;
  }
  if ((v41 & 0x80) != 0)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_duration));
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("duration"));

  }
  v45 = v4;

  return v45;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogMetaDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *batchId;
  NSData *impressionIdentifierData;
  __int16 has;
  NSData *tiltStationBlob;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int16 v15;
  NSString *slotIdentifier;
  __int16 v17;
  NSData *iAdID;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  NSData *dPID;
  APPBAdSize *screenSize;
  APPBAdSize *clientViewSize;
  APPBAdSize *selectedCreativeSize;
  NSString *actionIdentifier;
  NSString *adDataResponseIdentifier;
  __int16 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  v5 = v4;
  batchId = self->_batchId;
  if (batchId)
    PBDataWriterWriteStringField(v4, batchId, 1);
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteInt32Field(v5, self->_messageSequence, 2);
  impressionIdentifierData = self->_impressionIdentifierData;
  if (impressionIdentifierData)
    PBDataWriterWriteDataField(v5, impressionIdentifierData, 3);
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_impressionSequence, 4);
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_59;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field(v5, self->_overclickCount, 5);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_59:
  PBDataWriterWriteInt32Field(v5, self->_connectionType, 8);
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field(v5, self->_adSpace, 9);
LABEL_12:
  tiltStationBlob = self->_tiltStationBlob;
  if (tiltStationBlob)
    PBDataWriterWriteDataField(v5, tiltStationBlob, 10);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = self->_tiltTrackBlobs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteDataField(v5, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), 11);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  v15 = (__int16)self->_has;
  if ((v15 & 4) != 0)
  {
    PBDataWriterWriteDoubleField(v5, 13, self->_timeStamp);
    v15 = (__int16)self->_has;
    if ((v15 & 2) == 0)
    {
LABEL_23:
      if ((v15 & 0x200) == 0)
        goto LABEL_24;
      goto LABEL_63;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteDoubleField(v5, 14, self->_timeSinceAppResume);
  v15 = (__int16)self->_has;
  if ((v15 & 0x200) == 0)
  {
LABEL_24:
    if ((v15 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_63:
  PBDataWriterWriteInt32Field(v5, self->_impressionSource, 15);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_25:
    PBDataWriterWriteInt32Field(v5, self->_clickSource, 16);
LABEL_26:
  slotIdentifier = self->_slotIdentifier;
  if (slotIdentifier)
    PBDataWriterWriteStringField(v5, slotIdentifier, 17);
  v17 = (__int16)self->_has;
  if ((v17 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_slotPosition, 18);
    v17 = (__int16)self->_has;
  }
  if ((v17 & 0x2000) != 0)
    PBDataWriterWriteBOOLField(v5, self->_slotWasVisuallyEngaged, 19);
  iAdID = self->_iAdID;
  if (iAdID)
    PBDataWriterWriteDataField(v5, iAdID, 20);
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
    PBDataWriterWriteDataField(v5, anonymousDemandiAdID, 21);
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
    PBDataWriterWriteDataField(v5, contentiAdID, 22);
  dPID = self->_dPID;
  if (dPID)
    PBDataWriterWriteDataField(v5, dPID, 23);
  screenSize = self->_screenSize;
  if (screenSize)
    PBDataWriterWriteSubmessage(v5, screenSize, 100);
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField(v5, 101, self->_screenScale);
  clientViewSize = self->_clientViewSize;
  if (clientViewSize)
    PBDataWriterWriteSubmessage(v5, clientViewSize, 102);
  selectedCreativeSize = self->_selectedCreativeSize;
  if (selectedCreativeSize)
    PBDataWriterWriteSubmessage(v5, selectedCreativeSize, 103);
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    PBDataWriterWriteStringField(v5, actionIdentifier, 104);
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if (adDataResponseIdentifier)
    PBDataWriterWriteStringField(v5, adDataResponseIdentifier, 105);
  v27 = (__int16)self->_has;
  if ((v27 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_buttonState, 106);
    v27 = (__int16)self->_has;
  }
  if ((v27 & 0x80) != 0)
    PBDataWriterWriteInt32Field(v5, self->_duration, 107);

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  __int16 v10;
  _DWORD *v11;
  __int16 v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (self->_batchId)
  {
    objc_msgSend(v4, "setBatchId:");
    v4 = v14;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v4 + 36) = self->_messageSequence;
    *((_WORD *)v4 + 102) |= 0x400u;
  }
  if (self->_impressionIdentifierData)
  {
    objc_msgSend(v14, "setImpressionIdentifierData:");
    v4 = v14;
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v4 + 34) = self->_impressionSequence;
    *((_WORD *)v4 + 102) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 37) = self->_overclickCount;
  *((_WORD *)v4 + 102) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_56:
  *((_DWORD *)v4 + 22) = self->_connectionType;
  *((_WORD *)v4 + 102) |= 0x40u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 12) = self->_adSpace;
    *((_WORD *)v4 + 102) |= 8u;
  }
LABEL_12:
  if (self->_tiltStationBlob)
    objc_msgSend(v14, "setTiltStationBlob:");
  if (-[APPBLogMetaData tiltTrackBlobsCount](self, "tiltTrackBlobsCount"))
  {
    objc_msgSend(v14, "clearTiltTrackBlobs");
    v6 = -[APPBLogMetaData tiltTrackBlobsCount](self, "tiltTrackBlobsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData tiltTrackBlobAtIndex:](self, "tiltTrackBlobAtIndex:", i));
        objc_msgSend(v14, "addTiltTrackBlob:", v9);

      }
    }
  }
  v10 = (__int16)self->_has;
  v11 = v14;
  if ((v10 & 4) != 0)
  {
    *((_QWORD *)v14 + 3) = *(_QWORD *)&self->_timeStamp;
    *((_WORD *)v14 + 102) |= 4u;
    v10 = (__int16)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_20:
      if ((v10 & 0x200) == 0)
        goto LABEL_21;
      goto LABEL_60;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_20;
  }
  *((_QWORD *)v14 + 2) = *(_QWORD *)&self->_timeSinceAppResume;
  *((_WORD *)v14 + 102) |= 2u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_21:
    if ((v10 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_60:
  *((_DWORD *)v14 + 35) = self->_impressionSource;
  *((_WORD *)v14 + 102) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_22:
    *((_DWORD *)v14 + 19) = self->_clickSource;
    *((_WORD *)v14 + 102) |= 0x20u;
  }
LABEL_23:
  if (self->_slotIdentifier)
  {
    objc_msgSend(v14, "setSlotIdentifier:");
    v11 = v14;
  }
  v12 = (__int16)self->_has;
  if ((v12 & 0x1000) != 0)
  {
    v11[44] = self->_slotPosition;
    *((_WORD *)v11 + 102) |= 0x1000u;
    v12 = (__int16)self->_has;
  }
  if ((v12 & 0x2000) != 0)
  {
    *((_BYTE *)v11 + 200) = self->_slotWasVisuallyEngaged;
    *((_WORD *)v11 + 102) |= 0x2000u;
  }
  if (self->_iAdID)
  {
    objc_msgSend(v14, "setIAdID:");
    v11 = v14;
  }
  if (self->_anonymousDemandiAdID)
  {
    objc_msgSend(v14, "setAnonymousDemandiAdID:");
    v11 = v14;
  }
  if (self->_contentiAdID)
  {
    objc_msgSend(v14, "setContentiAdID:");
    v11 = v14;
  }
  if (self->_dPID)
  {
    objc_msgSend(v14, "setDPID:");
    v11 = v14;
  }
  if (self->_screenSize)
  {
    objc_msgSend(v14, "setScreenSize:");
    v11 = v14;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v11 + 1) = *(_QWORD *)&self->_screenScale;
    *((_WORD *)v11 + 102) |= 1u;
  }
  if (self->_clientViewSize)
  {
    objc_msgSend(v14, "setClientViewSize:");
    v11 = v14;
  }
  if (self->_selectedCreativeSize)
  {
    objc_msgSend(v14, "setSelectedCreativeSize:");
    v11 = v14;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v14, "setActionIdentifier:");
    v11 = v14;
  }
  if (self->_adDataResponseIdentifier)
  {
    objc_msgSend(v14, "setAdDataResponseIdentifier:");
    v11 = v14;
  }
  v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    v11[18] = self->_buttonState;
    *((_WORD *)v11 + 102) |= 0x10u;
    v13 = (__int16)self->_has;
  }
  if ((v13 & 0x80) != 0)
  {
    v11[28] = self->_duration;
    *((_WORD *)v11 + 102) |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  __int16 has;
  id v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  id v18;
  __int16 v19;
  id v20;
  void *v21;
  __int16 v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  __int16 v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_batchId, "copyWithZone:", a3);
  v7 = (void *)v5[8];
  v5[8] = v6;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v5 + 36) = self->_messageSequence;
    *((_WORD *)v5 + 102) |= 0x400u;
  }
  v8 = -[NSData copyWithZone:](self->_impressionIdentifierData, "copyWithZone:", a3);
  v9 = (void *)v5[16];
  v5[16] = v8;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v5 + 34) = self->_impressionSequence;
    *((_WORD *)v5 + 102) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 37) = self->_overclickCount;
  *((_WORD *)v5 + 102) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_33:
  *((_DWORD *)v5 + 22) = self->_connectionType;
  *((_WORD *)v5 + 102) |= 0x40u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 12) = self->_adSpace;
    *((_WORD *)v5 + 102) |= 8u;
  }
LABEL_8:
  v11 = -[NSData copyWithZone:](self->_tiltStationBlob, "copyWithZone:", a3);
  v12 = (void *)v5[23];
  v5[23] = v11;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = self->_tiltTrackBlobs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v43);
        objc_msgSend(v5, "addTiltTrackBlob:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v15);
  }

  v19 = (__int16)self->_has;
  if ((v19 & 4) != 0)
  {
    v5[3] = *(_QWORD *)&self->_timeStamp;
    *((_WORD *)v5 + 102) |= 4u;
    v19 = (__int16)self->_has;
    if ((v19 & 2) == 0)
    {
LABEL_17:
      if ((v19 & 0x200) == 0)
        goto LABEL_18;
      goto LABEL_37;
    }
  }
  else if ((v19 & 2) == 0)
  {
    goto LABEL_17;
  }
  v5[2] = *(_QWORD *)&self->_timeSinceAppResume;
  *((_WORD *)v5 + 102) |= 2u;
  v19 = (__int16)self->_has;
  if ((v19 & 0x200) == 0)
  {
LABEL_18:
    if ((v19 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_37:
  *((_DWORD *)v5 + 35) = self->_impressionSource;
  *((_WORD *)v5 + 102) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_19:
    *((_DWORD *)v5 + 19) = self->_clickSource;
    *((_WORD *)v5 + 102) |= 0x20u;
  }
LABEL_20:
  v20 = -[NSString copyWithZone:](self->_slotIdentifier, "copyWithZone:", a3, (_QWORD)v43);
  v21 = (void *)v5[21];
  v5[21] = v20;

  v22 = (__int16)self->_has;
  if ((v22 & 0x1000) != 0)
  {
    *((_DWORD *)v5 + 44) = self->_slotPosition;
    *((_WORD *)v5 + 102) |= 0x1000u;
    v22 = (__int16)self->_has;
  }
  if ((v22 & 0x2000) != 0)
  {
    *((_BYTE *)v5 + 200) = self->_slotWasVisuallyEngaged;
    *((_WORD *)v5 + 102) |= 0x2000u;
  }
  v23 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3);
  v24 = (void *)v5[15];
  v5[15] = v23;

  v25 = -[NSData copyWithZone:](self->_anonymousDemandiAdID, "copyWithZone:", a3);
  v26 = (void *)v5[7];
  v5[7] = v25;

  v27 = -[NSData copyWithZone:](self->_contentiAdID, "copyWithZone:", a3);
  v28 = (void *)v5[12];
  v5[12] = v27;

  v29 = -[NSData copyWithZone:](self->_dPID, "copyWithZone:", a3);
  v30 = (void *)v5[13];
  v5[13] = v29;

  v31 = -[APPBAdSize copyWithZone:](self->_screenSize, "copyWithZone:", a3);
  v32 = (void *)v5[19];
  v5[19] = v31;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_screenScale;
    *((_WORD *)v5 + 102) |= 1u;
  }
  v33 = -[APPBAdSize copyWithZone:](self->_clientViewSize, "copyWithZone:", a3);
  v34 = (void *)v5[10];
  v5[10] = v33;

  v35 = -[APPBAdSize copyWithZone:](self->_selectedCreativeSize, "copyWithZone:", a3);
  v36 = (void *)v5[20];
  v5[20] = v35;

  v37 = -[NSString copyWithZone:](self->_actionIdentifier, "copyWithZone:", a3);
  v38 = (void *)v5[4];
  v5[4] = v37;

  v39 = -[NSString copyWithZone:](self->_adDataResponseIdentifier, "copyWithZone:", a3);
  v40 = (void *)v5[5];
  v5[5] = v39;

  v41 = (__int16)self->_has;
  if ((v41 & 0x10) != 0)
  {
    *((_DWORD *)v5 + 18) = self->_buttonState;
    *((_WORD *)v5 + 102) |= 0x10u;
    v41 = (__int16)self->_has;
  }
  if ((v41 & 0x80) != 0)
  {
    *((_DWORD *)v5 + 28) = self->_duration;
    *((_WORD *)v5 + 102) |= 0x80u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *batchId;
  __int16 has;
  NSData *impressionIdentifierData;
  __int16 v8;
  NSData *tiltStationBlob;
  NSMutableArray *tiltTrackBlobs;
  __int16 v11;
  __int16 v12;
  NSString *slotIdentifier;
  NSData *iAdID;
  NSData *anonymousDemandiAdID;
  NSData *contentiAdID;
  NSData *dPID;
  APPBAdSize *screenSize;
  __int16 v19;
  APPBAdSize *clientViewSize;
  APPBAdSize *selectedCreativeSize;
  NSString *actionIdentifier;
  NSString *adDataResponseIdentifier;
  __int16 v24;
  __int16 v25;
  BOOL v26;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_105;
  batchId = self->_batchId;
  if ((unint64_t)batchId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](batchId, "isEqual:"))
      goto LABEL_105;
  }
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x400) == 0 || self->_messageSequence != *((_DWORD *)v4 + 36))
      goto LABEL_105;
  }
  else if ((*((_WORD *)v4 + 102) & 0x400) != 0)
  {
    goto LABEL_105;
  }
  impressionIdentifierData = self->_impressionIdentifierData;
  if ((unint64_t)impressionIdentifierData | *((_QWORD *)v4 + 16))
  {
    if (!-[NSData isEqual:](impressionIdentifierData, "isEqual:"))
      goto LABEL_105;
    has = (__int16)self->_has;
  }
  v8 = *((_WORD *)v4 + 102);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x100) == 0 || self->_impressionSequence != *((_DWORD *)v4 + 34))
      goto LABEL_105;
  }
  else if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x800) == 0 || self->_overclickCount != *((_DWORD *)v4 + 37))
      goto LABEL_105;
  }
  else if ((*((_WORD *)v4 + 102) & 0x800) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_connectionType != *((_DWORD *)v4 + 22))
      goto LABEL_105;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_adSpace != *((_DWORD *)v4 + 12))
      goto LABEL_105;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_105;
  }
  tiltStationBlob = self->_tiltStationBlob;
  if ((unint64_t)tiltStationBlob | *((_QWORD *)v4 + 23)
    && !-[NSData isEqual:](tiltStationBlob, "isEqual:"))
  {
    goto LABEL_105;
  }
  tiltTrackBlobs = self->_tiltTrackBlobs;
  if ((unint64_t)tiltTrackBlobs | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](tiltTrackBlobs, "isEqual:"))
      goto LABEL_105;
  }
  v11 = (__int16)self->_has;
  v12 = *((_WORD *)v4 + 102);
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_timeStamp != *((double *)v4 + 3))
      goto LABEL_105;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_105;
  }
  if ((v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_timeSinceAppResume != *((double *)v4 + 2))
      goto LABEL_105;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_105;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) == 0 || self->_impressionSource != *((_DWORD *)v4 + 35))
      goto LABEL_105;
  }
  else if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    goto LABEL_105;
  }
  if ((v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_clickSource != *((_DWORD *)v4 + 19))
      goto LABEL_105;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_105;
  }
  slotIdentifier = self->_slotIdentifier;
  if ((unint64_t)slotIdentifier | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](slotIdentifier, "isEqual:"))
      goto LABEL_105;
    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x1000) == 0 || self->_slotPosition != *((_DWORD *)v4 + 44))
      goto LABEL_105;
  }
  else if ((*((_WORD *)v4 + 102) & 0x1000) != 0)
  {
    goto LABEL_105;
  }
  if ((v11 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x2000) != 0)
    {
      if (self->_slotWasVisuallyEngaged)
      {
        if (!*((_BYTE *)v4 + 200))
          goto LABEL_105;
        goto LABEL_72;
      }
      if (!*((_BYTE *)v4 + 200))
        goto LABEL_72;
    }
LABEL_105:
    v26 = 0;
    goto LABEL_106;
  }
  if ((*((_WORD *)v4 + 102) & 0x2000) != 0)
    goto LABEL_105;
LABEL_72:
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((_QWORD *)v4 + 15) && !-[NSData isEqual:](iAdID, "isEqual:"))
    goto LABEL_105;
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:"))
      goto LABEL_105;
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:"))
      goto LABEL_105;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:"))
      goto LABEL_105;
  }
  screenSize = self->_screenSize;
  if ((unint64_t)screenSize | *((_QWORD *)v4 + 19))
  {
    if (!-[APPBAdSize isEqual:](screenSize, "isEqual:"))
      goto LABEL_105;
  }
  v19 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v19 & 1) == 0 || self->_screenScale != *((double *)v4 + 1))
      goto LABEL_105;
  }
  else if ((v19 & 1) != 0)
  {
    goto LABEL_105;
  }
  clientViewSize = self->_clientViewSize;
  if ((unint64_t)clientViewSize | *((_QWORD *)v4 + 10) && !-[APPBAdSize isEqual:](clientViewSize, "isEqual:"))
    goto LABEL_105;
  selectedCreativeSize = self->_selectedCreativeSize;
  if ((unint64_t)selectedCreativeSize | *((_QWORD *)v4 + 20))
  {
    if (!-[APPBAdSize isEqual:](selectedCreativeSize, "isEqual:"))
      goto LABEL_105;
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](actionIdentifier, "isEqual:"))
      goto LABEL_105;
  }
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if ((unint64_t)adDataResponseIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](adDataResponseIdentifier, "isEqual:"))
      goto LABEL_105;
  }
  v24 = (__int16)self->_has;
  v25 = *((_WORD *)v4 + 102);
  if ((v24 & 0x10) != 0)
  {
    if ((v25 & 0x10) == 0 || self->_buttonState != *((_DWORD *)v4 + 18))
      goto LABEL_105;
  }
  else if ((v25 & 0x10) != 0)
  {
    goto LABEL_105;
  }
  if ((v24 & 0x80) != 0)
  {
    if ((v25 & 0x80) == 0 || self->_duration != *((_DWORD *)v4 + 28))
      goto LABEL_105;
    v26 = 1;
  }
  else
  {
    v26 = (v25 & 0x80) == 0;
  }
LABEL_106:

  return v26;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  unint64_t v5;
  double timeStamp;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double timeSinceAppResume;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  double screenScale;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSUInteger v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  NSUInteger v47;

  v47 = -[NSString hash](self->_batchId, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v46 = 2654435761 * self->_messageSequence;
  else
    v46 = 0;
  v45 = (unint64_t)-[NSData hash](self->_impressionIdentifierData, "hash");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v44 = 2654435761 * self->_impressionSequence;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_6:
      v43 = 2654435761 * self->_overclickCount;
      if ((has & 0x40) != 0)
        goto LABEL_7;
LABEL_11:
      v42 = 0;
      if ((has & 8) != 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else
  {
    v44 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_6;
  }
  v43 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_11;
LABEL_7:
  v42 = 2654435761 * self->_connectionType;
  if ((has & 8) != 0)
  {
LABEL_8:
    v41 = 2654435761 * self->_adSpace;
    goto LABEL_13;
  }
LABEL_12:
  v41 = 0;
LABEL_13:
  v40 = (unint64_t)-[NSData hash](self->_tiltStationBlob, "hash");
  v39 = (unint64_t)-[NSMutableArray hash](self->_tiltTrackBlobs, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 4) != 0)
  {
    timeStamp = self->_timeStamp;
    v7 = -timeStamp;
    if (timeStamp >= 0.0)
      v7 = self->_timeStamp;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((v4 & 2) != 0)
  {
    timeSinceAppResume = self->_timeSinceAppResume;
    v12 = -timeSinceAppResume;
    if (timeSinceAppResume >= 0.0)
      v12 = self->_timeSinceAppResume;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((v4 & 0x200) != 0)
    v37 = 2654435761 * self->_impressionSource;
  else
    v37 = 0;
  v38 = v10;
  if ((v4 & 0x20) != 0)
    v36 = 2654435761 * self->_clickSource;
  else
    v36 = 0;
  v35 = -[NSString hash](self->_slotIdentifier, "hash");
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    v34 = 2654435761 * self->_slotPosition;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_37;
  }
  else
  {
    v34 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_37:
      v33 = 2654435761 * self->_slotWasVisuallyEngaged;
      goto LABEL_40;
    }
  }
  v33 = 0;
LABEL_40:
  v32 = (unint64_t)-[NSData hash](self->_iAdID, "hash");
  v31 = (unint64_t)-[NSData hash](self->_anonymousDemandiAdID, "hash");
  v30 = (unint64_t)-[NSData hash](self->_contentiAdID, "hash");
  v15 = (unint64_t)-[NSData hash](self->_dPID, "hash");
  v16 = -[APPBAdSize hash](self->_screenSize, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    screenScale = self->_screenScale;
    v19 = -screenScale;
    if (screenScale >= 0.0)
      v19 = self->_screenScale;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  v22 = -[APPBAdSize hash](self->_clientViewSize, "hash");
  v23 = -[APPBAdSize hash](self->_selectedCreativeSize, "hash");
  v24 = -[NSString hash](self->_actionIdentifier, "hash");
  v25 = -[NSString hash](self->_adDataResponseIdentifier, "hash");
  v26 = (__int16)self->_has;
  if ((v26 & 0x10) != 0)
  {
    v27 = 2654435761 * self->_buttonState;
    if ((v26 & 0x80) != 0)
      goto LABEL_50;
LABEL_52:
    v28 = 0;
    return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v5 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v15 ^ v16 ^ v17 ^ v22 ^ v23 ^ v24 ^ v25 ^ v27 ^ v28;
  }
  v27 = 0;
  if ((v26 & 0x80) == 0)
    goto LABEL_52;
LABEL_50:
  v28 = 2654435761 * self->_duration;
  return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v5 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v15 ^ v16 ^ v17 ^ v22 ^ v23 ^ v24 ^ v25 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int16 v11;
  __int16 v12;
  APPBAdSize *screenSize;
  uint64_t v14;
  APPBAdSize *clientViewSize;
  uint64_t v16;
  APPBAdSize *selectedCreativeSize;
  uint64_t v18;
  __int16 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[APPBLogMetaData setBatchId:](self, "setBatchId:");
  if ((*((_WORD *)v4 + 102) & 0x400) != 0)
  {
    self->_messageSequence = *((_DWORD *)v4 + 36);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)v4 + 16))
    -[APPBLogMetaData setImpressionIdentifierData:](self, "setImpressionIdentifierData:");
  v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x100) != 0)
  {
    self->_impressionSequence = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)v4 + 102);
    if ((v5 & 0x800) == 0)
    {
LABEL_9:
      if ((v5 & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_45;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x800) == 0)
  {
    goto LABEL_9;
  }
  self->_overclickCount = *((_DWORD *)v4 + 37);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_45:
  self->_connectionType = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 102) & 8) != 0)
  {
LABEL_11:
    self->_adSpace = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 23))
    -[APPBLogMetaData setTiltStationBlob:](self, "setTiltStationBlob:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *((id *)v4 + 24);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[APPBLogMetaData addTiltTrackBlob:](self, "addTiltTrackBlob:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), (_QWORD)v20);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v11 = *((_WORD *)v4 + 102);
  if ((v11 & 4) != 0)
  {
    self->_timeStamp = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
    v11 = *((_WORD *)v4 + 102);
    if ((v11 & 2) == 0)
    {
LABEL_23:
      if ((v11 & 0x200) == 0)
        goto LABEL_24;
      goto LABEL_49;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_23;
  }
  self->_timeSinceAppResume = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v11 = *((_WORD *)v4 + 102);
  if ((v11 & 0x200) == 0)
  {
LABEL_24:
    if ((v11 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_49:
  self->_impressionSource = *((_DWORD *)v4 + 35);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 102) & 0x20) != 0)
  {
LABEL_25:
    self->_clickSource = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_26:
  if (*((_QWORD *)v4 + 21))
    -[APPBLogMetaData setSlotIdentifier:](self, "setSlotIdentifier:");
  v12 = *((_WORD *)v4 + 102);
  if ((v12 & 0x1000) != 0)
  {
    self->_slotPosition = *((_DWORD *)v4 + 44);
    *(_WORD *)&self->_has |= 0x1000u;
    v12 = *((_WORD *)v4 + 102);
  }
  if ((v12 & 0x2000) != 0)
  {
    self->_slotWasVisuallyEngaged = *((_BYTE *)v4 + 200);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v4 + 15))
    -[APPBLogMetaData setIAdID:](self, "setIAdID:");
  if (*((_QWORD *)v4 + 7))
    -[APPBLogMetaData setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
  if (*((_QWORD *)v4 + 12))
    -[APPBLogMetaData setContentiAdID:](self, "setContentiAdID:");
  if (*((_QWORD *)v4 + 13))
    -[APPBLogMetaData setDPID:](self, "setDPID:");
  screenSize = self->_screenSize;
  v14 = *((_QWORD *)v4 + 19);
  if (screenSize)
  {
    if (v14)
      -[APPBAdSize mergeFrom:](screenSize, "mergeFrom:");
  }
  else if (v14)
  {
    -[APPBLogMetaData setScreenSize:](self, "setScreenSize:");
  }
  if ((*((_WORD *)v4 + 102) & 1) != 0)
  {
    self->_screenScale = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  clientViewSize = self->_clientViewSize;
  v16 = *((_QWORD *)v4 + 10);
  if (clientViewSize)
  {
    if (v16)
      -[APPBAdSize mergeFrom:](clientViewSize, "mergeFrom:");
  }
  else if (v16)
  {
    -[APPBLogMetaData setClientViewSize:](self, "setClientViewSize:");
  }
  selectedCreativeSize = self->_selectedCreativeSize;
  v18 = *((_QWORD *)v4 + 20);
  if (selectedCreativeSize)
  {
    if (v18)
      -[APPBAdSize mergeFrom:](selectedCreativeSize, "mergeFrom:");
  }
  else if (v18)
  {
    -[APPBLogMetaData setSelectedCreativeSize:](self, "setSelectedCreativeSize:");
  }
  if (*((_QWORD *)v4 + 4))
    -[APPBLogMetaData setActionIdentifier:](self, "setActionIdentifier:");
  if (*((_QWORD *)v4 + 5))
    -[APPBLogMetaData setAdDataResponseIdentifier:](self, "setAdDataResponseIdentifier:");
  v19 = *((_WORD *)v4 + 102);
  if ((v19 & 0x10) != 0)
  {
    self->_buttonState = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x10u;
    v19 = *((_WORD *)v4 + 102);
  }
  if ((v19 & 0x80) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x80u;
  }

}

- (NSString)batchId
{
  return self->_batchId;
}

- (void)setBatchId:(id)a3
{
  objc_storeStrong((id *)&self->_batchId, a3);
}

- (int)messageSequence
{
  return self->_messageSequence;
}

- (NSData)impressionIdentifierData
{
  return self->_impressionIdentifierData;
}

- (void)setImpressionIdentifierData:(id)a3
{
  objc_storeStrong((id *)&self->_impressionIdentifierData, a3);
}

- (int)impressionSequence
{
  return self->_impressionSequence;
}

- (int)overclickCount
{
  return self->_overclickCount;
}

- (NSData)tiltStationBlob
{
  return self->_tiltStationBlob;
}

- (void)setTiltStationBlob:(id)a3
{
  objc_storeStrong((id *)&self->_tiltStationBlob, a3);
}

- (NSMutableArray)tiltTrackBlobs
{
  return self->_tiltTrackBlobs;
}

- (void)setTiltTrackBlobs:(id)a3
{
  objc_storeStrong((id *)&self->_tiltTrackBlobs, a3);
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (double)timeSinceAppResume
{
  return self->_timeSinceAppResume;
}

- (NSString)slotIdentifier
{
  return self->_slotIdentifier;
}

- (void)setSlotIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_slotIdentifier, a3);
}

- (int)slotPosition
{
  return self->_slotPosition;
}

- (BOOL)slotWasVisuallyEngaged
{
  return self->_slotWasVisuallyEngaged;
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
  objc_storeStrong((id *)&self->_iAdID, a3);
}

- (NSData)anonymousDemandiAdID
{
  return self->_anonymousDemandiAdID;
}

- (void)setAnonymousDemandiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, a3);
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_contentiAdID, a3);
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
  objc_storeStrong((id *)&self->_dPID, a3);
}

- (APPBAdSize)screenSize
{
  return self->_screenSize;
}

- (void)setScreenSize:(id)a3
{
  objc_storeStrong((id *)&self->_screenSize, a3);
}

- (double)screenScale
{
  return self->_screenScale;
}

- (APPBAdSize)clientViewSize
{
  return self->_clientViewSize;
}

- (void)setClientViewSize:(id)a3
{
  objc_storeStrong((id *)&self->_clientViewSize, a3);
}

- (APPBAdSize)selectedCreativeSize
{
  return self->_selectedCreativeSize;
}

- (void)setSelectedCreativeSize:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCreativeSize, a3);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
}

- (NSString)adDataResponseIdentifier
{
  return self->_adDataResponseIdentifier;
}

- (void)setAdDataResponseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_adDataResponseIdentifier, a3);
}

- (int)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiltTrackBlobs, 0);
  objc_storeStrong((id *)&self->_tiltStationBlob, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedCreativeSize, 0);
  objc_storeStrong((id *)&self->_screenSize, 0);
  objc_storeStrong((id *)&self->_impressionIdentifierData, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
  objc_storeStrong((id *)&self->_clientViewSize, 0);
  objc_storeStrong((id *)&self->_batchId, 0);
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);
  objc_storeStrong((id *)&self->_adDataResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
