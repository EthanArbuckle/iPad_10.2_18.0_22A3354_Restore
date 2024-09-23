@implementation PLSpatialOverCaptureInformation

- (NSString)spatialOverCaptureGroupIdentifier
{
  return self->_spatialOverCaptureGroupIdentifier;
}

- (void)setSpatialOverCaptureGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)spatialOverCaptureLivePhotoPairingIdentifier
{
  return self->_spatialOverCaptureLivePhotoPairingIdentifier;
}

- (void)setSpatialOverCaptureLivePhotoPairingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialOverCaptureLivePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_spatialOverCaptureGroupIdentifier, 0);
}

@end
