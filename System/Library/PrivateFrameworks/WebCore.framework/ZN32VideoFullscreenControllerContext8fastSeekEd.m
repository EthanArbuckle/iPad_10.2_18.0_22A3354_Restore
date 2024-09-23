@implementation ZN32VideoFullscreenControllerContext8fastSeekEd

unsigned int *___ZN32VideoFullscreenControllerContext8fastSeekEd_block_invoke(unsigned int *result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v1 = *(_QWORD *)(*((_QWORD *)result + 5) + 104);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 48);
    if (v2)
    {
      v3 = *((double *)result + 6);
      *(_DWORD *)(v2 + 24) += 2;
      v6[0] = WTF::MediaTime::createWithDouble((WTF::MediaTime *)result, v3);
      v6[1] = v4;
      result = WebCore::HTMLMediaElement::fastSeek((WebCore::HTMLMediaElement *)v2, (const WTF::MediaTime *)v6);
      if (*(_DWORD *)(v2 + 24) == 2)
      {
        if ((*(_WORD *)(v2 + 30) & 0x400) == 0)
          return WebCore::Node::removedLastRef((WebCore::Node *)v2, v5);
      }
      else
      {
        *(_DWORD *)(v2 + 24) -= 2;
      }
    }
  }
  return result;
}

@end
