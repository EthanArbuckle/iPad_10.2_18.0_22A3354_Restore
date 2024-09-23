@implementation PSIDateFilter

- (PSIDateFilter)initWithSingleDateComponents:(id)a3
{
  id v4;
  PSIDateFilter *v5;
  PSIDate *v6;
  PSIDate *singleDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSIDateFilter;
  v5 = -[PSIDateFilter init](&v9, sel_init);
  if (v5)
  {
    v6 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v4);
    singleDate = v5->_singleDate;
    v5->_singleDate = v6;

    if (!v5->_singleDate)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (PSIDateFilter)initWithStartDateComponents:(id)a3
{
  id v4;
  PSIDateFilter *v5;
  PSIDate *v6;
  PSIDate *startDate;
  uint64_t v8;
  PSIDate *endDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSIDateFilter;
  v5 = -[PSIDateFilter init](&v11, sel_init);
  if (v5)
  {
    v6 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v4);
    startDate = v5->_startDate;
    v5->_startDate = v6;

    +[PSIDate distantFuture](PSIDate, "distantFuture");
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (PSIDate *)v8;

    if (!v5->_startDate)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (PSIDateFilter)initWithEndDateComponents:(id)a3
{
  id v4;
  PSIDateFilter *v5;
  uint64_t v6;
  PSIDate *startDate;
  PSIDate *v8;
  PSIDate *endDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSIDateFilter;
  v5 = -[PSIDateFilter init](&v11, sel_init);
  if (v5)
  {
    +[PSIDate distantPast](PSIDate, "distantPast");
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (PSIDate *)v6;

    v8 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v4);
    endDate = v5->_endDate;
    v5->_endDate = v8;

    if (!v5->_endDate)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (PSIDateFilter)initWithStartDateComponents:(id)a3 endDateComponents:(id)a4
{
  id v6;
  id v7;
  PSIDateFilter *v8;
  PSIDateFilter *v9;
  PSIDate *v10;
  PSIDate *startDate;
  PSIDate **p_startDate;
  PSIDate *v13;
  PSIDate *endDate;
  PSIDate **p_endDate;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PSIDateFilter;
  v8 = -[PSIDateFilter init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v6);
      p_startDate = &v9->_startDate;
      startDate = v9->_startDate;
      v9->_startDate = v10;
    }
    else
    {
      p_startDate = &v8->_startDate;
      startDate = v8->_startDate;
      v8->_startDate = 0;
    }

    if (v7)
    {
      v13 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v7);
      p_endDate = &v9->_endDate;
      endDate = v9->_endDate;
      v9->_endDate = v13;
    }
    else
    {
      p_endDate = &v9->_endDate;
      endDate = v9->_endDate;
      v9->_endDate = 0;
    }
    if ((endDate, v6) && !*p_startDate || v7 && !*p_endDate)
    {

      v9 = 0;
    }
  }

  return v9;
}

- (PSIDateFilter)initWithSingleDate:(id)a3
{
  id v5;
  PSIDateFilter *v6;
  PSIDateFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSIDateFilter;
  v6 = -[PSIDateFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_singleDate, a3);

  return v7;
}

- (PSIDateFilter)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  PSIDateFilter *v9;
  PSIDateFilter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSIDateFilter;
  v9 = -[PSIDateFilter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

- (int64_t)int64RepresentationMask
{
  PSIDate *singleDate;
  int64_t v5;

  singleDate = self->_singleDate;
  if (singleDate)
    return -[PSIDate int64RepresentationMask](singleDate, "int64RepresentationMask");
  v5 = -[PSIDate int64RepresentationMask](self->_startDate, "int64RepresentationMask");
  return -[PSIDate int64RepresentationMask](self->_endDate, "int64RepresentationMask") | v5;
}

- (BOOL)isEqual:(id)a3
{
  PSIDateFilter *v4;
  int64_t v5;
  BOOL v6;

  v4 = (PSIDateFilter *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v6 = 1;
    }
    else
    {
      v5 = -[PSIDateFilter int64RepresentationMask](self, "int64RepresentationMask");
      v6 = v5 == -[PSIDateFilter int64RepresentationMask](v4, "int64RepresentationMask");
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  PSIDate *singleDate;
  uint64_t v4;

  singleDate = self->_singleDate;
  if (singleDate)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayString: '%@'. Date: %@"), self->_displayString, singleDate, v4);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayString: '%@'. Start: %@. End: %@"), self->_displayString, self->_startDate, self->_endDate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PSIDate)singleDate
{
  return (PSIDate *)objc_getProperty(self, a2, 8, 1);
}

- (PSIDate)startDate
{
  return (PSIDate *)objc_getProperty(self, a2, 16, 1);
}

- (PSIDate)endDate
{
  return (PSIDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_singleDate, 0);
}

@end
