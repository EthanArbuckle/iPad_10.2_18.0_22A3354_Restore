@implementation APPBMediaAsset

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)deliveryProtocol
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_deliveryProtocol;
  else
    return 1;
}

- (void)setDeliveryProtocol:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_deliveryProtocol = a3;
}

- (void)setHasDeliveryProtocol:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDeliveryProtocol
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)deliveryProtocolAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("progressive");
  if (a3 == 2)
    v3 = CFSTR("streaming");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsDeliveryProtocol:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("progressive")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("streaming")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (int)mIMEType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_mIMEType;
  else
    return 1;
}

- (void)setMIMEType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mIMEType = a3;
}

- (void)setHasMIMEType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMIMEType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)mIMETypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214688 + a3 - 1);
}

- (int)StringAsMIMEType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mov")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mp4")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("m4v")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("threeGP")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)codec
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_codec;
  else
    return 1;
}

- (void)setCodec:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_codec = a3;
}

- (void)setHasCodec:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCodec
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)codecAsString:(int)a3
{
  if ((a3 - 1) >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002146A8 + a3 - 1);
}

- (int)StringAsCodec:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("H264")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MPEG4")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AACLC")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setWidth:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasWidth
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHeight:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHeight
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setBitrate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bitrate = a3;
}

- (void)setHasBitrate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBitrate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMinBitrate:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_minBitrate = a3;
}

- (void)setHasMinBitrate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMinBitrate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMaxBitrate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_maxBitrate = a3;
}

- (void)setHasMaxBitrate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMaxBitrate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setScalable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_scalable = a3;
}

- (void)setHasScalable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasScalable
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMaintainAspectRatio:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_maintainAspectRatio = a3;
}

- (void)setHasMaintainAspectRatio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMaintainAspectRatio
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasApiFramework
{
  return self->_apiFramework != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBMediaAsset;
  v3 = -[APPBMediaAsset description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBMediaAsset dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mediaURL;
  NSString *identifier;
  __int16 has;
  int deliveryProtocol;
  __CFString *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSString *apiFramework;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  mediaURL = self->_mediaURL;
  if (mediaURL)
    objc_msgSend(v3, "setObject:forKey:", mediaURL, CFSTR("mediaURL"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    deliveryProtocol = self->_deliveryProtocol;
    if (deliveryProtocol == 1)
    {
      v9 = CFSTR("progressive");
    }
    else if (deliveryProtocol == 2)
    {
      v9 = CFSTR("streaming");
    }
    else
    {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deliveryProtocol));
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("deliveryProtocol"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_23;
      goto LABEL_19;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  v10 = self->_mIMEType - 1;
  if (v10 >= 4)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mIMEType));
  else
    v11 = *(&off_100214688 + v10);
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("MIMEType"));

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
LABEL_19:
    v12 = self->_codec - 1;
    if (v12 >= 3)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_codec));
    else
      v13 = *(&off_1002146A8 + v12);
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("codec"));

    has = (__int16)self->_has;
  }
LABEL_23:
  if ((has & 0x80) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_width));
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("width"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_25:
      if ((has & 1) == 0)
        goto LABEL_26;
      goto LABEL_36;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_25;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_height));
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("height"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_26:
    if ((has & 4) == 0)
      goto LABEL_27;
    goto LABEL_37;
  }
LABEL_36:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_bitrate));
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("bitrate"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_27:
    if ((has & 2) == 0)
      goto LABEL_28;
    goto LABEL_38;
  }
LABEL_37:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_minBitrate));
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("minBitrate"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_28:
    if ((has & 0x200) == 0)
      goto LABEL_29;
    goto LABEL_39;
  }
LABEL_38:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_maxBitrate));
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("maxBitrate"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_29:
    if ((has & 0x100) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_39:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_scalable));
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("scalable"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_30:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_maintainAspectRatio));
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("maintainAspectRatio"));

  }
