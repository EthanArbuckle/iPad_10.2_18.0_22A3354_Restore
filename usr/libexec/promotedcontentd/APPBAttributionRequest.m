@implementation APPBAttributionRequest

+ (id)options
{
  if (qword_100269770 != -1)
    dispatch_once(&qword_100269770, &stru_100214820);
  return (id)qword_100269768;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasTiltID
{
  return self->_tiltID != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setPurchaseTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_purchaseTimestamp = a3;
}

- (void)setHasPurchaseTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPurchaseTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIAdConversionTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_iAdConversionTimestamp = a3;
}

- (void)setHasIAdConversionTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIAdConversionTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIAdImpressionTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_iAdImpressionTimestamp = a3;
}

- (void)setHasIAdImpressionTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIAdImpressionTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAttributedByiTunes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_attributedByiTunes = a3;
}

- (void)setHasAttributedByiTunes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasAttributedByiTunes
{
  return *(_BYTE *)&self->_has >> 7;
}

- (int)runState
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_runState;
  else
    return 0;
}

- (void)setRunState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_runState = a3;
}

- (void)setHasRunState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRunState
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)runStateAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214840 + a3);
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

- (BOOL)hasToroID
{
  return self->_toroID != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (void)setSearchAdClickTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_searchAdClickTimestamp = a3;
}

- (void)setHasSearchAdClickTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSearchAdClickTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasAdMetadata
{
  return self->_adMetadata != 0;
}

- (void)setDownloadClickTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_downloadClickTimestamp = a3;
}

- (void)setHasDownloadClickTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDownloadClickTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)downloadType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_downloadType;
  else
    return 0;
}

- (void)setDownloadType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_downloadType = a3;
}

- (void)setHasDownloadType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDownloadType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)downloadTypeAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214858 + a3);
}

- (int)StringAsDownloadType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AttributionNoDownload")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AttributionDownload")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AttributionRedownload")))
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
  v8.super_class = (Class)APPBAttributionRequest;
  v3 = -[APPBAttributionRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAttributionRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *iAdID;
  NSData *tiltID;
  NSData *anonymousDemandiAdID;
  NSString *bundleID;
  char has;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t runState;
  void *v15;
  NSData *toroID;
  NSData *dPID;
  void *v18;
  NSString *adMetadata;
  char v20;
  void *v21;
  uint64_t downloadType;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v3, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  tiltID = self->_tiltID;
  if (tiltID)
    objc_msgSend(v4, "setObject:forKey:", tiltID, CFSTR("tiltID"));
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
    objc_msgSend(v4, "setObject:forKey:", anonymousDemandiAdID, CFSTR("anonymousDemandiAdID"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v4, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_purchaseTimestamp));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("purchaseTimestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_iAdConversionTimestamp));
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("iAdConversionTimestamp"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_18;
  }
LABEL_17:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_iAdImpressionTimestamp));
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("iAdImpressionTimestamp"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_19;
  }
LABEL_18:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_attributedByiTunes));
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("attributedByiTunes"));

  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_23;
LABEL_19:
  runState = self->_runState;
  if (runState >= 3)
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_runState));
  else
    v15 = *(&off_100214840 + runState);
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("runState"));

