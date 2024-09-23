@implementation SMInitiatorContact

- (SMInitiatorContact)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SMInitiatorContact *v7;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  LOBYTE(v10) = 1;
  LOWORD(v9) = 0;
  v7 = -[SMInitiatorContact initWithIdentifier:conversation:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:](self, "initWithIdentifier:conversation:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:", v3, 0, 0, 0, 0, 0, -1.0, -1.0, -1.0, 0,
         v4,
         v5,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         -1,
         -1,
         -1,
         -1,
         -1,
         -1,
         -1,
         v9,
         0,
         0,
         v10,
         0,
         v6,
         0,
         0,
         0,
         0);

  return v7;
}

- (SMInitiatorContact)initWithIdentifier:(id)a3 conversation:(id)a4 shouldBeCleanedUpDate:(id)a5 cloudkitShareZoneCleanedUpSuccessfully:(BOOL)a6 syncDate:(id)a7 keyReleaseMessageSendDate:(id)a8 scheduledSendExpiryDate:(id)a9 phoneCache:(id)a10 watchCache:(id)a11 sessionID:(id)a12 safetyCacheKey:(id)a13 allowReadToken:(id)a14 scheduleSendMessageGUID:(id)a15 unlockLocation:(id)a16 lockLocation:(id)a17 startingLocation:(id)a18 offWristLocation:(id)a19 parkedCarLocation:(id)a20 destinationMapItem:(id)a21 timeCacheUploadCompletion:(id)a22 maxCacheSize:(double)a23 maxLocationsInTrace:(int64_t)a24 maxTimeBetweenCacheUpdates:(double)a25 numCacheUpdates:(int64_t)a26 timeTilCacheRelease:(double)a27 numberOfSuccessfulCacheUpdates:(int64_t)a28 numberOfMessageCancelling:(int64_t)a29 numberOfSuccessfulMessageCancelling:(int64_t)a30 numberOfMessageScheduling:(int64_t)a31 numberOfSuccessfulMessageScheduling:(int64_t)a32 wasCacheReleased:(BOOL)a33 wasScheduledSendTriggered:(BOOL)a34 locationOfTrigger:(id)a35 triggerDate:(id)a36 lockState:(BOOL)a37 cacheUpdateBackstopExpiryDate:(id)a38 workoutEvents:(id)a39 numberOfHandoffBecomingActive:(int64_t)a40 numberOfHandoffBecomingNonActive:(int64_t)a41 earliestActiveDeviceIdentifier:(id)a42 latestActiveDeviceIdentifier:(id)a43
{
  id v48;
  id v49;
  SMInitiatorContact *v50;
  SMInitiatorContact *v51;
  void *v52;
  SMInitiatorContact *v53;
  SMInitiatorContact *v54;
  NSObject *v55;
  id v58;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  objc_super v81;
  uint8_t buf[16];

  v80 = a4;
  v58 = a5;
  v79 = a5;
  v78 = a8;
  v77 = a9;
  v76 = a10;
  v75 = a11;
  v74 = a15;
  v73 = a16;
  v72 = a17;
  v71 = a18;
  v70 = a19;
  v69 = a20;
  v68 = a21;
  v67 = a22;
  v66 = a35;
  v65 = a36;
  v64 = a38;
  v48 = a39;
  v63 = a42;
  v49 = a43;
  if (a3)
  {
    v81.receiver = self;
    v81.super_class = (Class)SMInitiatorContact;
    v50 = -[SMContact initWithIdentifier:sessionID:allowReadToken:safetyCacheKey:syncDate:sharingInvitationData:shareURL:participantID:](&v81, sel_initWithIdentifier_sessionID_allowReadToken_safetyCacheKey_syncDate_sharingInvitationData_shareURL_participantID_, a3, a12, a14, a13, a7, 0, 0, 0);
    v51 = v50;
    if (v50)
    {
      objc_storeStrong((id *)&v50->_conversation, a4);
      objc_storeStrong((id *)&v51->_shouldBeCleanedUpDate, v58);
      v51->_cloudkitShareZoneCleanedUpSuccessfully = a6;
      objc_storeStrong((id *)&v51->_scheduledSendExpiryDate, a9);
      objc_storeStrong((id *)&v51->_keyReleaseMessageSendDate, a8);
      objc_storeStrong((id *)&v51->_unlockLocation, a16);
      objc_storeStrong((id *)&v51->_lockLocation, a17);
      objc_storeStrong((id *)&v51->_startingLocation, a18);
      objc_storeStrong((id *)&v51->_offWristLocation, a19);
      objc_storeStrong((id *)&v51->_parkedCarLocation, a20);
      objc_storeStrong((id *)&v51->_destinationMapItem, a21);
      objc_storeStrong((id *)&v51->_phoneCache, a10);
      objc_storeStrong((id *)&v51->_watchCache, a11);
      objc_storeStrong((id *)&v51->_scheduleSendMessageGUID, a15);
      objc_storeStrong((id *)&v51->_timeCacheUploadCompletion, a22);
      v51->_maxCacheSize = a23;
      v51->_maxLocationsInTrace = a24;
      v51->_maxTimeBetweenCacheUpdates = a25;
      v51->_numCacheUpdates = a26;
      v51->_timeTilCacheRelease = a27;
      v51->_numberOfSuccessfulCacheUpdates = a28;
      v51->_numberOfMessageCancelling = a29;
      v51->_numberOfSuccessfulMessageCancelling = a30;
      v51->_numberOfMessageScheduling = a31;
      v51->_numberOfSuccessfulMessageScheduling = a32;
      v51->_wasCacheReleased = a33;
      v51->_wasScheduledSendTriggered = a34;
      objc_storeStrong((id *)&v51->_locationOfTrigger, a35);
      objc_storeStrong((id *)&v51->_triggerDate, a36);
      v51->_lockState = a37;
      objc_storeStrong((id *)&v51->_cacheUpdateBackstopExpiryDate, a38);
      v52 = v48;
      if (!v48)
        v52 = (void *)objc_opt_new();
      objc_storeStrong((id *)&v51->_workoutEvents, v52);
      if (!v48)

      v51->_numberOfHandoffBecomingActive = a40;
      v51->_numberOfHandoffBecomingNonActive = a41;
      objc_storeStrong((id *)&v51->_earliestActiveDeviceIdentifier, a42);
      objc_storeStrong((id *)&v51->_latestActiveDeviceIdentifier, a43);
    }
    v53 = v51;
    v54 = v53;
  }
  else
  {
    v53 = self;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v55, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v54 = 0;
  }

  return v54;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v21 = (void *)MEMORY[0x24BDD17C8];
  -[SMContact sessionUUID](self, "sessionUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMContact identifier](self, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact conversation](self, "conversation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "receiverHandles");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMContact syncDate](self, "syncDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringFromDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact keyReleaseMessageSendDate](self, "keyReleaseMessageSendDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringFromDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact shouldBeCleanedUpDate](self, "shouldBeCleanedUpDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringFromDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMContact allowReadToken](self, "allowReadToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMContact safetyCacheKey](self, "safetyCacheKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SMInitiatorContact cloudkitShareZoneCleanedUpSuccessfully](self, "cloudkitShareZoneCleanedUpSuccessfully");
  -[SMInitiatorContact scheduledSendExpiryDate](self, "scheduledSendExpiryDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringFromDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact scheduleSendMessageGUID](self, "scheduleSendMessageGUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact startingLocation](self, "startingLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact unlockLocation](self, "unlockLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact lockLocation](self, "lockLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact parkedCarLocation](self, "parkedCarLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact offWristLocation](self, "offWristLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact workoutEvents](self, "workoutEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = -[SMInitiatorContact numberOfHandoffBecomingActive](self, "numberOfHandoffBecomingActive");
  v8 = -[SMInitiatorContact numberOfHandoffBecomingNonActive](self, "numberOfHandoffBecomingNonActive");
  -[SMInitiatorContact earliestActiveDeviceIdentifier](self, "earliestActiveDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorContact latestActiveDeviceIdentifier](self, "latestActiveDeviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("sessionID,%@,identifier,%@,receiverHandles,%@,syncDate,%@,keyReleaseMessageDate,%@,shouldBeCleanedUpDate,%@,allowReadToken,%@,safetyCacheKey,%@,cloudKitCleanedUp,%d,scheduledSendDate,%@,scheduledSendGUID,%@,startLocation,%@,unlockLocation,%@,lockLocation,%@,parkedCarLocation,%@,offWristLocation,%@,workoutEventsCount,%lu,numberOfHandoffBecomingActive,%ld,numberOfHandoffBecomingNonActive,%ld,earliestActiveDeviceIdentifier,%@,latestActiveDeviceIdentifier,%@"), v32, v31, v30, v29, v28, v19, v18, v27, v17, v16, v15, v13, v14, v12, v3, v4,
    v6,
    v7,
    v8,
    v9,
    v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (SMConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (NSDate)shouldBeCleanedUpDate
{
  return self->_shouldBeCleanedUpDate;
}

- (void)setShouldBeCleanedUpDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)keyReleaseMessageSendDate
{
  return self->_keyReleaseMessageSendDate;
}

- (void)setKeyReleaseMessageSendDate:(id)a3
{
  objc_storeStrong((id *)&self->_keyReleaseMessageSendDate, a3);
}

- (BOOL)cloudkitShareZoneCleanedUpSuccessfully
{
  return self->_cloudkitShareZoneCleanedUpSuccessfully;
}

- (void)setCloudkitShareZoneCleanedUpSuccessfully:(BOOL)a3
{
  self->_cloudkitShareZoneCleanedUpSuccessfully = a3;
}

- (NSDate)scheduledSendExpiryDate
{
  return self->_scheduledSendExpiryDate;
}

- (void)setScheduledSendExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)scheduleSendMessageGUID
{
  return self->_scheduleSendMessageGUID;
}

- (void)setScheduleSendMessageGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (SMLocation)unlockLocation
{
  return self->_unlockLocation;
}

- (void)setUnlockLocation:(id)a3
{
  objc_storeStrong((id *)&self->_unlockLocation, a3);
}

- (SMLocation)lockLocation
{
  return self->_lockLocation;
}

- (void)setLockLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lockLocation, a3);
}

