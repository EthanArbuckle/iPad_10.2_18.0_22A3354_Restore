@implementation ODCurareDKEvent

- (ODCurareDKEvent)initWithDKEvent:(id)a3
{
  id v4;
  ODCurareDKEvent *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  void *v13;
  uint64_t v14;
  NSArray *metadata;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODCurareDKEvent;
  v5 = -[ODCurareDKEvent init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "startDate");
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "endDate");
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    objc_msgSend(v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    objc_msgSend(v4, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ODCurareEvaluationAndReporting-MetadataDataKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSArray *)v14;

  }
  return v5;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)metadata
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
