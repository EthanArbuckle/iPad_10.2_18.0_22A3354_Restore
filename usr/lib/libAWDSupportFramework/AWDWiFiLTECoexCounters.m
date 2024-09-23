@implementation AWDWiFiLTECoexCounters

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiLTECoexCounters setNoLTECoexBin:](self, "setNoLTECoexBin:", 0);
  -[AWDWiFiLTECoexCounters setLightLTECoexBin:](self, "setLightLTECoexBin:", 0);
  -[AWDWiFiLTECoexCounters setHeavyLTECoexBin:](self, "setHeavyLTECoexBin:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTECoexCounters;
  -[AWDWiFiLTECoexCounters dealloc](&v3, sel_dealloc);
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

- (BOOL)hasNoLTECoexBin
{
  return self->_noLTECoexBin != 0;
}

- (BOOL)hasLightLTECoexBin
{
  return self->_lightLTECoexBin != 0;
}

- (BOOL)hasHeavyLTECoexBin
{
  return self->_heavyLTECoexBin != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTECoexCounters;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiLTECoexCounters description](&v3, sel_description), -[AWDWiFiLTECoexCounters dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDWiFiLTECoexBin *noLTECoexBin;
  AWDWiFiLTECoexBin *lightLTECoexBin;
  AWDWiFiLTECoexBin *heavyLTECoexBin;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  noLTECoexBin = self->_noLTECoexBin;
  if (noLTECoexBin)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiLTECoexBin dictionaryRepresentation](noLTECoexBin, "dictionaryRepresentation"), CFSTR("noLTECoexBin"));
  lightLTECoexBin = self->_lightLTECoexBin;
  if (lightLTECoexBin)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiLTECoexBin dictionaryRepresentation](lightLTECoexBin, "dictionaryRepresentation"), CFSTR("lightLTECoexBin"));
  heavyLTECoexBin = self->_heavyLTECoexBin;
  if (heavyLTECoexBin)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiLTECoexBin dictionaryRepresentation](heavyLTECoexBin, "dictionaryRepresentation"), CFSTR("heavyLTECoexBin"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLTECoexCountersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_noLTECoexBin)
    PBDataWriterWriteSubmessage();
  if (self->_lightLTECoexBin)
    PBDataWriterWriteSubmessage();
  if (self->_heavyLTECoexBin)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (self->_noLTECoexBin)
    objc_msgSend(a3, "setNoLTECoexBin:");
  if (self->_lightLTECoexBin)
    objc_msgSend(a3, "setLightLTECoexBin:");
  if (self->_heavyLTECoexBin)
    objc_msgSend(a3, "setHeavyLTECoexBin:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[AWDWiFiLTECoexBin copyWithZone:](self->_noLTECoexBin, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[AWDWiFiLTECoexBin copyWithZone:](self->_lightLTECoexBin, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 16) = -[AWDWiFiLTECoexBin copyWithZone:](self->_heavyLTECoexBin, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDWiFiLTECoexBin *noLTECoexBin;
  AWDWiFiLTECoexBin *lightLTECoexBin;
  AWDWiFiLTECoexBin *heavyLTECoexBin;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_13;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    noLTECoexBin = self->_noLTECoexBin;
    if (!((unint64_t)noLTECoexBin | *((_QWORD *)a3 + 4))
      || (v5 = -[AWDWiFiLTECoexBin isEqual:](noLTECoexBin, "isEqual:")) != 0)
    {
      lightLTECoexBin = self->_lightLTECoexBin;
      if (!((unint64_t)lightLTECoexBin | *((_QWORD *)a3 + 3))
        || (v5 = -[AWDWiFiLTECoexBin isEqual:](lightLTECoexBin, "isEqual:")) != 0)
      {
        heavyLTECoexBin = self->_heavyLTECoexBin;
        if ((unint64_t)heavyLTECoexBin | *((_QWORD *)a3 + 2))
          LOBYTE(v5) = -[AWDWiFiLTECoexBin isEqual:](heavyLTECoexBin, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDWiFiLTECoexBin hash](self->_noLTECoexBin, "hash") ^ v3;
  v5 = -[AWDWiFiLTECoexBin hash](self->_lightLTECoexBin, "hash");
  return v4 ^ v5 ^ -[AWDWiFiLTECoexBin hash](self->_heavyLTECoexBin, "hash");
}

- (void)mergeFrom:(id)a3
{
  AWDWiFiLTECoexBin *noLTECoexBin;
  uint64_t v6;
  AWDWiFiLTECoexBin *lightLTECoexBin;
  uint64_t v8;
  AWDWiFiLTECoexBin *heavyLTECoexBin;
  uint64_t v10;

  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  noLTECoexBin = self->_noLTECoexBin;
  v6 = *((_QWORD *)a3 + 4);
  if (noLTECoexBin)
  {
    if (v6)
      -[AWDWiFiLTECoexBin mergeFrom:](noLTECoexBin, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDWiFiLTECoexCounters setNoLTECoexBin:](self, "setNoLTECoexBin:");
  }
  lightLTECoexBin = self->_lightLTECoexBin;
  v8 = *((_QWORD *)a3 + 3);
  if (lightLTECoexBin)
  {
    if (v8)
      -[AWDWiFiLTECoexBin mergeFrom:](lightLTECoexBin, "mergeFrom:");
  }
  else if (v8)
  {
    -[AWDWiFiLTECoexCounters setLightLTECoexBin:](self, "setLightLTECoexBin:");
  }
  heavyLTECoexBin = self->_heavyLTECoexBin;
  v10 = *((_QWORD *)a3 + 2);
  if (heavyLTECoexBin)
  {
    if (v10)
      -[AWDWiFiLTECoexBin mergeFrom:](heavyLTECoexBin, "mergeFrom:");
  }
  else if (v10)
  {
    -[AWDWiFiLTECoexCounters setHeavyLTECoexBin:](self, "setHeavyLTECoexBin:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiLTECoexBin)noLTECoexBin
{
  return self->_noLTECoexBin;
}

- (void)setNoLTECoexBin:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (AWDWiFiLTECoexBin)lightLTECoexBin
{
  return self->_lightLTECoexBin;
}

- (void)setLightLTECoexBin:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (AWDWiFiLTECoexBin)heavyLTECoexBin
{
  return self->_heavyLTECoexBin;
}

- (void)setHeavyLTECoexBin:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
