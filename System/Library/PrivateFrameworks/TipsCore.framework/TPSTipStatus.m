@implementation TPSTipStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewedDate, 0);
  objc_storeStrong((id *)&self->_hintDismissalDate, 0);
  objc_storeStrong((id *)&self->_hintWouldHaveBeenDisplayedDate, 0);
  objc_storeStrong((id *)&self->_hintEligibleDate, 0);
  objc_storeStrong((id *)&self->_dateForTriggerRestartTracking, 0);
  objc_storeStrong((id *)&self->_lastUsedVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_clonedFromIdentifier, 0);
  objc_storeStrong((id *)&self->_correlationIdentifier, 0);
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_savedDate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_hintNotDisplayedDueToFrequencyControlDates, 0);
  objc_storeStrong((id *)&self->_desiredOutcomePerformedDates, 0);
  objc_storeStrong((id *)&self->_hintDisplayedDates, 0);
  objc_storeStrong((id *)&self->_lastDisplayContext, 0);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t hintIneligibleReason;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  hintIneligibleReason = self->_hintIneligibleReason;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", hintIneligibleReason, CFSTR("hintIneligibleReason"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayType, CFSTR("displayType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_preconditionMatched, CFSTR("preconditionMatched"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_expired, CFSTR("expired"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_overrideHoldout, CFSTR("overrideHoldout"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_overrideFrequencyControl, CFSTR("overrideFrequencyControl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_variantIdentifier, CFSTR("variantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_correlationIdentifier, CFSTR("correlationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clonedFromIdentifier, CFSTR("clonedFromIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelVersion, CFSTR("modelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUsedVersion, CFSTR("lastUsedVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hintEligibleDate, CFSTR("hintEligibleDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastDisplayContext, CFSTR("lastDisplayContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hintWouldHaveBeenDisplayedDate, CFSTR("hintWouldHaveBeenDisplayedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hintDismissalDate, CFSTR("hintDismissalDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentViewedDate, CFSTR("contentViewedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateForTriggerRestartTracking, CFSTR("dateForTriggerRestartTracking"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_savedDate, CFSTR("savedDate"));
  v6 = (void *)-[NSMutableArray copy](self->_hintDisplayedDates, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("hintDisplayedDates"));

  v7 = (void *)-[NSMutableArray copy](self->_desiredOutcomePerformedDates, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("desiredOutcomePerformedDates"));

  v8 = (void *)-[NSMutableArray copy](self->_hintNotDisplayedDueToFrequencyControlDates, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("hintNotDisplayedDueToFrequencyControlDates"));

  v9 = (id)-[NSMutableDictionary copy](self->_userInfo, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("userInfo"));

}

- (TPSTipStatus)initWithCoder:(id)a3
{
  id v4;
  TPSTipStatus *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *variantIdentifier;
  uint64_t v14;
  NSString *correlationIdentifier;
  uint64_t v16;
  NSString *clonedFromIdentifier;
  uint64_t v18;
  NSString *modelVersion;
  uint64_t v20;
  NSString *lastUsedVersion;
  uint64_t v22;
  NSString *lastDisplayContext;
  uint64_t v24;
  NSDate *hintEligibleDate;
  uint64_t v26;
  NSDate *hintWouldHaveBeenDisplayedDate;
  uint64_t v28;
  NSDate *hintDismissalDate;
  uint64_t v30;
  NSDate *contentViewedDate;
  uint64_t v32;
  NSDate *savedDate;
  uint64_t v34;
  NSDate *dateForTriggerRestartTracking;
  NSDate *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSMutableArray *desiredOutcomePerformedDates;
  void *v43;
  uint64_t v44;
  NSMutableArray *hintDisplayedDates;
  void *v46;
  uint64_t v47;
  NSMutableArray *hintNotDisplayedDueToFrequencyControlDates;
  void *v49;
  void *v50;
  uint64_t v51;
  NSMutableDictionary *userInfo;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)TPSTipStatus;
  v5 = -[TPSTipStatus init](&v54, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayType"));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 0;
    else
      v7 = v6;
    v5->_displayType = v7;
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hintIneligibleReason"));
    if (v8 <= 22)
      v9 = v8;
    else
      v9 = 0;
    v5->_hintIneligibleReason = v9;
    v5->_preconditionMatched = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preconditionMatched"));
    v5->_expired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("expired"));
    v5->_overrideHoldout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overrideHoldout"));
    v5->_overrideFrequencyControl = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overrideFrequencyControl"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variantIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    variantIdentifier = v5->_variantIdentifier;
    v5->_variantIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("correlationIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    correlationIdentifier = v5->_correlationIdentifier;
    v5->_correlationIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clonedFromIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    clonedFromIdentifier = v5->_clonedFromIdentifier;
    v5->_clonedFromIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelVersion"));
    v18 = objc_claimAutoreleasedReturnValue();
    modelVersion = v5->_modelVersion;
    v5->_modelVersion = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUsedVersion"));
    v20 = objc_claimAutoreleasedReturnValue();
    lastUsedVersion = v5->_lastUsedVersion;
    v5->_lastUsedVersion = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastDisplayContext"));
    v22 = objc_claimAutoreleasedReturnValue();
    lastDisplayContext = v5->_lastDisplayContext;
    v5->_lastDisplayContext = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hintEligibleDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    hintEligibleDate = v5->_hintEligibleDate;
    v5->_hintEligibleDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hintWouldHaveBeenDisplayedDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    hintWouldHaveBeenDisplayedDate = v5->_hintWouldHaveBeenDisplayedDate;
    v5->_hintWouldHaveBeenDisplayedDate = (NSDate *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hintDismissalDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    hintDismissalDate = v5->_hintDismissalDate;
    v5->_hintDismissalDate = (NSDate *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentViewedDate"));
    v30 = objc_claimAutoreleasedReturnValue();
    contentViewedDate = v5->_contentViewedDate;
    v5->_contentViewedDate = (NSDate *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("savedDate"));
    v32 = objc_claimAutoreleasedReturnValue();
    savedDate = v5->_savedDate;
    v5->_savedDate = (NSDate *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateForTriggerRestartTracking"));
    v34 = objc_claimAutoreleasedReturnValue();
    dateForTriggerRestartTracking = v5->_dateForTriggerRestartTracking;
    v5->_dateForTriggerRestartTracking = (NSDate *)v34;

    if (objc_msgSend(MEMORY[0x1E0C99D68], "isDateExpired:maxTimeInterval:", v5->_dateForTriggerRestartTracking, -2160000.0))
    {
      v36 = v5->_dateForTriggerRestartTracking;
      v5->_dateForTriggerRestartTracking = 0;

    }
    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("desiredOutcomePerformedDates"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v40);
      v41 = objc_claimAutoreleasedReturnValue();
      desiredOutcomePerformedDates = v5->_desiredOutcomePerformedDates;
      v5->_desiredOutcomePerformedDates = (NSMutableArray *)v41;

    }
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("hintDisplayedDates"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v43);
      v44 = objc_claimAutoreleasedReturnValue();
      hintDisplayedDates = v5->_hintDisplayedDates;
      v5->_hintDisplayedDates = (NSMutableArray *)v44;

    }
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("hintNotDisplayedDueToFrequencyControlDates"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v46);
      v47 = objc_claimAutoreleasedReturnValue();
      hintNotDisplayedDueToFrequencyControlDates = v5->_hintNotDisplayedDueToFrequencyControlDates;
      v5->_hintNotDisplayedDueToFrequencyControlDates = (NSMutableArray *)v47;

    }
    objc_msgSend((id)objc_opt_class(), "_userInfoClasses");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("userInfo"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v50, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v50);
      v51 = objc_claimAutoreleasedReturnValue();
      userInfo = v5->_userInfo;
      v5->_userInfo = (NSMutableDictionary *)v51;

    }
  }

  return v5;
}

+ (NSSet)_userInfoClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

- (NSString)correlationIdentifier
{
  return self->_correlationIdentifier;
}

- (NSDate)savedDate
{
  return self->_savedDate;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (BOOL)isUserKnew
{
  void *v3;
  void *v4;
  void *v5;
  NSDate *v6;
  BOOL v7;

  -[NSMutableArray firstObject](self->_desiredOutcomePerformedDates, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableArray firstObject](self->_hintDisplayedDates, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "compare:", self->_contentViewedDate) == -1)
    {
      v6 = v5;
    }
    else
    {
      v6 = self->_contentViewedDate;
      if (!v6)
      {
        v7 = 1;
LABEL_9:

        goto LABEL_10;
      }
    }
    v7 = objc_msgSend(v3, "compare:", v6) == -1;

    goto LABEL_9;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (NSDate)hintEligibleDate
{
  return self->_hintEligibleDate;
}

- (BOOL)isDesiredOutcomePerformed
{
  void *v2;
  BOOL v3;

  -[TPSTipStatus desiredOutcomePerformedDates](self, "desiredOutcomePerformedDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isHintDisplayed
{
  void *v2;
  BOOL v3;

  -[TPSTipStatus hintDisplayedDates](self, "hintDisplayedDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)hintDisplayedDates
{
  void *v2;

  if (self->_hintDisplayedDates)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSArray)desiredOutcomePerformedDates
{
  void *v2;

  if (self->_desiredOutcomePerformedDates)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSDate)hintDismissalDate
{
  return self->_hintDismissalDate;
}

- (NSDate)contentViewedDate
{
  return self->_contentViewedDate;
}

- (BOOL)isExpired
{
  return self->_expired;
}

- (NSString)lastUsedVersion
{
  return self->_lastUsedVersion;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setDisplayType:", self->_displayType);
  objc_msgSend(v4, "setPreconditionMatched:", self->_preconditionMatched);
  objc_msgSend(v4, "setExpired:", self->_expired);
  objc_msgSend(v4, "setHintIneligibleReason:", self->_hintIneligibleReason);
  objc_msgSend(v4, "setOverrideHoldout:", self->_overrideHoldout);
  objc_msgSend(v4, "setOverrideFrequencyControl:", self->_overrideFrequencyControl);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setVariantIdentifier:", self->_variantIdentifier);
  objc_msgSend(v4, "setCorrelationIdentifier:", self->_correlationIdentifier);
  objc_msgSend(v4, "setClonedFromIdentifier:", self->_clonedFromIdentifier);
  objc_msgSend(v4, "setModelVersion:", self->_modelVersion);
  objc_msgSend(v4, "setLastUsedVersion:", self->_lastUsedVersion);
  objc_msgSend(v4, "setDateForTriggerRestartTracking:", self->_dateForTriggerRestartTracking);
  objc_msgSend(v4, "setHintEligibleDate:", self->_hintEligibleDate);
  objc_msgSend(v4, "setLastDisplayContext:", self->_lastDisplayContext);
  objc_msgSend(v4, "setHintDisplayedDates:", self->_hintDisplayedDates);
  objc_msgSend(v4, "setHintWouldHaveBeenDisplayedDate:", self->_hintWouldHaveBeenDisplayedDate);
  objc_msgSend(v4, "setHintDismissalDate:", self->_hintDismissalDate);
  objc_msgSend(v4, "setContentViewedDate:", self->_contentViewedDate);
  objc_msgSend(v4, "setDesiredOutcomePerformedDates:", self->_desiredOutcomePerformedDates);
  objc_msgSend(v4, "setHintNotDisplayedDueToFrequencyControlDates:", self->_hintNotDisplayedDueToFrequencyControlDates);
  objc_msgSend(v4, "setSavedDate:", self->_savedDate);
  objc_msgSend(v4, "setUserInfo:", self->_userInfo);
  return v4;
}

- (void)setVariantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setCorrelationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setClonedFromIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (void)setOverrideFrequencyControl:(BOOL)a3
{
  self->_overrideFrequencyControl = a3;
}

- (BOOL)isPreconditionMatched
{
  return self->_preconditionMatched;
}

- (void)setOverrideHoldout:(BOOL)a3
{
  self->_overrideHoldout = a3;
}

- (void)setUserInfo:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *userInfo;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    userInfo = self->_userInfo;
    self->_userInfo = v4;
  }
  else
  {
    userInfo = self->_userInfo;
    self->_userInfo = 0;
  }

}

- (void)setSavedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setPreconditionMatched:(BOOL)a3
{
  self->_preconditionMatched = a3;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setLastUsedVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setLastDisplayContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setHintWouldHaveBeenDisplayedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setHintNotDisplayedDueToFrequencyControlDates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *hintNotDisplayedDueToFrequencyControlDates;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    hintNotDisplayedDueToFrequencyControlDates = self->_hintNotDisplayedDueToFrequencyControlDates;
    self->_hintNotDisplayedDueToFrequencyControlDates = v4;
  }
  else
  {
    hintNotDisplayedDueToFrequencyControlDates = self->_hintNotDisplayedDueToFrequencyControlDates;
    self->_hintNotDisplayedDueToFrequencyControlDates = 0;
  }

}

- (void)setHintIneligibleReason:(int64_t)a3
{
  self->_hintIneligibleReason = a3;
}

- (void)setHintEligibleDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setHintDisplayedDates:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *hintDisplayedDates;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    hintDisplayedDates = self->_hintDisplayedDates;
    self->_hintDisplayedDates = v5;

    if (self->_displayType == 1)
      -[TPSTipStatus removeHintEligibleDateStatus](self, "removeHintEligibleDateStatus");
  }
  else
  {
    v7 = self->_hintDisplayedDates;
    self->_hintDisplayedDates = 0;

  }
}

- (void)setHintDismissalDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;

  v5 = (NSDate *)a3;
  if (self->_hintDismissalDate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_hintDismissalDate, a3);
    -[TPSTipStatus removeHintEligibleDateStatus](self, "removeHintEligibleDateStatus");
    v5 = v6;
  }

}

- (void)setExpired:(BOOL)a3
{
  self->_expired = a3;
}

- (void)setDesiredOutcomePerformedDates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *desiredOutcomePerformedDates;
  NSMutableArray *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    desiredOutcomePerformedDates = self->_desiredOutcomePerformedDates;
    self->_desiredOutcomePerformedDates = v4;

    -[TPSTipStatus removeHintEligibleDateStatus](self, "removeHintEligibleDateStatus");
  }
  else
  {
    v6 = self->_desiredOutcomePerformedDates;
    self->_desiredOutcomePerformedDates = 0;

  }
}

- (void)setDateForTriggerRestartTracking:(id)a3
{
  NSDate *v5;
  NSDate *v6;

  v5 = (NSDate *)a3;
  if (self->_dateForTriggerRestartTracking != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dateForTriggerRestartTracking, a3);
    -[TPSTipStatus removeHintEligibleDateStatus](self, "removeHintEligibleDateStatus");
    v5 = v6;
  }

}

- (void)setContentViewedDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;

  v5 = (NSDate *)a3;
  if (self->_contentViewedDate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contentViewedDate, a3);
    -[TPSTipStatus removeHintEligibleDateStatus](self, "removeHintEligibleDateStatus");
    v5 = v6;
  }

}

