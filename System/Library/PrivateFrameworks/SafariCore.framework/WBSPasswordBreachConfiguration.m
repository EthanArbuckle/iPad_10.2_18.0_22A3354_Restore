@implementation WBSPasswordBreachConfiguration

- (WBSPasswordBreachConfiguration)initWithDictionary:(id)a3
{
  return -[WBSPasswordBreachConfiguration initWithDictionary:protocolClasses:allowValuesForTesting:](self, "initWithDictionary:protocolClasses:allowValuesForTesting:", a3, MEMORY[0x1E0C9AA60], 0);
}

- (WBSPasswordBreachConfiguration)initWithDictionary:(id)a3 protocolClasses:(id)a4 allowValuesForTesting:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  WBSPasswordBreachConfiguration *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  WBSPasswordBreachConfigurationDictionaryUnpacker *v20;
  uint64_t v21;
  NSString *highFrequencyBucketHashSalt;
  uint64_t v23;
  NSString *lowFrequencyBucketHashSalt;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSURL *highFrequencyBucketURL;
  uint64_t v29;
  NSURL *lowFrequencyBucketURL;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  WBSPasswordBreachConfiguration *v44;
  uint64_t v46;
  NSURLSessionConfiguration *urlSessionConfiguration;
  objc_super v48;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v48.receiver = self;
  v48.super_class = (Class)WBSPasswordBreachConfiguration;
  v10 = -[WBSPasswordBreachConfiguration init](&v48, sel_init);
  if (!v10)
  {
    v44 = 0;
    goto LABEL_34;
  }
  v11 = os_variant_allows_internal_security_policies();
  v10->_isInternalBuild = v11;
  if ((v11 & 1) == 0 && v5)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachConfiguration initWithDictionary:protocolClasses:allowValuesForTesting:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
    v5 = 0;
  }
  v20 = -[WBSPasswordBreachConfigurationDictionaryUnpacker initWithDictionary:]([WBSPasswordBreachConfigurationDictionaryUnpacker alloc], "initWithDictionary:", v8);
  -[WBSPasswordBreachConfigurationDictionaryUnpacker stringForKey:minimumLength:](v20, "stringForKey:minimumLength:", CFSTR("HighFrequencyBucketHashSalt"), 8);
  v21 = objc_claimAutoreleasedReturnValue();
  highFrequencyBucketHashSalt = v10->_highFrequencyBucketHashSalt;
  v10->_highFrequencyBucketHashSalt = (NSString *)v21;

  -[WBSPasswordBreachConfigurationDictionaryUnpacker stringForKey:minimumLength:](v20, "stringForKey:minimumLength:", CFSTR("LowFrequencyBucketHashSalt"), 8);
  v23 = objc_claimAutoreleasedReturnValue();
  lowFrequencyBucketHashSalt = v10->_lowFrequencyBucketHashSalt;
  v10->_lowFrequencyBucketHashSalt = (NSString *)v23;

  if (v5)
    v25 = 1;
  else
    v25 = 2048;
  if (v5)
    v26 = 1;
  else
    v26 = 15;
  v10->_highFrequencyBucketHashWorkFactor = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("HighFrequencyBucketHashWorkFactor"), v25, -1);
  v10->_lowFrequencyBucketHashWorkFactor = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("HighFrequencyBucketHashWorkFactor"), v25, -1);
  v10->_lowFrequencyBucketIdentifierBitCount = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("LowFrequencyBucketIdentifierBitCount"), v26, 26);
  v10->_highFrequencyBucketScryptBlockSizeR = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("HighFrequencyBucketScryptBlockSizeR"), 1, 100);
  v10->_highFrequencyBucketScryptParallelismFactorP = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("HighFrequencyBucketScryptParallelismFactorP"), 1, 100);
  v10->_lowFrequencyBucketScryptBlockSizeR = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("LowFrequencyBucketScryptBlockSizeR"), 1, 100);
  v10->_lowFrequencyBucketScryptParallelismFactorP = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("LowFrequencyBucketScryptParallelismFactorP"), 1, 100);
  -[WBSPasswordBreachConfigurationDictionaryUnpacker URLForKey:](v20, "URLForKey:", CFSTR("HighFrequencyBucketURL"));
  v27 = objc_claimAutoreleasedReturnValue();
  highFrequencyBucketURL = v10->_highFrequencyBucketURL;
  v10->_highFrequencyBucketURL = (NSURL *)v27;

  -[WBSPasswordBreachConfigurationDictionaryUnpacker URLForKey:](v20, "URLForKey:", CFSTR("LowFrequencyBucketURL"));
  v29 = objc_claimAutoreleasedReturnValue();
  lowFrequencyBucketURL = v10->_lowFrequencyBucketURL;
  v10->_lowFrequencyBucketURL = (NSURL *)v29;

  if (v5)
    v31 = 0;
  else
    v31 = 86400;
  if (v5)
    v32 = 1;
  else
    v32 = 5;
  if (v5)
    v33 = 1;
  else
    v33 = 3;
  if (v5)
    v34 = 1;
  else
    v34 = 10;
  v10->_minimumDelayBetweenSessions = (double)-[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("MinimumDelayBetweenSessions"), v31, 2592000);
  v10->_passwordCheckBatchSize = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("PasswordCheckBatchSize"), v32, 50);
  v10->_numberOfBatchesPerSession = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("NumberOfBatchesPerSession"), v33, 10);
  v10->_fakePasswordLengthBytes = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("FakePasswordLengthBytes"), v34, 30);
  v10->_lowFrequencyBucketFetchTimeout = -[WBSPasswordBreachConfigurationDictionaryUnpacker unsignedIntegerForKey:minimumValue:maximumValue:](v20, "unsignedIntegerForKey:minimumValue:maximumValue:", CFSTR("LowFrequencyBucketFetchTimeout"), v32, 120);
  if (+[WBSPasswordBreachCryptographicOperations isValidScryptHashWorkFactor:blockSizeR:parallelismFactorP:](WBSPasswordBreachCryptographicOperations, "isValidScryptHashWorkFactor:blockSizeR:parallelismFactorP:", v10->_lowFrequencyBucketHashWorkFactor, v10->_lowFrequencyBucketScryptBlockSizeR, v10->_lowFrequencyBucketScryptParallelismFactorP)&& +[WBSPasswordBreachCryptographicOperations isValidScryptHashWorkFactor:blockSizeR:parallelismFactorP:](WBSPasswordBreachCryptographicOperations, "isValidScryptHashWorkFactor:blockSizeR:parallelismFactorP:", v10->_highFrequencyBucketHashWorkFactor, v10->_highFrequencyBucketScryptBlockSizeR, v10->_highFrequencyBucketScryptParallelismFactorP))
  {
    if (v5)
    {
      v10->_shouldRefillBagWhenEmpty = -[WBSPasswordBreachConfigurationDictionaryUnpacker optionalBoolForKey:defaultValue:](v20, "optionalBoolForKey:defaultValue:", CFSTR("ShouldRefillBagWhenEmptyInternalOnly"), 1);
      v35 = -[WBSPasswordBreachConfigurationDictionaryUnpacker optionalBoolForKey:defaultValue:](v20, "optionalBoolForKey:defaultValue:", CFSTR("VerboseSensitiveLoggingInternalOnly"), 0);
    }
    else
    {
      v35 = 0;
      v10->_shouldRefillBagWhenEmpty = 1;
    }
    v10->_verboseSensitiveLoggingEnabled = v35;
    if (!-[WBSPasswordBreachConfigurationDictionaryUnpacker errorOccurred](v20, "errorOccurred"))
    {
      objc_msgSend(MEMORY[0x1E0C92CA0], "safari_ephemeralSessionConfiguration");
      v46 = objc_claimAutoreleasedReturnValue();
      urlSessionConfiguration = v10->_urlSessionConfiguration;
      v10->_urlSessionConfiguration = (NSURLSessionConfiguration *)v46;

      if (v9)
        -[NSURLSessionConfiguration setProtocolClasses:](v10->_urlSessionConfiguration, "setProtocolClasses:", v9);
      v44 = v10;
      goto LABEL_32;
    }
  }
  else
  {
    v36 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[WBSPasswordBreachConfiguration initWithDictionary:protocolClasses:allowValuesForTesting:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);
  }
  v44 = 0;
