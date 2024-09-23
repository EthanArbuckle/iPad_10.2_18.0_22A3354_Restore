@implementation UIKBGridCandidateView

- (id)getConfiguration
{
  return +[UIKeyboardCandidateViewConfiguration configuration](UIKeyboardCandidateViewConfigurationTVGrid, "configuration");
}

@end
