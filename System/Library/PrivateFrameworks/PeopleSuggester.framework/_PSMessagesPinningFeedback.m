@implementation _PSMessagesPinningFeedback

+ (id)skipOnboardingWithOnboardingSuggestions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAction:actualPinnings:onboardingSuggestions:trialId:eventDate:", 0, 0, v5, 0, v6);

  return v7;
}

+ (id)acceptedWithActualPinnings:(id)a3 OnboardingSuggestions:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAction:actualPinnings:onboardingSuggestions:trialId:eventDate:", 1, v8, v7, 0, v9);

  return v10;
}

+ (id)pinsChangedWithNowCurrentPins:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAction:actualPinnings:onboardingSuggestions:trialId:eventDate:", 2, v5, 0, 0, v6);

  return v7;
}

- (_PSMessagesPinningFeedback)initWithAction:(int64_t)a3 actualPinnings:(id)a4 onboardingSuggestions:(id)a5 trialId:(id)a6 eventDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _PSMessagesPinningFeedback *v17;
  _PSMessagesPinningFeedback *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)_PSMessagesPinningFeedback;
  v17 = -[_PSMessagesPinningFeedback init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_actionType = a3;
    objc_storeStrong((id *)&v17->_actualPinnings, a4);
    objc_storeStrong((id *)&v18->_onboardingSuggestions, a5);
    objc_storeStrong((id *)&v18->_trialId, a6);
    objc_storeStrong((id *)&v18->_eventDate, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSMessagesPinningFeedback)initWithCoder:(id)a3
{
  id v4;
  _PSMessagesPinningFeedback *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *actualPinnings;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *onboardingSuggestions;
  uint64_t v16;
  NSString *trialId;
  uint64_t v18;
  NSDate *eventDate;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_PSMessagesPinningFeedback;
  v5 = -[_PSMessagesPinningFeedback init](&v21, sel_init);
  if (v5)
  {
    v5->_actionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_actualPinnings"));
    v9 = objc_claimAutoreleasedReturnValue();
    actualPinnings = v5->_actualPinnings;
    v5->_actualPinnings = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("onboardingSuggestions"));
    v14 = objc_claimAutoreleasedReturnValue();
    onboardingSuggestions = v5->_onboardingSuggestions;
    v5->_onboardingSuggestions = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trialId"));
    v16 = objc_claimAutoreleasedReturnValue();
    trialId = v5->_trialId;
    v5->_trialId = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t actionType;
  id v5;

  actionType = self->_actionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", actionType, CFSTR("actionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actualPinnings, CFSTR("_actualPinnings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_onboardingSuggestions, CFSTR("onboardingSuggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trialId, CFSTR("trialId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventDate, CFSTR("eventDate"));

}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (int64_t)interactionMethod
{
  return self->_interactionMethod;
}

- (void)setInteractionMethod:(int64_t)a3
{
  self->_interactionMethod = a3;
}

- (NSArray)onboardingSuggestions
{
  return self->_onboardingSuggestions;
}

- (NSArray)actualPinnings
{
  return self->_actualPinnings;
}

- (NSString)trialId
{
  return self->_trialId;
}

- (void)setTrialId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_trialId, 0);
  objc_storeStrong((id *)&self->_actualPinnings, 0);
  objc_storeStrong((id *)&self->_onboardingSuggestions, 0);
}

@end
