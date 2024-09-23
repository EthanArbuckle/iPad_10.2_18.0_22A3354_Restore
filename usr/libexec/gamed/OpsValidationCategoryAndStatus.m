@implementation OpsValidationCategoryAndStatus

- (OpsValidationCategoryAndStatus)initWithOpsValidationCategory:(unsigned int)a3 status:(unsigned int)a4
{
  OpsValidationCategoryAndStatus *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OpsValidationCategoryAndStatus;
  result = -[OpsValidationCategoryAndStatus init](&v7, "init");
  if (result)
  {
    result->_category = a3;
    result->_status = a4;
  }
  return result;
}

- (unsigned)category
{
  return self->_category;
}

- (void)setCategory:(unsigned int)a3
{
  self->_category = a3;
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

@end
