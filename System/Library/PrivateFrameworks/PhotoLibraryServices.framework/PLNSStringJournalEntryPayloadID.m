@implementation PLNSStringJournalEntryPayloadID

- (PLNSStringJournalEntryPayloadID)initWithString:(id)a3
{
  id v4;
  PLNSStringJournalEntryPayloadID *v5;
  uint64_t v6;
  NSString *payloadID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLNSStringJournalEntryPayloadID;
  v5 = -[PLNSStringJournalEntryPayloadID init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    payloadID = v5->_payloadID;
    v5->_payloadID = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_payloadID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PLNSStringJournalEntryPayloadID *v4;
  uint64_t v5;
  char v6;

  v4 = (PLNSStringJournalEntryPayloadID *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
      v6 = -[NSString isEqual:](self->_payloadID, "isEqual:", v4->_payloadID);
    else
      v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return -[NSString description](self->_payloadID, "description");
}

- (id)payloadIDString
{
  return self->_payloadID;
}

- (id)payloadUUIDData
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadID, 0);
}

@end
