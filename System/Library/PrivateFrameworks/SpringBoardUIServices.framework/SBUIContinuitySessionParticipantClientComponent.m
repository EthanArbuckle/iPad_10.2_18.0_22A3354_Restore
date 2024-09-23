@implementation SBUIContinuitySessionParticipantClientComponent

- (SBContinuitySession)continuitySession
{
  return self->_continuitySession;
}

- (void)setContinuitySession:(id)a3
{
  objc_storeStrong((id *)&self->_continuitySession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuitySession, 0);
}

@end
