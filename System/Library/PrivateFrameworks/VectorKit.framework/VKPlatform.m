@implementation VKPlatform

void __22__VKPlatform_isIphone__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    -[VKPlatform isIphone]::deviceClass = objc_msgSend(v0, "intValue");
    v0 = v1;
  }

}

void __19__VKPlatform_isPad__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    -[VKPlatform isPad]::deviceClass = objc_msgSend(v0, "intValue");
    v0 = v1;
  }

}

- (unsigned)tilePrefetchNumberOfScreens
{
  return 3;
}

- (double)routeLineSimplificationEpsilon
{
  return 5.0;
}

- (BOOL)lowPerformanceDevice
{
  return self->_lowPerformanceDevice;
}

- (BOOL)allows3DPuck
{
  return 1;
}

- (BOOL)isPad
{
  if (-[VKPlatform isPad]::once != -1)
    dispatch_once(&-[VKPlatform isPad]::once, &__block_literal_global_25);
  return -[VKPlatform isPad]::deviceClass == 3;
}

+ (id)sharedPlatform
{
  if (+[VKPlatform sharedPlatform]::onceToken != -1)
    dispatch_once(&+[VKPlatform sharedPlatform]::onceToken, &__block_literal_global_8107);
  return (id)_singleton;
}

- (char)tileZBias
{
  return 0;
}

- (unsigned)tileDecodeQueueWidth
{
  if (self->_numCPUs <= 1)
    return 2;
  else
    return 6;
}

- (BOOL)shouldStyleLabelsInParallel
{
  return 0;
}

- (BOOL)supportsPerFragmentLighting
{
  return self->_supportsPerFragmentLighting;
}

- (BOOL)supportsBuildingStrokes
{
  return self->_supportsBuildingStrokes;
}

- (BOOL)supportsBuildingShadows
{
  return 1;
}

- (BOOL)supports3DBuildings
{
  return 1;
}

- (BOOL)supports3DBuildingStrokes
{
  return self->_supports3DBuildingStrokes;
}

void __28__VKPlatform_sharedPlatform__block_invoke()
{
  VKPlatform *v0;
  void *v1;

  v0 = objc_alloc_init(VKPlatform);
  v1 = (void *)_singleton;
  _singleton = (uint64_t)v0;

}

- (VKPlatform)init
{
  VKPlatform *v2;
  VKPlatform *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKPlatform;
  v2 = -[VKPlatform init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VKPlatform _determineHardware](v2, "_determineHardware");
    v3->_proceduralRoadAlpha = MGGetBoolAnswer();
    v3->_useCheapTrafficShader = MGGetBoolAnswer();
    v3->_supportsBuildingStrokes = MGGetBoolAnswer();
    v3->_supports3DBuildingStrokes = MGGetBoolAnswer();
    v3->_supportsCoastlineGlows = MGGetBoolAnswer();
    v3->_lowPerformanceDevice = 0;
    v3->_supportsPerFragmentLighting = MGGetBoolAnswer();
    v3->_supportsARMode = MGGetBoolAnswer();
  }
  return v3;
}

- (void)_determineHardware
{
  int *p_numCPUs;
  size_t v4;

  self->_memSize = -[VKPlatform _calculateMemSize](self, "_calculateMemSize");
  v4 = 4;
  p_numCPUs = &self->_numCPUs;
  if (sysctlbyname("hw.ncpu", p_numCPUs, &v4, 0, 0))
    *p_numCPUs = 1;
}

- (unint64_t)_calculateMemSize
{
  size_t v3;
  unint64_t v4;

  v3 = 8;
  v4 = 0;
  sysctlbyname("hw.memsize", &v4, &v3, 0, 0);
  return v4 >> 20;
}

- (unsigned)explicitDefaultRefreshRate
{
  int v3;

  v3 = MGGetBoolAnswer();
  if ((-[VKPlatform isIphone](self, "isIphone") & v3) != 0)
    return 60;
  else
    return 0;
}

- (BOOL)isIphone
{
  if (-[VKPlatform isIphone]::once != -1)
    dispatch_once(&-[VKPlatform isIphone]::once, &__block_literal_global_28);
  return -[VKPlatform isIphone]::deviceClass == 1;
}

- (BOOL)roadsWithSimpleLineMeshesAvailable
{
  if (-[VKPlatform roadsWithSimpleLineMeshesAvailable]::once != -1)
    dispatch_once(&-[VKPlatform roadsWithSimpleLineMeshesAvailable]::once, &__block_literal_global_22_8085);
  return -[VKPlatform roadsWithSimpleLineMeshesAvailable]::_simpleLineRoads;
}

- (unint64_t)tileMaximumLimit:(unint64_t)a3
{
  unint64_t memSize;
  double v4;
  double v5;
  unint64_t v6;

  memSize = self->_memSize;
  if (self->_isMac)
  {
    v4 = *((double *)&xmmword_19FFB2EC0 + (memSize <= 0x2000));
    if (memSize <= 0x1000)
      v4 = 0.3;
    v5 = (double)memSize * (v4 + v4);
  }
  else
  {
    v5 = (double)memSize + (double)memSize;
  }
  if (a3 <= 1)
    v6 = 1;
  else
    v6 = a3;
  return (unint64_t)(v5 / (double)v6);
}

- (BOOL)supportsHiResRTT
{
  return 1;
}

- (BOOL)canMakeSharingThumbnails
{
  return self->_memSize > 0x100;
}

- (BOOL)isMac
{
  return self->_isMac;
}

- (BOOL)shouldDrawWhenReady
{
  return self->_numCPUs > 1;
}

- (BOOL)supportsHiResBuildings
{
  return 0;
}

- (unsigned)preferredFrequencyUpdate
{
  char v3;

  v3 = MGGetBoolAnswer();
  if (!-[VKPlatform isIphone](self, "isIphone") || (v3 & 1) == 0)
    -[VKPlatform isPad](self, "isPad");
  return 4;
}

- (unsigned)processingQueueWidth
{
  int numCPUs;

  numCPUs = self->_numCPUs;
  if (numCPUs <= 2)
    LOBYTE(numCPUs) = 2;
  return numCPUs - 1;
}

- (BOOL)reduceMotionEnabled
{
  return _AXSReduceMotionEnabled() != 0;
}

- (unint64_t)memorySize
{
  return self->_memSize;
}

- (BOOL)proceduralRoadAlpha
{
  return self->_proceduralRoadAlpha;
}

- (BOOL)useCheapTrafficShader
{
  return self->_useCheapTrafficShader;
}

- (BOOL)supportsCoastlineGlows
{
  return self->_supportsCoastlineGlows;
}

- (BOOL)supportsARMode
{
  return self->_supportsARMode;
}

void __48__VKPlatform_roadsWithSimpleLineMeshesAvailable__block_invoke()
{
  void *v0;
  void *v1;
  char v2;

  v0 = (void *)MGCopyAnswer();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "BOOLValue");
  else
    v2 = 0;

  -[VKPlatform roadsWithSimpleLineMeshesAvailable]::_simpleLineRoads = v2;
}

@end
