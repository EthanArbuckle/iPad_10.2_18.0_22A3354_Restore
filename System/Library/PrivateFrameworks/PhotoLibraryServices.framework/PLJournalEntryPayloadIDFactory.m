@implementation PLJournalEntryPayloadIDFactory

+ (id)payloadIDWithUUIDBytes:(unsigned __int8)a3[16]
{
  return -[PLNSUUIDJournalEntryPayloadID initWithUUIDBytes:]([PLNSUUIDJournalEntryPayloadID alloc], "initWithUUIDBytes:", a3);
}

+ (id)payloadIDWithUUIDString:(id)a3
{
  id v3;
  PLNSUUIDJournalEntryPayloadID *v4;
  PLNSUUIDJournalEntryPayloadID *v5;
  PLNSStringJournalEntryPayloadID *v6;
  PLNSStringJournalEntryPayloadID *v7;

  v3 = a3;
  if (v3)
  {
    v4 = -[PLNSUUIDJournalEntryPayloadID initWithUUIDString:]([PLNSUUIDJournalEntryPayloadID alloc], "initWithUUIDString:", v3);
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = -[PLNSStringJournalEntryPayloadID initWithString:]([PLNSStringJournalEntryPayloadID alloc], "initWithString:", v3);
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)payloadIDWithString:(id)a3
{
  id v3;
  PLNSStringJournalEntryPayloadID *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[PLNSStringJournalEntryPayloadID initWithString:]([PLNSStringJournalEntryPayloadID alloc], "initWithString:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
