@implementation UINavigationController

BOOL __84__UINavigationController_PhotosUI__pu_popToViewControllerIfAllowed_animated_forced___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "prepareForDismissingForced:", *(unsigned __int8 *)(a1 + 48)) & 1) == 0
    && !*(_BYTE *)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v4 = *(_QWORD *)(a1 + 32) != (_QWORD)v3;
  else
    v4 = 0;

  return v4;
}

@end
