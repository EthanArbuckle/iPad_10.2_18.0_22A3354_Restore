@implementation PVVideoCompositingContext

+ (id)dotGraphLoggingDirectory
{
  if (+[PVVideoCompositingContext dotGraphLoggingDirectory]::onceToken != -1)
    dispatch_once(&+[PVVideoCompositingContext dotGraphLoggingDirectory]::onceToken, &__block_literal_global_17);
  return (id)+[PVVideoCompositingContext dotGraphLoggingDirectory]::s_str;
}

uint64_t __53__PVVideoCompositingContext_dotGraphLoggingDirectory__block_invoke(PVRenderManager *a1)
{
  void *v1;
  PVRenderManager *v2;
  std::string *p_p;
  uint64_t v4;
  void *v5;
  uint64_t result;
  uint64_t v7;
  std::string __p;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = (PVRenderManager *)PVRenderManager::INSTANCE(a1, &v7);
  PVRenderManager::DotGraphLoggingDirectory(v2, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v1, "stringWithUTF8String:", p_p);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)+[PVVideoCompositingContext dotGraphLoggingDirectory]::s_str;
  +[PVVideoCompositingContext dotGraphLoggingDirectory]::s_str = v4;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  result = v7;
  if (v7)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  return result;
}

+ (id)createContextForGPUDisplay
{
  return -[PVVideoCompositingContext initWithDeviceForDisplay:]([PVVideoCompositingContext alloc], "initWithDeviceForDisplay:", 0);
}

+ (id)createContextForCPUDisplay
{
  return -[PVVideoCompositingContext initWithDeviceForDisplay:]([PVVideoCompositingContext alloc], "initWithDeviceForDisplay:", 1);
}

+ (id)createContextForGPUExport
{
  return -[PVVideoCompositingContext initWithDeviceForExport:]([PVVideoCompositingContext alloc], "initWithDeviceForExport:", 0);
}

+ (id)createContextForCPUExport
{
  return -[PVVideoCompositingContext initWithDeviceForExport:]([PVVideoCompositingContext alloc], "initWithDeviceForExport:", 1);
}

+ (id)defaultOutputColorSpaceWithRenderingIntent:(int)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "preferredExportColorSpace");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (a3)
    {
      v5 = 0;
      return v5;
    }
  }
  +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredDisplayColorSpace");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v5 = (void *)v4;

  return v5;
}

