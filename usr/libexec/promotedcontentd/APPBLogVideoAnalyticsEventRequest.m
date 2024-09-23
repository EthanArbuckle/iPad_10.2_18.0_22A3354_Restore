@implementation APPBLogVideoAnalyticsEventRequest

+ (id)options
{
  if (qword_100269760 != -1)
    dispatch_once(&qword_100269760, &stru_100214750);
  return (id)qword_100269758;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (int)videoState
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_videoState;
  else
    return 0;
}

- (void)setVideoState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_videoState = a3;
}

- (void)setHasVideoState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasVideoState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)videoStateAsString:(int)a3
{
  if (a3 >= 0x11)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214770 + a3);
}

- (int)StringAsVideoState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Loaded")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unloaded")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Started")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Completed")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Paused")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Resumed")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Skipped")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Muted")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unmuted")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FullScreen")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExitFullScreen")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Touched")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProgressFirstQuartile")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProgressMidpoint")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProgressThirdQuartile")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VisibilityChanged")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PlaybackFailed")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCurrentPlaybackTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_currentPlaybackTime = a3;
}

- (void)setHasCurrentPlaybackTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrentPlaybackTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTotalDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalDuration = a3;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setVisiblePercentage:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_visiblePercentage = a3;
}

- (void)setHasVisiblePercentage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVisiblePercentage
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEventSequence:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_eventSequence = a3;
}

- (void)setHasEventSequence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEventSequence
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setVolume:(float)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_volume = a3;
}

- (void)setHasVolume:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVolume
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBLogVideoAnalyticsEventRequest;
  v3 = -[APPBLogVideoAnalyticsEventRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogVideoAnalyticsEventRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  APPBLogMetaData *metaData;
  void *v6;
  NSString *bundleID;
  char has;
  uint64_t videoState;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  metaData = self->_metaData;
  if (metaData)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData dictionaryRepresentation](metaData, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("metaData"));

  }
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    videoState = self->_videoState;
    if (videoState >= 0x11)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_videoState));
    else
      v10 = *(&off_100214770 + videoState);
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("videoState"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_currentPlaybackTime));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("currentPlaybackTime"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 8) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_12;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_totalDuration));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("totalDuration"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_21;
  }
LABEL_20:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_visiblePercentage));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("visiblePercentage"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
LABEL_22:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_eventSequence));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("eventSequence"));

    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_16;
  }
LABEL_21:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("timestamp"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_22;
LABEL_15:
  if ((has & 0x40) != 0)
  {
LABEL_16:
    *(float *)&v4 = self->_volume;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("volume"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogVideoAnalyticsEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  NSString *bundleID;
  char has;
  id v8;

  v4 = a3;
  metaData = self->_metaData;
  v8 = v4;
  if (metaData)
  {
    PBDataWriterWriteSubmessage(v4, metaData, 1);
    v4 = v8;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    PBDataWriterWriteStringField(v8, bundleID, 2);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field(v8, self->_videoState, 3);
    v4 = v8;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField(v8, 4, self->_currentPlaybackTime);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField(v8, 5, self->_totalDuration);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField(v8, 6, self->_visiblePercentage);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
LABEL_19:
    PBDataWriterWriteInt32Field(v8, self->_eventSequence, 8);
    v4 = v8;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_18:
  PBDataWriterWriteDoubleField(v8, 7, self->_timestamp);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_19;
LABEL_11:
  if ((has & 0x40) != 0)
  {
LABEL_12:
    PBDataWriterWriteFloatField(v8, 9, self->_volume);
    v4 = v8;
  }
LABEL_13:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_metaData)
  {
    objc_msgSend(v4, "setMetaData:");
    v4 = v6;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v6, "setBundleID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_videoState;
    *((_BYTE *)v4 + 72) |= 0x20u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_currentPlaybackTime;
  *((_BYTE *)v4 + 72) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_totalDuration;
  *((_BYTE *)v4 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_visiblePercentage;
  *((_BYTE *)v4 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
LABEL_19:
    *((_DWORD *)v4 + 12) = self->_eventSequence;
    *((_BYTE *)v4 + 72) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_18:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)v4 + 72) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_19;
LABEL_11:
  if ((has & 0x40) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 17) = LODWORD(self->_volume);
    *((_BYTE *)v4 + 72) |= 0x40u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBLogMetaData copyWithZone:](self->_metaData, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_videoState;
    *((_BYTE *)v5 + 72) |= 0x20u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[1] = *(_QWORD *)&self->_currentPlaybackTime;
  *((_BYTE *)v5 + 72) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5[3] = *(_QWORD *)&self->_totalDuration;
  *((_BYTE *)v5 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5[4] = *(_QWORD *)&self->_visiblePercentage;
  *((_BYTE *)v5 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    *((_DWORD *)v5 + 12) = self->_eventSequence;
    *((_BYTE *)v5 + 72) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v5;
    goto LABEL_8;
  }
LABEL_14:
  v5[2] = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)v5 + 72) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 17) = LODWORD(self->_volume);
    *((_BYTE *)v5 + 72) |= 0x40u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  NSString *bundleID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_40;
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((_QWORD *)v4 + 7))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:"))
      goto LABEL_40;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x20) == 0 || self->_videoState != *((_DWORD *)v4 + 16))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x20) != 0)
  {
LABEL_40:
    v7 = 0;
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_currentPlaybackTime != *((double *)v4 + 1))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_totalDuration != *((double *)v4 + 3))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_visiblePercentage != *((double *)v4 + 4))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x10) == 0 || self->_eventSequence != *((_DWORD *)v4 + 12))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  v7 = (*((_BYTE *)v4 + 72) & 0x40) == 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x40) == 0 || self->_volume != *((float *)v4 + 17))
      goto LABEL_40;
    v7 = 1;
  }
