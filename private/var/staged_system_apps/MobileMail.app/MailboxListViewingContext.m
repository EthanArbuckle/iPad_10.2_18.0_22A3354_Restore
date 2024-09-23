@implementation MailboxListViewingContext

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (id)selectionTarget
{
  return self->_selectionTarget;
}

- (void)setSelectionTarget:(id)a3
{
  objc_storeStrong(&self->_selectionTarget, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionTarget, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
