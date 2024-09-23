@implementation PLSearchIndexingEvent

- (PLSearchIndexingEvent)initWithDonationCount:(unint64_t)a3 deletionCount:(unint64_t)a4 timestamp:(id)a5 sampleIdentifier:(id)a6
{
  id v10;
  id v11;
  PLSearchIndexingEvent *v12;
  PLSearchIndexingEvent *v13;
  uint64_t v14;
  NSDate *timestamp;
  uint64_t v16;
  NSString *sampleIdentifier;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PLSearchIndexingEvent;
  v12 = -[PLSearchIndexingEvent init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_donationCount = a3;
    v12->_deletionCount = a4;
    v14 = objc_msgSend(v10, "copy");
    timestamp = v13->_timestamp;
    v13->_timestamp = (NSDate *)v14;

    v16 = objc_msgSend(v11, "copy");
    sampleIdentifier = v13->_sampleIdentifier;
    v13->_sampleIdentifier = (NSString *)v16;

  }
  return v13;
}

- (PLSearchIndexingEvent)initWithError:(id)a3
{
  id v4;
  PLSearchIndexingEvent *v5;
  uint64_t v6;
  NSError *error;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchIndexingEvent;
  v5 = -[PLSearchIndexingEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    error = v5->_error;
    v5->_error = (NSError *)v6;

  }
  return v5;
}

- (id)description
{
  NSError *error;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  error = self->_error;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (error)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> Donation failure, error: %@"), v6, self, self->_error, v10, v11, v12);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> Donation success, donation count: %lu, deletion count: %lu, timestamp: %@ sample identifier: %@"), v6, self, self->_donationCount, self->_deletionCount, self->_timestamp, self->_sampleIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)donationCount
{
  return self->_donationCount;
}

- (unint64_t)deletionCount
{
  return self->_deletionCount;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)sampleIdentifier
{
  return self->_sampleIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sampleIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (id)autoBugCaptureEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  getkSymptomDiagnosticKeyEventName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("SearchIndexDonation"), v4);

  -[PLSearchIndexingEvent error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[PLSearchIndexingEvent error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchIndexingEvent error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Failure - %@ - %lu"), v8, objc_msgSend(v9, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getkSymptomDiagnosticKeyEventResult();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    getkSymptomDiagnosticKeyTimestamp();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

  }
  else
  {
    getkSymptomDiagnosticKeyEventResult();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Success"), v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLSearchIndexingEvent donationCount](self, "donationCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    getkSymptomDiagnosticKeyEventCount();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v18);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLSearchIndexingEvent deletionCount](self, "deletionCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("DeletionCount"));

    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[PLSearchIndexingEvent timestamp](self, "timestamp");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    objc_msgSend(v20, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    getkSymptomDiagnosticKeyTimestamp();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v23);

    -[PLSearchIndexingEvent sampleIdentifier](self, "sampleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("SampleIdentifier"));
  }

  v24 = (void *)objc_msgSend(v3, "copy");
  return v24;
}

@end
