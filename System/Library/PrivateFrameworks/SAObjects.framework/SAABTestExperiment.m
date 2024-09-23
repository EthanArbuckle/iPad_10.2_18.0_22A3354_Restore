@implementation SAABTestExperiment

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.experimentation");
}

- (id)encodedClassName
{
  return CFSTR("Experiment");
}

- (NSString)deploymentId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deploymentId"));
}

- (void)setDeploymentId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deploymentId"), a3);
}

- (NSString)experimentId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("experimentId"));
}

- (void)setExperimentId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("experimentId"), a3);
}

- (NSString)treatmentId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("treatmentId"));
}

- (void)setTreatmentId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("treatmentId"), a3);
}

@end
