@implementation SMReceiverContact

- (SMReceiverContact)initWithIdentifier:(id)a3 syncDate:(id)a4 phoneCache:(id)a5 watchCache:(id)a6 sessionStatus:(id)a7 allowReadToken:(id)a8 safetyCacheKey:(id)a9 shareURL:(id)a10 participantID:(id)a11 sharingInvitationData:(id)a12 numCacheDownloads:(int64_t)a13 numSuccessfulCacheDownloads:(int64_t)a14 maxPhoneCacheSize:(int64_t)a15 maxWatchCacheSize:(int64_t)a16 maxLocationsInPhoneCacheTrace:(int64_t)a17 maxLocationsInWatchCacheTrace:(int64_t)a18 timeTillCacheRelease:(double)a19 timeTillFirstSuccessfulCacheDownload:(double)a20 sessionID:(id)a21 firstDetailViewSessionState:(int64_t)a22 lastDetailViewSessionState:(int64_t)a23 phoneMaxWorkoutEvents:(int64_t)a24 watchMaxWorkoutEvents:(int64_t)a25
{
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  SMReceiverContact *v39;
  SMReceiverContact *v40;
  SMReceiverContact *v41;
  SMReceiverContact *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  objc_super v55;
  uint8_t buf[16];

  v32 = a3;
  v54 = a4;
  v50 = a5;
  v49 = a6;
  v33 = a7;
  v53 = a8;
  v34 = a9;
  v35 = a10;
  v36 = a11;
  v37 = a12;
  v38 = a21;
  v52 = v35;
  if (!v32)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v42 = 0;
    v44 = v49;
    v43 = v50;
    goto LABEL_12;
  }
  if (!v33)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue();
    v44 = v49;
    v43 = v50;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionStatus", buf, 2u);
    }

    v42 = 0;
LABEL_12:
    v41 = self;
    goto LABEL_13;
  }
  v55.receiver = self;
  v55.super_class = (Class)SMReceiverContact;
  v51 = v34;
  v39 = -[SMContact initWithIdentifier:sessionID:allowReadToken:safetyCacheKey:syncDate:sharingInvitationData:shareURL:participantID:](&v55, sel_initWithIdentifier_sessionID_allowReadToken_safetyCacheKey_syncDate_sharingInvitationData_shareURL_participantID_, v32, v38, v53, v34, v54, v37, v35, v36);
  v40 = v39;
  if (v39)
  {
    objc_storeStrong((id *)&v39->_phoneCache, a5);
    objc_storeStrong((id *)&v40->_watchCache, a6);
    objc_storeStrong((id *)&v40->_sessionStatus, a7);
    v40->_numCacheDownloads = a13;
    v40->_numSuccessfulCacheDownloads = a14;
    v40->_maxPhoneCacheSize = a15;
    v40->_maxWatchCacheSize = a16;
    v40->_maxLocationsInPhoneCacheTrace = a17;
    v40->_maxLocationsInWatchCacheTrace = a18;
    v40->_timeTillCacheRelease = a19;
    v40->_timeTillFirstSuccessfulCacheDownload = a20;
    v40->_firstDetailViewSessionState = a22;
    v40->_lastDetailViewSessionState = a23;
    v40->_phoneMaxWorkoutEvents = a24;
    v40->_watchMaxWorkoutEvents = a25;
  }
  v41 = v40;
  v42 = v41;
  v44 = v49;
  v43 = v50;
  v34 = v51;
LABEL_13:

  return v42;
}

- (id)description
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMContact sessionUUID](self, "sessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMContact identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMReceiverContact sessionStatus](self, "sessionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "initiatorHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMContact syncDate](self, "syncDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMContact allowReadToken](self, "allowReadToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMContact safetyCacheKey](self, "safetyCacheKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sessionID,%@,identifier,%@,initiatorHandle,%@,syncDate,%@,allowReadToken,%@,safetyCacheKey,%@"), v4, v5, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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

- (SMReceiverSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (int64_t)numCacheDownloads
{
  return self->_numCacheDownloads;
}

- (void)setNumCacheDownloads:(int64_t)a3
{
  self->_numCacheDownloads = a3;
}

- (int64_t)numSuccessfulCacheDownloads
{
  return self->_numSuccessfulCacheDownloads;
}

- (void)setNumSuccessfulCacheDownloads:(int64_t)a3
{
  self->_numSuccessfulCacheDownloads = a3;
}

- (int64_t)maxPhoneCacheSize
{
  return self->_maxPhoneCacheSize;
}

- (void)setMaxPhoneCacheSize:(int64_t)a3
{
  self->_maxPhoneCacheSize = a3;
}

- (int64_t)maxWatchCacheSize
{
  return self->_maxWatchCacheSize;
}

- (void)setMaxWatchCacheSize:(int64_t)a3
{
  self->_maxWatchCacheSize = a3;
}

- (int64_t)maxLocationsInPhoneCacheTrace
{
  return self->_maxLocationsInPhoneCacheTrace;
}

- (void)setMaxLocationsInPhoneCacheTrace:(int64_t)a3
{
  self->_maxLocationsInPhoneCacheTrace = a3;
}

- (int64_t)maxLocationsInWatchCacheTrace
{
  return self->_maxLocationsInWatchCacheTrace;
}

- (void)setMaxLocationsInWatchCacheTrace:(int64_t)a3
{
  self->_maxLocationsInWatchCacheTrace = a3;
}

- (double)timeTillCacheRelease
{
  return self->_timeTillCacheRelease;
}

- (void)setTimeTillCacheRelease:(double)a3
{
  self->_timeTillCacheRelease = a3;
}

- (double)timeTillFirstSuccessfulCacheDownload
{
  return self->_timeTillFirstSuccessfulCacheDownload;
}

- (void)setTimeTillFirstSuccessfulCacheDownload:(double)a3
{
  self->_timeTillFirstSuccessfulCacheDownload = a3;
}

- (int64_t)firstDetailViewSessionState
{
  return self->_firstDetailViewSessionState;
}

- (void)setFirstDetailViewSessionState:(int64_t)a3
{
  self->_firstDetailViewSessionState = a3;
}

- (int64_t)lastDetailViewSessionState
{
  return self->_lastDetailViewSessionState;
}

- (void)setLastDetailViewSessionState:(int64_t)a3
{
  self->_lastDetailViewSessionState = a3;
}

- (int64_t)phoneMaxWorkoutEvents
{
  return self->_phoneMaxWorkoutEvents;
}

- (void)setPhoneMaxWorkoutEvents:(int64_t)a3
{
  self->_phoneMaxWorkoutEvents = a3;
}

- (int64_t)watchMaxWorkoutEvents
{
  return self->_watchMaxWorkoutEvents;
}

- (void)setWatchMaxWorkoutEvents:(int64_t)a3
{
  self->_watchMaxWorkoutEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_watchCache, 0);
  objc_storeStrong((id *)&self->_phoneCache, 0);
}

@end
