@implementation UIWKAutocorrectionContext

- (NSString)contextBeforeSelection
{
  return self->_contextBeforeSelection;
}

- (void)setContextBeforeSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)contextAfterSelection
{
  return self->_contextAfterSelection;
}

- (void)setContextAfterSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)markedText
{
  return self->_markedText;
}

- (void)setMarkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_NSRange)rangeInMarkedText
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeInMarkedText.length;
  location = self->_rangeInMarkedText.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeInMarkedText:(_NSRange)a3
{
  self->_rangeInMarkedText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_contextAfterSelection, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_contextBeforeSelection, 0);
}

@end
