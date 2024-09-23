@implementation WebFrame(WebInternal)

+ (_QWORD)_createFrameWithPage:()WebInternal frameName:frameView:ownerElement:
{
  const void *v3;
  _QWORD *result;
  _QWORD *v5;

  v3 = *(const void **)(a1 + 8);
  result = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  v5 = result;
  *result = &off_1E9D6B138;
  result[1] = 0;
  result[2] = v3;
  if (v3)
    result = CFRetain(v3);
  v5[3] = 0;
  *a2 = v5;
  return result;
}

+ (uint64_t)_createFrameWithPage:()WebInternal frameName:frameView:ownerElement:
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E9D6B958;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

@end
