@implementation CRLWPTextMagnifierCaretController

- (CRLWPTextMagnifierCaretController)initWithPreferredStatusBarStyle:(int64_t)a3
{
  CRLWPTextMagnifierCaretController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPTextMagnifierCaretController;
  result = -[CRLWPTextMagnifierCaretController init](&v5, "init");
  if (result)
    result->_statusBarStyle = a3;
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  return -[CRLWPTextMagnifierCaretController statusBarStyle](self, "statusBarStyle");
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

@end