LABEL_31:
  apiFramework = self->_apiFramework;
  if (apiFramework)
    objc_msgSend(v4, "setObject:forKey:", apiFramework, CFSTR("apiFramework"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBMediaAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *mediaURL;
  NSString *identifier;
  __int16 has;
  void *v8;
  NSString *apiFramework;
  id v10;

  v4 = a3;
  mediaURL = self->_mediaURL;
  if (!mediaURL)
    sub_10017BB04();
  v10 = v4;
  PBDataWriterWriteStringField(v4, mediaURL, 1);
  identifier = self->_identifier;
  if (identifier)
    PBDataWriterWriteStringField(v10, identifier, 2);
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(v10, self->_deliveryProtocol, 3);
    has = (__int16)self->_has;
  }
  v8 = v10;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field(v10, self->_mIMEType, 4);
    v8 = v10;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_8:
      if ((has & 0x80) == 0)
        goto LABEL_9;
      goto LABEL_21;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field(v10, self->_codec, 5);
  v8 = v10;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field(v10, self->_width, 6);
  v8 = v10;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field(v10, self->_height, 7);
  v8 = v10;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteDoubleField(v10, 8, self->_bitrate);
  v8 = v10;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField(v10, 9, self->_minBitrate);
  v8 = v10;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField(v10, 10, self->_maxBitrate);
  v8 = v10;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_26:
  PBDataWriterWriteBOOLField(v10, self->_scalable, 11);
  v8 = v10;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_15:
    PBDataWriterWriteBOOLField(v10, self->_maintainAspectRatio, 12);
    v8 = v10;
  }
LABEL_16:
  apiFramework = self->_apiFramework;
  if (apiFramework)
  {
    PBDataWriterWriteStringField(v10, apiFramework, 13);
    v8 = v10;
  }

}

- (void)copyTo:(id)a3
{
  __int16 has;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setMediaURL:", self->_mediaURL);
  if (self->_identifier)
    objc_msgSend(v6, "setIdentifier:");
  has = (__int16)self->_has;
  v5 = v6;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_deliveryProtocol;
    *((_WORD *)v6 + 44) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 16) = self->_mIMEType;
  *((_WORD *)v6 + 44) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v6 + 10) = self->_codec;
  *((_WORD *)v6 + 44) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v6 + 20) = self->_width;
  *((_WORD *)v6 + 44) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v6 + 12) = self->_height;
  *((_WORD *)v6 + 44) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)v6 + 1) = *(_QWORD *)&self->_bitrate;
  *((_WORD *)v6 + 44) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)v6 + 3) = *(_QWORD *)&self->_minBitrate;
  *((_WORD *)v6 + 44) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)v6 + 2) = *(_QWORD *)&self->_maxBitrate;
  *((_WORD *)v6 + 44) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_25:
  *((_BYTE *)v6 + 85) = self->_scalable;
  *((_WORD *)v6 + 44) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    *((_BYTE *)v6 + 84) = self->_maintainAspectRatio;
    *((_WORD *)v6 + 44) |= 0x100u;
  }
LABEL_14:
  if (self->_apiFramework)
  {
    objc_msgSend(v6, "setApiFramework:");
    v5 = v6;
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

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_mediaURL, "copyWithZone:", a3);
  v7 = (void *)v5[9];
  v5[9] = v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 11) = self->_deliveryProtocol;
    *((_WORD *)v5 + 44) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 16) = self->_mIMEType;
  *((_WORD *)v5 + 44) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 10) = self->_codec;
  *((_WORD *)v5 + 44) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 20) = self->_width;
  *((_WORD *)v5 + 44) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 12) = self->_height;
  *((_WORD *)v5 + 44) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v5[1] = *(_QWORD *)&self->_bitrate;
  *((_WORD *)v5 + 44) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v5[3] = *(_QWORD *)&self->_minBitrate;
  *((_WORD *)v5 + 44) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
LABEL_21:
    *((_BYTE *)v5 + 85) = self->_scalable;
    *((_WORD *)v5 + 44) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  v5[2] = *(_QWORD *)&self->_maxBitrate;
  *((_WORD *)v5 + 44) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x100) != 0)
  {
LABEL_11:
    *((_BYTE *)v5 + 84) = self->_maintainAspectRatio;
    *((_WORD *)v5 + 44) |= 0x100u;
  }
LABEL_12:
  v11 = -[NSString copyWithZone:](self->_apiFramework, "copyWithZone:", a3);
  v12 = (void *)v5[4];
  v5[4] = v11;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mediaURL;
  NSString *identifier;
  __int16 has;
  __int16 v8;
  unsigned __int8 v9;
  NSString *apiFramework;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_58;
  mediaURL = self->_mediaURL;
  if ((unint64_t)mediaURL | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](mediaURL, "isEqual:"))
      goto LABEL_58;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_58;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 44);
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_deliveryProtocol != *((_DWORD *)v4 + 11))
      goto LABEL_58;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_mIMEType != *((_DWORD *)v4 + 16))
      goto LABEL_58;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_codec != *((_DWORD *)v4 + 10))
      goto LABEL_58;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_width != *((_DWORD *)v4 + 20))
      goto LABEL_58;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_height != *((_DWORD *)v4 + 12))
      goto LABEL_58;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_bitrate != *((double *)v4 + 1))
      goto LABEL_58;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_minBitrate != *((double *)v4 + 3))
      goto LABEL_58;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_maxBitrate != *((double *)v4 + 2))
      goto LABEL_58;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x200) == 0)
      goto LABEL_58;
    if (self->_scalable)
    {
      if (!*((_BYTE *)v4 + 85))
        goto LABEL_58;
    }
    else if (*((_BYTE *)v4 + 85))
    {
      goto LABEL_58;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x200) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0)
      goto LABEL_64;
