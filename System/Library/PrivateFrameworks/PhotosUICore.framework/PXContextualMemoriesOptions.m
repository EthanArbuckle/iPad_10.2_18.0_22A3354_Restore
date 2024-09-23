@implementation PXContextualMemoriesOptions

- (PXContextualMemoriesOptions)init
{
  PXContextualMemoriesOptions *v2;
  PXContextualMemoriesOptions *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSDate *peopleProximityDate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXContextualMemoriesOptions;
  v2 = -[PXContextualMemoriesOptions init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accuracy = *(double *)MEMORY[0x1E0C9E4D0];
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startOfDayForDate:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    peopleProximityDate = v3->_peopleProximityDate;
    v3->_peopleProximityDate = (NSDate *)v6;

  }
  return v3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (NSDate)peopleProximityDate
{
  return self->_peopleProximityDate;
}

- (void)setPeopleProximityDate:(id)a3
{
  objc_storeStrong((id *)&self->_peopleProximityDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleProximityDate, 0);
}

@end