LABEL_23:
  toroID = self->_toroID;
  if (toroID)
    objc_msgSend(v4, "setObject:forKey:", toroID, CFSTR("toroID"));
  dPID = self->_dPID;
  if (dPID)
    objc_msgSend(v4, "setObject:forKey:", dPID, CFSTR("DPID"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_searchAdClickTimestamp));
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("searchAdClickTimestamp"));

  }
  adMetadata = self->_adMetadata;
  if (adMetadata)
    objc_msgSend(v4, "setObject:forKey:", adMetadata, CFSTR("adMetadata"));
  v20 = (char)self->_has;
  if ((v20 & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_downloadClickTimestamp));
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("downloadClickTimestamp"));

    v20 = (char)self->_has;
  }
  if ((v20 & 0x20) != 0)
  {
    downloadType = self->_downloadType;
    if (downloadType >= 3)
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_downloadType));
    else
      v23 = *(&off_100214858 + downloadType);
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("downloadType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAttributionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *iAdID;
  NSData *tiltID;
  NSData *anonymousDemandiAdID;
  NSString *bundleID;
  char has;
  NSData *toroID;
  NSData *dPID;
  NSString *adMetadata;
  char v13;
  id v14;

  v4 = a3;
  iAdID = self->_iAdID;
  v14 = v4;
  if (iAdID)
  {
    PBDataWriterWriteDataField(v4, iAdID, 1);
    v4 = v14;
  }
  tiltID = self->_tiltID;
  if (tiltID)
  {
    PBDataWriterWriteDataField(v14, tiltID, 2);
    v4 = v14;
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID)
  {
    PBDataWriterWriteDataField(v14, anonymousDemandiAdID, 3);
    v4 = v14;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    PBDataWriterWriteStringField(v14, bundleID, 4);
    v4 = v14;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField(v14, 5, self->_purchaseTimestamp);
    v4 = v14;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField(v14, 6, self->_iAdConversionTimestamp);
  v4 = v14;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField(v14, 7, self->_iAdImpressionTimestamp);
  v4 = v14;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_31:
  PBDataWriterWriteBOOLField(v14, self->_attributedByiTunes, 8);
  v4 = v14;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt32Field(v14, self->_runState, 9);
    v4 = v14;
  }
LABEL_15:
  toroID = self->_toroID;
  if (toroID)
  {
    PBDataWriterWriteDataField(v14, toroID, 10);
    v4 = v14;
  }
  dPID = self->_dPID;
  if (dPID)
  {
    PBDataWriterWriteDataField(v14, dPID, 11);
    v4 = v14;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField(v14, 12, self->_searchAdClickTimestamp);
    v4 = v14;
  }
  adMetadata = self->_adMetadata;
  if (adMetadata)
  {
    PBDataWriterWriteStringField(v14, adMetadata, 13);
    v4 = v14;
  }
  v13 = (char)self->_has;
  if ((v13 & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v14, 14, self->_downloadClickTimestamp);
    v4 = v14;
    v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field(v14, self->_downloadType, 15);
    v4 = v14;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_iAdID)
  {
    objc_msgSend(v4, "setIAdID:");
    v4 = v7;
  }
  if (self->_tiltID)
  {
    objc_msgSend(v7, "setTiltID:");
    v4 = v7;
  }
  if (self->_anonymousDemandiAdID)
  {
    objc_msgSend(v7, "setAnonymousDemandiAdID:");
    v4 = v7;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v7, "setBundleID:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_purchaseTimestamp;
    *((_BYTE *)v4 + 124) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_iAdConversionTimestamp;
  *((_BYTE *)v4 + 124) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_iAdImpressionTimestamp;
  *((_BYTE *)v4 + 124) |= 4u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_31:
  *((_BYTE *)v4 + 120) = self->_attributedByiTunes;
  *((_BYTE *)v4 + 124) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 24) = self->_runState;
    *((_BYTE *)v4 + 124) |= 0x40u;
  }
LABEL_15:
  if (self->_toroID)
  {
    objc_msgSend(v7, "setToroID:");
    v4 = v7;
  }
  if (self->_dPID)
  {
    objc_msgSend(v7, "setDPID:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_searchAdClickTimestamp;
    *((_BYTE *)v4 + 124) |= 0x10u;
  }
  if (self->_adMetadata)
  {
    objc_msgSend(v7, "setAdMetadata:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_downloadClickTimestamp;
    *((_BYTE *)v4 + 124) |= 1u;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_downloadType;
    *((_BYTE *)v4 + 124) |= 0x20u;
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
  id v12;
  void *v13;
  char has;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  char v21;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3);
  v7 = (void *)v5[11];
  v5[11] = v6;

  v8 = -[NSData copyWithZone:](self->_tiltID, "copyWithZone:", a3);
  v9 = (void *)v5[13];
  v5[13] = v8;

  v10 = -[NSData copyWithZone:](self->_anonymousDemandiAdID, "copyWithZone:", a3);
  v11 = (void *)v5[7];
  v5[7] = v10;

  v12 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v13 = (void *)v5[8];
  v5[8] = v12;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[4] = *(_QWORD *)&self->_purchaseTimestamp;
    *((_BYTE *)v5 + 124) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = *(_QWORD *)&self->_iAdConversionTimestamp;
  *((_BYTE *)v5 + 124) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5[3] = *(_QWORD *)&self->_iAdImpressionTimestamp;
  *((_BYTE *)v5 + 124) |= 4u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  *((_BYTE *)v5 + 120) = self->_attributedByiTunes;
  *((_BYTE *)v5 + 124) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 24) = self->_runState;
    *((_BYTE *)v5 + 124) |= 0x40u;
  }
