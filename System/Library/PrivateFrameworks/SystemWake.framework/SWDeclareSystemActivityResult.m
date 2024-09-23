@implementation SWDeclareSystemActivityResult

- (SWDeclareSystemActivityResult)initWithReturnValue:(int)a3 assertionID:(unsigned int)a4 systemState:(int)a5
{
  SWDeclareSystemActivityResult *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SWDeclareSystemActivityResult;
  result = -[SWDeclareSystemActivityResult init](&v9, sel_init);
  if (result)
  {
    result->_returnValue = a3;
    result->_assertionID = a4;
    result->_systemState = a5;
  }
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", self->_returnValue, CFSTR("returnValue"));
  v5 = (id)objc_msgSend(v3, "appendInt:withName:", self->_assertionID, CFSTR("assertionID"));
  v6 = (id)objc_msgSend(v3, "appendInt:withName:", self->_systemState, CFSTR("systemState"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)returnValue
{
  return self->_returnValue;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (int)systemState
{
  return self->_systemState;
}

@end
