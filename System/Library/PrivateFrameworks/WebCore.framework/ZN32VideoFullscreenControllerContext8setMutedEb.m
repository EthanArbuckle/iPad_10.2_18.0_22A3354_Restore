@implementation ZN32VideoFullscreenControllerContext8setMutedEb

unsigned int *___ZN32VideoFullscreenControllerContext8setMutedEb_block_invoke(unsigned int *result)
{
  uint64_t v1;
  WebCore::Node *v2;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(*((_QWORD *)result + 5) + 104);
  if (v1)
  {
    v2 = *(WebCore::Node **)(v1 + 48);
    if (v2)
    {
      v3 = *((unsigned __int8 *)result + 48);
      *((_DWORD *)v2 + 6) += 2;
      result = (unsigned int *)(*(uint64_t (**)(WebCore::Node *, uint64_t))(*(_QWORD *)v2 + 1480))(v2, v3);
      if (*((_DWORD *)v2 + 6) == 2)
      {
        if ((*((_WORD *)v2 + 15) & 0x400) == 0)
          return WebCore::Node::removedLastRef(v2, v4);
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
