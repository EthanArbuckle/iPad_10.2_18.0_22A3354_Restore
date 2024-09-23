@implementation AWDSpringBoardAppBrightness

- (void)dealloc
{
  objc_super v3;

  -[AWDSpringBoardAppBrightness setAppBundleID:](self, "setAppBundleID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardAppBrightness;
  -[AWDSpringBoardAppBrightness dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAppBundleID
{
  return self->_appBundleID != 0;
}

- (void)setBrightness:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_brightness = a3;
}

- (void)setHasBrightness:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBrightness
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardAppBrightness;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSpringBoardAppBrightness description](&v3, sel_description), -[AWDSpringBoardAppBrightness dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *appBundleID;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  appBundleID = self->_appBundleID;
  if (appBundleID)
    objc_msgSend(v3, "setObject:forKey:", appBundleID, CFSTR("appBundleID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_brightness), CFSTR("brightness"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardAppBrightnessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_appBundleID)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 4u;
  }
  if (self->_appBundleID)
    objc_msgSend(a3, "setAppBundleID:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_brightness;
    *((_BYTE *)a3 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_duration;
    *((_BYTE *)a3 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 4u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_appBundleID, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_brightness;
    *(_BYTE *)(v6 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_duration;
    *(_BYTE *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *appBundleID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    appBundleID = self->_appBundleID;
    if ((unint64_t)appBundleID | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](appBundleID, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_brightness != *((_QWORD *)a3 + 1))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_duration != *((_QWORD *)a3 + 2))
        goto LABEL_19;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_appBundleID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761u * self->_brightness;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761u * self->_duration;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 40) & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDSpringBoardAppBrightness setAppBundleID:](self, "setAppBundleID:");
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) != 0)
  {
    self->_brightness = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_duration = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)brightness
{
  return self->_brightness;
}

- (unint64_t)duration
{
  return self->_duration;
}

@end
