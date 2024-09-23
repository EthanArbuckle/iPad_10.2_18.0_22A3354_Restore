@implementation APPBNativeMediaCreativeMetadata

+ (id)options
{
  if (qword_100269920 != -1)
    dispatch_once(&qword_100269920, &stru_100215200);
  return (id)qword_100269918;
}

- (BOOL)hasVideoFileURL
{
  return self->_videoFileURL != 0;
}

- (void)setWidth:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHeight:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setXPosition:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_xPosition = a3;
}

- (void)setHasXPosition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasXPosition
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setYPosition:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_yPosition = a3;
}

- (void)setHasYPosition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasYPosition
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasBackgroundImage
{
  return self->_backgroundImage != 0;
}

- (BOOL)hasEndCard
{
  return self->_endCard != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBNativeMediaCreativeMetadata;
  v3 = -[APPBNativeMediaCreativeMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBNativeMediaCreativeMetadata dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *videoFileURL;
  char has;
  void *v7;
  NSString *backgroundImage;
  NSString *endCard;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  videoFileURL = self->_videoFileURL;
  if (videoFileURL)
    objc_msgSend(v3, "setObject:forKey:", videoFileURL, CFSTR("videoFileURL"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_width));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("width"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_height));
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("height"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_xPosition));
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("xPosition"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_yPosition));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("yPosition"));

  }
LABEL_8:
  backgroundImage = self->_backgroundImage;
  if (backgroundImage)
    objc_msgSend(v4, "setObject:forKey:", backgroundImage, CFSTR("backgroundImage"));
  endCard = self->_endCard;
  if (endCard)
    objc_msgSend(v4, "setObject:forKey:", endCard, CFSTR("endCard"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBNativeMediaCreativeMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *videoFileURL;
  char has;
  NSString *backgroundImage;
  NSString *endCard;
  id v9;

  v4 = a3;
  videoFileURL = self->_videoFileURL;
  v9 = v4;
  if (videoFileURL)
  {
    PBDataWriterWriteStringField(v4, videoFileURL, 1);
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v9, self->_width, 2);
    v4 = v9;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field(v9, self->_height, 3);
  v4 = v9;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field(v9, self->_xPosition, 4);
  v4 = v9;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field(v9, self->_yPosition, 5);
    v4 = v9;
  }
LABEL_8:
  backgroundImage = self->_backgroundImage;
  if (backgroundImage)
  {
    PBDataWriterWriteStringField(v9, backgroundImage, 6);
    v4 = v9;
  }
  endCard = self->_endCard;
  if (endCard)
  {
    PBDataWriterWriteStringField(v9, endCard, 7);
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_videoFileURL)
  {
    objc_msgSend(v4, "setVideoFileURL:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_width;
    *((_BYTE *)v4 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 6) = self->_height;
  *((_BYTE *)v4 + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v4 + 11) = self->_xPosition;
  *((_BYTE *)v4 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 12) = self->_yPosition;
    *((_BYTE *)v4 + 52) |= 8u;
  }
LABEL_8:
  if (self->_backgroundImage)
  {
    objc_msgSend(v6, "setBackgroundImage:");
    v4 = v6;
  }
  if (self->_endCard)
  {
    objc_msgSend(v6, "setEndCard:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_videoFileURL, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_width;
    *((_BYTE *)v5 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *((_DWORD *)v5 + 11) = self->_xPosition;
      *((_BYTE *)v5 + 52) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_height;
  *((_BYTE *)v5 + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 12) = self->_yPosition;
    *((_BYTE *)v5 + 52) |= 8u;
  }
LABEL_6:
  v9 = -[NSString copyWithZone:](self->_backgroundImage, "copyWithZone:", a3);
  v10 = (void *)v5[1];
  v5[1] = v9;

  v11 = -[NSString copyWithZone:](self->_endCard, "copyWithZone:", a3);
  v12 = (void *)v5[2];
  v5[2] = v11;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *videoFileURL;
  NSString *backgroundImage;
  NSString *endCard;
  unsigned __int8 v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_28;
  videoFileURL = self->_videoFileURL;
  if ((unint64_t)videoFileURL | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](videoFileURL, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_width != *((_DWORD *)v4 + 10))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
LABEL_28:
    v8 = 0;
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_height != *((_DWORD *)v4 + 6))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_xPosition != *((_DWORD *)v4 + 11))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_yPosition != *((_DWORD *)v4 + 12))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_28;
  }
  backgroundImage = self->_backgroundImage;
  if ((unint64_t)backgroundImage | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](backgroundImage, "isEqual:"))
  {
    goto LABEL_28;
  }
  endCard = self->_endCard;
  if ((unint64_t)endCard | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](endCard, "isEqual:");
  else
    v8 = 1;
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_videoFileURL, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_width;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_height;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_xPosition;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_yPosition;
LABEL_10:
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_backgroundImage, "hash");
  return v8 ^ -[NSString hash](self->_endCard, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v4 = (int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[APPBNativeMediaCreativeMetadata setVideoFileURL:](self, "setVideoFileURL:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_width = v4[10];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((v4[13] & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_height = v4[6];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  self->_xPosition = v4[11];
  *(_BYTE *)&self->_has |= 4u;
  if ((v4[13] & 8) != 0)
  {
LABEL_7:
    self->_yPosition = v4[12];
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 1))
  {
    -[APPBNativeMediaCreativeMetadata setBackgroundImage:](self, "setBackgroundImage:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[APPBNativeMediaCreativeMetadata setEndCard:](self, "setEndCard:");
    v4 = v6;
  }

}

- (NSString)videoFileURL
{
  return self->_videoFileURL;
}

- (void)setVideoFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoFileURL, a3);
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (int)xPosition
{
  return self->_xPosition;
}

- (int)yPosition
{
  return self->_yPosition;
}

- (NSString)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (NSString)endCard
{
  return self->_endCard;
}

- (void)setEndCard:(id)a3
{
  objc_storeStrong((id *)&self->_endCard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoFileURL, 0);
  objc_storeStrong((id *)&self->_endCard, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

@end
