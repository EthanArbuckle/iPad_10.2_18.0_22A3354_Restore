@implementation PPDecayedFeedbackCounts

- (PPDecayedFeedbackCounts)initWithLatestDate:(id)a3 engagedExplicitly:(double)a4 engagedImplicitly:(double)a5 rejectedExplicitly:(double)a6 rejectedImplicitly:(double)a7
{
  id v13;
  PPDecayedFeedbackCounts *v14;
  PPDecayedFeedbackCounts *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PPDecayedFeedbackCounts;
  v14 = -[PPDecayedFeedbackCounts init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_latestDate, a3);
    v15->_engagedExplicitly = a4;
    v15->_engagedImplicitly = a5;
    v15->_rejectedExplicitly = a6;
    v15->_rejectedImplicitly = a7;
  }

  return v15;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  NSDate *latestDate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1C3BD6630](objc_msgSend(v3, "setFormatOptions:", 275));
  v13[0] = CFSTR("latestDate");
  latestDate = self->_latestDate;
  v6 = latestDate;
  if (!latestDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v6;
  v13[1] = CFSTR("engagedExplicitly");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_engagedExplicitly);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("engagedImplicitly");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_engagedImplicitly);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = CFSTR("rejectedExplicitly");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rejectedExplicitly);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  v13[4] = CFSTR("rejectedImplicitly");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rejectedImplicitly);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!latestDate)
  objc_autoreleasePoolPop(v4);

  return v11;
}

- (double)engagedExplicitly
{
  return self->_engagedExplicitly;
}

- (double)engagedImplicitly
{
  return self->_engagedImplicitly;
}

- (double)rejectedExplicitly
{
  return self->_rejectedExplicitly;
}

- (double)rejectedImplicitly
{
  return self->_rejectedImplicitly;
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDate, 0);
}

@end
