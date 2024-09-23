@implementation PLNSUUIDJournalEntryPayloadID

- (PLNSUUIDJournalEntryPayloadID)initWithUUIDBytes:(unsigned __int8)a3[16]
{
  PLNSUUIDJournalEntryPayloadID *v4;
  uint64_t v5;
  NSUUID *payloadID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLNSUUIDJournalEntryPayloadID;
  v4 = -[PLNSUUIDJournalEntryPayloadID init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3);
    payloadID = v4->_payloadID;
    v4->_payloadID = (NSUUID *)v5;

  }
  return v4;
}

- (PLNSUUIDJournalEntryPayloadID)initWithUUIDString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PLNSUUIDJournalEntryPayloadID *v7;
  PLNSUUIDJournalEntryPayloadID *v8;
  objc_super v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)PLNSUUIDJournalEntryPayloadID;
    v7 = -[PLNSUUIDJournalEntryPayloadID init](&v10, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_payloadID, v6);
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_payloadID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PLNSUUIDJournalEntryPayloadID *v4;
  uint64_t v5;
  char v6;

  v4 = (PLNSUUIDJournalEntryPayloadID *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
      v6 = -[NSUUID isEqual:](self->_payloadID, "isEqual:", v4->_payloadID);
    else
      v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)-[NSUUID description](self->_payloadID, "description");
}

- (id)payloadIDString
{
  return -[NSUUID UUIDString](self->_payloadID, "UUIDString");
}

- (id)payloadUUIDData
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  v3[1] = 0;
  -[NSUUID getUUIDBytes:](self->_payloadID, "getUUIDBytes:", v3);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadID, 0);
}

@end
