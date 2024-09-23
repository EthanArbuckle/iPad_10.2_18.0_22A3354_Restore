@implementation TPSAnalyticsEventProcessedUsageEvents

- (TPSAnalyticsEventProcessedUsageEvents)initWithUsageInfo:(id)a3 experiment:(id)a4 preHintUsageCount:(unint64_t)a5 postHintUsageCount:(unint64_t)a6 preHintRangeOutOfBounds:(BOOL)a7 postHintRangeOutOfBounds:(BOOL)a8 date:(id)a9
{
  id v15;
  id v16;
  TPSAnalyticsEventProcessedUsageEvents *v17;
  void *v18;
  uint64_t v19;
  NSString *identifier;
  uint64_t v21;
  NSDate *firstShownDate;
  uint64_t v23;
  NSDate *notifiedDate;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v26.receiver = self;
  v26.super_class = (Class)TPSAnalyticsEventProcessedUsageEvents;
  v17 = -[TPSAnalyticsEvent initWithDate:](&v26, sel_initWithDate_, a9);
  if (v17)
  {
    objc_msgSend(v15, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v19;

    objc_msgSend(v15, "firstShownDate");
    v21 = objc_claimAutoreleasedReturnValue();
    firstShownDate = v17->_firstShownDate;
    v17->_firstShownDate = (NSDate *)v21;

    objc_msgSend(v15, "notifiedDate");
    v23 = objc_claimAutoreleasedReturnValue();
    notifiedDate = v17->_notifiedDate;
    v17->_notifiedDate = (NSDate *)v23;

    objc_storeStrong((id *)&v17->_experiment, a4);
    v17->_overrideHoldout = objc_msgSend(v15, "overrideHoldout");
    v17->_desiredOutcomeCount = objc_msgSend(v15, "desiredOutcomeCount");
    v17->_preHintUsageCount = a5;
    v17->_postHintUsageCount = a6;
    v17->_preHintRangeOutOfBounds = a7;
    v17->_postHintRangeOutOfBounds = a8;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventProcessedUsageEvents)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventProcessedUsageEvents *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *firstShownDate;
  uint64_t v10;
  NSDate *notifiedDate;
  uint64_t v12;
  TPSExperiment *experiment;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventProcessedUsageEvents;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0DBF4F8]);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("first_shown_date"));
    v8 = objc_claimAutoreleasedReturnValue();
    firstShownDate = v5->_firstShownDate;
    v5->_firstShownDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notified_date"));
    v10 = objc_claimAutoreleasedReturnValue();
    notifiedDate = v5->_notifiedDate;
    v5->_notifiedDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experiment"));
    v12 = objc_claimAutoreleasedReturnValue();
    experiment = v5->_experiment;
    v5->_experiment = (TPSExperiment *)v12;

    v5->_overrideHoldout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overrideHoldout"));
    v5->_desiredOutcomeCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("desired_outcome_count"));
    v5->_preHintUsageCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pre_content_view_usage_count"));
    v5->_postHintUsageCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("post_content_view_usage_count"));
    v5->_preHintRangeOutOfBounds = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pre_content_hint_range_out_of_bounds"));
    v5->_postHintRangeOutOfBounds = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("post_content_range_out_of_bounds"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventProcessedUsageEvents;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, *MEMORY[0x1E0DBF4F8], v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_firstShownDate, CFSTR("first_shown_date"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_notifiedDate, CFSTR("notified_date"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_experiment, CFSTR("experiment"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_overrideHoldout, CFSTR("overrideHoldout"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_desiredOutcomeCount, CFSTR("desired_outcome_count"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_preHintUsageCount, CFSTR("pre_content_view_usage_count"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_postHintUsageCount, CFSTR("post_content_view_usage_count"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_preHintRangeOutOfBounds, CFSTR("pre_content_hint_range_out_of_bounds"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_postHintRangeOutOfBounds, CFSTR("post_content_range_out_of_bounds"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), *MEMORY[0x1E0DBF500], CFSTR("processed_usage_events"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TPSExperiment *experiment;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, *MEMORY[0x1E0DBF4F8]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_firstShownDate, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithLongLong:", llround(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("first_shown_date"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_notifiedDate, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithLongLong:", llround(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("notified_date"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_desiredOutcomeCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("desired_outcome_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_preHintUsageCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("pre_content_view_usage_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_postHintUsageCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("post_content_view_usage_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preHintRangeOutOfBounds);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("pre_content_hint_range_out_of_bounds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_postHintRangeOutOfBounds);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("post_content_range_out_of_bounds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0DBF348], "isSeniorUser"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DBF4F0]);

  experiment = self->_experiment;
  if (experiment)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TPSExperiment identifier](experiment, "identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0DBF4E8]);

    if (self->_overrideHoldout)
      v19 = 1;
    else
      v19 = -[TPSExperiment camp](self->_experiment, "camp");
    objc_msgSend(MEMORY[0x1E0DBF2B8], "experimentCampIDStringForCamp:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DBF4E0]);

  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)firstShownDate
{
  return self->_firstShownDate;
}

- (NSDate)notifiedDate
{
  return self->_notifiedDate;
}

- (TPSExperiment)experiment
{
  return self->_experiment;
}

- (unint64_t)desiredOutcomeCount
{
  return self->_desiredOutcomeCount;
}

- (unint64_t)preHintUsageCount
{
  return self->_preHintUsageCount;
}

- (unint64_t)postHintUsageCount
{
  return self->_postHintUsageCount;
}

- (BOOL)preHintRangeOutOfBounds
{
  return self->_preHintRangeOutOfBounds;
}

- (BOOL)postHintRangeOutOfBounds
{
  return self->_postHintRangeOutOfBounds;
}

- (BOOL)overrideHoldout
{
  return self->_overrideHoldout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_notifiedDate, 0);
  objc_storeStrong((id *)&self->_firstShownDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