- (TPSTipStatus)initWithIdentifier:(id)a3
{
  id v5;
  TPSTipStatus *v6;
  TPSTipStatus *v7;
  NSString *modelVersion;
  TPSTipStatus *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSTipStatus;
  v6 = -[TPSTipStatus init](&v11, sel_init);
  v7 = v6;
  if (v6
    && (v6->_hintIneligibleReason = 0,
        objc_storeStrong((id *)&v6->_identifier, a3),
        modelVersion = v7->_modelVersion,
        v7->_modelVersion = (NSString *)CFSTR("1.0"),
        modelVersion,
        !-[NSString length](v7->_identifier, "length")))
  {
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (void)removeHintEligibleDateStatus
{
  NSDate *hintEligibleDate;

  hintEligibleDate = self->_hintEligibleDate;
  self->_hintEligibleDate = 0;

}

- (void)addHintDisplayedDate:(id)a3
{
  id v4;
  NSMutableArray *hintDisplayedDates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    hintDisplayedDates = self->_hintDisplayedDates;
    v8 = v4;
    if (!hintDisplayedDates)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_hintDisplayedDates;
      self->_hintDisplayedDates = v6;

      hintDisplayedDates = self->_hintDisplayedDates;
    }
    -[NSMutableArray addObject:](hintDisplayedDates, "addObject:", v8);
    v4 = v8;
    if (self->_displayType == 1)
    {
      -[TPSTipStatus removeHintEligibleDateStatus](self, "removeHintEligibleDateStatus");
      v4 = v8;
    }
  }

}

