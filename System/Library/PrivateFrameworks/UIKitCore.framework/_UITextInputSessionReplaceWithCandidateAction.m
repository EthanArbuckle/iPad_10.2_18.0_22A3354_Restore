@implementation _UITextInputSessionReplaceWithCandidateAction

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

- (int64_t)replaceWithCandidateType
{
  return self->_replaceWithCandidateType;
}

- (void)setReplaceWithCandidateType:(int64_t)a3
{
  self->_replaceWithCandidateType = a3;
}

@end
