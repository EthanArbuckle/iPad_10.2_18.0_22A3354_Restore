@implementation PXSuggestionToken

- (PXSuggestionToken)init
{
  PXSuggestionToken *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSuggestionToken;
  result = -[PXSuggestionToken init](&v3, sel_init);
  if (result)
    result->_token = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)cancel
{
  self->_canceled = 1;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

@end
