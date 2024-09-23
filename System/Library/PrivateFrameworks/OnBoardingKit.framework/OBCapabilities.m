@implementation OBCapabilities

- (BOOL)eligibleForChlorine
{
  OBCapabilities *v2;
  NSNumber *overrideEligibleForChlorine;
  BOOL v4;
  int domain_answer;
  NSObject *v6;

  v2 = self;
  objc_sync_enter(v2);
  overrideEligibleForChlorine = v2->_overrideEligibleForChlorine;
  if (overrideEligibleForChlorine)
  {
    v4 = -[NSNumber BOOLValue](overrideEligibleForChlorine, "BOOLValue");
    objc_sync_exit(v2);

  }
  else
  {
    objc_sync_exit(v2);

    domain_answer = os_eligibility_get_domain_answer();
    _OBLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[OBCapabilities eligibleForChlorine].cold.1(domain_answer, v6);

    return 0;
  }
  return v4;
}

+ (id)sharedCapabilities
{
  if (sharedCapabilities_onceToken != -1)
    dispatch_once(&sharedCapabilities_onceToken, &__block_literal_global_2);
  return (id)sharedCapabilities_sharedInstance;
}

void __36__OBCapabilities_sharedCapabilities__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCapabilities_sharedInstance;
  sharedCapabilities_sharedInstance = v0;

}

- (BOOL)isWAPI
{
  if (isWAPI_onceToken != -1)
    dispatch_once(&isWAPI_onceToken, &__block_literal_global_1);
  return isWAPI_wapi;
}

uint64_t __24__OBCapabilities_isWAPI__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isWAPI_wapi = result;
  return result;
}

- (BOOL)deviceSupportsGenerativeModels
{
  return MGGetBoolAnswer();
}

- (NSNumber)overrideEligibleForChlorine
{
  OBCapabilities *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_overrideEligibleForChlorine;
  objc_sync_exit(v2);

  return v3;
}

- (void)setOverrideEligibleForChlorine:(id)a3
{
  NSNumber *v4;
  NSNumber *overrideEligibleForChlorine;
  OBCapabilities *obj;

  v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  overrideEligibleForChlorine = obj->_overrideEligibleForChlorine;
  obj->_overrideEligibleForChlorine = v4;

  objc_sync_exit(obj);
}

- (BOOL)preventURLDataDetection
{
  return self->_preventURLDataDetection;
}

- (void)setPreventURLDataDetection:(BOOL)a3
{
  self->_preventURLDataDetection = a3;
}

- (BOOL)preventOpeningSafari
{
  return self->_preventOpeningSafari;
}

- (void)setPreventOpeningSafari:(BOOL)a3
{
  self->_preventOpeningSafari = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideEligibleForChlorine, 0);
}

- (void)eligibleForChlorine
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_199FE5000, a2, OS_LOG_TYPE_ERROR, "Failed to get eligibility for chlorine with error %d", (uint8_t *)v2, 8u);
}

@end
