@implementation HKSPSleepEventRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)description
{
  return (NSString *)-[HKSPSleepEventRecord descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepEventRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (BOOL)isCurrentSleepWindDownShortcutsOnboardingCompleted
{
  _BOOL4 v3;

  v3 = -[HKSPSleepEventRecord isAnySleepWindDownShortcutsOnboardingCompleted](self, "isAnySleepWindDownShortcutsOnboardingCompleted");
  if (v3)
    LOBYTE(v3) = -[HKSPSleepEventRecord sleepWindDownShortcutsOnboardingCompletedVersion](self, "sleepWindDownShortcutsOnboardingCompletedVersion") > 1;
  return v3;
}

- (BOOL)isAnySleepWindDownShortcutsOnboardingCompleted
{
  return -[HKSPSleepEventRecord sleepWindDownShortcutsOnboardingCompletedVersion](self, "sleepWindDownShortcutsOnboardingCompletedVersion") != 0;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  -[HKSPSleepEventRecord wakeUpAlarmSnoozedUntilDate](self, "wakeUpAlarmSnoozedUntilDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_appendDateDescriptionIfRelevant:withName:toBuilder:", v5, CFSTR("wakeUpAlarmSnoozedUntilDate"), v3);

  v6 = (void *)objc_opt_class();
  -[HKSPSleepEventRecord wakeUpAlarmDismissedDate](self, "wakeUpAlarmDismissedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_appendDateDescriptionIfRelevant:withName:toBuilder:", v7, CFSTR("wakeUpAlarmDismissedDate"), v3);

  v8 = (void *)objc_opt_class();
  -[HKSPSleepEventRecord wakeUpOverriddenDate](self, "wakeUpOverriddenDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_appendDateDescriptionIfRelevant:withName:toBuilder:", v9, CFSTR("wakeUpOverriddenDate"), v3);

  v10 = (void *)objc_opt_class();
  -[HKSPSleepEventRecord wakeUpEarlyNotificationConfirmedDate](self, "wakeUpEarlyNotificationConfirmedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_appendDateDescriptionIfRelevant:withName:toBuilder:", v11, CFSTR("wakeUpEarlyNotificationConfirmedDate"), v3);

  v12 = (void *)objc_opt_class();
  -[HKSPSleepEventRecord wakeUpConfirmedUntilDate](self, "wakeUpConfirmedUntilDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_appendDateDescriptionIfRelevant:withName:toBuilder:", v13, CFSTR("wakeUpConfirmedUntilDate"), v3);

  v14 = (void *)objc_opt_class();
  -[HKSPSleepEventRecord goodMorningDismissedDate](self, "goodMorningDismissedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_appendDateDescriptionIfRelevant:withName:toBuilder:", v15, CFSTR("goodMorningDismissedDate"), v3);

  v16 = (id)objc_msgSend(v3, "appendInteger:withName:", -[HKSPSleepEventRecord sleepCoachingOnboardingCompletedVersion](self, "sleepCoachingOnboardingCompletedVersion"), CFSTR("sleepCoachingOnboardingCompletedVersion"));
  v17 = (void *)objc_opt_class();
  -[HKSPSleepEventRecord sleepCoachingOnboardingFirstCompletedDate](self, "sleepCoachingOnboardingFirstCompletedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_appendDateDescriptionIfRelevant:withName:toBuilder:", v18, CFSTR("sleepCoachingOnboardingFirstCompletedDate"), v3);

  v19 = (id)objc_msgSend(v3, "appendInteger:withName:", -[HKSPSleepEventRecord sleepTrackingOnboardingCompletedVersion](self, "sleepTrackingOnboardingCompletedVersion"), CFSTR("sleepTrackingOnboardingCompletedVersion"));
  v20 = (void *)objc_opt_class();
  -[HKSPSleepEventRecord sleepTrackingOnboardingFirstCompletedDate](self, "sleepTrackingOnboardingFirstCompletedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_appendDateDescriptionIfRelevant:withName:toBuilder:", v21, CFSTR("sleepTrackingOnboardingFirstCompletedDate"), v3);

  v22 = (id)objc_msgSend(v3, "appendInteger:withName:", -[HKSPSleepEventRecord sleepWindDownShortcutsOnboardingCompletedVersion](self, "sleepWindDownShortcutsOnboardingCompletedVersion"), CFSTR("sleepWindDownShortcutsOnboardingCompletedVersion"));
  v23 = (void *)objc_opt_class();
  -[HKSPSleepEventRecord sleepWindDownShortcutsOnboardingFirstCompletedDate](self, "sleepWindDownShortcutsOnboardingFirstCompletedDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_appendDateDescriptionIfRelevant:withName:toBuilder:", v24, CFSTR("sleepWindDownShortcutsOnboardingFirstCompletedDate"), v3);

  return v3;
}

+ (void)_appendDateDescriptionIfRelevant:(id)a3 withName:(id)a4 toBuilder:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToDate:", v9) & 1) != 0)
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "isEqualToDate:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v12, "hkspDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:withName:", v9, v7);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (int64_t)sleepWindDownShortcutsOnboardingCompletedVersion
{
  return self->_sleepWindDownShortcutsOnboardingCompletedVersion;
}

- (NSDate)sleepTrackingOnboardingFirstCompletedDate
{
  return self->_sleepTrackingOnboardingFirstCompletedDate;
}

- (int64_t)sleepCoachingOnboardingCompletedVersion
{
  return self->_sleepCoachingOnboardingCompletedVersion;
}

- (NSDate)wakeUpOverriddenDate
{
  return self->_wakeUpOverriddenDate;
}

- (NSDate)wakeUpEarlyNotificationConfirmedDate
{
  return self->_wakeUpEarlyNotificationConfirmedDate;
}

- (NSDate)wakeUpConfirmedUntilDate
{
  return self->_wakeUpConfirmedUntilDate;
}

- (NSDate)wakeUpAlarmSnoozedUntilDate
{
  return self->_wakeUpAlarmSnoozedUntilDate;
}

- (NSDate)wakeUpAlarmDismissedDate
{
  return self->_wakeUpAlarmDismissedDate;
}

- (NSDate)sleepWindDownShortcutsOnboardingFirstCompletedDate
{
  return self->_sleepWindDownShortcutsOnboardingFirstCompletedDate;
}

- (NSDate)sleepCoachingOnboardingFirstCompletedDate
{
  return self->_sleepCoachingOnboardingFirstCompletedDate;
}

- (NSDate)goodMorningDismissedDate
{
  return self->_goodMorningDismissedDate;
}

- (BOOL)isCurrentSleepTrackingOnboardingCompleted
{
  _BOOL4 v3;

  v3 = -[HKSPSleepEventRecord isAnySleepTrackingOnboardingCompleted](self, "isAnySleepTrackingOnboardingCompleted");
  if (v3)
    LOBYTE(v3) = -[HKSPSleepEventRecord sleepTrackingOnboardingCompletedVersion](self, "sleepTrackingOnboardingCompletedVersion") > 1;
  return v3;
}

- (BOOL)isAnySleepTrackingOnboardingCompleted
{
  return -[HKSPSleepEventRecord sleepTrackingOnboardingCompletedVersion](self, "sleepTrackingOnboardingCompletedVersion") != 0;
}

- (int64_t)sleepTrackingOnboardingCompletedVersion
{
  return self->_sleepTrackingOnboardingCompletedVersion;
}

- (BOOL)isCurrentSleepCoachingOnboardingCompleted
{
  _BOOL4 v3;

  v3 = -[HKSPSleepEventRecord isAnySleepCoachingOnboardingCompleted](self, "isAnySleepCoachingOnboardingCompleted");
  if (v3)
    LOBYTE(v3) = -[HKSPSleepEventRecord sleepCoachingOnboardingCompletedVersion](self, "sleepCoachingOnboardingCompletedVersion") > 1;
  return v3;
}

- (BOOL)isAnySleepCoachingOnboardingCompleted
{
  return -[HKSPSleepEventRecord sleepCoachingOnboardingCompletedVersion](self, "sleepCoachingOnboardingCompletedVersion") != 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  HKSPEncodeObjectWithCoder(self, v4);
  if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_syncAnchor, CFSTR("HKSPEventRecordSyncAnchor"));

}

- (BOOL)_needsMigrationForCoder:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "hksp_serializationOptions") & 1) != 0
    && objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("HKSPEventRecordVersion")) == 0;

  return v4;
}

