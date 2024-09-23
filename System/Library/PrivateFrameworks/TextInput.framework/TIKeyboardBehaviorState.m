@implementation TIKeyboardBehaviorState

- (void)setUserSelectedCurrentCandidate:(BOOL)a3
{
  self->_userSelectedCurrentCandidate = a3;
}

- (void)setSpaceConfirmation:(BOOL)a3
{
  self->spaceConfirmation = a3;
}

- (void)setShowsExtendedList:(BOOL)a3
{
  self->showsExtendedList = a3;
}

- (void)setShowsCandidatesInLayout:(BOOL)a3
{
  self->_showsCandidatesInLayout = a3;
}

- (void)setHasInput:(BOOL)a3
{
  self->hasInput = a3;
}

- (void)setHasCandidates:(BOOL)a3
{
  self->hasCandidates = a3;
}

- (void)setHasCandidateSelected:(BOOL)a3
{
  self->hasCandidateSelected = a3;
}

- (void)setHasAutocorrection:(BOOL)a3
{
  self->_hasAutocorrection = a3;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  self->hardwareKeyboardMode = a3;
}

- (void)setFollowsZhuyin:(BOOL)a3
{
  self->followsZhuyin = a3;
}

- (void)setFollowsIncompleteRomaji:(BOOL)a3
{
  self->followsIncompleteRomaji = a3;
}

- (BOOL)hasInput
{
  return self->hasInput;
}

- (BOOL)hasCandidates
{
  return self->hasCandidates;
}

- (BOOL)hasCandidateSelected
{
  return self->hasCandidateSelected;
}

- (BOOL)hasNextPage
{
  return self->hasNextPage;
}

- (void)setHasNextPage:(BOOL)a3
{
  self->hasNextPage = a3;
}

- (BOOL)showsExtendedList
{
  return self->showsExtendedList;
}

- (BOOL)followsZhuyin
{
  return self->followsZhuyin;
}

- (BOOL)spaceConfirmation
{
  return self->spaceConfirmation;
}

- (BOOL)hardwareKeyboardMode
{
  return self->hardwareKeyboardMode;
}

- (BOOL)followsIncompleteRomaji
{
  return self->followsIncompleteRomaji;
}

- (BOOL)hasAutocorrection
{
  return self->_hasAutocorrection;
}

- (BOOL)userSelectedCurrentCandidate
{
  return self->_userSelectedCurrentCandidate;
}

- (BOOL)showsCandidatesInLayout
{
  return self->_showsCandidatesInLayout;
}

- (BOOL)isContinuousPathUnderway
{
  return self->_continuousPathUnderway;
}

- (void)setContinuousPathUnderway:(BOOL)a3
{
  self->_continuousPathUnderway = a3;
}

@end
