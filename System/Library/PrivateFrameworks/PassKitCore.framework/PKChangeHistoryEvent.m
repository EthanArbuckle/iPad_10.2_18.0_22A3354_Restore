@implementation PKChangeHistoryEvent

- (PKChangeHistoryEvent)init
{
  PKChangeHistoryEvent *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKChangeHistoryEvent;
  v2 = -[PKChangeHistoryEvent init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (PKChangeHistoryEvent)initWithType:(int64_t)a3 recordType:(int64_t)a4 recordUniqueID:(id)a5 timestamp:(id)a6
{
  id v11;
  id v12;
  PKChangeHistoryEvent *v13;
  void *v14;
  uint64_t v15;
  NSString *identifier;
  objc_super v18;

  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKChangeHistoryEvent;
  v13 = -[PKChangeHistoryEvent init](&v18, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v15;

    v13->_type = a3;
    v13->_recordType = a4;
    objc_storeStrong((id *)&v13->_recordUniqueID, a5);
    objc_storeStrong((id *)&v13->_timestamp, a6);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PKChangeHistoryEvent *v4;
  PKChangeHistoryEvent *v5;
  PKChangeHistoryEvent *v6;
  NSString *identifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  char v12;
  NSString *recordUniqueID;
  NSString *v14;
  _BOOL4 v15;
  NSDate *timestamp;
  NSDate *v18;

  v4 = (PKChangeHistoryEvent *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        identifier = v6->_identifier;
        v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_19;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_20;
        }
        if (self->_type != v6->_type || self->_recordType != v6->_recordType)
          goto LABEL_20;
        recordUniqueID = v6->_recordUniqueID;
        v8 = self->_recordUniqueID;
        v14 = recordUniqueID;
        if (v8 == v14)
        {

LABEL_24:
          timestamp = self->_timestamp;
          v18 = v6->_timestamp;
          if (timestamp && v18)
            v12 = -[NSDate isEqual:](timestamp, "isEqual:");
          else
            v12 = timestamp == v18;
          goto LABEL_21;
        }
        v10 = v14;
        if (v8 && v14)
        {
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (v15)
            goto LABEL_24;
LABEL_20:
          v12 = 0;
LABEL_21:

          goto LABEL_22;
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    v12 = 0;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSString *recordUniqueID;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  recordUniqueID = self->_recordUniqueID;
  v3 = self->_recordType - self->_type + 32 * self->_type + 16337;
  v7[0] = self->_identifier;
  v7[1] = recordUniqueID;
  v7[2] = self->_timestamp;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKCombinedHash(v3, v4);

  return v5;
}

- (id)description
{
  unint64_t type;
  const __CFString *v3;
  const __CFString *v4;
  int64_t recordType;

  type = self->_type;
  if (type > 2)
    v3 = CFSTR("unknown-event-type");
  else
    v3 = off_1E2AD9890[type];
  v4 = CFSTR("unknown-record-type");
  recordType = self->_recordType;
  if (recordType == 1)
    v4 = CFSTR("PKChangedRecordTypeCatalog");
  if (!recordType)
    v4 = CFSTR("PKChangedRecordTypePass");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier: %@, type: %@, recordType: %@, recordUniqueID: %@, timestamp: %@"), self->_identifier, v3, v4, self->_recordUniqueID, self->_timestamp);
}

- (BOOL)representsPassAddition
{
  return !self->_recordType && self->_type == 0;
}

- (BOOL)representsPassUpdate
{
  return !self->_recordType && self->_type == 1;
}

- (BOOL)representsPassRemoval
{
  return !self->_recordType && self->_type == 2;
}

- (BOOL)representsCatalogUpdate
{
  return self->_recordType == 1 && self->_type == 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(int64_t)a3
{
  self->_recordType = a3;
}

- (NSString)recordUniqueID
{
  return self->_recordUniqueID;
}

- (void)setRecordUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_recordUniqueID, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_recordUniqueID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