- (HKSPSleepEventRecord)initWithCoder:(id)a3
{
  id v4;
  HKSPSleepEventRecord *v5;
  HKSPSleepEventRecord *v6;
  uint64_t v7;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepEventRecord *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSPSleepEventRecord;
  v5 = -[HKSPSleepEventRecord init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", HKSPSyncAnchorClass(), CFSTR("HKSPEventRecordSyncAnchor"));
      v7 = objc_claimAutoreleasedReturnValue();
      syncAnchor = v6->_syncAnchor;
      v6->_syncAnchor = (HKSPSyncAnchor *)v7;

    }
    if (-[HKSPSleepEventRecord _needsMigrationForCoder:](v6, "_needsMigrationForCoder:", v4))
      -[HKSPSleepEventRecord _migrateForCoder:](v6, "_migrateForCoder:", v4);
    v9 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepWindDownShortcutsOnboardingFirstCompletedDate, 0);
  objc_storeStrong((id *)&self->_sleepTrackingOnboardingFirstCompletedDate, 0);
  objc_storeStrong((id *)&self->_sleepCoachingOnboardingFirstCompletedDate, 0);
  objc_storeStrong((id *)&self->_goodMorningDismissedDate, 0);
  objc_storeStrong((id *)&self->_wakeUpAlarmSnoozedUntilDate, 0);
  objc_storeStrong((id *)&self->_wakeUpConfirmedUntilDate, 0);
  objc_storeStrong((id *)&self->_wakeUpOverriddenDate, 0);
  objc_storeStrong((id *)&self->_wakeUpAlarmDismissedDate, 0);
  objc_storeStrong((id *)&self->_wakeUpEarlyNotificationConfirmedDate, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
}

