@implementation PXDateRange

- (PXDateRange)initWithStartDate:(double)a3 endDate:(double)a4
{
  PXDateRange *result;
  void *v9;
  objc_super v10;

  if (a3 > a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDateRangeSet.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate <= endDate"));

  }
  v10.receiver = self;
  v10.super_class = (Class)PXDateRange;
  result = -[PXDateRange init](&v10, sel_init);
  if (result)
  {
    result->_startDate = a3;
    result->_endDate = a4;
  }
  return result;
}

- (BOOL)intersectsRange:(id)a3
{
  id v4;
  double startDate;
  double v6;
  BOOL v7;
  double endDate;
  double v9;

  v4 = a3;
  startDate = self->_startDate;
  objc_msgSend(v4, "endDate");
  if (startDate <= v6)
  {
    endDate = self->_endDate;
    objc_msgSend(v4, "startDate");
    v7 = endDate >= v9;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isStrictlyBeforeRange:(id)a3
{
  id v4;
  double startDate;
  double v6;
  BOOL v7;
  double endDate;
  double v9;

  v4 = a3;
  startDate = self->_startDate;
  objc_msgSend(v4, "startDate");
  if (startDate <= v6)
  {
    endDate = self->_endDate;
    objc_msgSend(v4, "startDate");
    v7 = endDate <= v9;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PXDateRange *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = (PXDateRange *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[PXDateRange startDate](self, "startDate"), v6 = v5, -[PXDateRange startDate](v4, "startDate"), v6 == v7))
    {
      -[PXDateRange endDate](self, "endDate");
      v9 = v8;
      -[PXDateRange endDate](v4, "endDate");
      v11 = v9 == v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return (unint64_t)fabs(self->_endDate) ^ (unint64_t)fabs(self->_startDate);
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
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PXDateRange;
  -[PXDateRange description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D68];
  -[PXDateRange startDate](self, "startDate");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D68];
  -[PXDateRange endDate](self, "endDate");
  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ startDate=%@, endDate=%@>"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

@end
