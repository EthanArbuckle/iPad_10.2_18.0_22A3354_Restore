@implementation PCSCKKSItemModifyContext

- (PCSCKKSItemModifyContext)init
{
  PCSCKKSItemModifyContext *v2;
  PCSMTT *v3;
  PCSMTT *mtt;
  uint64_t v5;
  PCSCKKSItemModifyContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PCSCKKSItemModifyContext;
  v2 = -[PCSCKKSItemModifyContext init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PCSMTT);
    mtt = v2->_mtt;
    v2->_mtt = v3;

    v5 = PCSCKKSItemContextTimeout;
    if (!PCSCKKSItemContextTimeout)
      v5 = 300;
    v2->_timeoutValue = v5;
    v6 = v2;
  }

  return v2;
}

- (void)resetIdentities
{
  _PCSIdentityData *currentIdentity;
  _PCSIdentityData *rollIdentity;
  NSData *currentItemReference;
  NSData *existingItemSHA1;
  NSData *existingItemReference;
  NSData *rollItemSHA1;
  NSData *rollItemReference;

  currentIdentity = self->_currentIdentity;
  if (currentIdentity)
  {
    self->_currentIdentity = 0;
    CFRelease(currentIdentity);
  }
  rollIdentity = self->_rollIdentity;
  if (rollIdentity)
  {
    self->_rollIdentity = 0;
    CFRelease(rollIdentity);
  }
  currentItemReference = self->_currentItemReference;
  self->_currentItemReference = 0;

  existingItemSHA1 = self->_existingItemSHA1;
  self->_existingItemSHA1 = 0;

  existingItemReference = self->_existingItemReference;
  self->_existingItemReference = 0;

  rollItemSHA1 = self->_rollItemSHA1;
  self->_rollItemSHA1 = 0;

  rollItemReference = self->_rollItemReference;
  self->_rollItemReference = 0;

}

- (void)setCurrentIdentity:(_PCSIdentityData *)a3 persistentReference:(id)a4
{
  NSData *v6;
  _PCSIdentityData *currentIdentity;
  NSData *currentItemReference;

  v6 = (NSData *)a4;
  currentIdentity = self->_currentIdentity;
  if (currentIdentity)
  {
    self->_currentIdentity = 0;
    CFRelease(currentIdentity);
  }
  if (a3)
    self->_currentIdentity = (_PCSIdentityData *)CFRetain(a3);
  currentItemReference = self->_currentItemReference;
  self->_currentItemReference = v6;

}

- (void)dealloc
{
  __PCSLogContext *log;
  __CFDictionary *rollAttributes;
  objc_super v5;

  -[PCSCKKSItemModifyContext resetIdentities](self, "resetIdentities");
  log = self->_log;
  if (log)
    CFRelease(log);
  rollAttributes = self->_rollAttributes;
  if (rollAttributes)
    CFRelease(rollAttributes);
  v5.receiver = self;
  v5.super_class = (Class)PCSCKKSItemModifyContext;
  -[PCSCKKSItemModifyContext dealloc](&v5, sel_dealloc);
}

- (_PCSIdentitySetData)set
{
  return self->_set;
}

- (void)setSet:(_PCSIdentitySetData *)a3
{
  self->_set = a3;
}

- (__PCSLogContext)log
{
  return self->_log;
}

- (void)setLog:(__PCSLogContext *)a3
{
  self->_log = a3;
}

- (int64_t)timeoutValue
{
  return self->_timeoutValue;
}

- (void)setTimeoutValue:(int64_t)a3
{
  self->_timeoutValue = a3;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (_PCSIdentityData)currentIdentity
{
  return self->_currentIdentity;
}

- (NSData)currentItemReference
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)existingItemReference
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExistingItemReference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)existingItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExistingItemSHA1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (_PCSIdentityData)rollIdentity
{
  return self->_rollIdentity;
}

- (void)setRollIdentity:(_PCSIdentityData *)a3
{
  self->_rollIdentity = a3;
}

- (NSData)rollItemReference
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRollItemReference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSData)rollItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRollItemSHA1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDate)server_NextRollDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setServer_NextRollDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)sync
{
  return self->_sync;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (BOOL)forceSync
{
  return self->_forceSync;
}

- (void)setForceSync:(BOOL)a3
{
  self->_forceSync = a3;
}

- (BOOL)roll
{
  return self->_roll;
}

- (void)setRoll:(BOOL)a3
{
  self->_roll = a3;
}

- (int)retryLeftCount
{
  return self->_retryLeftCount;
}

- (void)setRetryLeftCount:(int)a3
{
  self->_retryLeftCount = a3;
}

- (PCSMTT)mtt
{
  return (PCSMTT *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)returnedExistingIdentity
{
  return self->_returnedExistingIdentity;
}

- (void)setReturnedExistingIdentity:(BOOL)a3
{
  self->_returnedExistingIdentity = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PCSLockAssertion)lockAssertion
{
  return (PCSLockAssertion *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLockAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (id)activityAssertion
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setActivityAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityAssertion, 0);
  objc_storeStrong((id *)&self->_lockAssertion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_mtt, 0);
  objc_storeStrong((id *)&self->_server_NextRollDate, 0);
  objc_storeStrong((id *)&self->_rollItemSHA1, 0);
  objc_storeStrong((id *)&self->_rollItemReference, 0);
  objc_storeStrong((id *)&self->_existingItemSHA1, 0);
  objc_storeStrong((id *)&self->_existingItemReference, 0);
  objc_storeStrong((id *)&self->_currentItemReference, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
