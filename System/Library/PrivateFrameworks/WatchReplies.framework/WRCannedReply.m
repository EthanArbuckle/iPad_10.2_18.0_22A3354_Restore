@implementation WRCannedReply

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)defaultReplyText
{
  return self->_defaultReplyText;
}

- (void)setDefaultReplyText:(id)a3
{
  objc_storeStrong((id *)&self->_defaultReplyText, a3);
}

- (NSString)defaultReplyKey
{
  return self->_defaultReplyKey;
}

- (void)setDefaultReplyKey:(id)a3
{
  objc_storeStrong((id *)&self->_defaultReplyKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultReplyKey, 0);
  objc_storeStrong((id *)&self->_defaultReplyText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
