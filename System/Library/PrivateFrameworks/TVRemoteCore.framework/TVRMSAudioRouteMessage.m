@implementation TVRMSAudioRouteMessage

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setMacAddress:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_macAddress = a3;
}

- (void)setHasMacAddress:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMacAddress
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSupportsVideo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportsVideo = a3;
}

- (void)setHasSupportsVideo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsVideo
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSelected:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_selected = a3;
}

- (void)setHasSelected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSelected
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)TVRMSAudioRouteMessage;
  -[TVRMSAudioRouteMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSAudioRouteMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *displayName;
  char has;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKey:", displayName, CFSTR("displayName"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsVideo);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("supportsVideo"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v4;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_macAddress);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("macAddress"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_selected);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("selected"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSAudioRouteMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
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
  if (self->_displayName)
  {
    v6 = v4;
    objc_msgSend(v4, "setDisplayName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *((_BYTE *)v4 + 25) = self->_supportsVideo;
    *((_BYTE *)v4 + 28) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v4 + 1) = self->_macAddress;
  *((_BYTE *)v4 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 24) = self->_selected;
    *((_BYTE *)v4 + 28) |= 2u;
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
  v6 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 25) = self->_supportsVideo;
    *(_BYTE *)(v5 + 28) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 8) = self->_macAddress;
  *(_BYTE *)(v5 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 24) = self->_selected;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  NSString *displayName;
  BOOL v6;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[28] & 1) == 0 || self->_macAddress != *((_QWORD *)v4 + 1))
      goto LABEL_18;
  }
  else if ((v4[28] & 1) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[28] & 4) == 0 || self->_supportsVideo != v4[25])
      goto LABEL_18;
  }
  else if ((v4[28] & 4) != 0)
  {
    goto LABEL_18;
  }
  v6 = (v4[28] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[28] & 2) == 0 || self->_selected != v4[24])
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
  uint64_t v6;

  v3 = -[NSString hash](self->_displayName, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_macAddress;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_supportsVideo;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_selected;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[TVRMSAudioRouteMessage setDisplayName:](self, "setDisplayName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_5;
LABEL_9:
    self->_supportsVideo = *((_BYTE *)v4 + 25);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_macAddress = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_selected = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (int64_t)macAddress
{
  return self->_macAddress;
}

- (BOOL)supportsVideo
{
  return self->_supportsVideo;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
