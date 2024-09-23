@implementation ZN7WebCore19PowerSourceNotifierC2EON3WTF8FunctionIFvbEEE

WebCore *___ZN7WebCore19PowerSourceNotifierC2EON3WTF8FunctionIFvbEEE_block_invoke(WebCore *result)
{
  uint64_t v1;
  uint64_t v2;
  _BOOL8 HasAC;

  v1 = *((_QWORD *)result + 4);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
    {
      if (HIBYTE(WebCore::hasAC))
        HIBYTE(WebCore::hasAC) = 0;
      if (*(_QWORD *)(v2 + 16))
      {
        HasAC = WebCore::systemHasAC(result);
        return (WebCore *)(*(uint64_t (**)(_QWORD, _BOOL8))(**(_QWORD **)(v2 + 16) + 16))(*(_QWORD *)(v2 + 16), HasAC);
      }
    }
  }
  return result;
}

@end
