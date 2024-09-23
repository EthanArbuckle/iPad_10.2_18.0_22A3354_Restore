@implementation HVConsumerState

- (unsigned)levelOfService
{
  return self->_levelOfService;
}

- (unsigned)documentsIgnored
{
  return self->_documentsIgnored;
}

- (void)setDocumentsIgnored:(unsigned int)a3
{
  self->_documentsIgnored = a3;
}

- (HVConsumerState)init
{
  HVConsumerState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HVConsumerState;
  result = -[HVConsumerState init](&v3, sel_init);
  if (result)
  {
    result->_levelOfService = 0;
    *(_QWORD *)&result->_numberOfExtractions = 0;
    *(_QWORD *)&result->_documentsConsumed = 0;
    result->_errorsReported = 0;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<HVConsumerState l:%hhu d:%u i:%u ex:%u int:%u err:%u>"), self->_levelOfService, self->_documentsConsumed, self->_documentsIgnored, self->_numberOfExtractions, self->_numberOfInterruptions, self->_errorsReported);
}

- (void)setLevelOfService:(unsigned __int8)a3
{
  self->_levelOfService = a3;
}

- (unsigned)documentsConsumed
{
  return self->_documentsConsumed;
}

- (void)setDocumentsConsumed:(unsigned int)a3
{
  self->_documentsConsumed = a3;
}

- (unsigned)numberOfExtractions
{
  return self->_numberOfExtractions;
}

- (void)setNumberOfExtractions:(unsigned int)a3
{
  self->_numberOfExtractions = a3;
}

- (unsigned)numberOfInterruptions
{
  return self->_numberOfInterruptions;
}

- (void)setNumberOfInterruptions:(unsigned int)a3
{
  self->_numberOfInterruptions = a3;
}

- (unsigned)errorsReported
{
  return self->_errorsReported;
}

- (void)setErrorsReported:(unsigned int)a3
{
  self->_errorsReported = a3;
}

@end
