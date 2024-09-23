@implementation WFCloudKitSyncEvent

- (WFCloudKitSyncEvent)initWithIdentifier:(int)a3 eventType:(int)a4 date:(id)a5 content:(id)a6
{
  id v11;
  id v12;
  WFCloudKitSyncEvent *v13;
  WFCloudKitSyncEvent *v14;
  WFCloudKitSyncEvent *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WFCloudKitSyncEvent;
  v13 = -[WFCloudKitSyncEvent init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_identifier = a3;
    v13->_eventType = a4;
    objc_storeStrong((id *)&v13->_date, a5);
    objc_storeStrong((id *)&v14->_content, a6);
    v15 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[WFCloudKitSyncEvent identifier](self, "identifier");
  v5 = -[WFCloudKitSyncEvent eventType](self, "eventType") - 1;
  if (v5 > 0xA)
    v6 = CFSTR("RecordFetch");
  else
    v6 = off_1E7AEBCF0[v5];
  -[WFCloudKitSyncEvent date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEvent content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%i: %@, date: %@ (%@)>"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)identifier
{
  return self->_identifier;
}

- (int)eventType
{
  return self->_eventType;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDictionary)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