- (BOOL)isEqualToOnboardingModel:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = -[HKSPSleepEventRecord sleepCoachingOnboardingCompletedVersion](self, "sleepCoachingOnboardingCompletedVersion");
  if (v5 == objc_msgSend(v4, "sleepCoachingOnboardingCompletedVersion")
    && (v6 = -[HKSPSleepEventRecord sleepTrackingOnboardingCompletedVersion](self, "sleepTrackingOnboardingCompletedVersion"), v6 == objc_msgSend(v4, "sleepTrackingOnboardingCompletedVersion")))
  {
    v7 = -[HKSPSleepEventRecord sleepWindDownShortcutsOnboardingCompletedVersion](self, "sleepWindDownShortcutsOnboardingCompletedVersion");
    v8 = v7 == objc_msgSend(v4, "sleepWindDownShortcutsOnboardingCompletedVersion");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HKSPSleepEventRecord)init
{
  HKSPSleepEventRecord *v2;
  HKSPSleepEventRecord *v3;
  uint64_t v4;
  NSDate *wakeUpEarlyNotificationConfirmedDate;
  uint64_t v6;
  NSDate *wakeUpConfirmedUntilDate;
  uint64_t v8;
  NSDate *wakeUpAlarmDismissedDate;
  uint64_t v10;
  NSDate *wakeUpOverriddenDate;
  uint64_t v12;
  NSDate *wakeUpAlarmSnoozedUntilDate;
  uint64_t v14;
  NSDate *goodMorningDismissedDate;
  NSDate *sleepCoachingOnboardingFirstCompletedDate;
  NSDate *sleepTrackingOnboardingFirstCompletedDate;
  NSDate *sleepWindDownShortcutsOnboardingFirstCompletedDate;
  HKSPSleepEventRecord *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HKSPSleepEventRecord;
  v2 = -[HKSPSleepEventRecord init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = objc_claimAutoreleasedReturnValue();
    wakeUpEarlyNotificationConfirmedDate = v3->_wakeUpEarlyNotificationConfirmedDate;
    v3->_wakeUpEarlyNotificationConfirmedDate = (NSDate *)v4;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = objc_claimAutoreleasedReturnValue();
    wakeUpConfirmedUntilDate = v3->_wakeUpConfirmedUntilDate;
    v3->_wakeUpConfirmedUntilDate = (NSDate *)v6;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = objc_claimAutoreleasedReturnValue();
    wakeUpAlarmDismissedDate = v3->_wakeUpAlarmDismissedDate;
    v3->_wakeUpAlarmDismissedDate = (NSDate *)v8;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = objc_claimAutoreleasedReturnValue();
    wakeUpOverriddenDate = v3->_wakeUpOverriddenDate;
    v3->_wakeUpOverriddenDate = (NSDate *)v10;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v12 = objc_claimAutoreleasedReturnValue();
    wakeUpAlarmSnoozedUntilDate = v3->_wakeUpAlarmSnoozedUntilDate;
    v3->_wakeUpAlarmSnoozedUntilDate = (NSDate *)v12;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v14 = objc_claimAutoreleasedReturnValue();
    goodMorningDismissedDate = v3->_goodMorningDismissedDate;
    v3->_goodMorningDismissedDate = (NSDate *)v14;

    sleepCoachingOnboardingFirstCompletedDate = v3->_sleepCoachingOnboardingFirstCompletedDate;
    v3->_sleepCoachingOnboardingCompletedVersion = 0;
    v3->_sleepCoachingOnboardingFirstCompletedDate = 0;

    sleepTrackingOnboardingFirstCompletedDate = v3->_sleepTrackingOnboardingFirstCompletedDate;
    v3->_sleepTrackingOnboardingCompletedVersion = 0;
    v3->_sleepTrackingOnboardingFirstCompletedDate = 0;

    sleepWindDownShortcutsOnboardingFirstCompletedDate = v3->_sleepWindDownShortcutsOnboardingFirstCompletedDate;
    v3->_sleepWindDownShortcutsOnboardingCompletedVersion = 0;
    v3->_sleepWindDownShortcutsOnboardingFirstCompletedDate = 0;

    v19 = v3;
  }

  return v3;
}

