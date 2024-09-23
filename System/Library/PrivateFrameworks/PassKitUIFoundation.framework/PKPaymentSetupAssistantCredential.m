@implementation PKPaymentSetupAssistantCredential

- (UIImage)passSnapshot
{
  return self->_passSnapshot;
}

- (void)setPassSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_passSnapshot, a3);
}

- (BOOL)isSnapshotFetchInProgress
{
  return self->_isSnapshotFetchInProgress;
}

- (void)setIsSnapshotFetchInProgress:(BOOL)a3
{
  self->_isSnapshotFetchInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSnapshot, 0);
}

@end
