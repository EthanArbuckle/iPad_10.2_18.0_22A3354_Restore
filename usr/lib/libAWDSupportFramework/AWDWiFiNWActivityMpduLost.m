@implementation AWDWiFiNWActivityMpduLost

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiNWActivityMpduLost setBALost:](self, "setBALost:", 0);
  -[AWDWiFiNWActivityMpduLost setNonBALost:](self, "setNonBALost:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityMpduLost;
  -[AWDWiFiNWActivityMpduLost dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBALost
{
  return self->_bALost != 0;
}

- (BOOL)hasNonBALost
{
  return self->_nonBALost != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityMpduLost;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityMpduLost description](&v3, sel_description), -[AWDWiFiNWActivityMpduLost dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDWiFiNWActivityMpduWME *bALost;
  AWDWiFiNWActivityMpduWME *nonBALost;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  bALost = self->_bALost;
  if (bALost)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityMpduWME dictionaryRepresentation](bALost, "dictionaryRepresentation"), CFSTR("BALost"));
  nonBALost = self->_nonBALost;
  if (nonBALost)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityMpduWME dictionaryRepresentation](nonBALost, "dictionaryRepresentation"), CFSTR("nonBALost"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityMpduLostReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bALost)
    PBDataWriterWriteSubmessage();
  if (self->_nonBALost)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  if (self->_bALost)
    objc_msgSend(a3, "setBALost:");
  if (self->_nonBALost)
    objc_msgSend(a3, "setNonBALost:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = -[AWDWiFiNWActivityMpduWME copyWithZone:](self->_bALost, "copyWithZone:", a3);
  v5[2] = -[AWDWiFiNWActivityMpduWME copyWithZone:](self->_nonBALost, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDWiFiNWActivityMpduWME *bALost;
  AWDWiFiNWActivityMpduWME *nonBALost;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    bALost = self->_bALost;
    if (!((unint64_t)bALost | *((_QWORD *)a3 + 1))
      || (v5 = -[AWDWiFiNWActivityMpduWME isEqual:](bALost, "isEqual:")) != 0)
    {
      nonBALost = self->_nonBALost;
      if ((unint64_t)nonBALost | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[AWDWiFiNWActivityMpduWME isEqual:](nonBALost, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[AWDWiFiNWActivityMpduWME hash](self->_bALost, "hash");
  return -[AWDWiFiNWActivityMpduWME hash](self->_nonBALost, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  AWDWiFiNWActivityMpduWME *bALost;
  uint64_t v6;
  AWDWiFiNWActivityMpduWME *nonBALost;
  uint64_t v8;

  bALost = self->_bALost;
  v6 = *((_QWORD *)a3 + 1);
  if (bALost)
  {
    if (v6)
      -[AWDWiFiNWActivityMpduWME mergeFrom:](bALost, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDWiFiNWActivityMpduLost setBALost:](self, "setBALost:");
  }
  nonBALost = self->_nonBALost;
  v8 = *((_QWORD *)a3 + 2);
  if (nonBALost)
  {
    if (v8)
      -[AWDWiFiNWActivityMpduWME mergeFrom:](nonBALost, "mergeFrom:");
  }
  else if (v8)
  {
    -[AWDWiFiNWActivityMpduLost setNonBALost:](self, "setNonBALost:");
  }
}

- (AWDWiFiNWActivityMpduWME)bALost
{
  return self->_bALost;
}

- (void)setBALost:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AWDWiFiNWActivityMpduWME)nonBALost
{
  return self->_nonBALost;
}

- (void)setNonBALost:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
