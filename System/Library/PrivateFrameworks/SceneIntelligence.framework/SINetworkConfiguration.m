@implementation SINetworkConfiguration

- (SINetworkConfiguration)init
{
  return -[SINetworkConfiguration initWithEventName:](self, "initWithEventName:", 0);
}

- (SINetworkConfiguration)initWithEventName:(id)a3
{
  NSString *v4;
  SINetworkConfiguration *v5;
  SINetworkConfiguration *v6;
  NSString *algorithmClassName;
  uint64_t v8;
  NSMutableSet *disabledOutputBlobs;
  NSString *networkMode;
  NSString *networkFunction;
  NSString *defaultVisualLoggerName;
  SINetworkConfiguration *v13;
  objc_super v15;

  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)SINetworkConfiguration;
  v5 = -[SINetworkConfiguration init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    algorithmClassName = v5->_algorithmClassName;
    v5->_algorithmClassName = 0;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    disabledOutputBlobs = v6->_disabledOutputBlobs;
    v6->_disabledOutputBlobs = (NSMutableSet *)v8;

    networkMode = v6->_networkMode;
    v6->_networkMode = (NSString *)CFSTR("main");

    networkFunction = v6->_networkFunction;
    v6->_networkFunction = (NSString *)CFSTR("main");

    v6->_consumeDepth = 0;
    v6->_isReplay = 0;
    v6->_coreAnalyticTimeInterval = 600;
    v6->_coreAnalyticEventName = v4;
    defaultVisualLoggerName = v6->_defaultVisualLoggerName;
    v6->_defaultVisualLoggerName = (NSString *)CFSTR("default");

    v6->_engineType = 1;
    v6->_runByE5RT = 1;
    v13 = v6;
  }

  return v6;
}

- (void)setNetworkMode:(id)a3
{
  objc_storeStrong((id *)&self->_networkMode, a3);
}

- (void)setNetworkFunction:(id)a3
{
  objc_storeStrong((id *)&self->_networkFunction, a3);
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (self->_isReplay)
    v4 = "YES";
  else
    v4 = "NO";
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("NetworkName:%@, NetworkMode:%@ IsReplay:%s"), self->_networkName, self->_networkMode, v4);
}

- (NSString)networkPath
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNetworkPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int64_t)a3
{
  self->_engineType = a3;
}

- (NSString)networkName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)runByE5RT
{
  return self->_runByE5RT;
}

- (void)setRunByE5RT:(BOOL)a3
{
  self->_runByE5RT = a3;
}

- (NSMutableSet)disabledOutputBlobs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisabledOutputBlobs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)loggerPrefix
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLoggerPrefix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)supportZeroCopy
{
  return self->_supportZeroCopy;
}

- (void)setSupportZeroCopy:(BOOL)a3
{
  self->_supportZeroCopy = a3;
}

- (NSString)coreAnalyticEventName
{
  return self->_coreAnalyticEventName;
}

- (BOOL)isReplay
{
  return self->_isReplay;
}

- (void)setIsReplay:(BOOL)a3
{
  self->_isReplay = a3;
}

- (int)coreAnalyticTimeInterval
{
  return self->_coreAnalyticTimeInterval;
}

- (void)setCoreAnalyticTimeInterval:(int)a3
{
  self->_coreAnalyticTimeInterval = a3;
}

- (NSString)algorithmClassName
{
  return self->_algorithmClassName;
}

- (NSString)algorithmOutputClassName
{
  return self->_algorithmOutputClassName;
}

- (NSString)networkMode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)networkFunction
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)defaultVisualLoggerName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)consumeDepth
{
  return self->_consumeDepth;
}

- (int)signpostMappingID
{
  return self->_signpostMappingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerPrefix, 0);
  objc_storeStrong((id *)&self->_disabledOutputBlobs, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);
  objc_storeStrong((id *)&self->_defaultVisualLoggerName, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_networkFunction, 0);
  objc_storeStrong((id *)&self->_networkMode, 0);
  objc_storeStrong((id *)&self->_algorithmOutputClassName, 0);
  objc_storeStrong((id *)&self->_algorithmClassName, 0);
}

@end
