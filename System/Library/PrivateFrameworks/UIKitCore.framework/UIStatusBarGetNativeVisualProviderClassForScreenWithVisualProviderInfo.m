@implementation UIStatusBarGetNativeVisualProviderClassForScreenWithVisualProviderInfo

id ___UIStatusBarGetNativeVisualProviderClassForScreenWithVisualProviderInfo_block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id result;

  result = _UIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  return result;
}

@end
