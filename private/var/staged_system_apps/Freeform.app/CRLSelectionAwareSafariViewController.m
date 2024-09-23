@implementation CRLSelectionAwareSafariViewController

- (CRLSelectionAwareSafariViewController)initWithURL:(id)a3
{
  CRLSelectionAwareSafariViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLSelectionAwareSafariViewController;
  result = -[CRLSelectionAwareSafariViewController initWithURL:](&v4, "initWithURL:", a3);
  if (result)
    result->_staysOpenOnSelectionChange = 1;
  return result;
}

- (BOOL)staysOpenOnSelectionChange
{
  return self->_staysOpenOnSelectionChange;
}

@end