- (void)addHintNotDisplayedDueToFrequencyControlDate:(id)a3
{
  id v4;
  NSMutableArray *hintNotDisplayedDueToFrequencyControlDates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    hintNotDisplayedDueToFrequencyControlDates = self->_hintNotDisplayedDueToFrequencyControlDates;
    v8 = v4;
    if (!hintNotDisplayedDueToFrequencyControlDates)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_hintNotDisplayedDueToFrequencyControlDates;
      self->_hintNotDisplayedDueToFrequencyControlDates = v6;

      hintNotDisplayedDueToFrequencyControlDates = self->_hintNotDisplayedDueToFrequencyControlDates;
    }
    -[NSMutableArray addObject:](hintNotDisplayedDueToFrequencyControlDates, "addObject:", v8);
    v4 = v8;
  }

}

- (NSArray)hintNotDisplayedDueToFrequencyControlDates
{
  void *v2;

  if (self->_hintNotDisplayedDueToFrequencyControlDates)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)addDesiredOutcomePerformedDate:(id)a3
{
  id v4;
  NSMutableArray *desiredOutcomePerformedDates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    desiredOutcomePerformedDates = self->_desiredOutcomePerformedDates;
    v8 = v4;
    if (!desiredOutcomePerformedDates)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_desiredOutcomePerformedDates;
      self->_desiredOutcomePerformedDates = v6;

      v4 = v8;
      desiredOutcomePerformedDates = self->_desiredOutcomePerformedDates;
    }
    if ((-[NSMutableArray containsObject:](desiredOutcomePerformedDates, "containsObject:", v4) & 1) == 0)
      -[NSMutableArray addObject:](self->_desiredOutcomePerformedDates, "addObject:", v8);
    -[TPSTipStatus removeHintEligibleDateStatus](self, "removeHintEligibleDateStatus");
    v4 = v8;
  }

}

