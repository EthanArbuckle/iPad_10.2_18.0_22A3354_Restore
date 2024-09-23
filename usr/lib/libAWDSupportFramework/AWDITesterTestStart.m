@implementation AWDITesterTestStart

- (void)dealloc
{
  objc_super v3;

  -[AWDITesterTestStart setTestName:](self, "setTestName:", 0);
  -[AWDITesterTestStart setUniqueKey:](self, "setUniqueKey:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestStart;
  -[AWDITesterTestStart dealloc](&v3, sel_dealloc);
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

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestStart;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDITesterTestStart description](&v3, sel_description), -[AWDITesterTestStart dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterTestStartReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_testName)
    PBDataWriterWriteStringField();
  if (self->_uniqueKey)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_testName)
    objc_msgSend(a3, "setTestName:");
  if (self->_uniqueKey)
    objc_msgSend(a3, "setUniqueKey:");
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
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_testName, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_uniqueKey, "copyWithZone:", a3);
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
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    testName = self->_testName;
    if (!((unint64_t)testName | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](testName, "isEqual:")) != 0)
    {
      uniqueKey = self->_uniqueKey;
      if ((unint64_t)uniqueKey | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NSString isEqual:](uniqueKey, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_testName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_uniqueKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDITesterTestStart setTestName:](self, "setTestName:");
  if (*((_QWORD *)a3 + 3))
    -[AWDITesterTestStart setUniqueKey:](self, "setUniqueKey:");
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
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
