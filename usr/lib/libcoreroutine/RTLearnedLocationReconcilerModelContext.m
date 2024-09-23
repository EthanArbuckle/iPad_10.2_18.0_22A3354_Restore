@implementation RTLearnedLocationReconcilerModelContext

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSArray)overlappingVisits
{
  return self->_overlappingVisits;
}

- (void)setOverlappingVisits:(id)a3
{
  objc_storeStrong((id *)&self->_overlappingVisits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlappingVisits, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
