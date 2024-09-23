@implementation SESProximityChip

+ (id)sharedObject
{
  if (qword_10034BAF0 != -1)
    dispatch_once(&qword_10034BAF0, &stru_1003035D8);
  return (id)qword_10034BAE8;
}

- (SESProximityChip)init
{
  SESProximityChip *v2;
  SESProximityChip *v3;
  PRChipInfo *chipInformation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SESProximityChip;
  v2 = -[SESProximityChip init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    chipInformation = v2->_chipInformation;
    v2->_chipInformation = 0;

    v3->_chipType = 0;
    v3->_isSupported = 1;
  }
  return v3;
}

+ (void)cacheProximityChipData:(id)a3
{
  void (**v3)(id, os_unfair_lock_s *);
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  _QWORD v8[4];
  os_unfair_lock_s *v9;
  void (**v10)(id, os_unfair_lock_s *);

  v3 = (void (**)(id, os_unfair_lock_s *))a3;
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(+[SESProximityChip sharedObject](SESProximityChip, "sharedObject"));
  v5 = v4 + 2;
  os_unfair_lock_lock(v4 + 2);
  if (-[os_unfair_lock_s done](v4, "done"))
  {
    v3[2](v3, v4);
    os_unfair_lock_unlock(v5);
  }
  else
  {
    os_unfair_lock_unlock(v5);
    global_queue = dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100016CFC;
    v8[3] = &unk_100303078;
    v9 = v4;
    v10 = v3;
    dispatch_async(v7, v8);

  }
}

- (void)cacheProximityChipData
{
  os_unfair_lock_s *p_cacheLock;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  uint64_t v6;
  uint64_t v7;
  PRChipInfo *v8;
  PRChipInfo *chipInformation;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int64_t chipType;
  _BOOL4 v15;
  int v16;
  int64_t v17;
  __int16 v18;
  _BOOL4 v19;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  if (!-[SESProximityChip done](self, "done"))
  {
    v4 = IOServiceNameMatching("rose");
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
    self->_isSupported = MatchingService != 0;
    v6 = IOObjectRelease(MatchingService);
    v7 = PRGetChipInfo(v6);
    v8 = (PRChipInfo *)objc_claimAutoreleasedReturnValue(v7);
    chipInformation = self->_chipInformation;
    self->_chipInformation = v8;

    v10 = PRGetChipType();
    self->_chipType = v10;
    if (self->_isSupported && (!v10 || !self->_chipInformation))
    {
      v12 = SESDefaultLogObject(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        chipType = self->_chipType;
        v15 = self->_chipInformation == 0;
        v16 = 134218240;
        v17 = chipType;
        v18 = 1024;
        v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to retrieve proximity chip type %ld information missing %d", (uint8_t *)&v16, 0x12u);
      }

      +[SESTapToRadar requestTapToRadar:client:](SESTapToRadar, "requestTapToRadar:client:", CFSTR("Failure retrieving proximity chip information"), CFSTR("FailedProximityChipQuery"));
    }
  }
  os_unfair_lock_unlock(p_cacheLock);
}

- (BOOL)isSupported
{
  SESProximityChip *v2;
  os_unfair_lock_s *p_cacheLock;

  v2 = self;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  LOBYTE(v2) = v2->_isSupported;
  os_unfair_lock_unlock(p_cacheLock);
  return (char)v2;
}

- (id)getInformation
{
  os_unfair_lock_s *p_cacheLock;
  PRChipInfo *v4;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v4 = self->_chipInformation;
  os_unfair_lock_unlock(p_cacheLock);
  return v4;
}

- (int64_t)getType
{
  os_unfair_lock_s *p_cacheLock;
  int64_t chipType;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  chipType = self->_chipType;
  os_unfair_lock_unlock(p_cacheLock);
  return chipType;
}

- (BOOL)done
{
  os_unfair_lock_assert_owner(&self->_cacheLock);
  if (!self->_isSupported)
    return 1;
  if (self->_chipInformation)
    return self->_chipType != 0;
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipInformation, 0);
}

@end