+ (id)defaultWorkingColorSpaceWithOutputColorSpace:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "isHDRSpace"))
  {
    +[PVColorSpace rec2020LinearColorSpace](PVColorSpace, "rec2020LinearColorSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (PVVideoCompositingContext)initWithDeviceForDisplay:(int)a3
{
  uint64_t v3;
  void *v5;
  PVVideoCompositingContext *v6;

  v3 = *(_QWORD *)&a3;
  +[PVVideoCompositingContext defaultOutputColorSpaceWithRenderingIntent:](PVVideoCompositingContext, "defaultOutputColorSpaceWithRenderingIntent:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PVVideoCompositingContext initWithDevice:defaultColorSpace:](self, "initWithDevice:defaultColorSpace:", v3, v5);

  return v6;
}

- (PVVideoCompositingContext)initWithDeviceForExport:(int)a3
{
  uint64_t v3;
  void *v5;
  PVVideoCompositingContext *v6;

  v3 = *(_QWORD *)&a3;
  +[PVVideoCompositingContext defaultOutputColorSpaceWithRenderingIntent:](PVVideoCompositingContext, "defaultOutputColorSpaceWithRenderingIntent:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PVVideoCompositingContext initWithDevice:defaultColorSpace:](self, "initWithDevice:defaultColorSpace:", v3, v5);

  return v6;
}

- (PVVideoCompositingContext)initWithDevice:(int)a3 defaultColorSpace:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  PVVideoCompositingContext *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  +[PVVideoCompositingContext defaultWorkingColorSpaceWithOutputColorSpace:](PVVideoCompositingContext, "defaultWorkingColorSpaceWithOutputColorSpace:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PVVideoCompositingContext initWithDevice:workingColorSpace:outputColorSpace:](self, "initWithDevice:workingColorSpace:outputColorSpace:", v4, v7, v6);

  return v8;
}

- (PVVideoCompositingContext)initWithDevice:(int)a3 workingColorSpace:(id)a4 outputColorSpace:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  PVVideoCompositingContext *v10;
  PVVideoCompositingContext *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PVVideoCompositingContext;
  v10 = -[PVVideoCompositingContext init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PVVideoCompositingContext setRenderDevice:](v10, "setRenderDevice:", v6);
    -[PVVideoCompositingContext setGpuRenderAPI:](v11, "setGpuRenderAPI:", 1);
    v12 = +[PVDeviceCharacteristics hasExtendedColorDisplay](PVDeviceCharacteristics, "hasExtendedColorDisplay");
    -[PVVideoCompositingContext setOutputColorSpace:](v11, "setOutputColorSpace:", v9);
    -[PVVideoCompositingContext setWorkingColorSpace:](v11, "setWorkingColorSpace:", v8);
    -[PVVideoCompositingContext setWorkingColorSpaceConformIntent:](v11, "setWorkingColorSpaceConformIntent:", !v12);
    -[PVVideoCompositingContext setShaderFormat:](v11, "setShaderFormat:", 28);
    -[PVVideoCompositingContext setConcatenationFlag:](v11, "setConcatenationFlag:", 1);
    -[PVVideoCompositingContext setRenderGraphDumpLevel:](v11, "setRenderGraphDumpLevel:", 0);
    -[PVVideoCompositingContext setDotGraphLevel:](v11, "setDotGraphLevel:", 0);
    -[PVVideoCompositingContext setTileSize:](v11, "setTileSize:", 48);
    -[PVVideoCompositingContext setNumCPUThreads:](v11, "setNumCPUThreads:", 2);
    -[PVVideoCompositingContext setTextureBorder:](v11, "setTextureBorder:", 1);
    -[PVVideoCompositingContext setDynamicPlayback:](v11, "setDynamicPlayback:", 0);
    -[PVVideoCompositingContext setSignPostLevel:](v11, "setSignPostLevel:", 1);
    -[PVVideoCompositingContext setTraceGLLevel:](v11, "setTraceGLLevel:", 0);
    -[PVVideoCompositingContext setTraceMetalLevel:](v11, "setTraceMetalLevel:", 0);
    -[PVVideoCompositingContext setPageSize:](v11, "setPageSize:", +[PVEnvironment PVPageSize](PVEnvironment, "PVPageSize"));
    -[PVVideoCompositingContext setInstructionGraphDumpLevel:](v11, "setInstructionGraphDumpLevel:", 0);
    -[PVVideoCompositingContext setInstructionGraphDotTreeLevel:](v11, "setInstructionGraphDotTreeLevel:", 0);
    -[PVVideoCompositingContext setPowerFriendlyExport:](v11, "setPowerFriendlyExport:", 0);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVVideoCompositingContext setContext:](v11, "setContext:", v14);

  }
  return v11;
}

- (void)setContext:(id)a3
{
  NSDictionary *v4;

  v4 = (NSDictionary *)a3;
  -[PVVideoCompositingContext setRenderDevice:](self, "setRenderDevice:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextDeviceIDKey"), -[PVVideoCompositingContext renderDevice](self, "renderDevice")));
  -[PVVideoCompositingContext setGpuRenderAPI:](self, "setGpuRenderAPI:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextGPURenderAPIKey"), -[PVVideoCompositingContext gpuRenderAPI](self, "gpuRenderAPI")));
  -[PVVideoCompositingContext setNumCPUThreads:](self, "setNumCPUThreads:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextNumCPUThreadsKey"), -[PVVideoCompositingContext numCPUThreads](self, "numCPUThreads")));
  -[PVVideoCompositingContext setBufferFormat:](self, "setBufferFormat:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextBufferFormatKey"), -[PVVideoCompositingContext bufferFormat](self, "bufferFormat")));
  -[PVVideoCompositingContext setShaderFormat:](self, "setShaderFormat:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextShaderFormatKey"), -[PVVideoCompositingContext shaderFormat](self, "shaderFormat")));
  -[PVVideoCompositingContext setFilterMode:](self, "setFilterMode:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextFilterModeKey"), -[PVVideoCompositingContext filterMode](self, "filterMode")));
  -[PVVideoCompositingContext setConcatenationFlag:](self, "setConcatenationFlag:", getDefaultsBoolValue(v4, CFSTR("PVVideoCompositingContextConcatentationKey"), -[PVVideoCompositingContext concatenationFlag](self, "concatenationFlag")));
  -[PVVideoCompositingContext setTileSize:](self, "setTileSize:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextTileSizeKey"), -[PVVideoCompositingContext tileSize](self, "tileSize")));
  -[PVVideoCompositingContext setPageSize:](self, "setPageSize:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextPageSizeKey"), -[PVVideoCompositingContext pageSize](self, "pageSize")));
  -[PVVideoCompositingContext setTextureBorder:](self, "setTextureBorder:", getDefaultsBoolValue(v4, CFSTR("PVVideoCompositingContextTextureBorderKey"), -[PVVideoCompositingContext textureBorder](self, "textureBorder")));
  -[PVVideoCompositingContext setDynamicPlayback:](self, "setDynamicPlayback:", getDefaultsBoolValue(v4, CFSTR("PVVideoCompositingContextDynamicPlaybackKey"), -[PVVideoCompositingContext dynamicPlayback](self, "dynamicPlayback")));
  -[PVVideoCompositingContext setRenderGraphDumpLevel:](self, "setRenderGraphDumpLevel:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextGraphDumpLevelKey"), -[PVVideoCompositingContext renderGraphDumpLevel](self, "renderGraphDumpLevel")));
  -[PVVideoCompositingContext setRenderStatsFlag:](self, "setRenderStatsFlag:", getDefaultsBoolValue(v4, CFSTR("PVVideoCompositingContextStatsFlagKey"), -[PVVideoCompositingContext renderStatsFlag](self, "renderStatsFlag")));
  -[PVVideoCompositingContext setRenderStatsWarmUp:](self, "setRenderStatsWarmUp:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextStatsWarmUpKey"), -[PVVideoCompositingContext renderStatsWarmUp](self, "renderStatsWarmUp")));
  -[PVVideoCompositingContext setRenderStatsMaxVals:](self, "setRenderStatsMaxVals:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextStatsMaxValsKey"), -[PVVideoCompositingContext renderStatsMaxVals](self, "renderStatsMaxVals")));
  -[PVVideoCompositingContext setDotGraphLevel:](self, "setDotGraphLevel:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextDotGraphLevelKey"), -[PVVideoCompositingContext dotGraphLevel](self, "dotGraphLevel")));
  -[PVVideoCompositingContext setSignPostLevel:](self, "setSignPostLevel:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextSignPostLevelKey"), -[PVVideoCompositingContext signPostLevel](self, "signPostLevel")));
  -[PVVideoCompositingContext setTraceGLLevel:](self, "setTraceGLLevel:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextTraceGLLevelKey"), -[PVVideoCompositingContext traceGLLevel](self, "traceGLLevel")));
  -[PVVideoCompositingContext setTraceMetalLevel:](self, "setTraceMetalLevel:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextTraceMetalLevelKey"), -[PVVideoCompositingContext traceMetalLevel](self, "traceMetalLevel")));
  -[PVVideoCompositingContext setInstructionGraphDumpLevel:](self, "setInstructionGraphDumpLevel:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextInstructionGraphDumpLevelKey"), -[PVVideoCompositingContext instructionGraphDumpLevel](self, "instructionGraphDumpLevel")));
  -[PVVideoCompositingContext setInstructionGraphDotTreeLevel:](self, "setInstructionGraphDotTreeLevel:", getDefaultsIntValue(v4, CFSTR("PVVideoCompositingContextInstructionGraphDotTreeLevelKey"), -[PVVideoCompositingContext instructionGraphDotTreeLevel](self, "instructionGraphDotTreeLevel")));
  -[PVVideoCompositingContext setPowerFriendlyExport:](self, "setPowerFriendlyExport:", getDefaultsBoolValue(v4, CFSTR("PVVideoCompositingContextPowerFriendlyExport"), -[PVVideoCompositingContext powerFriendlyExport](self, "powerFriendlyExport")));

}

