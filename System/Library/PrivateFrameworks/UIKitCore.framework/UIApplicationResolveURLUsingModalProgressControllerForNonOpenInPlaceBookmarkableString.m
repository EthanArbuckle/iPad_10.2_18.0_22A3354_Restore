@implementation UIApplicationResolveURLUsingModalProgressControllerForNonOpenInPlaceBookmarkableString

uint64_t ___UIApplicationResolveURLUsingModalProgressControllerForNonOpenInPlaceBookmarkableString_block_invoke(uint64_t a1, char a2)
{
  objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  if ((a2 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "ui_scheduleForCleanup");
}

@end
