@implementation PKPayLaterDashboardMessage

- (PKPayLaterDashboardMessage)initWithMessage:(id)a3 priority:(int64_t)a4 date:(id)a5
{
  id v9;
  id v10;
  PKPayLaterDashboardMessage *v11;
  PKPayLaterDashboardMessage *v12;
  int64_t v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterDashboardMessage;
  v11 = -[PKPayLaterDashboardMessage init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_message, a3);
    objc_storeStrong((id *)&v12->_date, a5);
    v13 = 400;
    if (a4)
      v13 = a4;
    v12->_priority = v13;
  }

  return v12;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t priority;
  void *v7;
  NSDate *date;
  void *v9;
  uint64_t v10;
  int64_t v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "priority");
  priority = self->_priority;
  if (priority == v5)
  {
    if (self->_date)
    {
      objc_msgSend(v4, "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      date = self->_date;
      if (v7)
      {
        objc_msgSend(v4, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSDate compare:](date, "compare:", v9);

        if (v10 == -1)
          v11 = 1;
        else
          v11 = -1;
        goto LABEL_12;
      }
    }
    else
    {
      date = 0;
    }
    v11 = date != 0;
    goto LABEL_12;
  }
  if (priority < v5)
    v11 = 1;
  else
    v11 = -1;
LABEL_12:

  return v11;
}

- (PKDashboardPassMessage)message
{
  return self->_message;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
