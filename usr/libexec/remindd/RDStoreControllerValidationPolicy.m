@implementation RDStoreControllerValidationPolicy

- (RDStoreControllerValidationPolicy)initWithShouldValidateMoveAcrossSharedList:(BOOL)a3 saveShouldContinueIfCustomValidationFailed:(BOOL)a4
{
  RDStoreControllerValidationPolicy *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RDStoreControllerValidationPolicy;
  result = -[RDStoreControllerValidationPolicy init](&v7, "init");
  if (result)
  {
    result->_shouldValidateMoveAcrossSharedList = a3;
    result->_saveShouldContinueIfCustomValidationFailed = a4;
    result->_customValidationFailed = 0;
  }
  return result;
}

- (BOOL)shouldValidateMoveAcrossSharedList
{
  return self->_shouldValidateMoveAcrossSharedList;
}

- (BOOL)saveShouldContinueIfCustomValidationFailed
{
  return self->_saveShouldContinueIfCustomValidationFailed;
}

- (BOOL)customValidationFailed
{
  return self->_customValidationFailed;
}

- (void)setCustomValidationFailed:(BOOL)a3
{
  self->_customValidationFailed = a3;
}

@end
