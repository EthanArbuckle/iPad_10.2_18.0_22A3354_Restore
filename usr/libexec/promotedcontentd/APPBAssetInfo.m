@implementation APPBAssetInfo

- (int)contentType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_contentType;
  else
    return 30000;
}

- (void)setContentType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)contentTypeAsString:(int)a3
{
  if ((a3 - 30000) >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002151E8 + a3 - 30000);
}

- (int)StringAsContentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMAGE")) & 1) != 0)
  {
    v4 = 30000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO")) & 1) != 0)
  {
    v4 = 30001;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO")))
  {
    v4 = 30002;
  }
  else
  {
    v4 = 30000;
  }

  return v4;
}

- (void)setWidth:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHeight:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHeight
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)setLength:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLength
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBitrate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bitrate = a3;
}

- (void)setHasBitrate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBitrate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setAutoloop:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_autoloop = a3;
}

- (void)setHasAutoloop:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAutoloop
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAssetInfo;
  v3 = -[APPBAssetInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAssetInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *url;
  char v11;
  void *v12;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v6 = self->_contentType - 30000;
    if (v6 >= 3)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_contentType));
    else
      v7 = *(&off_1002151E8 + v6);
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("contentType"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_width));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("width"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_height));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("height"));

  }
  url = self->_url;
  if (url)
    objc_msgSend(v3, "setObject:forKey:", url, CFSTR("url"));
  v11 = (char)self->_has;
  if ((v11 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_14;
LABEL_18:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_bitrate));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("bitrate"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_15;
  }
  *(float *)&v4 = self->_length;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("length"));

  v11 = (char)self->_has;
  if ((v11 & 1) != 0)
    goto LABEL_18;
LABEL_14:
  if ((v11 & 0x20) != 0)
  {
LABEL_15:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_autoloop));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("autoloop"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAssetInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSString *url;
  char v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v7, self->_contentType, 1);
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v7, self->_width, 2);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field(v7, self->_height, 3);
LABEL_5:
  url = self->_url;
  if (url)
    PBDataWriterWriteStringField(v7, url, 4);
  v6 = (char)self->_has;
  if ((v6 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_16:
    PBDataWriterWriteDoubleField(v7, 6, self->_bitrate);
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteFloatField(v7, 5, self->_length);
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_16;
LABEL_9:
  if ((v6 & 0x20) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField(v7, self->_autoloop, 7);
LABEL_11:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_contentType;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_width;
  *((_BYTE *)v4 + 48) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[5] = self->_height;
    *((_BYTE *)v4 + 48) |= 4u;
  }
LABEL_5:
  if (self->_url)
  {
    v7 = v4;
    objc_msgSend(v4, "setUrl:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_16:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_bitrate;
    *((_BYTE *)v4 + 48) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v4[6] = LODWORD(self->_length);
  *((_BYTE *)v4 + 48) |= 8u;
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_16;
LABEL_9:
  if ((v6 & 0x20) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 44) = self->_autoloop;
    *((_BYTE *)v4 + 48) |= 0x20u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  char v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[4] = self->_contentType;
    *((_BYTE *)v5 + 48) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[10] = self->_width;
  *((_BYTE *)v5 + 48) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5[5] = self->_height;
    *((_BYTE *)v5 + 48) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  v10 = (char)self->_has;
  if ((v10 & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
LABEL_14:
    v6[1] = *(_QWORD *)&self->_bitrate;
    *((_BYTE *)v6 + 48) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v6;
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 6) = LODWORD(self->_length);
  *((_BYTE *)v6 + 48) |= 8u;
  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
    goto LABEL_14;
LABEL_7:
  if ((v10 & 0x20) != 0)
  {
LABEL_8:
    *((_BYTE *)v6 + 44) = self->_autoloop;
    *((_BYTE *)v6 + 48) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *url;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_32;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_contentType != *((_DWORD *)v4 + 4))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0 || self->_width != *((_DWORD *)v4 + 10))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_height != *((_DWORD *)v4 + 5))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_32;
  }
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_32;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_length != *((float *)v4 + 6))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_bitrate != *((double *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_32;
  }
  v7 = (*((_BYTE *)v4 + 48) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x20) != 0)
    {
      if (self->_autoloop)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_32;
      }
      else if (*((_BYTE *)v4 + 44))
      {
        goto LABEL_32;
      }
      v7 = 1;
      goto LABEL_33;
    }
LABEL_32:
    v7 = 0;
  }
LABEL_33:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  char has;
  unint64_t v8;
  float length;
  float v10;
  float v11;
  float v12;
  unint64_t v13;
  double bitrate;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_contentType;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_width;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_height;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_url, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    length = self->_length;
    v10 = -length;
    if (length >= 0.0)
      v10 = self->_length;
    v11 = floorf(v10 + 0.5);
    v12 = (float)(v10 - v11) * 1.8447e19;
    v8 = 2654435761u * (unint64_t)fmodf(v11, 1.8447e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabsf(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((has & 1) != 0)
  {
    bitrate = self->_bitrate;
    v15 = -bitrate;
    if (bitrate >= 0.0)
      v15 = self->_bitrate;
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
  if ((has & 0x20) != 0)
    v18 = 2654435761 * self->_autoloop;
  else
    v18 = 0;
  return v4 ^ v3 ^ v5 ^ v8 ^ v13 ^ v18 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_contentType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_width = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_4:
    self->_height = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 4))
  {
    v7 = v4;
    -[APPBAssetInfo setUrl:](self, "setUrl:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0)
      goto LABEL_9;
LABEL_16:
    self->_bitrate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 48) & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_length = *((float *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 1) != 0)
    goto LABEL_16;
LABEL_9:
  if ((v6 & 0x20) != 0)
  {
LABEL_10:
    self->_autoloop = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_11:

}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (float)length
{
  return self->_length;
}

- (double)bitrate
{
  return self->_bitrate;
}

- (BOOL)autoloop
{
  return self->_autoloop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
