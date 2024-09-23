@implementation ATXTimelineRelevanceAbuseControlOutcome

- (ATXTimelineRelevanceAbuseControlOutcome)initWithSuggestion:(id)a3 timestamp:(double)a4 abuseControlOutcome:(int64_t)a5
{
  id v8;
  void *v9;
  ATXTimelineRelevanceAbuseControlOutcome *v10;

  v8 = a3;
  objc_msgSend(v8, "suggestionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXTimelineRelevanceAbuseControlOutcome initWithSuggestion:suggestionId:timestamp:abuseControlOutcome:](self, "initWithSuggestion:suggestionId:timestamp:abuseControlOutcome:", v8, v9, a5, a4);

  return v10;
}

- (ATXTimelineRelevanceAbuseControlOutcome)initWithSuggestion:(id)a3 suggestionId:(id)a4 timestamp:(double)a5 abuseControlOutcome:(int64_t)a6
{
  id v11;
  id v12;
  ATXTimelineRelevanceAbuseControlOutcome *v13;
  ATXTimelineRelevanceAbuseControlOutcome *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXTimelineRelevanceAbuseControlOutcome;
  v13 = -[ATXTimelineRelevanceAbuseControlOutcome init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_timestamp = a5;
    objc_storeStrong((id *)&v13->_suggestion, a3);
    objc_storeStrong((id *)&v14->_suggestionId, a4);
    v14->_abuseControlOutcome = a6;
  }

  return v14;
}

+ (id)outcomeWithSuggestion:(id)a3 timestamp:(double)a4 abuseControlOutcome:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSuggestion:timestamp:abuseControlOutcome:", v8, a5, a4);

  return v9;
}

+ (id)outcomeWithSuggestionId:(id)a3 timestamp:(double)a4 abuseControlOutcome:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSuggestion:suggestionId:timestamp:abuseControlOutcome:", 0, v8, a5, a4);

  return v9;
}

+ (id)descriptionForOutcome:(int64_t)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("Outcome: Failure, Reason: FailureRecentDismissal: Recently dismissed by user");
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown abuse control outcome: %ld"), 0);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 2:
      result = CFSTR("Outcome: Failure, Reason: FailureWidgetIsOnDenyList: Widget on deny list");
      break;
    case 3:
      result = CFSTR("Outcome: Failure, Reason: FailureRotationExceededDurationLimit: Failed Abuse Control (exceeding duration limit)");
      break;
    case 4:
      result = CFSTR("Outcome: Failure, Reason: FailureEarlierSuggestionCurrentlyBeingPredictedWasChosen: Earlier suggestion from the same timeline still being predicted");
      break;
    case 5:
      result = CFSTR("Outcome: Failure, Reason: FailureLaterSuggestionChosen: Later suggestion from the same timeline");
      break;
    case 6:
      result = CFSTR("Outcome: Failure, Reason: FailureScoreIsSameAsThresholdButCountOfRecentRotationsExceedsSoftRotationQuota: score == threshold, but number of rotations >= softRotationQuota");
      break;
    case 7:
      result = CFSTR("Outcome: Failure, Reason: FailureNilRelevance: Timeline Suggestion with nil relevance. This should never happen.");
      break;
    case 8:
      result = CFSTR("Outcome: Failure, Reason: FailureNonPositiveScore: Timeline Suggestion with non-positive score. This should never happen.");
      break;
    case 9:
      result = CFSTR("Outcome: Failure, Reason: FailureNumberOfRecentRotationsHaveReachedHardRotationQuota: rotations for this timeline in the past 24 hour have reached or exceeded the hard rotation quota");
      break;
    case 10:
      result = CFSTR("Outcome: Failure, Reason: FailureSuggestionInCoolDown: Suggestion for this timeline is still in cool down");
      break;
    case 11:
      result = CFSTR("Outcome: Failure, Reason: FailureInsufficientHistory: Insufficient timeline relevance donation history");
      break;
    case 12:
      result = CFSTR("Outcome: Failure, Reason: FailureScoreIsSmallerThanThreshold: score < threshold");
      break;
    case 13:
      result = CFSTR("Outcome: Failure, Reason: FailureScoreIsSameAsThresholdBadLuck: score == threshold, suggestion failed abuse control test after coin toss");
      break;
    case 14:
      result = CFSTR("Outcome: Pass, Reason: PassWidgetKitDeveloperModeEnabled: WidgetKit Developer Mode is enabled and debugging is allowed for widget; bypassing abuse control");
      break;
    case 15:
      result = CFSTR("Outcome: Pass, Reason: PassWidgetHasUnlimitedSoftRotationQuota: Unlimited soft rotation quota");
      break;
    case 16:
      result = CFSTR("Outcome: Pass, Reason: PassSoftRotationQuotaExceedsAverageCountOfDailyEntries: avgNumEntryPerDay < softRotationQuota");
      break;
    case 17:
      result = CFSTR("Outcome: Pass, Reason: PassSuggestionPreviouslyPassedButWidgetHasNotBeenSurfaced: Suggestion has passed before and haven't been rotated to.");
      break;
    case 18:
      result = CFSTR("Outcome: Pass, Reason: PassWidgetWasSurfacedAndHasNotExceededDurationLimit: Rotation for this suggestion exists and is within duration limit");
      break;
    case 19:
      result = CFSTR("Outcome: Pass, Reason: PassScoreIsGreaterThanThreshold: score > threshold");
      break;
    case 20:
      result = CFSTR("Outcome: Pass, Reason: PassScoreIsSameAsThresholdGoodLuck: score == threshold, suggestion passed abuse control test after coin toss");
      break;
    case 21:
      result = CFSTR("Outcome: Suggestion has expired");
      break;
    case 22:
      result = CFSTR("Outcome: Failure, Reason: Blocked by Screen Time.");
      break;
    case 23:
      result = CFSTR("Outcome: Failure, Reason: FailureScoreIsSameAsThresholdRandomizationDisabled: score == threshold, randomization disabled");
      break;
    default:
LABEL_3:
      result = v3;
      break;
  }
  return result;
}

- (ATXInfoSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)abuseControlOutcome
{
  return self->_abuseControlOutcome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionId, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
