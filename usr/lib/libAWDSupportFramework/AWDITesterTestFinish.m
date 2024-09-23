@implementation AWDITesterTestFinish

- (void)dealloc
{
  objc_super v3;

  -[AWDITesterTestFinish setTestName:](self, "setTestName:", 0);
  -[AWDITesterTestFinish setUniqueKey:](self, "setUniqueKey:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestFinish;
  -[AWDITesterTestFinish dealloc](&v3, sel_dealloc);
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

- (BOOL)hasTestName
{
  return self->_testName != 0;
}

- (BOOL)hasUniqueKey
{
  return self->_uniqueKey != 0;
}

- (void)setTestStatus:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_testStatus = a3;
}

- (void)setHasTestStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTestStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestFinish;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDITesterTestFinish description](&v3, sel_description), -[AWDITesterTestFinish dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *testName;
  NSString *uniqueKey;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  testName = self->_testName;
  if (testName)
    objc_msgSend(v3, "setObject:forKey:", testName, CFSTR("testName"));
  uniqueKey = self->_uniqueKey;
  if (uniqueKey)
    objc_msgSend(v3, "setObject:forKey:", uniqueKey, CFSTR("uniqueKey"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_testStatus), CFSTR("testStatus"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterTestFinishReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_testName)
    PBDataWriterWriteStringField();
  if (self->_uniqueKey)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (self->_testName)
    objc_msgSend(a3, "setTestName:");
  if (self->_uniqueKey)
    objc_msgSend(a3, "setUniqueKey:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_testStatus;
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

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_testName, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_uniqueKey, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_testStatus;
    *(_BYTE *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *testName;
  NSString *uniqueKey;

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
    testName = self->_testName;
    if (!((unint64_t)testName | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](testName, "isEqual:")) != 0)
    {
      uniqueKey = self->_uniqueKey;
      if (!((unint64_t)uniqueKey | *((_QWORD *)a3 + 4))
        || (v5 = -[NSString isEqual:](uniqueKey, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 2) == 0;
        if ((*(_BYTE *)&self->_has & 2) != 0)
        {
          if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_testStatus != *((_DWORD *)a3 + 6))
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
  v4 = -[NSString hash](self->_testName, "hash");
  v5 = -[NSString hash](self->_uniqueKey, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_testStatus;
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
  if (*((_QWORD *)a3 + 2))
    -[AWDITesterTestFinish setTestName:](self, "setTestName:");
  if (*((_QWORD *)a3 + 4))
    -[AWDITesterTestFinish setUniqueKey:](self, "setUniqueKey:");
  if ((*((_BYTE *)a3 + 40) & 2) != 0)
  {
    self->_testStatus = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)uniqueKey
{
  return self->_uniqueKey;
}

- (void)setUniqueKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)testStatus
{
  return self->_testStatus;
}

@end
