@implementation SATrialExperiment

- (id)experimentNamespace
{
  return sub_2459CACD4(self, (uint64_t)a2, &OBJC_IVAR___SATrialExperiment__experimentNamespace);
}

- (id)experimentID
{
  return sub_2459CACD4(self, (uint64_t)a2, &OBJC_IVAR___SATrialExperiment__experimentID);
}

- (id)treatmentID
{
  return sub_2459CACD4(self, (uint64_t)a2, &OBJC_IVAR___SATrialExperiment__treatmentID);
}

- (id)deploymentID
{
  return sub_2459CAD54();
}

- (id)compatibilityVersion
{
  return sub_2459CADA0();
}

- (int)allocationStatus
{
  return sub_2459CADEC();
}

- (SATrialExperiment)init
{
  return (SATrialExperiment *)SATrialExperiment.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_6_3();

}

@end
