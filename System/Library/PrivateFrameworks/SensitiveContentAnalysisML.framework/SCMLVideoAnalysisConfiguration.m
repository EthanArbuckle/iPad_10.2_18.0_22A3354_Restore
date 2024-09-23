@implementation SCMLVideoAnalysisConfiguration

+ (id)defaultConfig
{
  if (defaultConfig_onceToken != -1)
    dispatch_once(&defaultConfig_onceToken, &__block_literal_global_2);
  return (id)defaultConfig_defaultConfig;
}

void __47__SCMLVideoAnalysisConfiguration_defaultConfig__block_invoke()
{
  SCMLVideoAnalysisConfiguration *v0;
  void *v1;

  v0 = -[SCMLVideoAnalysisConfiguration initWithOptions:framesPerSync:frameLimit:sensitiveFrameCountThreshold:useUniformSampling:]([SCMLVideoAnalysisConfiguration alloc], "initWithOptions:framesPerSync:frameLimit:sensitiveFrameCountThreshold:useUniformSampling:", 0, 1, &unk_2516EB898, 2, 1);
  v1 = (void *)defaultConfig_defaultConfig;
  defaultConfig_defaultConfig = (uint64_t)v0;

}

- (SCMLVideoAnalysisConfiguration)init
{

  return 0;
}

- (SCMLVideoAnalysisConfiguration)initWithOptions:(id)a3
{
  return -[SCMLVideoAnalysisConfiguration initWithOptions:framesPerSync:frameLimit:sensitiveFrameCountThreshold:useUniformSampling:](self, "initWithOptions:framesPerSync:frameLimit:sensitiveFrameCountThreshold:useUniformSampling:", a3, 0, 0, 1, 0);
}

- (SCMLVideoAnalysisConfiguration)initWithOptions:(id)a3 framesPerSync:(unint64_t)a4 frameLimit:(id)a5 sensitiveFrameCountThreshold:(unint64_t)a6 useUniformSampling:(BOOL)a7
{
  id v12;
  id v13;
  SCMLVideoAnalysisConfiguration *v14;
  SCMLVideoAnalysisConfiguration *v15;
  uint64_t v16;
  NSString *debugFramesOutputPathPrefix;
  objc_super v19;

  v12 = a3;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SCMLVideoAnalysisConfiguration;
  v14 = -[SCMLAnalysisConfiguration initWithOptions:](&v19, sel_initWithOptions_, v12);
  v15 = v14;
  if (v14)
  {
    v14->_framesPerSync = a4;
    objc_storeStrong((id *)&v14->_frameLimit, a5);
    v15->_sensitiveFrameCountThreshold = a6;
    v15->_useUniformSampling = a7;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SCMLAnalysisConfigurationDebugFramesOutputPathPrefix"));
    v16 = objc_claimAutoreleasedReturnValue();
    debugFramesOutputPathPrefix = v15->_debugFramesOutputPathPrefix;
    v15->_debugFramesOutputPathPrefix = (NSString *)v16;

  }
  return v15;
}

- (unint64_t)framesPerSync
{
  return self->_framesPerSync;
}

- (NSNumber)frameLimit
{
  return self->_frameLimit;
}

- (unint64_t)sensitiveFrameCountThreshold
{
  return self->_sensitiveFrameCountThreshold;
}

- (BOOL)useUniformSampling
{
  return self->_useUniformSampling;
}

- (NSString)debugFramesOutputPathPrefix
{
  return self->_debugFramesOutputPathPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugFramesOutputPathPrefix, 0);
  objc_storeStrong((id *)&self->_frameLimit, 0);
}

@end
