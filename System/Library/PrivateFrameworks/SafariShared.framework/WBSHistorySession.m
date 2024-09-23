@implementation WBSHistorySession

+ (id)currentSession
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  currentSessionStartDate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSessionStartDate:", v3);

  return v4;
}

- (WBSHistorySession)init
{

  return 0;
}

- (WBSHistorySession)initWithSessionStartDate:(id)a3
{
  id v5;
  WBSHistorySession *v6;
  WBSHistorySession *v7;
  WBSHistorySession *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistorySession;
  v6 = -[WBSHistorySession init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_startDate, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isCurrentSession
{
  NSDate *startDate;
  void *v3;

  startDate = self->_startDate;
  currentSessionStartDate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(startDate) = -[NSDate isEqualToDate:](startDate, "isEqualToDate:", v3);

  return (char)startDate;
}

- (BOOL)isEqual:(id)a3
{
  WBSHistorySession *v4;
  NSDate *startDate;
  void *v6;
  char v7;

  v4 = (WBSHistorySession *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      startDate = self->_startDate;
      -[WBSHistorySession startDate](v4, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSDate isEqualToDate:](startDate, "isEqualToDate:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSDate hash](self->_startDate, "hash");
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
