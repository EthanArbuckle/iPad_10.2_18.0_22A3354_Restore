@implementation PKCloudStoreRecordFetchTask

- (PKCloudStoreRecordFetchTask)initWithType:(unint64_t)a3
{
  PKCloudStoreRecordFetchTask *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCloudStoreRecordFetchTask;
  result = -[PKCloudStoreRecordFetchTask init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (PKCloudStoreRecordFetchTask)initWithTransactionSourceIdentifier:(id)a3 type:(unint64_t)a4
{
  id v7;
  PKCloudStoreRecordFetchTask *v8;
  PKCloudStoreRecordFetchTask *v9;

  v7 = a3;
  v8 = -[PKCloudStoreRecordFetchTask initWithType:](self, "initWithType:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_transactionSourceIdentifier, a3);

  return v9;
}

- (PKCloudStoreRecordFetchTask)initWithCloudStoreZone:(id)a3 type:(unint64_t)a4
{
  id v7;
  PKCloudStoreRecordFetchTask *v8;
  PKCloudStoreRecordFetchTask *v9;

  v7 = a3;
  v8 = -[PKCloudStoreRecordFetchTask initWithType:](self, "initWithType:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_cloudStoreZone, a3);

  return v9;
}

- (id)identifier
{
  NSString *transactionSourceIdentifier;
  PKCloudStoreZone *cloudStoreZone;
  __CFString *v5;

  transactionSourceIdentifier = self->_transactionSourceIdentifier;
  if (transactionSourceIdentifier)
    return transactionSourceIdentifier;
  cloudStoreZone = self->_cloudStoreZone;
  if (cloudStoreZone)
  {
    -[PKCloudStoreZone zoneName](cloudStoreZone, "zoneName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E2ADF4C0;
  }
  return v5;
}

- (void)startTask
{
  NSDate *v3;
  NSDate *startDate;
  NSDate *endDate;
  NSError *lastError;
  NSDate *nextPossibleFetchDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v3;

  endDate = self->_endDate;
  self->_endDate = 0;

  lastError = self->_lastError;
  self->_lastError = 0;

  nextPossibleFetchDate = self->_nextPossibleFetchDate;
  self->_nextPossibleFetchDate = 0;

  self->_status = 1;
}

- (void)queueTask
{
  NSDate *v3;
  NSDate *startDate;
  NSDate *endDate;
  NSError *lastError;
  NSDate *nextPossibleFetchDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v3;

  endDate = self->_endDate;
  self->_endDate = 0;

  lastError = self->_lastError;
  self->_lastError = 0;

  nextPossibleFetchDate = self->_nextPossibleFetchDate;
  self->_nextPossibleFetchDate = 0;

  self->_status = 4;
}

- (void)completeTaskWithError:(id)a3
{
  NSDate *v5;
  NSDate *endDate;
  unint64_t v7;
  BOOL v8;
  int64_t backoffLevel;
  uint64_t v10;
  NSDate *v11;
  NSDate *nextPossibleFetchDate;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endDate = self->_endDate;
  self->_endDate = v5;

  v7 = 2;
  if (v13)
    v7 = 3;
  self->_status = v7;
  objc_storeStrong((id *)&self->_lastError, a3);
  v8 = -[PKCloudStoreRecordFetchTask lastErrorIsSetupAssistantNotComplete](self, "lastErrorIsSetupAssistantNotComplete");
  if (self->_status != 3 || v8)
  {
    nextPossibleFetchDate = self->_nextPossibleFetchDate;
    self->_backoffLevel = 0;
    self->_nextPossibleFetchDate = 0;
  }
  else
  {
    backoffLevel = self->_backoffLevel;
    self->_backoffLevel = backoffLevel + 1;
    if ((unint64_t)(backoffLevel + 1) < 0xD)
      v10 = backoffLevel + 1;
    else
      v10 = 13;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", PKCloudStoreRecordFetchTaskBackOffLevelIntervals[v10]);
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    nextPossibleFetchDate = self->_nextPossibleFetchDate;
    self->_nextPossibleFetchDate = v11;
  }

}

- (BOOL)lastErrorIsSetupAssistantNotComplete
{
  NSError *lastError;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  BOOL v7;
  BOOL v8;
  int v9;

  lastError = self->_lastError;
  if (lastError)
  {
    -[NSError domain](lastError, "domain");
    v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("PKPassKitErrorDomain");
    if (v4 != v5)
    {
      v6 = v5;
      if (v4)
        v7 = v5 == 0;
      else
        v7 = 1;
      if (v7)
      {

      }
      else
      {
        v9 = -[__CFString isEqualToString:](v4, "isEqualToString:", v5);

        if (v9)
          goto LABEL_12;
      }
      v8 = 0;
      goto LABEL_14;
    }

LABEL_12:
    v8 = -[NSError code](self->_lastError, "code") == -4016;
LABEL_14:

    return v8;
  }
  return 0;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  v5 = self->_type - 1;
  if (v5 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD2A70[v5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("type"));
  v7 = self->_status - 1;
  if (v7 > 3)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2AD2A88[v7];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("status"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));
  -[PKCloudStoreZone zoneName](self->_cloudStoreZone, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("cloudStoreZone"));

  -[NSDate description](self->_startDate, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("startDate"));

  -[NSDate description](self->_endDate, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("endDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_backoffLevel);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("backoffLevel"));

  -[NSDate description](self->_nextPossibleFetchDate, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("nextPossibleFetchDate"));

  -[NSError description](self->_lastError, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("lastError"));

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreRecordFetchTask)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreRecordFetchTask *v5;
  uint64_t v6;
  NSString *transactionSourceIdentifier;
  uint64_t v8;
  PKCloudStoreZone *cloudStoreZone;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSDate *endDate;
  uint64_t v14;
  NSDate *nextPossibleFetchDate;
  uint64_t v16;
  NSError *lastError;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKCloudStoreRecordFetchTask;
  v5 = -[PKCloudStoreRecordFetchTask init](&v19, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionSourceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudStoreZone"));
    v8 = objc_claimAutoreleasedReturnValue();
    cloudStoreZone = v5->_cloudStoreZone;
    v5->_cloudStoreZone = (PKCloudStoreZone *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    v5->_backoffLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backoffLevel"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextPossibleFetchDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    nextPossibleFetchDate = v5->_nextPossibleFetchDate;
    v5->_nextPossibleFetchDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastError"));
    v16 = objc_claimAutoreleasedReturnValue();
    lastError = v5->_lastError;
    v5->_lastError = (NSError *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudStoreZone, CFSTR("cloudStoreZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_backoffLevel, CFSTR("backoffLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextPossibleFetchDate, CFSTR("nextPossibleFetchDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastError, CFSTR("lastError"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCloudStoreRecordFetchTask *v5;
  uint64_t v6;
  NSString *transactionSourceIdentifier;
  PKCloudStoreZone *v8;
  PKCloudStoreZone *cloudStoreZone;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSDate *endDate;
  uint64_t v14;
  NSDate *nextPossibleFetchDate;
  uint64_t v16;
  NSError *lastError;

  v5 = -[PKCloudStoreRecordFetchTask init](+[PKCloudStoreRecordFetchTask allocWithZone:](PKCloudStoreRecordFetchTask, "allocWithZone:"), "init");
  v5->_type = self->_type;
  v5->_status = self->_status;
  v6 = -[NSString copyWithZone:](self->_transactionSourceIdentifier, "copyWithZone:", a3);
  transactionSourceIdentifier = v5->_transactionSourceIdentifier;
  v5->_transactionSourceIdentifier = (NSString *)v6;

  v8 = -[PKCloudStoreZone copyWithZone:](self->_cloudStoreZone, "copyWithZone:", a3);
  cloudStoreZone = v5->_cloudStoreZone;
  v5->_cloudStoreZone = v8;

  v10 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v10;

  v12 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  endDate = v5->_endDate;
  v5->_endDate = (NSDate *)v12;

  v5->_backoffLevel = self->_backoffLevel;
  v14 = -[NSDate copyWithZone:](self->_nextPossibleFetchDate, "copyWithZone:", a3);
  nextPossibleFetchDate = v5->_nextPossibleFetchDate;
  v5->_nextPossibleFetchDate = (NSDate *)v14;

  v16 = -[NSError copyWithZone:](self->_lastError, "copyWithZone:", a3);
  lastError = v5->_lastError;
  v5->_lastError = (NSError *)v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  _BOOL4 v12;
  PKCloudStoreZone *cloudStoreZone;
  PKCloudStoreZone *v14;
  NSDate *startDate;
  NSDate *v16;
  NSDate *endDate;
  NSDate *v18;
  NSDate *nextPossibleFetchDate;
  NSDate *v20;
  NSError *lastError;
  NSError *v22;
  char v23;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6 || self->_type != v6[1] || self->_status != v6[2])
    goto LABEL_37;
  v8 = (void *)v6[3];
  v9 = self->_transactionSourceIdentifier;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_37;
    }
    v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_37;
  }
  cloudStoreZone = self->_cloudStoreZone;
  v14 = (PKCloudStoreZone *)v7[4];
  if (cloudStoreZone && v14)
  {
    if (!-[PKCloudStoreZone isEqual:](cloudStoreZone, "isEqual:"))
      goto LABEL_37;
  }
  else if (cloudStoreZone != v14)
  {
    goto LABEL_37;
  }
  startDate = self->_startDate;
  v16 = (NSDate *)v7[5];
  if (startDate && v16)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
      goto LABEL_37;
  }
  else if (startDate != v16)
  {
    goto LABEL_37;
  }
  endDate = self->_endDate;
  v18 = (NSDate *)v7[6];
  if (endDate && v18)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0)
      goto LABEL_37;
  }
  else if (endDate != v18)
  {
    goto LABEL_37;
  }
  if (self->_backoffLevel != v7[7])
    goto LABEL_37;
  nextPossibleFetchDate = self->_nextPossibleFetchDate;
  v20 = (NSDate *)v7[8];
  if (!nextPossibleFetchDate || !v20)
  {
    if (nextPossibleFetchDate == v20)
      goto LABEL_33;
LABEL_37:
    v23 = 0;
    goto LABEL_38;
  }
  if ((-[NSDate isEqual:](nextPossibleFetchDate, "isEqual:") & 1) == 0)
    goto LABEL_37;
LABEL_33:
  lastError = self->_lastError;
  v22 = (NSError *)v7[9];
  if (lastError && v22)
    v23 = -[NSError isEqual:](lastError, "isEqual:");
  else
    v23 = lastError == v22;
LABEL_38:

  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_transactionSourceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_cloudStoreZone);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endDate);
  objc_msgSend(v3, "safelyAddObject:", self->_lastError);
  objc_msgSend(v3, "safelyAddObject:", self->_nextPossibleFetchDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_status - v5 + 32 * v5;
  v7 = self->_backoffLevel - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  PKCloudStoreZone *cloudStoreZone;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = self->_type - 1;
  if (v5 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD2A70[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  v7 = self->_status - 1;
  if (v7 > 3)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2AD2A88[v7];
  objc_msgSend(v4, "appendFormat:", CFSTR("status: '%@'; "), v8);
  if (self->_transactionSourceIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("transactionSourceIdentifier: '%@'; "), self->_transactionSourceIdentifier);
  cloudStoreZone = self->_cloudStoreZone;
  if (cloudStoreZone)
  {
    -[PKCloudStoreZone zoneName](cloudStoreZone, "zoneName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("cloudStoreZone: '%@'; "), v10);

  }
  objc_msgSend(v4, "appendFormat:", CFSTR("startDate: '%@'; "), self->_startDate);
  if (self->_endDate)
    objc_msgSend(v4, "appendFormat:", CFSTR("endDate: '%@'; "), self->_endDate);
  if (self->_lastError)
    objc_msgSend(v4, "appendFormat:", CFSTR("lastError: '%@'; "), self->_lastError);
  if (self->_backoffLevel >= 1)
    objc_msgSend(v4, "appendFormat:", CFSTR("backoffLevel: %ld; "), self->_backoffLevel);
  if (self->_nextPossibleFetchDate)
    objc_msgSend(v4, "appendFormat:", CFSTR("nextPossibleFetchDate: '%@'; "), self->_nextPossibleFetchDate);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKCloudStoreZone)cloudStoreZone
{
  return self->_cloudStoreZone;
}

- (void)setCloudStoreZone:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStoreZone, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)backoffLevel
{
  return self->_backoffLevel;
}

- (void)setBackoffLevel:(int64_t)a3
{
  self->_backoffLevel = a3;
}

- (NSDate)nextPossibleFetchDate
{
  return self->_nextPossibleFetchDate;
}

- (void)setNextPossibleFetchDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_nextPossibleFetchDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_cloudStoreZone, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
}

@end
