@implementation TIActionSummary

- (int)totalInputActions
{
  return self->_totalInputActions;
}

- (int)emojiSelections
{
  return self->_emojiSelections;
}

- (int)emojiSearchCandidateSelections
{
  return self->_emojiSearchCandidateSelections;
}

- (int)emojiCandidateSelections
{
  return self->_emojiCandidateSelections;
}

- (int)cursorMovements
{
  return self->_cursorMovements;
}

- (int)unknownKeyTaps
{
  return self->_unknownKeyTaps;
}

- (int)spaceKeyTaps
{
  return self->_spaceKeyTaps;
}

- (int)shiftKeyTaps
{
  return self->_shiftKeyTaps;
}

- (int)returnKeyTaps
{
  return self->_returnKeyTaps;
}

- (int)popupVariants
{
  return self->_popupVariants;
}

- (int)paths
{
  return self->_paths;
}

- (int)pathsWithWeight9
{
  return self->_pathsWithWeight9;
}

- (int)pathsWithWeight8
{
  return self->_pathsWithWeight8;
}

- (int)pathsWithWeight7
{
  return self->_pathsWithWeight7;
}

- (int)pathsWithWeight6
{
  return self->_pathsWithWeight6;
}

- (int)pathsWithWeight5
{
  return self->_pathsWithWeight5;
}

- (int)pathsWithWeight4
{
  return self->_pathsWithWeight4;
}

- (int)pathsWithWeight3
{
  return self->_pathsWithWeight3;
}

- (int)pathsWithWeight2
{
  return self->_pathsWithWeight2;
}

- (int)pathsWithWeight1
{
  return self->_pathsWithWeight1;
}

- (int)pathsWithWeight10
{
  return self->_pathsWithWeight10;
}

- (int)pastes
{
  return self->_pastes;
}

- (int)moreKeyTaps
{
  return self->_moreKeyTaps;
}

- (int)gestures
{
  return self->_gestures;
}

- (int)flicks
{
  return self->_flicks;
}

- (int)emojiSearchUnknownKeyTaps
{
  return self->_emojiSearchUnknownKeyTaps;
}

- (int)emojiSearchSpaceKeyTaps
{
  return self->_emojiSearchSpaceKeyTaps;
}

- (int)emojiSearchShiftKeyTaps
{
  return self->_emojiSearchShiftKeyTaps;
}

- (int)emojiSearchPopupVariants
{
  return self->_emojiSearchPopupVariants;
}

- (int)emojiSearchPaths
{
  return self->_emojiSearchPaths;
}

- (int)emojiSearchPathsWithWeight9
{
  return self->_emojiSearchPathsWithWeight9;
}

- (int)emojiSearchPathsWithWeight8
{
  return self->_emojiSearchPathsWithWeight8;
}

- (int)emojiSearchPathsWithWeight7
{
  return self->_emojiSearchPathsWithWeight7;
}

- (int)emojiSearchPathsWithWeight6
{
  return self->_emojiSearchPathsWithWeight6;
}

- (int)emojiSearchPathsWithWeight5
{
  return self->_emojiSearchPathsWithWeight5;
}

- (int)emojiSearchPathsWithWeight4
{
  return self->_emojiSearchPathsWithWeight4;
}

- (int)emojiSearchPathsWithWeight3
{
  return self->_emojiSearchPathsWithWeight3;
}

- (int)emojiSearchPathsWithWeight2
{
  return self->_emojiSearchPathsWithWeight2;
}

- (int)emojiSearchPathsWithWeight1
{
  return self->_emojiSearchPathsWithWeight1;
}

- (int)emojiSearchPathsWithWeight10
{
  return self->_emojiSearchPathsWithWeight10;
}

- (int)emojiSearchPastes
{
  return self->_emojiSearchPastes;
}

- (int)emojiSearchMoreKeyTaps
{
  return self->_emojiSearchMoreKeyTaps;
}

- (int)emojiSearchGestures
{
  return self->_emojiSearchGestures;
}

- (int)emojiSearchFlicks
{
  return self->_emojiSearchFlicks;
}

- (int)emojiSearchEmojiKeyTaps
{
  return self->_emojiSearchEmojiKeyTaps;
}

- (int)emojiSearchCuts
{
  return self->_emojiSearchCuts;
}

- (int)emojiSearchCursorMovements
{
  return self->_emojiSearchCursorMovements;
}

- (int)emojiSearchCharacterKeyTaps
{
  return self->_emojiSearchCharacterKeyTaps;
}

- (int)emojiSearchBackspaceKeyTaps
{
  return self->_emojiSearchBackspaceKeyTaps;
}

- (int)emojiKeyTaps
{
  return self->_emojiKeyTaps;
}

- (int)cuts
{
  return self->_cuts;
}

- (int)characterKeyTaps
{
  return self->_characterKeyTaps;
}

- (int)candidateSelections
{
  return self->_candidateSelections;
}

- (int)backspaceKeyTaps
{
  return self->_backspaceKeyTaps;
}

- (void)setTotalInputActions:(int)a3
{
  self->_totalInputActions = a3;
}

- (void)setCharacterKeyTaps:(int)a3
{
  self->_characterKeyTaps = a3;
}

- (void)setBackspaceKeyTaps:(int)a3
{
  self->_backspaceKeyTaps = a3;
}

- (void)setSpaceKeyTaps:(int)a3
{
  self->_spaceKeyTaps = a3;
}

- (void)setReturnKeyTaps:(int)a3
{
  self->_returnKeyTaps = a3;
}

- (void)setShiftKeyTaps:(int)a3
{
  self->_shiftKeyTaps = a3;
}