- (SMLocation)startingLocation
{
  return self->_startingLocation;
}

- (void)setStartingLocation:(id)a3
{
  objc_storeStrong((id *)&self->_startingLocation, a3);
}

- (SMLocation)offWristLocation
{
  return self->_offWristLocation;
}

- (void)setOffWristLocation:(id)a3
{
  objc_storeStrong((id *)&self->_offWristLocation, a3);
}

- (SMLocation)parkedCarLocation
{
  return self->_parkedCarLocation;
}

- (void)setParkedCarLocation:(id)a3
{
  objc_storeStrong((id *)&self->_parkedCarLocation, a3);
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void)setDestinationMapItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (SMCache)phoneCache
{
  return self->_phoneCache;
}

- (void)setPhoneCache:(id)a3
{
  objc_storeStrong((id *)&self->_phoneCache, a3);
}

- (SMCache)watchCache
{
  return self->_watchCache;
}

- (void)setWatchCache:(id)a3
{
  objc_storeStrong((id *)&self->_watchCache, a3);
}

- (NSDate)timeCacheUploadCompletion
{
  return self->_timeCacheUploadCompletion;
}

- (void)setTimeCacheUploadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (RTLocation)locationOfTrigger
{
  return self->_locationOfTrigger;
}

- (void)setLocationOfTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfTrigger, a3);
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDate)cacheUpdateBackstopExpiryDate
{
  return self->_cacheUpdateBackstopExpiryDate;
}

- (void)setCacheUpdateBackstopExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSMutableArray)workoutEvents
{
  return self->_workoutEvents;
}

- (void)setWorkoutEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (double)maxCacheSize
{
  return self->_maxCacheSize;
}

- (void)setMaxCacheSize:(double)a3
{
  self->_maxCacheSize = a3;
}

- (int64_t)maxLocationsInTrace
{
  return self->_maxLocationsInTrace;
}

- (void)setMaxLocationsInTrace:(int64_t)a3
{
  self->_maxLocationsInTrace = a3;
}

- (double)maxTimeBetweenCacheUpdates
{
  return self->_maxTimeBetweenCacheUpdates;
}

- (void)setMaxTimeBetweenCacheUpdates:(double)a3
{
  self->_maxTimeBetweenCacheUpdates = a3;
}

- (int64_t)numCacheUpdates
{
  return self->_numCacheUpdates;
}

- (void)setNumCacheUpdates:(int64_t)a3
{
  self->_numCacheUpdates = a3;
}

- (double)timeTilCacheRelease
{
  return self->_timeTilCacheRelease;
}

- (void)setTimeTilCacheRelease:(double)a3
{
  self->_timeTilCacheRelease = a3;
}

- (int64_t)numberOfSuccessfulCacheUpdates
{
  return self->_numberOfSuccessfulCacheUpdates;
}