- (void)dumpContext
{
  const __CFString *v3;
  const __CFString *v4;

  NSLog(CFSTR("----------------------------"), a2);
  NSLog(CFSTR("Custom Video Compositing Context"));
  if (self->renderDevice)
    v3 = CFSTR("CPU");
  else
    v3 = CFSTR("GPU");
  NSLog(CFSTR("Render Device:                %@"), v3);
  if (self->gpuRenderAPI)
    v4 = CFSTR("Metal");
  else
    v4 = CFSTR("OpenGL");
  NSLog(CFSTR("GPU Render API:               %@"), v4);
  NSLog(CFSTR("Buffer Format:                %d"), self->bufferFormat);
  NSLog(CFSTR("Shader Format:                %d"), self->shaderFormat);
  NSLog(CFSTR("Concatenation:                %d"), self->concatenationFlag);
  NSLog(CFSTR("Graph Dump Level:             %d"), self->renderGraphDumpLevel);
  NSLog(CFSTR("Dot Graph Level:              %d"), self->dotGraphLevel);
  NSLog(CFSTR("TileSize:                     %d"), self->tileSize);
  NSLog(CFSTR("Texture Border:               %d"), self->textureBorder);
  NSLog(CFSTR("Dynamic Playback:             %d"), self->dynamicPlayback);
  NSLog(CFSTR("Num CPU Threads:              %d"), self->numCPUThreads);
  NSLog(CFSTR("Sign Post Level:              %d"), self->signPostLevel);
  NSLog(CFSTR("Trace GL Level:               %d"), self->traceGLLevel);
  NSLog(CFSTR("Trace Metal Level:            %d"), self->traceMetalLevel);
  NSLog(CFSTR("Page Size:                    %d"), self->pageSize);
  NSLog(CFSTR("Instruction Graph Dump Level: %d"), self->instructionGraphDumpLevel);
  NSLog(CFSTR("Instruction Graph Dot Level:  %d"), self->instructionGraphDotTreeLevel);
  NSLog(CFSTR("Power Friendly Export:        %d"), self->powerFriendlyExport);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVVideoCompositingContext)initWithCoder:(id)a3
{
  id v4;
  PVVideoCompositingContext *v5;

  v4 = a3;
  v5 = -[PVVideoCompositingContext initWithDevice:](self, "initWithDevice:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextDeviceIDKey")));
  -[PVVideoCompositingContext setGpuRenderAPI:](v5, "setGpuRenderAPI:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PVVideoCompositingContextGPURenderAPIKey")));
  -[PVVideoCompositingContext setNumCPUThreads:](v5, "setNumCPUThreads:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextNumCPUThreadsKey")));
  -[PVVideoCompositingContext setBufferFormat:](v5, "setBufferFormat:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextBufferFormatKey")));
  -[PVVideoCompositingContext setShaderFormat:](v5, "setShaderFormat:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextShaderFormatKey")));
  -[PVVideoCompositingContext setFilterMode:](v5, "setFilterMode:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextFilterModeKey")));
  -[PVVideoCompositingContext setConcatenationFlag:](v5, "setConcatenationFlag:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PVVideoCompositingContextConcatentationKey")));
  -[PVVideoCompositingContext setTileSize:](v5, "setTileSize:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PVVideoCompositingContextTileSizeKey")));
  -[PVVideoCompositingContext setPageSize:](v5, "setPageSize:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PVVideoCompositingContextPageSizeKey")));
  -[PVVideoCompositingContext setTextureBorder:](v5, "setTextureBorder:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PVVideoCompositingContextTextureBorderKey")));
  -[PVVideoCompositingContext setDynamicPlayback:](v5, "setDynamicPlayback:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PVVideoCompositingContextDynamicPlaybackKey")));
  -[PVVideoCompositingContext setRenderGraphDumpLevel:](v5, "setRenderGraphDumpLevel:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextGraphDumpLevelKey")));
  -[PVVideoCompositingContext setRenderStatsFlag:](v5, "setRenderStatsFlag:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextStatsFlagKey")) != 0);
  -[PVVideoCompositingContext setRenderStatsWarmUp:](v5, "setRenderStatsWarmUp:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextStatsWarmUpKey")));
  -[PVVideoCompositingContext setRenderStatsMaxVals:](v5, "setRenderStatsMaxVals:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextStatsMaxValsKey")));
  -[PVVideoCompositingContext setDotGraphLevel:](v5, "setDotGraphLevel:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextDotGraphLevelKey")));
  -[PVVideoCompositingContext setSignPostLevel:](v5, "setSignPostLevel:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextSignPostLevelKey")));
  -[PVVideoCompositingContext setTraceGLLevel:](v5, "setTraceGLLevel:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PVVideoCompositingContextTraceGLLevelKey")));
  -[PVVideoCompositingContext setTraceMetalLevel:](v5, "setTraceMetalLevel:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PVVideoCompositingContextTraceMetalLevelKey")));
  -[PVVideoCompositingContext setInstructionGraphDumpLevel:](v5, "setInstructionGraphDumpLevel:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextInstructionGraphDumpLevelKey")));
  -[PVVideoCompositingContext setInstructionGraphDotTreeLevel:](v5, "setInstructionGraphDotTreeLevel:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("PVVideoCompositingContextInstructionGraphDotTreeLevelKey")));
  -[PVVideoCompositingContext setPowerFriendlyExport:](v5, "setPowerFriendlyExport:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PVVideoCompositingContextPowerFriendlyExport")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderDevice](self, "renderDevice"), CFSTR("PVVideoCompositingContextDeviceIDKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext gpuRenderAPI](self, "gpuRenderAPI"), CFSTR("PVVideoCompositingContextGPURenderAPIKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext numCPUThreads](self, "numCPUThreads"), CFSTR("PVVideoCompositingContextNumCPUThreadsKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext bufferFormat](self, "bufferFormat"), CFSTR("PVVideoCompositingContextBufferFormatKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext shaderFormat](self, "shaderFormat"), CFSTR("PVVideoCompositingContextShaderFormatKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext filterMode](self, "filterMode"), CFSTR("PVVideoCompositingContextFilterModeKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext concatenationFlag](self, "concatenationFlag"), CFSTR("PVVideoCompositingContextConcatentationKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext tileSize](self, "tileSize"), CFSTR("PVVideoCompositingContextTileSizeKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext pageSize](self, "pageSize"), CFSTR("PVVideoCompositingContextPageSizeKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext textureBorder](self, "textureBorder"), CFSTR("PVVideoCompositingContextTextureBorderKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext dynamicPlayback](self, "dynamicPlayback"), CFSTR("PVVideoCompositingContextDynamicPlaybackKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderGraphDumpLevel](self, "renderGraphDumpLevel"), CFSTR("PVVideoCompositingContextGraphDumpLevelKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderStatsFlag](self, "renderStatsFlag"), CFSTR("PVVideoCompositingContextStatsFlagKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderStatsWarmUp](self, "renderStatsWarmUp"), CFSTR("PVVideoCompositingContextStatsWarmUpKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderStatsMaxVals](self, "renderStatsMaxVals"), CFSTR("PVVideoCompositingContextStatsMaxValsKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext dotGraphLevel](self, "dotGraphLevel"), CFSTR("PVVideoCompositingContextDotGraphLevelKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext signPostLevel](self, "signPostLevel"), CFSTR("PVVideoCompositingContextSignPostLevelKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext traceGLLevel](self, "traceGLLevel"), CFSTR("PVVideoCompositingContextTraceGLLevelKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext traceMetalLevel](self, "traceMetalLevel"), CFSTR("PVVideoCompositingContextTraceMetalLevelKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext instructionGraphDumpLevel](self, "instructionGraphDumpLevel"), CFSTR("PVVideoCompositingContextInstructionGraphDumpLevelKey"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext instructionGraphDotTreeLevel](self, "instructionGraphDotTreeLevel"), CFSTR("PVVideoCompositingContextInstructionGraphDotTreeLevelKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PVVideoCompositingContext powerFriendlyExport](self, "powerFriendlyExport"), CFSTR("PVVideoCompositingContextPowerFriendlyExport"));

}

