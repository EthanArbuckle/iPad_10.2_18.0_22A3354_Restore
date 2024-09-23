@implementation _UIFeedbackKeyboardBehavior

- (void)userTypedOnKeyWithType:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)(a3 - 1) > 5)
    v3 = 0;
  else
    v3 = qword_18667B1A0[a3 - 1];
  -[_UIKeyboardFeedbackGenerator actionOccurred:](self, "actionOccurred:", v3);
}

@end
