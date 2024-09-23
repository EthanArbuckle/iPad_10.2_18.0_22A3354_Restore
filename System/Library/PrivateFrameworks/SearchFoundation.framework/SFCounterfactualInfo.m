@implementation SFCounterfactualInfo

- (BOOL)cfDiffered
{
  return self->_cfDiffered;
}

- (void)setCfDiffered:(BOOL)a3
{
  self->_cfDiffered = a3;
}

- (BOOL)cfUsed
{
  return self->_cfUsed;
}

- (void)setCfUsed:(BOOL)a3
{
  self->_cfUsed = a3;
}

- (unint64_t)cfError
{
  return self->_cfError;
}

- (void)setCfError:(unint64_t)a3
{
  self->_cfError = a3;
}

@end
