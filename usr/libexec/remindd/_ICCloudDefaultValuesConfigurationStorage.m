@implementation _ICCloudDefaultValuesConfigurationStorage

+ (id)sharedConfiguration
{
  if (qword_100852728 != -1)
    dispatch_once(&qword_100852728, &stru_1007D9828);
  return (id)qword_100852720;
}

- (id)minimumClientVersion
{
  return CFSTR("9,0,0");
}

- (id)throttlingPolicy
{
  ICCloudThrottlingLevel *v2;
  ICCloudThrottlingPolicy *v3;
  void *v4;
  ICCloudThrottlingPolicy *v5;
  ICCloudThrottlingLevel *v7;

  v2 = -[ICCloudThrottlingLevel initWithBatchInterval:numberOfBatches:]([ICCloudThrottlingLevel alloc], "initWithBatchInterval:numberOfBatches:", 0, 60.0);
  v3 = [ICCloudThrottlingPolicy alloc];
  v7 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = -[ICCloudThrottlingPolicy initWithThrottlingLevels:resetInterval:](v3, "initWithThrottlingLevels:resetInterval:", v4, 86400.0);

  return v5;
}

- (double)pollingInterval
{
  return 0.0;
}

- (unint64_t)maxInlineAssetSizeBytes
{
  return 0x80000;
}

- (id)maximumAttachmentSizeMB
{
  return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 0x4000);
}

- (unint64_t)maxAttachmentsPerNote
{
  return 100;
}

- (unint64_t)maxSubAttachmentsPerAttachment
{
  return 24;
}

- (unint64_t)resultsLimitPerSyncOperation
{
  return 50;
}

- (unint64_t)fetchBatchSize
{
  return 10;
}

- (unint64_t)fetchCacheCountLimit
{
  return 5000;
}

- (double)reachabilityChangeSyncThrottleInterval
{
  return 3600.0;
}

- (double)launchAndSignificantTimeChangePollThrottleInterval
{
  return 94608000.0;
}

- (double)persistedSubscriptionIDsValidityPeriod
{
  return 864000.0;
}

- (double)apsDebouncerDefaultInterval
{
  return 15.0;
}

- (double)apsDebouncerMigrationInProgressInterval
{
  return 180.0;
}

- (double)apsDebouncerWatchDefaultInterval
{
  return 15.0;
}

- (double)apsDebouncerWatchMigrationInProgressInterval
{
  return 180.0;
}

- (double)accountChangedDebouncerInterval
{
  return 10.0;
}

- (double)mergeLocalObjectsInitialRetryInterval
{
  return 30.0;
}

- (unint64_t)mergeLocalObjectsMaximumRetryCount
{
  return 6;
}

- (double)mergeLocalObjectsRetryStartOverThrottleInterval
{
  return 86400.0;
}

- (double)cloudSchemaCatchUpSyncInitialRetryInterval
{
  return 60.0;
}

- (unint64_t)cloudSchemaCatchUpSyncMaximumRetryCount
{
  return 3;
}

- (unint64_t)fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount
{
  return 3;
}

- (unint64_t)objectEffectiveVersionValidationFlushBatchSize
{
  return 100;
}

- (id)suggestedAttributesTrainingOverrides
{
  return &off_100804F18;
}

- (id)suggestedAttributesHarvestingOverrides
{
  return &off_100804FB8;
}

- (double)suggestedAttributesAutoTrainingThrottleInterval
{
  return 86400.0;
}

- (double)manualSortHintClientSideExpiration
{
  return 31536000.0;
}

- (double)templatePublicLinkTTL
{
  return 157680000.0;
}

- (double)templatePublicLinkOperationTimeoutInterval
{
  return 30.0;
}

- (unint64_t)alarmIDsLimitPerReminder
{
  return 1000;
}

- (id)manualSortHintLastAccessedUpdatePolicy
{
  return CFSTR("month");
}

- (double)tapToRadarThrottlingInterval
{
  return 300.0;
}

- (double)housekeepingActivityMinimumDelay
{
  return 600.0;
}

