@implementation PageSheetPresentationObserver

- (void)presentationTransitionDidEndWithNotification:(id)a3
{
  sub_1B14A0DC8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (void)dismissalTransitionDidEndWithNotification:(id)a3
{
  sub_1B14A0DC8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 1);
}

@end
