@implementation PESerializationUtilityExportSettings

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setScalePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scalePolicy, a3);
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

@end
