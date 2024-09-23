@implementation HIDReportInfo

- (HIDReportInfo)initWithID:(unsigned __int8)a3 type:(unsigned __int8)a4
{
  HIDReportInfo *v6;
  HIDReportInfo *v7;
  NSCondition *v8;
  NSCondition *commandCondition;
  NSError *commandError;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HIDReportInfo;
  v6 = -[HIDReportInfo init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    v6->_ID = a3;
    v6->_type = a4;
    v6->_isValid = 1;
    v8 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    commandCondition = v7->_commandCondition;
    v7->_commandCondition = v8;

    commandError = v7->_commandError;
    v7->_commandPending = 0;
    v7->_commandError = 0;

  }
  return v7;
}

- (unsigned)ID
{
  return self->_ID;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSCondition)commandCondition
{
  return self->_commandCondition;
}

- (int64_t)commandPending
{
  return self->_commandPending;
}

- (void)setCommandPending:(int64_t)a3
{
  self->_commandPending = a3;
}

- (NSError)commandError
{
  return self->_commandError;
}

- (void)setCommandError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)commandValue
{
  return self->_commandValue;
}

- (void)setCommandValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandValue, 0);
  objc_storeStrong((id *)&self->_commandError, 0);
  objc_storeStrong((id *)&self->_commandCondition, 0);
}

@end