- (void)setMoreKeyTaps:(int)a3
{
  self->_moreKeyTaps = a3;
}

- (void)setEmojiKeyTaps:(int)a3
{
  self->_emojiKeyTaps = a3;
}

- (void)setUnknownKeyTaps:(int)a3
{
  self->_unknownKeyTaps = a3;
}

- (void)setPaths:(int)a3
{
  self->_paths = a3;
}

- (void)setPathsWithWeight1:(int)a3
{
  self->_pathsWithWeight1 = a3;
}

- (void)setPathsWithWeight2:(int)a3
{
  self->_pathsWithWeight2 = a3;
}

- (void)setPathsWithWeight3:(int)a3
{
  self->_pathsWithWeight3 = a3;
}

- (void)setPathsWithWeight4:(int)a3
{
  self->_pathsWithWeight4 = a3;
}

- (void)setPathsWithWeight5:(int)a3
{
  self->_pathsWithWeight5 = a3;
}

- (void)setPathsWithWeight6:(int)a3
{
  self->_pathsWithWeight6 = a3;
}

- (void)setPathsWithWeight7:(int)a3
{
  self->_pathsWithWeight7 = a3;
}

- (void)setPathsWithWeight8:(int)a3
{
  self->_pathsWithWeight8 = a3;
}

- (void)setPathsWithWeight9:(int)a3
{
  self->_pathsWithWeight9 = a3;
}

- (void)setPathsWithWeight10:(int)a3
{
  self->_pathsWithWeight10 = a3;
}

- (void)setFlicks:(int)a3
{
  self->_flicks = a3;
}

- (void)setGestures:(int)a3
{
  self->_gestures = a3;
}

- (void)setPopupVariants:(int)a3
{
  self->_popupVariants = a3;
}

- (void)setCursorMovements:(int)a3
{
  self->_cursorMovements = a3;
}

- (void)setCandidateSelections:(int)a3
{
  self->_candidateSelections = a3;
}

- (void)setCuts:(int)a3
{
  self->_cuts = a3;
}

- (void)setPastes:(int)a3
{
  self->_pastes = a3;
}

- (void)setEmojiSelections:(int)a3
{
  self->_emojiSelections = a3;
}

- (void)setEmojiCandidateSelections:(int)a3
{
  self->_emojiCandidateSelections = a3;
}

- (void)setEmojiSearchCharacterKeyTaps:(int)a3
{
  self->_emojiSearchCharacterKeyTaps = a3;
}

- (void)setEmojiSearchBackspaceKeyTaps:(int)a3
{
  self->_emojiSearchBackspaceKeyTaps = a3;
}

- (void)setEmojiSearchSpaceKeyTaps:(int)a3
{
  self->_emojiSearchSpaceKeyTaps = a3;
}

- (void)setEmojiSearchShiftKeyTaps:(int)a3
{
  self->_emojiSearchShiftKeyTaps = a3;
}

- (void)setEmojiSearchMoreKeyTaps:(int)a3
{
  self->_emojiSearchMoreKeyTaps = a3;
}

- (void)setEmojiSearchEmojiKeyTaps:(int)a3
{
  self->_emojiSearchEmojiKeyTaps = a3;
}

- (void)setEmojiSearchUnknownKeyTaps:(int)a3
{
  self->_emojiSearchUnknownKeyTaps = a3;
}

- (void)setEmojiSearchPaths:(int)a3
{
  self->_emojiSearchPaths = a3;
}

- (void)setEmojiSearchPathsWithWeight1:(int)a3
{
  self->_emojiSearchPathsWithWeight1 = a3;
}

- (void)setEmojiSearchPathsWithWeight2:(int)a3
{
  self->_emojiSearchPathsWithWeight2 = a3;
}

- (void)setEmojiSearchPathsWithWeight3:(int)a3
{
  self->_emojiSearchPathsWithWeight3 = a3;
}

- (void)setEmojiSearchPathsWithWeight4:(int)a3
{
  self->_emojiSearchPathsWithWeight4 = a3;
}

- (void)setEmojiSearchPathsWithWeight5:(int)a3
{
  self->_emojiSearchPathsWithWeight5 = a3;
}

- (void)setEmojiSearchPathsWithWeight6:(int)a3
{
  self->_emojiSearchPathsWithWeight6 = a3;
}

- (void)setEmojiSearchPathsWithWeight7:(int)a3
{
  self->_emojiSearchPathsWithWeight7 = a3;
}

- (void)setEmojiSearchPathsWithWeight8:(int)a3
{
  self->_emojiSearchPathsWithWeight8 = a3;
}

- (void)setEmojiSearchPathsWithWeight9:(int)a3
{
  self->_emojiSearchPathsWithWeight9 = a3;
}

- (void)setEmojiSearchPathsWithWeight10:(int)a3
{
  self->_emojiSearchPathsWithWeight10 = a3;
}

- (void)setEmojiSearchFlicks:(int)a3
{
  self->_emojiSearchFlicks = a3;
}

- (void)setEmojiSearchGestures:(int)a3
{
  self->_emojiSearchGestures = a3;
}

- (void)setEmojiSearchPopupVariants:(int)a3
{
  self->_emojiSearchPopupVariants = a3;
}

- (void)setEmojiSearchCursorMovements:(int)a3
{
  self->_emojiSearchCursorMovements = a3;
}

- (void)setEmojiSearchCandidateSelections:(int)a3
{
  self->_emojiSearchCandidateSelections = a3;
}

- (void)setEmojiSearchCuts:(int)a3
{
  self->_emojiSearchCuts = a3;
}

- (void)setEmojiSearchPastes:(int)a3
{
  self->_emojiSearchPastes = a3;
}

@end
