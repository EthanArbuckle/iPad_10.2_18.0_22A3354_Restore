@implementation AWDCoreRoutineHeroAppSuggestionInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineHeroAppSuggestionInstance setSuggestionId:](self, "setSuggestionId:", 0);
  -[AWDCoreRoutineHeroAppSuggestionInstance setBundleId:](self, "setBundleId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineHeroAppSuggestionInstance;
  -[AWDCoreRoutineHeroAppSuggestionInstance dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setLat:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lat = a3;
}

- (void)setHasLat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLat
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLon:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_lon = a3;
}

- (void)setHasLon:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLon
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setInstalled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_installed = a3;
}

- (void)setHasInstalled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInstalled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineHeroAppSuggestionInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineHeroAppSuggestionInstance description](&v3, sel_description), -[AWDCoreRoutineHeroAppSuggestionInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *suggestionId;
  NSString *bundleId;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  suggestionId = self->_suggestionId;
  if (suggestionId)
    objc_msgSend(v3, "setObject:forKey:", suggestionId, CFSTR("suggestionId"));
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_lon), CFSTR("lon"));
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_10;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_lat), CFSTR("lat"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 8) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_installed), CFSTR("installed"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineHeroAppSuggestionInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_suggestionId)
    PBDataWriterWriteStringField();
  if (self->_bundleId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        return;
LABEL_13:
      PBDataWriterWriteInt32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 1u;
  }
  if (self->_suggestionId)
    objc_msgSend(a3, "setSuggestionId:");
  if (self->_bundleId)
    objc_msgSend(a3, "setBundleId:");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)a3 + 40) = self->_installed;
    *((_BYTE *)a3 + 44) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        return;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 6) = self->_lat;
  *((_BYTE *)a3 + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_10:
  *((_DWORD *)a3 + 7) = self->_lon;
  *((_BYTE *)a3 + 44) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_suggestionId, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v6 + 24) = self->_lat;
    *(_BYTE *)(v6 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v6;
    goto LABEL_6;
  }
  *(_BYTE *)(v6 + 40) = self->_installed;
  *(_BYTE *)(v6 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 28) = self->_lon;
    *(_BYTE *)(v6 + 44) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *suggestionId;
  NSString *bundleId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_28;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_28;
    }
    suggestionId = self->_suggestionId;
    if (!((unint64_t)suggestionId | *((_QWORD *)a3 + 4))
      || (v5 = -[NSString isEqual:](suggestionId, "isEqual:")) != 0)
    {
      bundleId = self->_bundleId;
      if (!((unint64_t)bundleId | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](bundleId, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 8) == 0)
        {
          if ((*((_BYTE *)a3 + 44) & 8) != 0)
            goto LABEL_28;
          goto LABEL_19;
        }
        if ((*((_BYTE *)a3 + 44) & 8) != 0)
        {
          if (self->_installed)
          {
            if (!*((_BYTE *)a3 + 40))
              goto LABEL_28;
            goto LABEL_19;
          }
          if (!*((_BYTE *)a3 + 40))
          {
LABEL_19:
            if ((*(_BYTE *)&self->_has & 2) != 0)
            {
              if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_lat != *((_DWORD *)a3 + 6))
                goto LABEL_28;
            }
            else if ((*((_BYTE *)a3 + 44) & 2) != 0)
            {
              goto LABEL_28;
            }
            LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 4) == 0;
            if ((*(_BYTE *)&self->_has & 4) != 0)
            {
              if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_lon != *((_DWORD *)a3 + 7))
                goto LABEL_28;
              LOBYTE(v5) = 1;
            }
            return v5;
          }
        }
LABEL_28:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_suggestionId, "hash");
  v5 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v6 = 2654435761 * self->_installed;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761 * self->_lat;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_7:
  v8 = 2654435761 * self->_lon;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDCoreRoutineHeroAppSuggestionInstance setSuggestionId:](self, "setSuggestionId:");
  if (*((_QWORD *)a3 + 2))
    -[AWDCoreRoutineHeroAppSuggestionInstance setBundleId:](self, "setBundleId:");
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 8) != 0)
  {
    self->_installed = *((_BYTE *)a3 + 40);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0)
        return;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_lat = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 44) & 4) == 0)
    return;
LABEL_10:
  self->_lon = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int)lat
{
  return self->_lat;
}

- (int)lon
{
  return self->_lon;
}

- (BOOL)installed
{
  return self->_installed;
}

@end
