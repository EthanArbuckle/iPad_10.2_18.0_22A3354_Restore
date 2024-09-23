@implementation ZN32VideoFullscreenControllerContext24setPlayingOnSecondScreenEb

unsigned int *___ZN32VideoFullscreenControllerContext24setPlayingOnSecondScreenEb_block_invoke(unsigned int *result, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  v2 = *(_QWORD *)(*((_QWORD *)result + 5) + 104);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 48);
    if (v3)
    {
      v4 = *((unsigned __int8 *)result + 48);
      v5 = *(_DWORD *)(v3 + 24);
      *(_DWORD *)(v3 + 24) = v5 + 2;
      if (*(unsigned __int8 *)(v3 + 1698) != v4)
      {
        *(_BYTE *)(v3 + 1698) = v4;
        result = (unsigned int *)WebCore::HTMLMediaElement::scheduleUpdateMediaState((uint64_t (**)())v3);
        v5 = *(_DWORD *)(v3 + 24) - 2;
      }
      if (v5)
      {
        *(_DWORD *)(v3 + 24) = v5;
      }
      else if ((*(_WORD *)(v3 + 30) & 0x400) == 0)
      {
        return WebCore::Node::removedLastRef((WebCore::Node *)v3, a2);
      }
    }
  }
  return result;
}

@end
