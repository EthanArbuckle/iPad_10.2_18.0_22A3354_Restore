@implementation _PSFTZKWTrialData

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[_PSFTZKWTrialData experimentIdentifiers](self, "experimentIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExperimentIdentifiers:", v5);

  -[_PSFTZKWTrialData rolloutIdentifiers](self, "rolloutIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRolloutIdentifiers:", v6);

  objc_msgSend(v4, "setStructuredCalendarIsEnabled:", -[_PSFTZKWTrialData structuredCalendarIsEnabled](self, "structuredCalendarIsEnabled"));
  objc_msgSend(v4, "setStructuredCalendarDefaultConfidenceCategory:", -[_PSFTZKWTrialData structuredCalendarDefaultConfidenceCategory](self, "structuredCalendarDefaultConfidenceCategory"));
  objc_msgSend(v4, "setUnstructuredCalendarIsEnabled:", -[_PSFTZKWTrialData unstructuredCalendarIsEnabled](self, "unstructuredCalendarIsEnabled"));
  objc_msgSend(v4, "setUnstructuredCalendarDefaultConfidenceCategory:", -[_PSFTZKWTrialData unstructuredCalendarDefaultConfidenceCategory](self, "unstructuredCalendarDefaultConfidenceCategory"));
  objc_msgSend(v4, "setUnstructuredRemindersIsEnabled:", -[_PSFTZKWTrialData unstructuredRemindersIsEnabled](self, "unstructuredRemindersIsEnabled"));
  objc_msgSend(v4, "setUnstructuredRemindersDefaultConfidenceCategory:", -[_PSFTZKWTrialData unstructuredRemindersDefaultConfidenceCategory](self, "unstructuredRemindersDefaultConfidenceCategory"));
  objc_msgSend(v4, "setPrimaryInteractionsIsEnabled:", -[_PSFTZKWTrialData primaryInteractionsIsEnabled](self, "primaryInteractionsIsEnabled"));
  objc_msgSend(v4, "setPrimaryInteractionsDefaultConfidenceCategory:", -[_PSFTZKWTrialData primaryInteractionsDefaultConfidenceCategory](self, "primaryInteractionsDefaultConfidenceCategory"));
  objc_msgSend(v4, "setPrimaryInteractionsModelType:", -[_PSFTZKWTrialData primaryInteractionsModelType](self, "primaryInteractionsModelType"));
  objc_msgSend(v4, "setFallbackInteractionsIsEnabled:", -[_PSFTZKWTrialData primaryInteractionsIsEnabled](self, "primaryInteractionsIsEnabled"));
  objc_msgSend(v4, "setFallbackInteractionsDefaultConfidenceCategory:", -[_PSFTZKWTrialData fallbackInteractionsDefaultConfidenceCategory](self, "fallbackInteractionsDefaultConfidenceCategory"));
  objc_msgSend(v4, "setFallbackInteractionsModelType:", -[_PSFTZKWTrialData fallbackInteractionsModelType](self, "fallbackInteractionsModelType"));
  return v4;
}

- (TRIExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (void)setExperimentIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TRIRolloutIdentifiers)rolloutIdentifiers
{
  return self->_rolloutIdentifiers;
}

- (void)setRolloutIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)structuredCalendarIsEnabled
{
  return self->_structuredCalendarIsEnabled;
}

- (void)setStructuredCalendarIsEnabled:(BOOL)a3
{
  self->_structuredCalendarIsEnabled = a3;
}

- (int64_t)structuredCalendarDefaultConfidenceCategory
{
  return self->_structuredCalendarDefaultConfidenceCategory;
}

- (void)setStructuredCalendarDefaultConfidenceCategory:(int64_t)a3
{
  self->_structuredCalendarDefaultConfidenceCategory = a3;
}

- (BOOL)unstructuredCalendarIsEnabled
{
  return self->_unstructuredCalendarIsEnabled;
}

- (void)setUnstructuredCalendarIsEnabled:(BOOL)a3
{
  self->_unstructuredCalendarIsEnabled = a3;
}

- (int64_t)unstructuredCalendarDefaultConfidenceCategory
{
  return self->_unstructuredCalendarDefaultConfidenceCategory;
}

- (void)setUnstructuredCalendarDefaultConfidenceCategory:(int64_t)a3
{
  self->_unstructuredCalendarDefaultConfidenceCategory = a3;
}

- (BOOL)unstructuredRemindersIsEnabled
{
  return self->_unstructuredRemindersIsEnabled;
}

- (void)setUnstructuredRemindersIsEnabled:(BOOL)a3
{
  self->_unstructuredRemindersIsEnabled = a3;
}

- (int64_t)unstructuredRemindersDefaultConfidenceCategory
{
  return self->_unstructuredRemindersDefaultConfidenceCategory;
}

- (void)setUnstructuredRemindersDefaultConfidenceCategory:(int64_t)a3
{
  self->_unstructuredRemindersDefaultConfidenceCategory = a3;
}

- (BOOL)primaryInteractionsIsEnabled
{
  return self->_primaryInteractionsIsEnabled;
}

- (void)setPrimaryInteractionsIsEnabled:(BOOL)a3
{
  self->_primaryInteractionsIsEnabled = a3;
}

- (int64_t)primaryInteractionsDefaultConfidenceCategory
{
  return self->_primaryInteractionsDefaultConfidenceCategory;
}

- (void)setPrimaryInteractionsDefaultConfidenceCategory:(int64_t)a3
{
  self->_primaryInteractionsDefaultConfidenceCategory = a3;
}

- (int64_t)primaryInteractionsModelType
{
  return self->_primaryInteractionsModelType;
}

- (void)setPrimaryInteractionsModelType:(int64_t)a3
{
  self->_primaryInteractionsModelType = a3;
}

- (BOOL)fallbackInteractionsIsEnabled
{
  return self->_fallbackInteractionsIsEnabled;
}

- (void)setFallbackInteractionsIsEnabled:(BOOL)a3
{
  self->_fallbackInteractionsIsEnabled = a3;
}

- (int64_t)fallbackInteractionsDefaultConfidenceCategory
{
  return self->_fallbackInteractionsDefaultConfidenceCategory;
}

- (void)setFallbackInteractionsDefaultConfidenceCategory:(int64_t)a3
{
  self->_fallbackInteractionsDefaultConfidenceCategory = a3;
}

- (int64_t)fallbackInteractionsModelType
{
  return self->_fallbackInteractionsModelType;
}

- (void)setFallbackInteractionsModelType:(int64_t)a3
{
  self->_fallbackInteractionsModelType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
}

@end
