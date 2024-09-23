@implementation AWDITesterCertHomeKitTestStart

- (void)dealloc
{
  objc_super v3;

  -[AWDITesterCertHomeKitTestStart setAccessoryManufacturer:](self, "setAccessoryManufacturer:", 0);
  -[AWDITesterCertHomeKitTestStart setAccessoryName:](self, "setAccessoryName:", 0);
  -[AWDITesterCertHomeKitTestStart setTestUUID:](self, "setTestUUID:", 0);
  -[AWDITesterCertHomeKitTestStart setTestName:](self, "setTestName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterCertHomeKitTestStart;
  -[AWDITesterCertHomeKitTestStart dealloc](&v3, sel_dealloc);
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

- (BOOL)hasAccessoryManufacturer
{
  return self->_accessoryManufacturer != 0;
}

- (BOOL)hasAccessoryName
{
  return self->_accessoryName != 0;
}

- (BOOL)hasTestUUID
{
  return self->_testUUID != 0;
}

- (BOOL)hasTestName
{
  return self->_testName != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDITesterCertHomeKitTestStart;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDITesterCertHomeKitTestStart description](&v3, sel_description), -[AWDITesterCertHomeKitTestStart dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *accessoryManufacturer;
  NSString *accessoryName;
  NSString *testUUID;
  NSString *testName;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  accessoryManufacturer = self->_accessoryManufacturer;
  if (accessoryManufacturer)
    objc_msgSend(v3, "setObject:forKey:", accessoryManufacturer, CFSTR("accessoryManufacturer"));
  accessoryName = self->_accessoryName;
  if (accessoryName)
    objc_msgSend(v3, "setObject:forKey:", accessoryName, CFSTR("accessoryName"));
  testUUID = self->_testUUID;
  if (testUUID)
    objc_msgSend(v3, "setObject:forKey:", testUUID, CFSTR("testUUID"));
  testName = self->_testName;
  if (testName)
    objc_msgSend(v3, "setObject:forKey:", testName, CFSTR("testName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterCertHomeKitTestStartReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_accessoryManufacturer)
    PBDataWriterWriteStringField();
  if (self->_accessoryName)
    PBDataWriterWriteStringField();
  if (self->_testUUID)
    PBDataWriterWriteStringField();
  if (self->_testName)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 1u;
  }
  if (self->_accessoryManufacturer)
    objc_msgSend(a3, "setAccessoryManufacturer:");
  if (self->_accessoryName)
    objc_msgSend(a3, "setAccessoryName:");
  if (self->_testUUID)
    objc_msgSend(a3, "setTestUUID:");
  if (self->_testName)
    objc_msgSend(a3, "setTestName:");
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
    *(_BYTE *)(v5 + 48) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_accessoryManufacturer, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_accessoryName, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_testUUID, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_testName, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *accessoryManufacturer;
  NSString *accessoryName;
  NSString *testUUID;
  NSString *testName;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_15;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    accessoryManufacturer = self->_accessoryManufacturer;
    if (!((unint64_t)accessoryManufacturer | *((_QWORD *)a3 + 2))
      || (v5 = -[NSString isEqual:](accessoryManufacturer, "isEqual:")) != 0)
    {
      accessoryName = self->_accessoryName;
      if (!((unint64_t)accessoryName | *((_QWORD *)a3 + 3))
        || (v5 = -[NSString isEqual:](accessoryName, "isEqual:")) != 0)
      {
        testUUID = self->_testUUID;
        if (!((unint64_t)testUUID | *((_QWORD *)a3 + 5))
          || (v5 = -[NSString isEqual:](testUUID, "isEqual:")) != 0)
        {
          testName = self->_testName;
          if ((unint64_t)testName | *((_QWORD *)a3 + 4))
            LOBYTE(v5) = -[NSString isEqual:](testName, "isEqual:");
          else
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
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_accessoryManufacturer, "hash") ^ v3;
  v5 = -[NSString hash](self->_accessoryName, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_testUUID, "hash");
  return v6 ^ -[NSString hash](self->_testName, "hash");
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDITesterCertHomeKitTestStart setAccessoryManufacturer:](self, "setAccessoryManufacturer:");
  if (*((_QWORD *)a3 + 3))
    -[AWDITesterCertHomeKitTestStart setAccessoryName:](self, "setAccessoryName:");
  if (*((_QWORD *)a3 + 5))
    -[AWDITesterCertHomeKitTestStart setTestUUID:](self, "setTestUUID:");
  if (*((_QWORD *)a3 + 4))
    -[AWDITesterCertHomeKitTestStart setTestName:](self, "setTestName:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

- (void)setAccessoryManufacturer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)testUUID
{
  return self->_testUUID;
}

- (void)setTestUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
