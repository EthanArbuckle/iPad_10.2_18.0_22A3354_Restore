@implementation PPMockRTLocationOfInterestVisit

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

+ (id)mockLocationOfInterestVisitWithEntryDate:(id)a3 exitDate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setEntryDate:", v6);

  objc_msgSend(v7, "setExitDate:", v5);
  return v7;
}

@end