LABEL_58:
    v9 = 0;
    goto LABEL_59;
  }
  if ((*((_WORD *)v4 + 44) & 0x100) == 0)
    goto LABEL_58;
  if (!self->_maintainAspectRatio)
  {
    if (!*((_BYTE *)v4 + 84))
      goto LABEL_64;
    goto LABEL_58;
  }
  if (!*((_BYTE *)v4 + 84))
    goto LABEL_58;
LABEL_64:
  apiFramework = self->_apiFramework;
  if ((unint64_t)apiFramework | *((_QWORD *)v4 + 4))
    v9 = -[NSString isEqual:](apiFramework, "isEqual:");
  else
    v9 = 1;
LABEL_59:

  return v9;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double bitrate;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double minBitrate;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double maxBitrate;
  double v21;
  long double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v28;
  NSUInteger v29;

  v29 = -[NSString hash](self->_mediaURL, "hash");
  v28 = -[NSString hash](self->_identifier, "hash");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v4 = 2654435761 * self->_deliveryProtocol;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_mIMEType;
      if ((has & 8) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v4 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_codec;
    if ((has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_width;
    if ((has & 0x20) != 0)
      goto LABEL_6;
LABEL_15:
    v8 = 0;
    if ((has & 1) != 0)
      goto LABEL_7;
LABEL_16:
    v13 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v7 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_15;
LABEL_6:
  v8 = 2654435761 * self->_height;
  if ((has & 1) == 0)
    goto LABEL_16;
LABEL_7:
  bitrate = self->_bitrate;
  v10 = -bitrate;
  if (bitrate >= 0.0)
    v10 = self->_bitrate;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((has & 4) != 0)
  {
    minBitrate = self->_minBitrate;
    v16 = -minBitrate;
    if (minBitrate >= 0.0)
      v16 = self->_minBitrate;
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
  if ((has & 2) != 0)
  {
    maxBitrate = self->_maxBitrate;
    v21 = -maxBitrate;
    if (maxBitrate >= 0.0)
      v21 = self->_maxBitrate;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 0x200) != 0)
  {
    v24 = 2654435761 * self->_scalable;
    if ((has & 0x100) != 0)
      goto LABEL_37;
LABEL_39:
    v25 = 0;
    goto LABEL_40;
  }
  v24 = 0;
  if ((has & 0x100) == 0)
    goto LABEL_39;
LABEL_37:
  v25 = 2654435761 * self->_maintainAspectRatio;
LABEL_40:
  v26 = v28 ^ v29;
  return v26 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ v19 ^ v24 ^ v25 ^ -[NSString hash](self->_apiFramework, "hash", v28);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 9))
  {
    -[APPBMediaAsset setMediaURL:](self, "setMediaURL:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[APPBMediaAsset setIdentifier:](self, "setIdentifier:");
    v4 = v6;
  }
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_deliveryProtocol = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)v4 + 44);
    if ((v5 & 0x40) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_8;
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_7;
  }
  self->_mIMEType = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_codec = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_width = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_height = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  self->_bitrate = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  self->_minBitrate = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_26:
  self->_maxBitrate = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x200) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_27:
  self->_scalable = *((_BYTE *)v4 + 85);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
LABEL_15:
    self->_maintainAspectRatio = *((_BYTE *)v4 + 84);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_16:
  if (*((_QWORD *)v4 + 4))
  {
    -[APPBMediaAsset setApiFramework:](self, "setApiFramework:");
    v4 = v6;
  }

}

- (NSString)mediaURL
{
  return self->_mediaURL;
}

- (void)setMediaURL:(id)a3
{
  objc_storeStrong((id *)&self->_mediaURL, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (double)bitrate
{
  return self->_bitrate;
}

- (double)minBitrate
{
  return self->_minBitrate;
}

- (double)maxBitrate
{
  return self->_maxBitrate;
}

- (BOOL)scalable
{
  return self->_scalable;
}

- (BOOL)maintainAspectRatio
{
  return self->_maintainAspectRatio;
}

- (NSString)apiFramework
{
  return self->_apiFramework;
}

- (void)setApiFramework:(id)a3
{
  objc_storeStrong((id *)&self->_apiFramework, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_apiFramework, 0);
}

@end
