@implementation ALSWirelessAP

- (void)dealloc
{
  objc_super v3;

  -[ALSWirelessAP setMacID:](self, "setMacID:", 0);
  -[ALSWirelessAP setLocation:](self, "setLocation:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSWirelessAP;
  -[ALSWirelessAP dealloc](&v3, "dealloc");
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setChannel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannel
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumZaxisHarvestTraces:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numZaxisHarvestTraces = a3;
}

- (void)setHasNumZaxisHarvestTraces:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumZaxisHarvestTraces
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSWirelessAP;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSWirelessAP description](&v3, "description"), -[ALSWirelessAP dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *macID;
  ALSLocation *location;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  macID = self->_macID;
  if (macID)
    objc_msgSend(v3, "setObject:forKey:", macID, CFSTR("macID"));
  location = self->_location;
  if (location)
    objc_msgSend(v4, "setObject:forKey:", -[ALSLocation dictionaryRepresentation](location, "dictionaryRepresentation"), CFSTR("location"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_channel), CFSTR("channel"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numZaxisHarvestTraces), CFSTR("numZaxisHarvestTraces"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F52C68((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *macID;
  ALSLocation *location;
  char has;

  macID = self->_macID;
  if (!macID)
    sub_101935E5C();
  PBDataWriterWriteStringField(a3, macID, 1);
  location = self->_location;
  if (location)
    PBDataWriterWriteSubmessage(a3, location, 2);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_channel, 21);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(a3, self->_numZaxisHarvestTraces, 22);
}

- (void)copyTo:(id)a3
{
  char has;

  objc_msgSend(a3, "setMacID:", self->_macID);
  if (self->_location)
    objc_msgSend(a3, "setLocation:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_channel;
    *((_BYTE *)a3 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_numZaxisHarvestTraces;
    *((_BYTE *)a3 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  char has;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");

  v5[3] = -[NSString copyWithZone:](self->_macID, "copyWithZone:", a3);
  v5[2] = -[ALSLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_channel;
    *((_BYTE *)v5 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_numZaxisHarvestTraces;
    *((_BYTE *)v5 + 36) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *macID;
  ALSLocation *location;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    macID = self->_macID;
    if (!((unint64_t)macID | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](macID, "isEqual:")) != 0)
    {
      location = self->_location;
      if (!((unint64_t)location | *((_QWORD *)a3 + 2))
        || (v5 = -[ALSLocation isEqual:](location, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 1) != 0)
        {
          if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_channel != *((_DWORD *)a3 + 2))
            goto LABEL_15;
        }
        else if ((*((_BYTE *)a3 + 36) & 1) != 0)
        {
LABEL_15:
          LOBYTE(v5) = 0;
          return v5;
        }
        LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 2) == 0;
        if ((*(_BYTE *)&self->_has & 2) != 0)
        {
          if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_numZaxisHarvestTraces != *((_DWORD *)a3 + 8))
            goto LABEL_15;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_macID, "hash");
  v4 = -[ALSLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_channel;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_numZaxisHarvestTraces;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  ALSLocation *location;
  uint64_t v6;
  char v7;

  if (*((_QWORD *)a3 + 3))
    -[ALSWirelessAP setMacID:](self, "setMacID:");
  location = self->_location;
  v6 = *((_QWORD *)a3 + 2);
  if (location)
  {
    if (v6)
      -[ALSLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v6)
  {
    -[ALSWirelessAP setLocation:](self, "setLocation:");
  }
  v7 = *((_BYTE *)a3 + 36);
  if ((v7 & 1) != 0)
  {
    self->_channel = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)a3 + 36);
  }
  if ((v7 & 2) != 0)
  {
    self->_numZaxisHarvestTraces = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (NSString)macID
{
  return self->_macID;
}

- (void)setMacID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (ALSLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)numZaxisHarvestTraces
{
  return self->_numZaxisHarvestTraces;
}

@end