- (id)initFromObject:(id)a3
{
  id v4;
  id v5;
  HKSPSleepEventRecord *v6;
  void *v7;
  uint64_t v8;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepEventRecord *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[HKSPSleepEventRecord init](self, "init");
    HKSPCopyFromObject(v5, v6);
    objc_msgSend(v5, "syncAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "copyWithZone:", 0);
    syncAnchor = v6->_syncAnchor;
    v6->_syncAnchor = (HKSPSyncAnchor *)v8;

    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)objectWithSyncAnchor:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initFromObject:", self);
  v6 = objc_msgSend(v4, "copyWithZone:", 0);

  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (void)_migrateForCoder:(id)a3
{
  self->_version = 1;
}

- (id)mutableCopy
{
  return -[HKSPMutableSleepEventRecord initFromObject:]([HKSPMutableSleepEventRecord alloc], "initFromObject:", self);
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_286);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSleepEventRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isConsolidatedSleepCoachingOnboardingCompleted
{
  _BOOL4 v3;

  v3 = -[HKSPSleepEventRecord isAnySleepCoachingOnboardingCompleted](self, "isAnySleepCoachingOnboardingCompleted");
  if (v3)
    LOBYTE(v3) = -[HKSPSleepEventRecord sleepCoachingOnboardingCompletedVersion](self, "sleepCoachingOnboardingCompletedVersion") > 2;
  return v3;
}

- (BOOL)isConsolidatedSleepTrackingOnboardingCompleted
{
  _BOOL4 v3;

  v3 = -[HKSPSleepEventRecord isAnySleepTrackingOnboardingCompleted](self, "isAnySleepTrackingOnboardingCompleted");
  if (v3)
    LOBYTE(v3) = -[HKSPSleepEventRecord sleepTrackingOnboardingCompletedVersion](self, "sleepTrackingOnboardingCompletedVersion") > 2;
  return v3;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

@end
