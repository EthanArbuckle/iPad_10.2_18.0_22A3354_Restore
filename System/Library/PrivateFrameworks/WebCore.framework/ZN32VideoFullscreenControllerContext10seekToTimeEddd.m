@implementation ZN32VideoFullscreenControllerContext10seekToTimeEddd

unsigned int *___ZN32VideoFullscreenControllerContext10seekToTimeEddd_block_invoke(unsigned int *result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  WTF::MediaTime *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  WTF::MediaTime *v10[2];
  WTF::MediaTime *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(*((_QWORD *)result + 5) + 104);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 48);
    if (v2)
    {
      v4 = *((double *)result + 7);
      v3 = *((double *)result + 8);
      v5 = *((double *)result + 6);
      *(_DWORD *)(v2 + 24) += 2;
      v10[0] = (WTF::MediaTime *)WTF::MediaTime::createWithDouble((WTF::MediaTime *)result, v5);
      v10[1] = v6;
      v11 = (WTF::MediaTime *)WTF::MediaTime::createWithDouble(v10[0], v4);
      v12 = v7;
      v13 = WTF::MediaTime::createWithDouble(v11, v3);
      v14 = v8;
      result = WebCore::HTMLMediaElement::seekWithTolerance((unsigned int *)v2, (const WebCore::SeekTarget *)v10, 1);
      if (*(_DWORD *)(v2 + 24) == 2)
      {
        if ((*(_WORD *)(v2 + 30) & 0x400) == 0)
          return WebCore::Node::removedLastRef((WebCore::Node *)v2, v9);
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
