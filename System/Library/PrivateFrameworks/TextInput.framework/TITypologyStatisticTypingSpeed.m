@implementation TITypologyStatisticTypingSpeed

- (id)aggregateReport
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v9.receiver = self;
  v9.super_class = (Class)TITypologyStatisticTypingSpeed;
  -[TITypologyStatisticComposite aggregateReport](&v9, sel_aggregateReport);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TITypologyStatisticTypingSpeed typingSpeed](self, "typingSpeed");
  if (v6 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("typingSpeed.distr"));

  }
  return v5;
}

- (float)typingSpeed
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  float result;
  float v10;

  -[TITypologyStatisticTypingSpeed timeElapsed](self, "timeElapsed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedElapsedTime");
  v5 = v4;

  -[TITypologyStatisticTypingSpeed basicCounts](self, "basicCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "characterCount");

  result = 0.0;
  if (v5 > 0.0 && v7 >= 6)
  {
    v10 = (double)(v7 - 1) / v5;
    return fminf(v10, 18.0);
  }
  return result;
}

- (TITypologyStatisticTimeElapsed)timeElapsed
{
  return self->_timeElapsed;
}

- (TITypologyStatisticBasicCounts)basicCounts
{
  return self->_basicCounts;
}

+ (id)statistic
{
  void *v2;
  void *v3;
  TITypologyStatisticTypingSpeed *v4;

  +[TITypologyStatistic statistic](TITypologyStatisticTimeElapsed, "statistic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TITypologyStatistic statistic](TITypologyStatisticBasicCounts, "statistic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TITypologyStatisticTypingSpeed initWithTimeElapsed:basicCounts:]([TITypologyStatisticTypingSpeed alloc], "initWithTimeElapsed:basicCounts:", v2, v3);

  return v4;
}

- (TITypologyStatisticTypingSpeed)initWithTimeElapsed:(id)a3 basicCounts:(id)a4
{
  id v7;
  id v8;
  void *v9;
  TITypologyStatisticTypingSpeed *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v13[0] = v7;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)TITypologyStatisticTypingSpeed;
  v10 = -[TITypologyStatisticComposite initWithArray:](&v12, sel_initWithArray_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_timeElapsed, a3);
    objc_storeStrong((id *)&v10->_basicCounts, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basicCounts, 0);
  objc_storeStrong((id *)&self->_timeElapsed, 0);
}

+ (id)statisticCompositeWithStatistics:(id)a3
{
  return 0;
}

@end
