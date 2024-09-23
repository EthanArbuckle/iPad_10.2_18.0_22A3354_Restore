@implementation _UIRevealGestureRecognizer

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIRevealGestureRecognizer;
    -[UIGestureRecognizer setDelegate:](&v5, sel_setDelegate_, v4);
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You cannot change the delegate of the UIViewControllerPreviewing failure relationship gesture recognizer"));
  }

}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 1 || (a3 & 0xFFFFFFFFFFFFFFFBLL) == 11;
}

@end
