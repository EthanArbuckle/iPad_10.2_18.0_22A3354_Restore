@implementation KeyboardObserver

- (void)keyboardWillShowWithNotification:(id)a3
{
  sub_1B1550400((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_1B154FF68);
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  sub_1B1550400((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_1B15503BC);
}

@end
