@implementation ZN32VideoFullscreenControllerContext11toggleMutedEv

unsigned int *___ZN32VideoFullscreenControllerContext11toggleMutedEv_block_invoke(uint64_t a1)
{
  unsigned int *result;

  result = *(unsigned int **)(*(_QWORD *)(a1 + 40) + 104);
  if (result)
    return WebCore::PlaybackSessionModelMediaElement::toggleMuted(result);
  return result;
}

@end
