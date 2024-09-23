@implementation RTVisitDecoded

- (RTVisitDecoded)init
{
  return -[RTVisitDecoded initWithEntryDate:exitDate:logProbability:](self, "initWithEntryDate:exitDate:logProbability:", 0, 0, 0.0);
}

- (RTVisitDecoded)initWithEntryDate:(id)a3 exitDate:(id)a4 logProbability:(double)a5
{
  id v9;
  id v10;
  RTVisitDecoded *v11;
  RTVisitDecoded *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTVisitDecoded;
  v11 = -[RTVisitDecoded init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entryDate, a3);
    objc_storeStrong((id *)&v12->_exitDate, a4);
    v12->_logProbability = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  double logProbability;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  logProbability = self->_logProbability;
  -[NSDate stringFromDate](self->_entryDate, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate stringFromDate](self->_exitDate, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("logProbability=%f, entryDate=%@, exitDate=%@"), *(_QWORD *)&logProbability, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)completeVisit
{
  return self->_entryDate && self->_exitDate != 0;
}

- (BOOL)partialVisit
{
  return self->_entryDate && self->_exitDate == 0;
}

- (BOOL)noVisit
{
  return !self->_entryDate && self->_exitDate == 0;
}

- (NSNumber)outputType
{
  uint64_t v3;
  void *v4;

  if (-[RTVisitDecoded noVisit](self, "noVisit"))
  {
    v3 = 0;
  }
  else if (-[RTVisitDecoded partialVisit](self, "partialVisit"))
  {
    v3 = 2;
  }
  else
  {
    if (!-[RTVisitDecoded completeVisit](self, "completeVisit"))
    {
      v4 = 0;
      return (NSNumber *)v4;
    }
    v3 = 3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSNumber *)v4;
}

- (double)logProbability
{
  return self->_logProbability;
}

- (void)setLogProbability:(double)a3
{
  self->_logProbability = a3;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (void)setEntryDate:(id)a3
{
  objc_storeStrong((id *)&self->_entryDate, a3);
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (void)setExitDate:(id)a3
{
  objc_storeStrong((id *)&self->_exitDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitDate, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
}

@end
