@implementation AWDMPTCPConnectionInterfaceReport

- (void)dealloc
{
  objc_super v3;

  -[AWDMPTCPConnectionInterfaceReport setInterfaceName:](self, "setInterfaceName:", 0);
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPConnectionInterfaceReport;
  -[AWDMPTCPConnectionInterfaceReport dealloc](&v3, sel_dealloc);
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

- (BOOL)hasInterfaceName
{
  return self->_interfaceName != 0;
}

- (unint64_t)postConnectSubflowFailureErrorsCount
{
  return self->_postConnectSubflowFailureErrors.count;
}

- (int)postConnectSubflowFailureErrors
{
  return self->_postConnectSubflowFailureErrors.list;
}

- (void)clearPostConnectSubflowFailureErrors
{
  PBRepeatedInt32Clear();
}

- (void)addPostConnectSubflowFailureErrors:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)postConnectSubflowFailureErrorsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_postConnectSubflowFailureErrors;
  unint64_t count;

  p_postConnectSubflowFailureErrors = &self->_postConnectSubflowFailureErrors;
  count = self->_postConnectSubflowFailureErrors.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_postConnectSubflowFailureErrors->list[a3];
}

- (void)setPostConnectSubflowFailureErrors:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setDataInKB:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataInKB = a3;
}

- (void)setHasDataInKB:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataInKB
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDataOutKB:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dataOutKB = a3;
}

- (void)setHasDataOutKB:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataOutKB
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSecondaryFlowSuccessCount:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_secondaryFlowSuccessCount = a3;
}

- (void)setHasSecondaryFlowSuccessCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSecondaryFlowSuccessCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSecondaryFlowFailureCount:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_secondaryFlowFailureCount = a3;
}

- (void)setHasSecondaryFlowFailureCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSecondaryFlowFailureCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPostConnectTcpFallbackCount:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_postConnectTcpFallbackCount = a3;
}

- (void)setHasPostConnectTcpFallbackCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPostConnectTcpFallbackCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPConnectionInterfaceReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMPTCPConnectionInterfaceReport description](&v3, sel_description), -[AWDMPTCPConnectionInterfaceReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *interfaceName;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  interfaceName = self->_interfaceName;
  if (interfaceName)
    objc_msgSend(v3, "setObject:forKey:", interfaceName, CFSTR("interface_name"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("post_connect_subflow_failure_errors"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dataInKB), CFSTR("data_in_KB"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dataOutKB), CFSTR("data_out_KB"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_secondaryFlowFailureCount), CFSTR("secondary_flow_failure_count"));
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_10;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_secondaryFlowSuccessCount), CFSTR("secondary_flow_success_count"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_9:
  if ((has & 0x20) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_postConnectTcpFallbackCount), CFSTR("post_connect_tcp_fallback_count"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMPTCPConnectionInterfaceReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_interfaceName)
    PBDataWriterWriteStringField();
  if (self->_postConnectSubflowFailureErrors.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_postConnectSubflowFailureErrors.count);
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      return;
LABEL_18:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_18;
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_timestamp;
    *((_BYTE *)a3 + 76) |= 4u;
  }
  if (self->_interfaceName)
    objc_msgSend(a3, "setInterfaceName:");
  if (-[AWDMPTCPConnectionInterfaceReport postConnectSubflowFailureErrorsCount](self, "postConnectSubflowFailureErrorsCount"))
  {
    objc_msgSend(a3, "clearPostConnectSubflowFailureErrors");
    v5 = -[AWDMPTCPConnectionInterfaceReport postConnectSubflowFailureErrorsCount](self, "postConnectSubflowFailureErrorsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addPostConnectSubflowFailureErrors:", -[AWDMPTCPConnectionInterfaceReport postConnectSubflowFailureErrorsAtIndex:](self, "postConnectSubflowFailureErrorsAtIndex:", i));
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_dataInKB;
    *((_BYTE *)a3 + 76) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)a3 + 5) = self->_dataOutKB;
  *((_BYTE *)a3 + 76) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 17) = self->_secondaryFlowSuccessCount;
  *((_BYTE *)a3 + 76) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      return;
    goto LABEL_14;
  }
LABEL_19:
  *((_DWORD *)a3 + 16) = self->_secondaryFlowFailureCount;
  *((_BYTE *)a3 + 76) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return;
LABEL_14:
  *((_BYTE *)a3 + 72) = self->_postConnectTcpFallbackCount;
  *((_BYTE *)a3 + 76) |= 0x20u;
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
    *(_QWORD *)(v5 + 48) = self->_timestamp;
    *(_BYTE *)(v5 + 76) |= 4u;
  }

  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_interfaceName, "copyWithZone:", a3);
  PBRepeatedInt32Copy();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_dataInKB;
    *(_BYTE *)(v6 + 76) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 40) = self->_dataOutKB;
  *(_BYTE *)(v6 + 76) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
