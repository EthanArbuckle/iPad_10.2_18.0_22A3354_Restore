@implementation _UITextPlaceholderAttachment

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return 0;
}

- (_NSRange)attachmentRange
{
  _NSRange *p_attachmentRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_attachmentRange = &self->_attachmentRange;
  location = self->_attachmentRange.location;
  length = p_attachmentRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setAttachmentRange:(_NSRange)a3
{
  self->_attachmentRange = a3;
}

- (NSDictionary)typingAttributesBeforeInsertion
{
  return self->_typingAttributesBeforeInsertion;
}

- (void)setTypingAttributesBeforeInsertion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingAttributesBeforeInsertion, 0);
}

@end