- (void)setSignPostLevel:(int)a3
{
  const char *v3;
  PVVideoCompositingContext *obj;

  v3 = *(const char **)&a3;
  obj = self;
  objc_sync_enter(obj);
  obj->signPostLevel = (int)v3;
  HGLogger::setLevel((HGLogger *)"PVSignPost", v3);
  objc_sync_exit(obj);

}

- (void)setInstructionGraphDumpLevel:(int)a3
{
  const char *v3;
  PVVideoCompositingContext *obj;

  v3 = *(const char **)&a3;
  obj = self;
  objc_sync_enter(obj);
  obj->instructionGraphDumpLevel = (int)v3;
  HGLogger::setLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v3);
  objc_sync_exit(obj);

}

- (void)setTraceMetalLevel:(int)a3
{
  const char *v3;
  PVVideoCompositingContext *obj;

  v3 = *(const char **)&a3;
  obj = self;
  objc_sync_enter(obj);
  obj->traceMetalLevel = (int)v3;
  HGLogger::setLevel((HGLogger *)"metal", v3);
  objc_sync_exit(obj);

}

- (void)setOutputColorSpace:(id)a3
{
  PVColorSpace *v4;
  PVColorSpace *outputColorSpace;
  PVVideoCompositingContext *obj;

  v4 = (PVColorSpace *)a3;
  obj = self;
  objc_sync_enter(obj);
  outputColorSpace = obj->_outputColorSpace;
  obj->_outputColorSpace = v4;

  objc_sync_exit(obj);
}

