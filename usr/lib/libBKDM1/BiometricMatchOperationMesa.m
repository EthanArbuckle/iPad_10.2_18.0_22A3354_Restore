@implementation BiometricMatchOperationMesa

- ($7287BE6C16BD8CBBAFC45DEB4D81687E)extendEnrollmentIdentity
{
  return ($7287BE6C16BD8CBBAFC45DEB4D81687E *)&self->_extendEnrollmentIdentity;
}

- ($8DE116C3FB21CCD6F79AB3F71F0D566B)extendEnrollmentAuthData
{
  return ($8DE116C3FB21CCD6F79AB3F71F0D566B *)&self->_extendEnrollmentAuthData;
}

- (BOOL)forExtendEnrollment
{
  return self->_forExtendEnrollment;
}

- (void)setForExtendEnrollment:(BOOL)a3
{
  self->_forExtendEnrollment = a3;
}

- (BOOL)captureOnly
{
  return self->_captureOnly;
}

- (void)setCaptureOnly:(BOOL)a3
{
  self->_captureOnly = a3;
}

- (BOOL)filterHomeButtonEvents
{
  return self->_filterHomeButtonEvents;
}

- (void)setFilterHomeButtonEvents:(BOOL)a3
{
  self->_filterHomeButtonEvents = a3;
}

- (BOOL)suppressHapticFeedback
{
  return self->_suppressHapticFeedback;
}

- (void)setSuppressHapticFeedback:(BOOL)a3
{
  self->_suppressHapticFeedback = a3;
}

- (BOOL)requireFingerOff
{
  return self->_requireFingerOff;
}

- (void)setRequireFingerOff:(BOOL)a3
{
  self->_requireFingerOff = a3;
}

@end
