@implementation SCMLTextSanitizerConfiguration

- (SCMLTextSanitizerConfiguration)init
{
  return -[SCMLTextSanitizerConfiguration initWithModelManagerServicesUseCaseID:](self, "initWithModelManagerServicesUseCaseID:", CFSTR("Safety.unspecified"));
}

- (SCMLTextSanitizerConfiguration)initWithModelManagerServicesUseCaseID:(id)a3
{
  id v4;
  SCMLTextSanitizerConfiguration *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCMLTextSanitizerConfiguration;
  v5 = -[SCMLTextSanitizerConfiguration init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    -[SCMLTextSanitizerConfiguration setLocale:](v5, "setLocale:", v6);

    -[SCMLTextSanitizerConfiguration setMode:](v5, "setMode:", 2);
    -[SCMLTextSanitizerConfiguration setBackends:](v5, "setBackends:", 0);
    -[SCMLTextSanitizerConfiguration setTrackPerformance:](v5, "setTrackPerformance:", 0);
    -[SCMLTextSanitizerConfiguration setGranularity:](v5, "setGranularity:", 0);
    -[SCMLTextSanitizerConfiguration setThrowInModerationLMAsyncHandler:](v5, "setThrowInModerationLMAsyncHandler:", 0);
    -[SCMLTextSanitizerConfiguration setThrowInAdapterAsyncHandler:](v5, "setThrowInAdapterAsyncHandler:", 0);
    -[SCMLTextSanitizerConfiguration setOnBehalfOfProcessID:](v5, "setOnBehalfOfProcessID:", 0xFFFFFFFFLL);
    -[SCMLTextSanitizerConfiguration setModelManagerServicesUseCaseID:](v5, "setModelManagerServicesUseCaseID:", v4);
  }

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (unint64_t)backends
{
  return self->_backends;
}

- (void)setBackends:(unint64_t)a3
{
  self->_backends = a3;
}

- (int)onBehalfOfProcessID
{
  return self->_onBehalfOfProcessID;
}

- (void)setOnBehalfOfProcessID:(int)a3
{
  self->_onBehalfOfProcessID = a3;
}

- (NSString)modelManagerServicesUseCaseID
{
  return self->_modelManagerServicesUseCaseID;
}

- (void)setModelManagerServicesUseCaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)trackPerformance
{
  return self->_trackPerformance;
}

- (void)setTrackPerformance:(BOOL)a3
{
  self->_trackPerformance = a3;
}

- (unsigned)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(unsigned int)a3
{
  self->_granularity = a3;
}

- (BOOL)throwInModerationLMAsyncHandler
{
  return self->_throwInModerationLMAsyncHandler;
}

- (void)setThrowInModerationLMAsyncHandler:(BOOL)a3
{
  self->_throwInModerationLMAsyncHandler = a3;
}

- (BOOL)throwInAdapterAsyncHandler
{
  return self->_throwInAdapterAsyncHandler;
}

- (void)setThrowInAdapterAsyncHandler:(BOOL)a3
{
  self->_throwInAdapterAsyncHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelManagerServicesUseCaseID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