- (BOOL)reenrollIfAllowed
{
  if (self->_hintIneligibleReason != 22
    || self->_contentViewedDate
    || -[NSMutableArray count](self->_desiredOutcomePerformedDates, "count")
    || self->_hintDismissalDate)
  {
    return 0;
  }
  self->_hintIneligibleReason = 0;
  self->_expired = 0;
  -[TPSTipStatus removeHintEligibleDateStatus](self, "removeHintEligibleDateStatus");
  return 1;
}

- (unint64_t)usageFlags
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;

  v3 = -[TPSTipStatus overrideHoldout](self, "overrideHoldout");
  v4 = -[TPSTipStatus overrideFrequencyControl](self, "overrideFrequencyControl");
  v5 = 2;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (void)updateUserInfoValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)();
  void *v17;
  id v18;

  v13 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v13)
    {
      objc_msgSend((id)objc_opt_class(), "_userInfoClasses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __43__TPSTipStatus_updateUserInfoValue_forKey___block_invoke;
      v17 = &unk_1E395B5E8;
      v8 = v13;
      v18 = v8;
      v9 = objc_msgSend(v7, "na_any:", &v14);

      if (v9)
      {
        userInfo = self->_userInfo;
        if (!userInfo)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          v12 = self->_userInfo;
          self->_userInfo = v11;

          userInfo = self->_userInfo;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](userInfo, "setObject:forKeyedSubscript:", v8, v6, v13, v14, v15, v16, v17);
      }

    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userInfo, "setObject:forKeyedSubscript:", 0, v6);
    }
  }

}

