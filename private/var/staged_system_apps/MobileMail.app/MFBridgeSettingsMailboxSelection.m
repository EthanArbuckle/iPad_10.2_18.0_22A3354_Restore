@implementation MFBridgeSettingsMailboxSelection

- (id)description
{
  void *v3;
  unint64_t inboxesFilterTypes;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("Mailbox Selection: \n")));
  objc_msgSend(v3, "appendFormat:", CFSTR("Selected mailboxes id: %@\n"), self->_selectedMailboxes);
  inboxesFilterTypes = self->_inboxesFilterTypes;
  if ((inboxesFilterTypes & 1) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("Unified mailbox selected \n"));
    inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 2) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("VIP mailbox selected \n"));
    inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 8) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("Unread mailbox selected \n"));
    inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 4) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("Flagged mailbox selected \n"));
    inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 0x10) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("ToOrCC mailbox selected \n"));
    inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 0x20) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("Important Threads mailbox selected \n"));
    inboxesFilterTypes = self->_inboxesFilterTypes;
  }
  if ((inboxesFilterTypes & 0x40) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("Today mailbox selected \n"));
  return v3;
}

- (unint64_t)inboxesFilterTypes
{
  return self->_inboxesFilterTypes;
}

- (void)setInboxesFilterTypes:(unint64_t)a3
{
  self->_inboxesFilterTypes = a3;
}

- (NSSet)selectedMailboxes
{
  return self->_selectedMailboxes;
}

- (void)setSelectedMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMailboxes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMailboxes, 0);
}

@end
