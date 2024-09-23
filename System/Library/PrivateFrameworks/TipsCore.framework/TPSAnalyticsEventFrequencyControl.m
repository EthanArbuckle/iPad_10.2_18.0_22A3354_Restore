@implementation TPSAnalyticsEventFrequencyControl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventFrequencyControl)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventFrequencyControl *v5;
  uint64_t v6;
  NSNumber *displayCount;
  uint64_t v8;
  NSNumber *notDisplayedDueToFrequencyControlCount;
  uint64_t v10;
  NSString *experimentID;
  uint64_t v12;
  NSString *displayType;
  uint64_t v14;
  NSString *experimentCampID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventFrequencyControl;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shown_count"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayCount = v5->_displayCount;
    v5->_displayCount = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("not_shown_due_to_frequency_control_count"));
    v8 = objc_claimAutoreleasedReturnValue();
    notDisplayedDueToFrequencyControlCount = v5->_notDisplayedDueToFrequencyControlCount;
    v5->_notDisplayedDueToFrequencyControlCount = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experiment_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    experimentID = v5->_experimentID;
    v5->_experimentID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_type"));
    v12 = objc_claimAutoreleasedReturnValue();
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experiment_camp_ID"));
    v14 = objc_claimAutoreleasedReturnValue();
    experimentCampID = v5->_experimentCampID;
    v5->_experimentCampID = (NSString *)v14;

  }
  return v5;
}

- (TPSAnalyticsEventFrequencyControl)initWithDisplayType:(id)a3 displayCount:(id)a4 notDisplayedDueToFrequencyControlCount:(id)a5
{
  id v9;
  id v10;
  id v11;
  TPSAnalyticsEventFrequencyControl *v12;
  TPSAnalyticsEventFrequencyControl *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventFrequencyControl;
  v12 = -[TPSAnalyticsEvent initWithDate:](&v15, sel_initWithDate_, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayType, a3);
    objc_storeStrong((id *)&v13->_displayCount, a4);
    objc_storeStrong((id *)&v13->_notDisplayedDueToFrequencyControlCount, a5);
  }

  return v13;
}

- (void)setDataProvider:(id)a3
{
  NSString *experimentID;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *experimentCampID;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TPSAnalyticsEventFrequencyControl;
  -[TPSAnalyticsEvent setDataProvider:](&v14, sel_setDataProvider_, a3);
  experimentID = self->_experimentID;
  if (experimentID)
  {
    v5 = experimentID;
    v6 = self->_experimentID;
    self->_experimentID = v5;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "experimentID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_experimentID;
    self->_experimentID = v7;

  }
  experimentCampID = self->_experimentCampID;
  if (experimentCampID)
  {
    v10 = experimentCampID;
    v11 = self->_experimentCampID;
    self->_experimentCampID = v10;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "experimentCampID");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_experimentCampID;
    self->_experimentCampID = v12;

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventFrequencyControl;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayCount, CFSTR("shown_count"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_notDisplayedDueToFrequencyControlCount, CFSTR("not_shown_due_to_frequency_control_count"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_experimentID, CFSTR("experiment_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayType, CFSTR("display_type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_experimentCampID, CFSTR("experiment_camp_ID"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("frequency_control_calculation"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_displayCount, CFSTR("shown_count"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_notDisplayedDueToFrequencyControlCount, CFSTR("not_shown_due_to_frequency_control_count"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_experimentID, CFSTR("experiment_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_displayType, CFSTR("display_type"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_experimentCampID, CFSTR("experiment_camp_ID"));
  return v3;
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (NSNumber)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(id)a3
{
  objc_storeStrong((id *)&self->_displayCount, a3);
}

- (NSNumber)notDisplayedDueToFrequencyControlCount
{
  return self->_notDisplayedDueToFrequencyControlCount;
}

- (void)setNotDisplayedDueToFrequencyControlCount:(id)a3
{
  objc_storeStrong((id *)&self->_notDisplayedDueToFrequencyControlCount, a3);
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
  objc_storeStrong((id *)&self->_experimentID, a3);
}

- (NSString)experimentCampID
{
  return self->_experimentCampID;
}

- (void)setExperimentCampID:(id)a3
{
  objc_storeStrong((id *)&self->_experimentCampID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentCampID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_notDisplayedDueToFrequencyControlCount, 0);
  objc_storeStrong((id *)&self->_displayCount, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end
