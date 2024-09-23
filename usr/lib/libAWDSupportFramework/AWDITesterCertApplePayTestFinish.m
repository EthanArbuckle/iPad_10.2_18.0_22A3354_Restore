@implementation AWDITesterCertApplePayTestFinish

- (void)dealloc
{
  objc_super v3;

  -[AWDITesterCertApplePayTestFinish setTestUUID:](self, "setTestUUID:", 0);
  -[AWDITesterCertApplePayTestFinish setTestName:](self, "setTestName:", 0);
  -[AWDITesterCertApplePayTestFinish setTestStatus:](self, "setTestStatus:", 0);
  -[AWDITesterCertApplePayTestFinish setTestResult:](self, "setTestResult:", 0);
  -[AWDITesterCertApplePayTestFinish setTestErrorDescription:](self, "setTestErrorDescription:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterCertApplePayTestFinish;
  -[AWDITesterCertApplePayTestFinish dealloc](&v3, sel_dealloc);
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

- (BOOL)hasTestUUID
{
  return self->_testUUID != 0;
}

- (BOOL)hasTestName
{
  return self->_testName != 0;
}

- (BOOL)hasTestStatus
{
  return self->_testStatus != 0;
}

- (void)setTestIterations:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_testIterations = a3;
}

- (void)setHasTestIterations:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTestIterations
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasTestResult
{
  return self->_testResult != 0;
}

- (BOOL)hasTestErrorDescription
{
  return self->_testErrorDescription != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDITesterCertApplePayTestFinish;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDITesterCertApplePayTestFinish description](&v3, sel_description), -[AWDITesterCertApplePayTestFinish dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *testUUID;
  NSString *testName;
  NSString *testStatus;
  NSString *testResult;
  NSString *testErrorDescription;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  testUUID = self->_testUUID;
  if (testUUID)
    objc_msgSend(v3, "setObject:forKey:", testUUID, CFSTR("testUUID"));
  testName = self->_testName;
  if (testName)
    objc_msgSend(v3, "setObject:forKey:", testName, CFSTR("testName"));
  testStatus = self->_testStatus;
  if (testStatus)
    objc_msgSend(v3, "setObject:forKey:", testStatus, CFSTR("testStatus"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_testIterations), CFSTR("testIterations"));
  testResult = self->_testResult;
  if (testResult)
    objc_msgSend(v3, "setObject:forKey:", testResult, CFSTR("testResult"));
  testErrorDescription = self->_testErrorDescription;
  if (testErrorDescription)
    objc_msgSend(v3, "setObject:forKey:", testErrorDescription, CFSTR("testErrorDescription"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterCertApplePayTestFinishReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_testUUID)
    PBDataWriterWriteStringField();
  if (self->_testName)
    PBDataWriterWriteStringField();
  if (self->_testStatus)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_testResult)
    PBDataWriterWriteStringField();
  if (self->_testErrorDescription)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 64) |= 1u;
  }
  if (self->_testUUID)
    objc_msgSend(a3, "setTestUUID:");
  if (self->_testName)
    objc_msgSend(a3, "setTestName:");
  if (self->_testStatus)
    objc_msgSend(a3, "setTestStatus:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_testIterations;
    *((_BYTE *)a3 + 64) |= 2u;
  }
  if (self->_testResult)
    objc_msgSend(a3, "setTestResult:");
  if (self->_testErrorDescription)
    objc_msgSend(a3, "setTestErrorDescription:");
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
    *(_BYTE *)(v5 + 64) |= 1u;
  }

  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_testUUID, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_testName, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_testStatus, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_testIterations;
    *(_BYTE *)(v6 + 64) |= 2u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_testResult, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_testErrorDescription, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *testUUID;
  NSString *testName;
  NSString *testStatus;
  NSString *testResult;
  NSString *testErrorDescription;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 64) & 1) != 0)
    {
LABEL_22:
      LOBYTE(v5) = 0;
      return v5;
    }
    testUUID = self->_testUUID;
    if (!((unint64_t)testUUID | *((_QWORD *)a3 + 7)) || (v5 = -[NSString isEqual:](testUUID, "isEqual:")) != 0)
    {
      testName = self->_testName;
      if (!((unint64_t)testName | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](testName, "isEqual:")) != 0)
      {
        testStatus = self->_testStatus;
        if (!((unint64_t)testStatus | *((_QWORD *)a3 + 6))
          || (v5 = -[NSString isEqual:](testStatus, "isEqual:")) != 0)
        {
          if ((*(_BYTE *)&self->_has & 2) != 0)
          {
            if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_testIterations != *((_DWORD *)a3 + 6))
              goto LABEL_22;
          }
          else if ((*((_BYTE *)a3 + 64) & 2) != 0)
          {
            goto LABEL_22;
          }
          testResult = self->_testResult;
          if (!((unint64_t)testResult | *((_QWORD *)a3 + 5))
            || (v5 = -[NSString isEqual:](testResult, "isEqual:")) != 0)
          {
            testErrorDescription = self->_testErrorDescription;
            if ((unint64_t)testErrorDescription | *((_QWORD *)a3 + 2))
              LOBYTE(v5) = -[NSString isEqual:](testErrorDescription, "isEqual:");
            else
              LOBYTE(v5) = 1;
          }
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
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_testUUID, "hash");
  v5 = -[NSString hash](self->_testName, "hash");
  v6 = -[NSString hash](self->_testStatus, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_testIterations;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSString hash](self->_testResult, "hash");
  return v8 ^ v9 ^ -[NSString hash](self->_testErrorDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 64) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 7))
    -[AWDITesterCertApplePayTestFinish setTestUUID:](self, "setTestUUID:");
  if (*((_QWORD *)a3 + 4))
    -[AWDITesterCertApplePayTestFinish setTestName:](self, "setTestName:");
  if (*((_QWORD *)a3 + 6))
    -[AWDITesterCertApplePayTestFinish setTestStatus:](self, "setTestStatus:");
  if ((*((_BYTE *)a3 + 64) & 2) != 0)
  {
    self->_testIterations = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDITesterCertApplePayTestFinish setTestResult:](self, "setTestResult:");
  if (*((_QWORD *)a3 + 2))
    -[AWDITesterCertApplePayTestFinish setTestErrorDescription:](self, "setTestErrorDescription:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)testUUID
{
  return self->_testUUID;
}

- (void)setTestUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)testStatus
{
  return self->_testStatus;
}

- (void)setTestStatus:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unsigned)testIterations
{
  return self->_testIterations;
}

- (NSString)testResult
{
  return self->_testResult;
}

- (void)setTestResult:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)testErrorDescription
{
  return self->_testErrorDescription;
}

- (void)setTestErrorDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
