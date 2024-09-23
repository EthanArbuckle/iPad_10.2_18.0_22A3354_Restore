@implementation _UIFocusBehavior_CarPlayKnob

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___UIFocusBehavior_CarPlayKnob_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7F380 != -1)
    dispatch_once(&qword_1ECD7F380, block);
  return (id)_MergedGlobals_1163;
}

- (BOOL)refinesIndexBarTargetContentOffset
{
  return 1;
}

@end
