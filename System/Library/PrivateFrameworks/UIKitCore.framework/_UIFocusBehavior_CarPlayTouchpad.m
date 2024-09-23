@implementation _UIFocusBehavior_CarPlayTouchpad

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___UIFocusBehavior_CarPlayTouchpad_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7CD60 != -1)
    dispatch_once(&qword_1ECD7CD60, block);
  return (id)_MergedGlobals_963;
}

- (BOOL)supportsIndirectPanningMovement
{
  return 1;
}

- (BOOL)shouldEnableFocusOnSelect
{
  return 1;
}

- (BOOL)refinesIndexBarTargetContentOffset
{
  return 1;
}

@end
