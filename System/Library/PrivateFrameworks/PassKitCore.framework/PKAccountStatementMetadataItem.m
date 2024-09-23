@implementation PKAccountStatementMetadataItem

- (PKAccountStatementMetadataItem)initWithDictionary:(id)a3
{
  id v4;
  PKAccountStatementMetadataItem *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *originatorAltDSID;
  uint64_t v12;
  NSString *zoneName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountStatementMetadataItem;
  v5 = -[PKAccountStatementMetadataItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKAccountStatementMetadataItemTypeFromString(v8);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountEventType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accountEventType = PKAccountEventTypeFromString(v9);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("originatorAltDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("zoneName"));
    v12 = objc_claimAutoreleasedReturnValue();
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v12;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  unint64_t type;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  unint64_t status;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t error;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "safelySetObject:forKey:", self->_identifier, CFSTR("identifier"));
  type = self->_type;
  v5 = CFSTR("unknown");
  v6 = CFSTR("accountEvent");
  if (type != 2)
    v6 = CFSTR("unknown");
  if (type == 1)
    v7 = CFSTR("transaction");
  else
    v7 = v6;
  objc_msgSend(v3, "safelySetObject:forKey:", v7, CFSTR("type"));
  PKAccountEventTypeToString(self->_accountEventType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v8, CFSTR("accountEventType"));

  objc_msgSend(v3, "safelySetObject:forKey:", self->_originatorAltDSID, CFSTR("originatorAltDSID"));
  objc_msgSend(v3, "safelySetObject:forKey:", self->_zoneName, CFSTR("zoneName"));
  status = self->_status;
  v10 = CFSTR("missing");
  if (status != 2)
    v10 = CFSTR("unknown");
  if (status == 1)
    v11 = CFSTR("onDevice");
  else
    v11 = v10;
  objc_msgSend(v3, "safelySetObject:forKey:", v11, CFSTR("status"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasBeenProcessed);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v12, CFSTR("hasBeenProcessed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_processedAttemptCount);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v13, CFSTR("processedAttemptCount"));

  PKISO8601DateStringFromDate(self->_lastProcessedDate);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v14, CFSTR("lastProcessedDate"));

  PKISO8601DateStringFromDate(self->_lastReportDate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v15, CFSTR("lastReportDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reportCount);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelySetObject:forKey:", v16, CFSTR("reportCount"));

  error = self->_error;
  if (error <= 2)
    v5 = off_1E2ADBDD8[error];
  objc_msgSend(v3, "safelySetObject:forKey:", v5, CFSTR("error"));
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountStatementMetadataItem)initWithCoder:(id)a3
{
  id v4;
  PKAccountStatementMetadataItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *originatorAltDSID;
  uint64_t v10;
  NSString *zoneName;
  uint64_t v12;
  NSDate *lastProcessedDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountStatementMetadataItem;
  v5 = -[PKAccountStatementMetadataItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_accountEventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accountEventType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatorAltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
    v10 = objc_claimAutoreleasedReturnValue();
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v10;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_hasBeenProcessed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBeenProcessed"));
    v5->_processedAttemptCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("processedAttemptCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastProcessedDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastProcessedDate = v5->_lastProcessedDate;
    v5->_lastProcessedDate = (NSDate *)v12;

    v5->_lastReportDate = (NSDate *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastReportDate"));
    v5->_error = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("error"));
    v5->_reportCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reportCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accountEventType, CFSTR("accountEventType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatorAltDSID, CFSTR("originatorAltDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zoneName, CFSTR("zoneName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasBeenProcessed, CFSTR("hasBeenProcessed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_processedAttemptCount, CFSTR("processedAttemptCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastProcessedDate, CFSTR("lastProcessedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastReportDate, CFSTR("lastReportDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reportCount, CFSTR("reportCount"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  void *v10;
  NSString *v11;
  _BOOL4 v12;
  void *v13;
  NSString *v14;
  _BOOL4 v15;
  BOOL v16;
  NSDate *lastProcessedDate;
  NSDate *v19;
  NSDate *lastReportDate;
  NSDate *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_20;
  v5 = (void *)v4[2];
  v6 = self->_identifier;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
      goto LABEL_19;
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_20;
  }
  v10 = (void *)v4[5];
  v6 = self->_originatorAltDSID;
  v11 = v10;
  if (v6 == v11)
  {

  }
  else
  {
    v8 = v11;
    if (!v6 || !v11)
      goto LABEL_19;
    v12 = -[NSString isEqualToString:](v6, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_20;
  }
  v13 = (void *)v4[6];
  v6 = self->_zoneName;
  v14 = v13;
  if (v6 != v14)
  {
    v8 = v14;
    if (v6 && v14)
    {
      v15 = -[NSString isEqualToString:](v6, "isEqualToString:", v14);

      if (!v15)
        goto LABEL_20;
      goto LABEL_23;
    }
LABEL_19:

    goto LABEL_20;
  }

LABEL_23:
  lastProcessedDate = self->_lastProcessedDate;
  v19 = (NSDate *)v4[9];
  if (lastProcessedDate && v19)
  {
    if ((-[NSDate isEqual:](lastProcessedDate, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (lastProcessedDate != v19)
  {
    goto LABEL_20;
  }
  lastReportDate = self->_lastReportDate;
  v21 = (NSDate *)v4[10];
  if (lastReportDate && v21)
  {
    if ((-[NSDate isEqual:](lastReportDate, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (lastReportDate != v21)
  {
    goto LABEL_20;
  }
  if (self->_status == v4[7]
    && self->_type == v4[3]
    && self->_accountEventType == v4[4]
    && self->_hasBeenProcessed == *((unsigned __int8 *)v4 + 8)
    && self->_processedAttemptCount == v4[8]
    && self->_reportCount == v4[11])
  {
    v16 = self->_error == v4[12];
    goto LABEL_21;
  }
LABEL_20:
  v16 = 0;
LABEL_21:

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_originatorAltDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_zoneName);
  objc_msgSend(v3, "safelyAddObject:", self->_lastProcessedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_lastReportDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_status - v4 + 32 * v4;
  v6 = self->_type - v5 + 32 * v5;
  v7 = self->_accountEventType - v6 + 32 * v6;
  v8 = self->_hasBeenProcessed - v7 + 32 * v7;
  v9 = self->_processedAttemptCount - v8 + 32 * v8;
  v10 = self->_error - v9 + 32 * v9;
  v11 = self->_reportCount - v10 + 32 * v10;

  return v11;
}

- (id)description
{
  void *v3;
  unint64_t type;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  unint64_t status;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  unint64_t error;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  type = self->_type;
  v5 = CFSTR("unknown");
  v6 = CFSTR("accountEvent");
  if (type != 2)
    v6 = CFSTR("unknown");
  if (type == 1)
    v7 = CFSTR("transaction");
  else
    v7 = v6;
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v7);
  PKAccountEventTypeToString(self->_accountEventType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountEventType: '%@'; "), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("originatorAltDSID: '%@'; "), self->_originatorAltDSID);
  objc_msgSend(v3, "appendFormat:", CFSTR("zoneName: '%@'; "), self->_zoneName);
  status = self->_status;
  v10 = CFSTR("missing");
  if (status != 2)
    v10 = CFSTR("unknown");
  if (status == 1)
    v11 = CFSTR("onDevice");
  else
    v11 = v10;
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v11);
  if (self->_hasBeenProcessed)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasBeenProcessed: '%@'; "), v12);
  objc_msgSend(v3, "appendFormat:", CFSTR("processedAttemptCount: %ld; "), self->_processedAttemptCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastProcessedDate: '%@'; "), self->_lastProcessedDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastReportDate: '%@'; "), self->_lastReportDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("reportCount: %ld; "), self->_reportCount);
  error = self->_error;
  if (error <= 2)
    v5 = off_1E2ADBDD8[error];
  objc_msgSend(v3, "appendFormat:", CFSTR("error: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_originatorAltDSID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSDate copyWithZone:](self->_lastProcessedDate, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  *(_QWORD *)(v5 + 56) = self->_status;
  *(_QWORD *)(v5 + 24) = self->_type;
  *(_QWORD *)(v5 + 32) = self->_accountEventType;
  *(_BYTE *)(v5 + 8) = self->_hasBeenProcessed;
  *(_QWORD *)(v5 + 64) = self->_processedAttemptCount;
  *(_QWORD *)(v5 + 96) = self->_error;
  return (id)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (int64_t)accountEventType
{
  return self->_accountEventType;
}

- (void)setAccountEventType:(int64_t)a3
{
  self->_accountEventType = a3;
}

- (NSString)originatorAltDSID
{
  return self->_originatorAltDSID;
}

- (void)setOriginatorAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (BOOL)hasBeenProcessed
{
  return self->_hasBeenProcessed;
}

- (void)setHasBeenProcessed:(BOOL)a3
{
  self->_hasBeenProcessed = a3;
}

- (int64_t)processedAttemptCount
{
  return self->_processedAttemptCount;
}

- (void)setProcessedAttemptCount:(int64_t)a3
{
  self->_processedAttemptCount = a3;
}

- (NSDate)lastProcessedDate
{
  return self->_lastProcessedDate;
}

- (void)setLastProcessedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)lastReportDate
{
  return self->_lastReportDate;
}

- (void)setLastReportDate:(id)a3
{
  self->_lastReportDate = (NSDate *)a3;
}

- (int64_t)reportCount
{
  return self->_reportCount;
}

- (void)setReportCount:(int64_t)a3
{
  self->_reportCount = a3;
}

- (unint64_t)error
{
  return self->_error;
}

- (void)setError:(unint64_t)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_originatorAltDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
