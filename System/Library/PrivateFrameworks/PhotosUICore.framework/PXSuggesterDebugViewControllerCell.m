@implementation PXSuggesterDebugViewControllerCell

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return self->_suggestion && sel_persist_ == a3;
}

- (PHSuggestion)suggestion
{
  return (PHSuggestion *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setSuggestion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