LABEL_41:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  double currentPlaybackTime;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double totalDuration;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double visiblePercentage;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  double timestamp;
  double v23;
  long double v24;
  double v25;
  uint64_t v26;
  float volume;
  float v28;
  float v29;
  float v30;
  unint64_t v31;
  unint64_t v33;

  v33 = -[APPBLogMetaData hash](self->_metaData, "hash");
  v3 = -[NSString hash](self->_bundleID, "hash");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v5 = 2654435761 * self->_videoState;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  currentPlaybackTime = self->_currentPlaybackTime;
  v7 = -currentPlaybackTime;
  if (currentPlaybackTime >= 0.0)
    v7 = self->_currentPlaybackTime;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    totalDuration = self->_totalDuration;
    v13 = -totalDuration;
    if (totalDuration >= 0.0)
      v13 = self->_totalDuration;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 8) != 0)
  {
    visiblePercentage = self->_visiblePercentage;
    v18 = -visiblePercentage;
    if (visiblePercentage >= 0.0)
      v18 = self->_visiblePercentage;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  if ((has & 2) != 0)
  {
    timestamp = self->_timestamp;
    v23 = -timestamp;
    if (timestamp >= 0.0)
      v23 = self->_timestamp;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  if ((has & 0x10) != 0)
  {
    v26 = 2654435761 * self->_eventSequence;
    if ((has & 0x40) != 0)
      goto LABEL_37;
LABEL_42:
    v31 = 0;
    return v3 ^ v33 ^ v5 ^ v10 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31;
  }
  v26 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_42;
LABEL_37:
  volume = self->_volume;
  v28 = -volume;
  if (volume >= 0.0)
    v28 = self->_volume;
  v29 = floorf(v28 + 0.5);
  v30 = (float)(v28 - v29) * 1.8447e19;
  v31 = 2654435761u * (unint64_t)fmodf(v29, 1.8447e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0)
      v31 += (unint64_t)v30;
  }
  else
  {
    v31 -= (unint64_t)fabsf(v30);
  }
  return v3 ^ v33 ^ v5 ^ v10 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  metaData = self->_metaData;
  v6 = *((_QWORD *)v4 + 7);
  v8 = v4;
  if (metaData)
  {
    if (!v6)
      goto LABEL_7;
    -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[APPBLogVideoAnalyticsEventRequest setMetaData:](self, "setMetaData:");
  }
  v4 = v8;
LABEL_7:
  if (*((_QWORD *)v4 + 5))
  {
    -[APPBLogVideoAnalyticsEventRequest setBundleID:](self, "setBundleID:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 0x20) != 0)
  {
    self->_videoState = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 0x20u;
    v7 = *((_BYTE *)v4 + 72);
    if ((v7 & 1) == 0)
    {
LABEL_11:
      if ((v7 & 4) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_currentPlaybackTime = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 4) == 0)
  {
LABEL_12:
    if ((v7 & 8) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  self->_totalDuration = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 8) == 0)
  {
LABEL_13:
    if ((v7 & 2) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  self->_visiblePercentage = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 2) == 0)
  {
LABEL_14:
    if ((v7 & 0x10) == 0)
      goto LABEL_15;
LABEL_23:
    self->_eventSequence = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 72) & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_22:
  self->_timestamp = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 0x10) != 0)
    goto LABEL_23;
LABEL_15:
  if ((v7 & 0x40) != 0)
  {
LABEL_16:
    self->_volume = *((float *)v4 + 17);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_17:

}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (double)currentPlaybackTime
{
  return self->_currentPlaybackTime;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (double)visiblePercentage
{
  return self->_visiblePercentage;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)eventSequence
{
  return self->_eventSequence;
}

- (float)volume
{
  return self->_volume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
