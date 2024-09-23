@implementation ICSharedListeningConnectionReportEvent

- (ICSharedListeningConnectionReportEvent)initWithName:(id)a3
{
  id v5;
  ICSharedListeningConnectionReportEvent *v6;
  ICSharedListeningConnectionReportEvent *v7;
  uint64_t v8;
  NSDate *startDate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICSharedListeningConnectionReportEvent;
  v6 = -[ICSharedListeningConnectionReportEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v7->_startDate;
    v7->_startDate = (NSDate *)v8;

  }
  return v7;
}

- (void)addSubEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ICSharedListeningConnectionReportEvent subEvents](self, "subEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[ICSharedListeningConnectionReportEvent setSubEvents:](self, "setSubEvents:", v6);

  }
  -[ICSharedListeningConnectionReportEvent subEvents](self, "subEvents");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[ICSharedListeningConnectionReportEvent endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningConnectionReportEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSMutableArray)subEvents
{
  return self->_subEvents;
}

- (void)setSubEvents:(id)a3
{
  objc_storeStrong((id *)&self->_subEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subEvents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