LABEL_7:
  v15 = -[NSData copyWithZone:](self->_toroID, "copyWithZone:", a3);
  v16 = (void *)v5[14];
  v5[14] = v15;

  v17 = -[NSData copyWithZone:](self->_dPID, "copyWithZone:", a3);
  v18 = (void *)v5[9];
  v5[9] = v17;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v5[5] = *(_QWORD *)&self->_searchAdClickTimestamp;
    *((_BYTE *)v5 + 124) |= 0x10u;
  }
  v19 = -[NSString copyWithZone:](self->_adMetadata, "copyWithZone:", a3);
  v20 = (void *)v5[6];
  v5[6] = v19;

  v21 = (char)self->_has;
  if ((v21 & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_downloadClickTimestamp;
    *((_BYTE *)v5 + 124) |= 1u;
    v21 = (char)self->_has;
  }
  if ((v21 & 0x20) != 0)
  {
    *((_DWORD *)v5 + 20) = self->_downloadType;
    *((_BYTE *)v5 + 124) |= 0x20u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *iAdID;
  NSData *tiltID;
  NSData *anonymousDemandiAdID;
  NSString *bundleID;
  NSData *toroID;
  NSData *dPID;
  char has;
  NSString *adMetadata;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_60;
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:"))
      goto LABEL_60;
  }
  tiltID = self->_tiltID;
  if ((unint64_t)tiltID | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](tiltID, "isEqual:"))
      goto LABEL_60;
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:"))
      goto LABEL_60;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 8) == 0 || self->_purchaseTimestamp != *((double *)v4 + 4))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 124) & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 2) == 0 || self->_iAdConversionTimestamp != *((double *)v4 + 2))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 124) & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 4) == 0 || self->_iAdImpressionTimestamp != *((double *)v4 + 3))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 124) & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 0x80) == 0)
      goto LABEL_60;
    if (self->_attributedByiTunes)
    {
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_60;
    }
    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_60;
    }
  }
  else if ((*((_BYTE *)v4 + 124) & 0x80) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 0x40) == 0 || self->_runState != *((_DWORD *)v4 + 24))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 124) & 0x40) != 0)
  {
    goto LABEL_60;
  }
  toroID = self->_toroID;
  if ((unint64_t)toroID | *((_QWORD *)v4 + 14) && !-[NSData isEqual:](toroID, "isEqual:"))
    goto LABEL_60;
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:"))
      goto LABEL_60;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 0x10) == 0 || self->_searchAdClickTimestamp != *((double *)v4 + 5))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 124) & 0x10) != 0)
  {
    goto LABEL_60;
  }
  adMetadata = self->_adMetadata;
  if ((unint64_t)adMetadata | *((_QWORD *)v4 + 6))
  {
    if (-[NSString isEqual:](adMetadata, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_50;
    }
LABEL_60:
    v13 = 0;
    goto LABEL_61;
  }
LABEL_50:
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 1) == 0 || self->_downloadClickTimestamp != *((double *)v4 + 1))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 124) & 1) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 0x20) == 0 || self->_downloadType != *((_DWORD *)v4 + 20))
      goto LABEL_60;
    v13 = 1;
  }
  else
  {
    v13 = (*((_BYTE *)v4 + 124) & 0x20) == 0;
  }
