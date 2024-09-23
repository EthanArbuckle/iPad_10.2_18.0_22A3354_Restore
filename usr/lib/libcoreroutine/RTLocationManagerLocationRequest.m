@implementation RTLocationManagerLocationRequest

- (id)expiryDate
{
  void *v3;
  void *v4;
  void *v5;

  -[RTLocationManagerLocationRequest startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationManagerLocationRequest options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeout");
  objc_msgSend(v3, "dateByAddingTimeInterval:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (RTLocationRequestOptions)options
{
  return self->_options;
}

- (RTLocationManagerLocationRequest)initWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  RTLocationManagerLocationRequest *v9;
  RTLocationManagerLocationRequest *v10;
  uint64_t v11;
  id handler;
  uint64_t v13;
  NSDate *startDate;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RTLocationManagerLocationRequest;
  v9 = -[RTLocationManagerLocationRequest init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_options, a3);
    v11 = MEMORY[0x1D8232094](v8);
    handler = v10->_handler;
    v10->_handler = (id)v11;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = objc_claimAutoreleasedReturnValue();
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v13;

  }
  return v10;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLocationManagerLocationRequest startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationManagerLocationRequest expiryDate](self, "expiryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationManagerLocationRequest options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("startDate, %@, expiryDate, %@, options, %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
