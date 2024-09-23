@implementation RTStateModelAggOutOfStateSelection

- (RTStateModelAggOutOfStateSelection)init
{
  RTStateModelAggOutOfStateSelection *v2;
  RTStateModelAggOutOfStateSelection *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTStateModelAggOutOfStateSelection;
  v2 = -[RTStateModelAggOutOfStateSelection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RTStateModelAggOutOfStateSelection setWeeklyDensityCorrection:](v2, "setWeeklyDensityCorrection:", 1.0);
    -[RTStateModelAggOutOfStateSelection setDailyDensityCorrection:](v3, "setDailyDensityCorrection:", 1.0);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[RTStateModelAggOutOfStateSelection setSelectOOStStates:](v3, "setSelectOOStStates:", v4);

  }
  return v3;
}

- (RTStateModelAggOutOfStateSelection)initWithSelectOOStStates:(id)a3 dailyDensityCorrection:(double)a4 weeklyDensityCorrection:(double)a5
{
  id v9;
  RTStateModelAggOutOfStateSelection *v10;
  RTStateModelAggOutOfStateSelection *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RTStateModelAggOutOfStateSelection;
  v10 = -[RTStateModelAggOutOfStateSelection init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_selectOOStStates, a3);
    v11->_weeklyDensityCorrection = a5;
    v11->_dailyDensityCorrection = a4;
  }

  return v11;
}

- (NSMutableArray)selectOOStStates
{
  return self->_selectOOStStates;
}

- (void)setSelectOOStStates:(id)a3
{
  objc_storeStrong((id *)&self->_selectOOStStates, a3);
}

- (double)weeklyDensityCorrection
{
  return self->_weeklyDensityCorrection;
}

- (void)setWeeklyDensityCorrection:(double)a3
{
  self->_weeklyDensityCorrection = a3;
}

- (double)dailyDensityCorrection
{
  return self->_dailyDensityCorrection;
}

- (void)setDailyDensityCorrection:(double)a3
{
  self->_dailyDensityCorrection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectOOStStates, 0);
}

@end
