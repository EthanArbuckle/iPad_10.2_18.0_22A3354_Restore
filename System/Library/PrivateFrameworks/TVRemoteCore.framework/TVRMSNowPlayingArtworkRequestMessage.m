@implementation TVRMSNowPlayingArtworkRequestMessage

- (BOOL)hasArtworkIdentifier
{
  return self->_artworkIdentifier != 0;
}

- (void)setWidth:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHeight:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHeight
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCompressionQuality:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_compressionQuality = a3;
}

- (void)setHasCompressionQuality:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompressionQuality
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TVRMSNowPlayingArtworkRequestMessage;
  -[TVRMSNowPlayingArtworkRequestMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSNowPlayingArtworkRequestMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *artworkIdentifier;
  char has;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  artworkIdentifier = self->_artworkIdentifier;
  if (artworkIdentifier)
    objc_msgSend(v3, "setObject:forKey:", artworkIdentifier, CFSTR("artworkIdentifier"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("height"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v5;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_width);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("width"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *(float *)&v4 = self->_compressionQuality;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("compressionQuality"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSNowPlayingArtworkRequestMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_artworkIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_artworkIdentifier)
  {
    v6 = v4;
    objc_msgSend(v4, "setArtworkIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *((_DWORD *)v4 + 5) = self->_height;
    *((_BYTE *)v4 + 28) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_DWORD *)v4 + 6) = self->_width;
  *((_BYTE *)v4 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 4) = LODWORD(self->_compressionQuality);
    *((_BYTE *)v4 + 28) |= 1u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_artworkIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_height;
    *(_BYTE *)(v5 + 28) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_width;
  *(_BYTE *)(v5 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(float *)(v5 + 16) = self->_compressionQuality;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *artworkIdentifier;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  artworkIdentifier = self->_artworkIdentifier;
  if ((unint64_t)artworkIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](artworkIdentifier, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_width != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_height != *((_DWORD *)v4 + 5))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_compressionQuality != *((float *)v4 + 4))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  float compressionQuality;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_artworkIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  v4 = 2654435761 * self->_width;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_height;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  compressionQuality = self->_compressionQuality;
  v7 = compressionQuality;
  if (compressionQuality < 0.0)
    v7 = -compressionQuality;
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
  return v4 ^ v3 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[TVRMSNowPlayingArtworkRequestMessage setArtworkIdentifier:](self, "setArtworkIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_5;
LABEL_9:
    self->_height = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_width = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v5 & 1) != 0)
  {
LABEL_6:
    self->_compressionQuality = *((float *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:

}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_artworkIdentifier, a3);
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)height
{
  return self->_height;
}

- (float)compressionQuality
{
  return self->_compressionQuality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
}

@end