LABEL_32:

LABEL_34:
  return v44;
}

+ (WBSPasswordBreachConfiguration)standardConfiguration
{
  if (standardConfiguration_onceToken != -1)
    dispatch_once(&standardConfiguration_onceToken, &__block_literal_global_33);
  return (WBSPasswordBreachConfiguration *)(id)standardConfiguration_configuration;
}

void __55__WBSPasswordBreachConfiguration_standardConfiguration__block_invoke()
{
  void *v0;
  WBSPasswordBreachConfiguration *v1;
  void *v2;
  _QWORD v3[7];
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("LowFrequencyBucketIdentifierBitCount");
  v3[1] = CFSTR("HighFrequencyBucketURL");
  v4[0] = &unk_1E64CE3D0;
  v4[1] = CFSTR("https://pbs-service-idem-dev.usnkq03.app.apple.com/pbs/api/v1/bucket/");
  v3[2] = CFSTR("LowFrequencyBucketURL");
  v3[3] = CFSTR("PasswordCheckBatchSize");
  v4[2] = CFSTR("https://pbs-service-idem-dev.usnkq03.app.apple.com/pbs/api/v1/bucket/");
  v4[3] = &unk_1E64CE3E8;
  v3[4] = CFSTR("NumberOfBatchesPerSession");
  v3[5] = CFSTR("FakePasswordLengthBytes");
  v4[4] = &unk_1E64CE400;
  v4[5] = &unk_1E64CE418;
  v3[6] = CFSTR("LowFrequencyBucketFetchTimeout");
  v4[6] = &unk_1E64CE418;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[WBSPasswordBreachConfiguration initWithDictionary:]([WBSPasswordBreachConfiguration alloc], "initWithDictionary:", v0);
  v2 = (void *)standardConfiguration_configuration;
  standardConfiguration_configuration = (uint64_t)v1;

}

