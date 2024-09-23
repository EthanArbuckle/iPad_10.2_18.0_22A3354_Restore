@implementation ZN32VideoFullscreenControllerContext11endScanningEv

unsigned int *___ZN32VideoFullscreenControllerContext11endScanningEv_block_invoke(unsigned int *result)
{
  uint64_t v1;
  WebCore::Node *v2;
  void *v3;

  v1 = *(_QWORD *)(*((_QWORD *)result + 5) + 104);
  if (v1)
  {
    v2 = *(WebCore::Node **)(v1 + 48);
    if (v2)
    {
      *((_DWORD *)v2 + 6) += 2;
      result = (unsigned int *)(*(uint64_t (**)(WebCore::Node *))(*(_QWORD *)v2 + 1512))(v2);
      if (*((_DWORD *)v2 + 6) == 2)
      {
        if ((*((_WORD *)v2 + 15) & 0x400) == 0)
          return WebCore::Node::removedLastRef(v2, v3);
      }
      else
      {
        *((_DWORD *)v2 + 6) -= 2;
      }
    }
  }
  return result;
}

@end