- (void)setWorkingColorSpace:(id)a3
{
  PVVideoCompositingContext *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[PVColorSpace isEqual:](v5->_workingColorSpace, "isEqual:", v6))
  {
    objc_storeStrong((id *)&v5->_workingColorSpace, a3);
    -[PVVideoCompositingContext setIntermediateBufferFormatForWorkingColorSpace](v5, "setIntermediateBufferFormatForWorkingColorSpace");
  }
  objc_sync_exit(v5);

}

- (void)setIntermediateBufferFormatForWorkingColorSpace
{
  void *v2;
  int v3;
  uint64_t v4;
  PVVideoCompositingContext *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PVVideoCompositingContext workingColorSpace](obj, "workingColorSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWideGamutSpace");

  if (v3)
    v4 = 27;
  else
    v4 = 24;
  -[PVVideoCompositingContext setBufferFormat:](obj, "setBufferFormat:", v4);
  objc_sync_exit(obj);

}

- (int)renderDevice
{
  return self->renderDevice;
}

- (void)setRenderDevice:(int)a3
{
  self->renderDevice = a3;
}

- (BOOL)concatenationFlag
{
  return self->concatenationFlag;
}

- (void)setConcatenationFlag:(BOOL)a3
{
  self->concatenationFlag = a3;
}