- (void)setNumberOfSuccessfulCacheUpdates:(int64_t)a3
{
  self->_numberOfSuccessfulCacheUpdates = a3;
}

- (int64_t)numberOfMessageCancelling
{
  return self->_numberOfMessageCancelling;
}

- (void)setNumberOfMessageCancelling:(int64_t)a3
{
  self->_numberOfMessageCancelling = a3;
}

- (int64_t)numberOfSuccessfulMessageCancelling
{
  return self->_numberOfSuccessfulMessageCancelling;
}

- (void)setNumberOfSuccessfulMessageCancelling:(int64_t)a3
{
  self->_numberOfSuccessfulMessageCancelling = a3;
}

- (int64_t)numberOfMessageScheduling
{
  return self->_numberOfMessageScheduling;
}

- (void)setNumberOfMessageScheduling:(int64_t)a3
{
  self->_numberOfMessageScheduling = a3;
}

- (int64_t)numberOfSuccessfulMessageScheduling
{
  return self->_numberOfSuccessfulMessageScheduling;
}

- (void)setNumberOfSuccessfulMessageScheduling:(int64_t)a3
{
  self->_numberOfSuccessfulMessageScheduling = a3;
}

- (BOOL)wasCacheReleased
{
  return self->_wasCacheReleased;
}

- (void)setWasCacheReleased:(BOOL)a3
{
  self->_wasCacheReleased = a3;
}

- (BOOL)wasScheduledSendTriggered
{
  return self->_wasScheduledSendTriggered;
}

- (void)setWasScheduledSendTriggered:(BOOL)a3
{
  self->_wasScheduledSendTriggered = a3;
}

- (BOOL)lockState
{
  return self->_lockState;
}

- (void)setLockState:(BOOL)a3
{
  self->_lockState = a3;
}

- (int64_t)numberOfHandoffBecomingActive
{
  return self->_numberOfHandoffBecomingActive;
}

- (void)setNumberOfHandoffBecomingActive:(int64_t)a3
{
  self->_numberOfHandoffBecomingActive = a3;
}

- (int64_t)numberOfHandoffBecomingNonActive
{
  return self->_numberOfHandoffBecomingNonActive;
}

- (void)setNumberOfHandoffBecomingNonActive:(int64_t)a3
{
  self->_numberOfHandoffBecomingNonActive = a3;
}

- (NSUUID)earliestActiveDeviceIdentifier
{
  return self->_earliestActiveDeviceIdentifier;
}

- (void)setEarliestActiveDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSUUID)latestActiveDeviceIdentifier
{
  return self->_latestActiveDeviceIdentifier;
}

- (void)setLatestActiveDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestActiveDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_earliestActiveDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_cacheUpdateBackstopExpiryDate, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_locationOfTrigger, 0);
  objc_storeStrong((id *)&self->_timeCacheUploadCompletion, 0);
  objc_storeStrong((id *)&self->_watchCache, 0);
  objc_storeStrong((id *)&self->_phoneCache, 0);
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_parkedCarLocation, 0);
  objc_storeStrong((id *)&self->_offWristLocation, 0);
  objc_storeStrong((id *)&self->_startingLocation, 0);
  objc_storeStrong((id *)&self->_lockLocation, 0);
  objc_storeStrong((id *)&self->_unlockLocation, 0);
  objc_storeStrong((id *)&self->_scheduleSendMessageGUID, 0);
  objc_storeStrong((id *)&self->_scheduledSendExpiryDate, 0);
  objc_storeStrong((id *)&self->_keyReleaseMessageSendDate, 0);
  objc_storeStrong((id *)&self->_shouldBeCleanedUpDate, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