- (BOOL)shouldRefillBagWhenEmpty
{
  return !self->_isInternalBuild || self->_shouldRefillBagWhenEmpty;
}

- (BOOL)isVerboseSensitiveLoggingEnabled
{
  return self->_isInternalBuild && self->_verboseSensitiveLoggingEnabled;
}

- (NSString)highFrequencyBucketHashSalt
{
  return self->_highFrequencyBucketHashSalt;
}

- (NSString)lowFrequencyBucketHashSalt
{
  return self->_lowFrequencyBucketHashSalt;
}

- (unint64_t)highFrequencyBucketHashWorkFactor
{
  return self->_highFrequencyBucketHashWorkFactor;
}

- (unint64_t)lowFrequencyBucketHashWorkFactor
{
  return self->_lowFrequencyBucketHashWorkFactor;
}

- (unint64_t)highFrequencyBucketScryptBlockSizeR
{
  return self->_highFrequencyBucketScryptBlockSizeR;
}

- (unint64_t)lowFrequencyBucketScryptBlockSizeR
{
  return self->_lowFrequencyBucketScryptBlockSizeR;
}

- (unint64_t)highFrequencyBucketScryptParallelismFactorP
{
  return self->_highFrequencyBucketScryptParallelismFactorP;
}

- (unint64_t)lowFrequencyBucketScryptParallelismFactorP
{
  return self->_lowFrequencyBucketScryptParallelismFactorP;
}

- (unint64_t)lowFrequencyBucketIdentifierBitCount
{
  return self->_lowFrequencyBucketIdentifierBitCount;
}

- (NSURL)highFrequencyBucketURL
{
  return self->_highFrequencyBucketURL;
}

- (NSURL)lowFrequencyBucketURL
{
  return self->_lowFrequencyBucketURL;
}

- (NSURLSessionConfiguration)urlSessionConfiguration
{
  return self->_urlSessionConfiguration;
}

- (double)minimumDelayBetweenSessions
{
  return self->_minimumDelayBetweenSessions;
}

- (unint64_t)passwordCheckBatchSize
{
  return self->_passwordCheckBatchSize;
}

- (unint64_t)numberOfBatchesPerSession
{
  return self->_numberOfBatchesPerSession;
}

- (unint64_t)fakePasswordLengthBytes
{
  return self->_fakePasswordLengthBytes;
}

- (unint64_t)lowFrequencyBucketFetchTimeout
{
  return self->_lowFrequencyBucketFetchTimeout;
}

- (BOOL)verboseSensitiveLoggingEnabled
{
  return self->_verboseSensitiveLoggingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_lowFrequencyBucketURL, 0);
  objc_storeStrong((id *)&self->_highFrequencyBucketURL, 0);
  objc_storeStrong((id *)&self->_lowFrequencyBucketHashSalt, 0);
  objc_storeStrong((id *)&self->_highFrequencyBucketHashSalt, 0);
}

- (void)initWithDictionary:(uint64_t)a3 protocolClasses:(uint64_t)a4 allowValuesForTesting:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Invalid scrypt parameters.", a5, a6, a7, a8, 0);
}

- (void)initWithDictionary:(uint64_t)a3 protocolClasses:(uint64_t)a4 allowValuesForTesting:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Configuration allowValuesForTesting set to YES on non-internal device.", a5, a6, a7, a8, 0);
}

@end
