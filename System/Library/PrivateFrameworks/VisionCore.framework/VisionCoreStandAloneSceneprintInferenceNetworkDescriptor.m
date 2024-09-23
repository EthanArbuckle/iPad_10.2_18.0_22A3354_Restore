@implementation VisionCoreStandAloneSceneprintInferenceNetworkDescriptor

+ (id)descriptorAndReturnError:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", CFSTR("stand-alone sceneprint model is no longer supported"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VisionCoreTensorDescriptor)sceneprintOutput
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VisionCoreStandAloneSceneprintInferenceNetworkDescriptor.m"), 28, CFSTR("sceneprint tensor descriptor not available"));

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

@end