- (int)gpuRenderAPI
{
  return self->gpuRenderAPI;
}

- (void)setGpuRenderAPI:(int)a3
{
  self->gpuRenderAPI = a3;
}

- (int)numCPUThreads
{
  return self->numCPUThreads;
}

- (void)setNumCPUThreads:(int)a3
{
  self->numCPUThreads = a3;
}

- (int)bufferFormat
{
  return self->bufferFormat;
}

- (void)setBufferFormat:(int)a3
{
  self->bufferFormat = a3;
}

- (int)filterMode
{
  return self->filterMode;
}

- (void)setFilterMode:(int)a3
{
  self->filterMode = a3;
}

- (int)renderGraphDumpLevel
{
  return self->renderGraphDumpLevel;
}

- (void)setRenderGraphDumpLevel:(int)a3
{
  self->renderGraphDumpLevel = a3;
}

- (BOOL)renderStatsFlag
{
  return self->renderStatsFlag;
}

- (void)setRenderStatsFlag:(BOOL)a3
{
  self->renderStatsFlag = a3;
}

- (int)renderStatsWarmUp
{
  return self->renderStatsWarmUp;
}

- (void)setRenderStatsWarmUp:(int)a3
{
  self->renderStatsWarmUp = a3;
}

- (int)renderStatsMaxVals
{
  return self->renderStatsMaxVals;
}