uint64_t __43__TPSTipStatus_updateUserInfoValue_forKey___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSDictionary)userInfo
{
  void *v2;

  if (self->_userInfo)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (void)removeUserInfo
{
  -[TPSTipStatus setUserInfo:](self, "setUserInfo:", 0);
}

- (BOOL)isContentViewed
{
  void *v2;
  BOOL v3;

  -[TPSTipStatus contentViewedDate](self, "contentViewedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isHintDisplayedOnCloudDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTipStatus correlationIdentifier](self, "correlationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[TPSTipStatus clonedFromIdentifier](self, "clonedFromIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  -[TPSTipStatus identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v6);

  +[TPSCloudController sharedInstance](TPSCloudController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__TPSTipStatus_isHintDisplayedOnCloudDevices__block_invoke;
  v10[3] = &unk_1E395B610;
  v11 = v7;
  v8 = v7;
  LOBYTE(v5) = objc_msgSend(v3, "na_any:", v10);

  return (char)v5;
}

uint64_t __45__TPSTipStatus_isHintDisplayedOnCloudDevices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isHintDisplayedForContentID:", a2);
}

- (BOOL)isHintDisplayedOnAnyDevice
{
  return -[TPSTipStatus isHintDisplayed](self, "isHintDisplayed")
      || -[TPSTipStatus isHintDisplayedOnCloudDevices](self, "isHintDisplayedOnCloudDevices");
}

- (BOOL)isHintDismissed
{
  void *v2;
  BOOL v3;

  -[TPSTipStatus hintDismissalDate](self, "hintDismissalDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isHintInelgibile
{
  return -[TPSTipStatus hintIneligibleReason](self, "hintIneligibleReason") != 0;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[TPSTipStatus savedDate](self, "savedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "savedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSDate *dateForTriggerRestartTracking;
  NSDate *hintEligibleDate;
  NSString *lastDisplayContext;
  NSDate *hintWouldHaveBeenDisplayedDate;
  NSMutableArray *hintDisplayedDates;
  NSMutableArray *hintNotDisplayedDueToFrequencyControlDates;
  NSDate *hintDismissalDate;
  NSDate *contentViewedDate;
  NSMutableArray *desiredOutcomePerformedDates;
  NSDate *savedDate;
  NSMutableDictionary *userInfo;
  objc_super v19;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v19.receiver = self;
  v19.super_class = (Class)TPSTipStatus;
  -[TPSTipStatus debugDescription](&v19, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR(" {\n\t%@ = %@\n"), CFSTR("identifier"), self->_identifier);
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("variantIdentifier"), self->_variantIdentifier);
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("correlationIdentifier"), self->_correlationIdentifier);
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("clonedFromIdentifier"), self->_clonedFromIdentifier);
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("modelVersion"), self->_modelVersion);
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("lastUsedVersion"), self->_lastUsedVersion);
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %zd\n"), CFSTR("displayType"), self->_displayType);
  if (self->_hintIneligibleReason)
  {
    +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:](TPSAnalyticsCommonDefines, "ineligibleReasonStringForReason:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("hintIneligibleReason"), v6);

  }
  if (self->_preconditionMatched)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %d\n"), CFSTR("preconditionMatched"), 1);
  if (self->_expired)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %d\n"), CFSTR("expired"), 1);
  if (self->_overrideHoldout)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %d\n"), CFSTR("overrideHoldout"), 1);
  if (self->_overrideFrequencyControl)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %d\n"), CFSTR("overrideFrequencyControl"), 1);
  dateForTriggerRestartTracking = self->_dateForTriggerRestartTracking;
  if (dateForTriggerRestartTracking)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("dateForTriggerRestartTracking"), dateForTriggerRestartTracking);
  hintEligibleDate = self->_hintEligibleDate;
  if (hintEligibleDate)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("hintEligibleDate"), hintEligibleDate);
  lastDisplayContext = self->_lastDisplayContext;
  if (lastDisplayContext)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("lastDisplayContext"), lastDisplayContext);
  hintWouldHaveBeenDisplayedDate = self->_hintWouldHaveBeenDisplayedDate;
  if (hintWouldHaveBeenDisplayedDate)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("hintWouldHaveBeenDisplayedDate"), hintWouldHaveBeenDisplayedDate);
  hintDisplayedDates = self->_hintDisplayedDates;
  if (hintDisplayedDates)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("hintDisplayedDates"), hintDisplayedDates);
  hintNotDisplayedDueToFrequencyControlDates = self->_hintNotDisplayedDueToFrequencyControlDates;
  if (hintNotDisplayedDueToFrequencyControlDates)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("hintNotDisplayedDueToFrequencyControlDates"), hintNotDisplayedDueToFrequencyControlDates);
  hintDismissalDate = self->_hintDismissalDate;
  if (hintDismissalDate)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("hintDismissalDate"), hintDismissalDate);
  contentViewedDate = self->_contentViewedDate;
  if (contentViewedDate)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("contentViewedDate"), contentViewedDate);
  desiredOutcomePerformedDates = self->_desiredOutcomePerformedDates;
  if (desiredOutcomePerformedDates)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("desiredOutcomePerformedDates"), desiredOutcomePerformedDates);
  savedDate = self->_savedDate;
  if (savedDate)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("savedDate"), savedDate);
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ = %@\n"), CFSTR("userInfo"), userInfo);
  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (BOOL)overrideHoldout
{
  return self->_overrideHoldout;
}

- (BOOL)overrideFrequencyControl
{
  return self->_overrideFrequencyControl;
}

- (int64_t)hintIneligibleReason
{
  return self->_hintIneligibleReason;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (NSString)clonedFromIdentifier
{
  return self->_clonedFromIdentifier;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSDate)dateForTriggerRestartTracking
{
  return self->_dateForTriggerRestartTracking;
}

- (NSDate)hintWouldHaveBeenDisplayedDate
{
  return self->_hintWouldHaveBeenDisplayedDate;
}

- (NSString)lastDisplayContext
{
  return self->_lastDisplayContext;
}

@end
