@implementation CRLWPiOSTextCaretDragTrackerController

- (CRLWPiOSTextCaretDragTrackerController)initWithPreferredStatusBarStyle:(int64_t)a3
{
  CRLWPiOSTextCaretDragTrackerController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPiOSTextCaretDragTrackerController;
  result = -[CRLWPiOSTextCaretDragTrackerController init](&v5, "init");
  if (result)
    result->_statusBarStyle = a3;
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  return -[CRLWPiOSTextCaretDragTrackerController statusBarStyle](self, "statusBarStyle");
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

@end
