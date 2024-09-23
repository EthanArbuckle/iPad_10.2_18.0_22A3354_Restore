@implementation OSASubmissionClientOptions

- (BOOL)urgentSubmission
{
  return self->_urgentSubmission;
}

- (void)setUrgentSubmission:(BOOL)a3
{
  self->_urgentSubmission = a3;
}

@end