- (void)setRenderStatsMaxVals:(int)a3
{
  self->renderStatsMaxVals = a3;
}

- (int)dotGraphLevel
{
  return self->dotGraphLevel;
}

- (void)setDotGraphLevel:(int)a3
{
  self->dotGraphLevel = a3;
}

- (int)tileSize
{
  return self->tileSize;
}

- (void)setTileSize:(int)a3
{
  self->tileSize = a3;
}

- (int)shaderFormat
{
  return self->shaderFormat;
}

- (void)setShaderFormat:(int)a3
{
  self->shaderFormat = a3;
}

- (int)traceGLLevel
{
  return self->traceGLLevel;
}

- (void)setTraceGLLevel:(int)a3
{
  self->traceGLLevel = a3;
}

- (int)traceMetalLevel
{
  return self->traceMetalLevel;
}

- (int)signPostLevel
{
  return self->signPostLevel;
}

- (int)pageSize
{
  return self->pageSize;
}

- (void)setPageSize:(int)a3
{
  self->pageSize = a3;
}

- (BOOL)textureBorder
{
  return self->textureBorder;
}

- (void)setTextureBorder:(BOOL)a3
{
  self->textureBorder = a3;
}

- (BOOL)dynamicPlayback
{
  return self->dynamicPlayback;
}

- (void)setDynamicPlayback:(BOOL)a3
{
  self->dynamicPlayback = a3;
}

- (int)instructionGraphDumpLevel
{
  return self->instructionGraphDumpLevel;
}

- (int)instructionGraphDotTreeLevel
{
  return self->instructionGraphDotTreeLevel;
}

- (void)setInstructionGraphDotTreeLevel:(int)a3
{
  self->instructionGraphDotTreeLevel = a3;
}

- (BOOL)powerFriendlyExport
{
  return self->powerFriendlyExport;
}

- (void)setPowerFriendlyExport:(BOOL)a3
{
  self->powerFriendlyExport = a3;
}

- (int)workingColorSpaceConformIntent
{
  return self->workingColorSpaceConformIntent;
}

- (void)setWorkingColorSpaceConformIntent:(int)a3
{
  self->workingColorSpaceConformIntent = a3;
}

- (PVColorSpace)outputColorSpace
{
  return self->_outputColorSpace;
}

- (PVColorSpace)workingColorSpace
{
  return self->_workingColorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingColorSpace, 0);
  objc_storeStrong((id *)&self->_outputColorSpace, 0);
}

@end
