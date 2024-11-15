@implementation TransferMailboxContext

- (TransferMailboxContext)initWithMailbox:(id)a3 mailboxURLString:(id)a4 messageListItems:(id)a5
{
  id v9;
  id v10;
  id v11;
  TransferMailboxContext *v12;
  TransferMailboxContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TransferMailboxContext;
  v12 = -[TransferMailboxContext init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mailbox, a3);
    objc_storeStrong((id *)&v13->_mailboxURLString, a4);
    objc_storeStrong((id *)&v13->_messageListItems, a5);
  }

  return v13;
}

- (EMMailbox)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_mailbox, a3);
}

- (NSString)mailboxURLString
{
  return self->_mailboxURLString;
}

- (void)setMailboxURLString:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxURLString, a3);
}

- (NSSet)messageListItems
{
  return self->_messageListItems;
}

- (void)setMessageListItems:(id)a3
{
  objc_storeStrong((id *)&self->_messageListItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListItems, 0);
  objc_storeStrong((id *)&self->_mailboxURLString, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
}

@end
