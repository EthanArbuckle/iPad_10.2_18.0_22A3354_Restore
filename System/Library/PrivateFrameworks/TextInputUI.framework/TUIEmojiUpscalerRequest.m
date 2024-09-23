@implementation TUIEmojiUpscalerRequest

- (NSString)emoji
{
  return self->_emoji;
}

- (void)setEmoji:(id)a3
{
  objc_storeStrong((id *)&self->_emoji, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
}

@end