LABEL_13:
    *(_DWORD *)(v6 + 64) = self->_secondaryFlowFailureCount;
    *(_BYTE *)(v6 + 76) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v6;
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 68) = self->_secondaryFlowSuccessCount;
  *(_BYTE *)(v6 + 76) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 72) = self->_postConnectTcpFallbackCount;
    *(_BYTE *)(v6 + 76) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  NSString *interfaceName;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 76) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 6))
        goto LABEL_32;
    }
    else if ((*((_BYTE *)a3 + 76) & 4) != 0)
    {
      goto LABEL_32;
    }
    interfaceName = self->_interfaceName;
    if (!((unint64_t)interfaceName | *((_QWORD *)a3 + 7))
      || (IsEqual = -[NSString isEqual:](interfaceName, "isEqual:")) != 0)
    {
      IsEqual = PBRepeatedInt32IsEqual();
      if (IsEqual)
      {
        if ((*(_BYTE *)&self->_has & 1) != 0)
        {
          if ((*((_BYTE *)a3 + 76) & 1) == 0 || self->_dataInKB != *((_QWORD *)a3 + 4))
            goto LABEL_32;
        }
        else if ((*((_BYTE *)a3 + 76) & 1) != 0)
        {
          goto LABEL_32;
        }
        if ((*(_BYTE *)&self->_has & 2) != 0)
        {
          if ((*((_BYTE *)a3 + 76) & 2) == 0 || self->_dataOutKB != *((_QWORD *)a3 + 5))
            goto LABEL_32;
        }
        else if ((*((_BYTE *)a3 + 76) & 2) != 0)
        {
          goto LABEL_32;
        }
        if ((*(_BYTE *)&self->_has & 0x10) != 0)
        {
          if ((*((_BYTE *)a3 + 76) & 0x10) == 0 || self->_secondaryFlowSuccessCount != *((_DWORD *)a3 + 17))
            goto LABEL_32;
        }
        else if ((*((_BYTE *)a3 + 76) & 0x10) != 0)
        {
          goto LABEL_32;
        }
        if ((*(_BYTE *)&self->_has & 8) != 0)
        {
          if ((*((_BYTE *)a3 + 76) & 8) == 0 || self->_secondaryFlowFailureCount != *((_DWORD *)a3 + 16))
            goto LABEL_32;
        }
        else if ((*((_BYTE *)a3 + 76) & 8) != 0)
        {
          goto LABEL_32;
        }
        LOBYTE(IsEqual) = (*((_BYTE *)a3 + 76) & 0x20) == 0;
        if ((*(_BYTE *)&self->_has & 0x20) != 0)
        {
          if ((*((_BYTE *)a3 + 76) & 0x20) == 0)
          {
LABEL_32:
            LOBYTE(IsEqual) = 0;
            return IsEqual;
          }
          if (self->_postConnectTcpFallbackCount)
          {
            if (!*((_BYTE *)a3 + 72))
              goto LABEL_32;
          }
          else if (*((_BYTE *)a3 + 72))
          {
            goto LABEL_32;
          }
          LOBYTE(IsEqual) = 1;
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_interfaceName, "hash");
  v5 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_dataInKB;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_dataOutKB;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_secondaryFlowSuccessCount;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_13:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_9;
LABEL_14:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_12:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_8:
  v9 = 2654435761 * self->_secondaryFlowFailureCount;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_9:
  v10 = 2654435761 * self->_postConnectTcpFallbackCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;

  if ((*((_BYTE *)a3 + 76) & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 7))
    -[AWDMPTCPConnectionInterfaceReport setInterfaceName:](self, "setInterfaceName:");
  v5 = objc_msgSend(a3, "postConnectSubflowFailureErrorsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDMPTCPConnectionInterfaceReport addPostConnectSubflowFailureErrors:](self, "addPostConnectSubflowFailureErrors:", objc_msgSend(a3, "postConnectSubflowFailureErrorsAtIndex:", i));
  }
  v8 = *((_BYTE *)a3 + 76);
  if ((v8 & 1) != 0)
  {
    self->_dataInKB = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v8 = *((_BYTE *)a3 + 76);
    if ((v8 & 2) == 0)
    {
LABEL_10:
      if ((v8 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)a3 + 76) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_dataOutKB = *((_QWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 2u;
  v8 = *((_BYTE *)a3 + 76);
  if ((v8 & 0x10) == 0)
  {
LABEL_11:
    if ((v8 & 8) == 0)
      goto LABEL_12;
    goto LABEL_18;
  }
LABEL_17:
  self->_secondaryFlowSuccessCount = *((_DWORD *)a3 + 17);
  *(_BYTE *)&self->_has |= 0x10u;
  v8 = *((_BYTE *)a3 + 76);
  if ((v8 & 8) == 0)
  {
LABEL_12:
    if ((v8 & 0x20) == 0)
      return;
    goto LABEL_13;
  }
LABEL_18:
  self->_secondaryFlowFailureCount = *((_DWORD *)a3 + 16);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 76) & 0x20) == 0)
    return;
LABEL_13:
  self->_postConnectTcpFallbackCount = *((_BYTE *)a3 + 72);
  *(_BYTE *)&self->_has |= 0x20u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int64_t)dataInKB
{
  return self->_dataInKB;
}

- (int64_t)dataOutKB
{
  return self->_dataOutKB;
}

- (int)secondaryFlowSuccessCount
{
  return self->_secondaryFlowSuccessCount;
}

- (int)secondaryFlowFailureCount
{
  return self->_secondaryFlowFailureCount;
}

- (BOOL)postConnectTcpFallbackCount
{
  return self->_postConnectTcpFallbackCount;
}

@end