LABEL_61:

  return v13;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double purchaseTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double iAdConversionTimestamp;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double iAdImpressionTimestamp;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  double searchAdClickTimestamp;
  double v24;
  long double v25;
  double v26;
  NSUInteger v27;
  char v28;
  unint64_t v29;
  double downloadClickTimestamp;
  double v31;
  long double v32;
  double v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  NSUInteger v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;

  v42 = (unint64_t)-[NSData hash](self->_iAdID, "hash");
  v41 = (unint64_t)-[NSData hash](self->_tiltID, "hash");
  v40 = (unint64_t)-[NSData hash](self->_anonymousDemandiAdID, "hash");
  v39 = -[NSString hash](self->_bundleID, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    purchaseTimestamp = self->_purchaseTimestamp;
    v6 = -purchaseTimestamp;
    if (purchaseTimestamp >= 0.0)
      v6 = self->_purchaseTimestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    iAdConversionTimestamp = self->_iAdConversionTimestamp;
    v11 = -iAdConversionTimestamp;
    if (iAdConversionTimestamp >= 0.0)
      v11 = self->_iAdConversionTimestamp;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v38 = v9;
  if ((has & 4) != 0)
  {
    iAdImpressionTimestamp = self->_iAdImpressionTimestamp;
    v16 = -iAdImpressionTimestamp;
    if (iAdImpressionTimestamp >= 0.0)
      v16 = self->_iAdImpressionTimestamp;
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
  if (has < 0)
  {
    v36 = 2654435761 * self->_attributedByiTunes;
    if ((has & 0x40) == 0)
      goto LABEL_27;
  }
  else
  {
    v36 = 0;
    if ((has & 0x40) == 0)
    {
LABEL_27:
      v19 = 0;
      goto LABEL_30;
    }
  }
  v19 = 2654435761 * self->_runState;
LABEL_30:
  v20 = (unint64_t)-[NSData hash](self->_toroID, "hash", v36);
  v21 = (unint64_t)-[NSData hash](self->_dPID, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    searchAdClickTimestamp = self->_searchAdClickTimestamp;
    v24 = -searchAdClickTimestamp;
    if (searchAdClickTimestamp >= 0.0)
      v24 = self->_searchAdClickTimestamp;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  v27 = -[NSString hash](self->_adMetadata, "hash");
  v28 = (char)self->_has;
  if ((v28 & 1) != 0)
  {
    downloadClickTimestamp = self->_downloadClickTimestamp;
    v31 = -downloadClickTimestamp;
    if (downloadClickTimestamp >= 0.0)
      v31 = self->_downloadClickTimestamp;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((v28 & 0x20) != 0)
    v34 = 2654435761 * self->_downloadType;
  else
    v34 = 0;
  return v41 ^ v42 ^ v40 ^ v39 ^ v4 ^ v38 ^ v14 ^ v37 ^ v19 ^ v20 ^ v21 ^ v22 ^ v27 ^ v29 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 11))
  {
    -[APPBAttributionRequest setIAdID:](self, "setIAdID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[APPBAttributionRequest setTiltID:](self, "setTiltID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[APPBAttributionRequest setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[APPBAttributionRequest setBundleID:](self, "setBundleID:");
    v4 = v7;
  }
  v5 = *((_BYTE *)v4 + 124);
  if ((v5 & 8) != 0)
  {
    self->_purchaseTimestamp = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 124);
    if ((v5 & 2) == 0)
    {
LABEL_11:
      if ((v5 & 4) == 0)
        goto LABEL_12;
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 124) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_iAdConversionTimestamp = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 124);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  self->_iAdImpressionTimestamp = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 124);
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_31:
  self->_attributedByiTunes = *((_BYTE *)v4 + 120);
  *(_BYTE *)&self->_has |= 0x80u;
  if ((*((_BYTE *)v4 + 124) & 0x40) != 0)
  {
LABEL_14:
    self->_runState = *((_DWORD *)v4 + 24);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 14))
  {
    -[APPBAttributionRequest setToroID:](self, "setToroID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[APPBAttributionRequest setDPID:](self, "setDPID:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 124) & 0x10) != 0)
  {
    self->_searchAdClickTimestamp = *((double *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[APPBAttributionRequest setAdMetadata:](self, "setAdMetadata:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 124);
  if ((v6 & 1) != 0)
  {
    self->_downloadClickTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 124);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_downloadType = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 0x20u;
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

- (NSData)tiltID
{
  return self->_tiltID;
}

- (void)setTiltID:(id)a3
{
  objc_storeStrong((id *)&self->_tiltID, a3);
}

- (NSData)anonymousDemandiAdID
{
  return self->_anonymousDemandiAdID;
}

- (void)setAnonymousDemandiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (double)purchaseTimestamp
{
  return self->_purchaseTimestamp;
}

- (double)iAdConversionTimestamp
{
  return self->_iAdConversionTimestamp;
}

- (double)iAdImpressionTimestamp
{
  return self->_iAdImpressionTimestamp;
}

- (BOOL)attributedByiTunes
{
  return self->_attributedByiTunes;
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

- (double)searchAdClickTimestamp
{
  return self->_searchAdClickTimestamp;
}

- (NSString)adMetadata
{
  return self->_adMetadata;
}

- (void)setAdMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_adMetadata, a3);
}

- (double)downloadClickTimestamp
{
  return self->_downloadClickTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_tiltID, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);
  objc_storeStrong((id *)&self->_adMetadata, 0);
}

@end
