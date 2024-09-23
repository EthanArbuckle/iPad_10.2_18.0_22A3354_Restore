@implementation AWDMPTCPSubflowSwitchingReport

- (void)dealloc
{
  objc_super v3;

  -[AWDMPTCPSubflowSwitchingReport setSwitchFromInterfaceName:](self, "setSwitchFromInterfaceName:", 0);
  -[AWDMPTCPSubflowSwitchingReport setSwitchToInterfaceName:](self, "setSwitchToInterfaceName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPSubflowSwitchingReport;
  -[AWDMPTCPSubflowSwitchingReport dealloc](&v3, sel_dealloc);
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

- (BOOL)hasSwitchFromInterfaceName
{
  return self->_switchFromInterfaceName != 0;
}

- (BOOL)hasSwitchToInterfaceName
{
  return self->_switchToInterfaceName != 0;
}

- (void)setSwitchCount:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_switchCount = a3;
}

- (void)setHasSwitchCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSwitchCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPSubflowSwitchingReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMPTCPSubflowSwitchingReport description](&v3, sel_description), -[AWDMPTCPSubflowSwitchingReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *switchFromInterfaceName;
  NSString *switchToInterfaceName;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  switchFromInterfaceName = self->_switchFromInterfaceName;
  if (switchFromInterfaceName)
    objc_msgSend(v3, "setObject:forKey:", switchFromInterfaceName, CFSTR("switch_from_interface_name"));
  switchToInterfaceName = self->_switchToInterfaceName;
  if (switchToInterfaceName)
    objc_msgSend(v3, "setObject:forKey:", switchToInterfaceName, CFSTR("switch_to_interface_name"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_switchCount), CFSTR("switch_count"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMPTCPSubflowSwitchingReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_switchFromInterfaceName)
    PBDataWriterWriteStringField();
  if (self->_switchToInterfaceName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (self->_switchFromInterfaceName)
    objc_msgSend(a3, "setSwitchFromInterfaceName:");
  if (self->_switchToInterfaceName)
    objc_msgSend(a3, "setSwitchToInterfaceName:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_switchCount;
    *((_BYTE *)a3 + 40) |= 2u;
  }
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

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_switchFromInterfaceName, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_switchToInterfaceName, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_switchCount;
    *(_BYTE *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *switchFromInterfaceName;
  NSString *switchToInterfaceName;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_15;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    switchFromInterfaceName = self->_switchFromInterfaceName;
    if (!((unint64_t)switchFromInterfaceName | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](switchFromInterfaceName, "isEqual:")) != 0)
    {
      switchToInterfaceName = self->_switchToInterfaceName;
      if (!((unint64_t)switchToInterfaceName | *((_QWORD *)a3 + 4))
        || (v5 = -[NSString isEqual:](switchToInterfaceName, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 2) == 0;
        if ((*(_BYTE *)&self->_has & 2) != 0)
        {
          if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_switchCount != *((_DWORD *)a3 + 4))
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
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_switchFromInterfaceName, "hash");
  v5 = -[NSString hash](self->_switchToInterfaceName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_switchCount;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDMPTCPSubflowSwitchingReport setSwitchFromInterfaceName:](self, "setSwitchFromInterfaceName:");
  if (*((_QWORD *)a3 + 4))
    -[AWDMPTCPSubflowSwitchingReport setSwitchToInterfaceName:](self, "setSwitchToInterfaceName:");
  if ((*((_BYTE *)a3 + 40) & 2) != 0)
  {
    self->_switchCount = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)switchFromInterfaceName
{
  return self->_switchFromInterfaceName;
}

- (void)setSwitchFromInterfaceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)switchToInterfaceName
{
  return self->_switchToInterfaceName;
}

- (void)setSwitchToInterfaceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int)switchCount
{
  return self->_switchCount;
}

@end