- (double)cloudConfigurationDownloadThrottleInterval
{
  return 86400.0;
}

- (id)extraneousAlarmsCleanUpTriggerReductionFactor
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
}

- (unint64_t)extraneousAlarmsDeleteCountLimit
{
  return 200;
}

- (unint64_t)extraneousAlarmsDeleteCountThreshold
{
  return 10;
}

- (double)extraneousAlarmsBackoffThrottleInterval
{
  return 86400.0;
}

- (double)extraneousAlarmsThrottleInterval
{
  return 21600.0;
}

- (double)extraneousAlarmsCollectorDebounceInterval
{
  return 5.0;
}

- (double)extraneousAlarmsCollectorThrottleInterval
{
  return 43200.0;
}

- (double)staledFileAttachmentCleanupDefaultThrottleInterval
{
  return 86400.0;
}

- (double)staledFileAttachmentCleanupBackoffThrottleInterval
{
  return 2678400.0;
}

- (id)staledFileAttachmentCleanupRateReduceFactor
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
}

- (unint64_t)staledFileAttachmentCleanupPerRunDeleteLimit
{
  return 50;
}

- (double)imageDeduplicationDefaultThrottleInterval
{
  return 600.0;
}

- (double)imageDeduplicationBackoffThrottleInterval
{
  return 2678400.0;
}

- (id)imageDeduplicationRateReduceFactor
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
}

- (unint64_t)imageDeduplicationApproximatePerRunDeleteLimit
{
  return 50;
}

- (double)savedImageDeduplicationDefaultThrottleInterval
{
  return 600.0;
}

- (double)savedImageDeduplicationBackoffThrottleInterval
{
  return 2678400.0;
}

- (id)savedImageDeduplicationRateReduceFactor
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
}

- (unint64_t)savedImageDeduplicationApproximatePerRunDeleteLimit
{
  return 50;
}

- (double)suggestConversionToGroceryListDefaultThrottleInterval
{
  return 86400.0;
}

- (id)suggestConversionToGroceryListRateReduceFactor
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
}

- (id)languageHypothesisThresholdForPrimaryLanguage
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.3);
}

- (id)languageHypothesisThresholdForAdditionalLanguages
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.3);
}

- (id)miniumumAutomaticLanguageConfidenceScoreAllowed
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.05);
}

- (double)postAnalyticsDefaultThrottleInterval
{
  return 1209600.0;
}

- (id)postAnalyticsRateReduceFactor
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
}

- (double)batchDeleteExpiredRemindersDefaultThrottleInterval
{
  return 86400.0;
}

- (id)batchDeleteExpiredRemindersRateReduceFactor
{
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
}

- (double)batchDeleteExpiredRemindersMinimumDeletionTimeInterval
{
  return 3024000.0;
}

- (id)minimumSearchTermLengthByBaseLanguage
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[0] = REMMinimumSearchTermLengthBaseLanguageDefault;
  v3[1] = CFSTR("zh-Hans");
  v4[0] = &off_1008045C0;
  v4[1] = &off_1008045D8;
  v3[2] = CFSTR("zh-Hant");
  v3[3] = CFSTR("ja");
  v4[2] = &off_1008045D8;
  v4[3] = &off_1008045D8;
  v3[4] = CFSTR("ko");
  v4[4] = &off_1008045D8;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 5));
}

- (unint64_t)appStoreReviewCreatedOrCompletedRemindersCountThreshold
{
  return 20;
}

- (unint64_t)appStoreReviewNumberOfForegroundsThreshold
{
  return 3;
}

- (double)appStoreReviewTimeIntervalOfInterest
{
  return 2592000.0;
}

- (double)appStoreReviewTimeIntervalSinceInitialForeground
{
  return 604800.0;
}

- (double)appStoreReviewTimeIntervalSinceLastPrompt
{
  return 10368000.0;
}

- (double)appStoreReviewTimeIntervalSinceLastFetch
{
  return 1209600.0;
}

- (double)iCloudIsOffTimeIntervalSinceLastPrompt
{
  return 10368000.0;
}

@end
