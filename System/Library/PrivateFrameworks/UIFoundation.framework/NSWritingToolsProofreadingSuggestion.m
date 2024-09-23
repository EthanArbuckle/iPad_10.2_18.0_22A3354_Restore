@implementation NSWritingToolsProofreadingSuggestion

- (NSWritingToolsProofreadingSuggestion)initWithUUID:(id)a3 originalRange:(_NSRange)a4 replacementString:(id)a5 state:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  NSWritingToolsProofreadingSuggestion *v11;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v13.receiver = self;
  v13.super_class = (Class)NSWritingToolsProofreadingSuggestion;
  v11 = -[NSWritingToolsProofreadingSuggestion init](&v13, sel_init);
  if (v11)
  {
    v11->_uuid = (NSUUID *)a3;
    v11->_originalRange.location = location;
    v11->_originalRange.length = length;
    v11->_replacementString = (NSAttributedString *)objc_msgSend(a5, "copy");
    v11->_lengthDelta = objc_msgSend(a5, "length") - length;
    v11->_state = a6;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSWritingToolsProofreadingSuggestion;
  -[NSWritingToolsProofreadingSuggestion dealloc](&v3, sel_dealloc);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (_NSRange)originalRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_originalRange.length;
  location = self->_originalRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSAttributedString)replacementString
{
  return self->_replacementString;
}

- (int64_t)lengthDelta
{
  return self->_lengthDelta;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end
