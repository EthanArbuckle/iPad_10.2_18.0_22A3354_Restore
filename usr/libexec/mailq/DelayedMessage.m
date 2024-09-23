@implementation DelayedMessage

- (EFCancelable)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MFLibraryMessage)outboxCopy
{
  return self->_outboxCopy;
}

- (void)setOutboxCopy:(id)a3
{
  objc_storeStrong((id *)&self->_outboxCopy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outboxCopy, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
