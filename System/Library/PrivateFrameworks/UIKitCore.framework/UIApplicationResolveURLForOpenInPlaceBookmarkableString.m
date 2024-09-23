@implementation UIApplicationResolveURLForOpenInPlaceBookmarkableString

void ___UIApplicationResolveURLForOpenInPlaceBookmarkableString_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
    (*(void (**)(void))(a1[6] + 16))();
  else
    NSLog(CFSTR("Error %@ resolving bookmark %@ for URL %@"), a3, a1[4], a1[5]);
}

@end
