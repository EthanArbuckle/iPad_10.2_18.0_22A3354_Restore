@implementation ZNK12SafariShared21URLCompletionEntryMap21enumerateConcurrentlyEPU28objcproto17OS

_QWORD *___ZNK12SafariShared21URLCompletionEntryMap21enumerateConcurrentlyEPU28objcproto17OS_dispatch_group8NSObjectPU28objcproto17OS_dispatch_queueS1_iU13block_pointerFvRKNS_18URLCompletionEntryEE_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  _QWORD *result;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;

  v2 = *(uint64_t **)(a1 + 40);
  result = WTF::HashTable<SafariShared::URLCompletionEntryKey,SafariShared::URLCompletionEntry,SafariShared::URLCompletionEntryKeyExtractor,SafariShared::URLCompletionEntryHash,SafariShared::URLCompletionEntryValueTraits,SafariShared::URLCompletionEntryKeyTraits>::begin(v2);
  v4 = result;
  v6 = v5;
  if (*v2)
    v7 = *v2 + 56 * *(unsigned int *)(*v2 - 4);
  else
    v7 = 0;
  if ((_QWORD *)v7 != result)
  {
    do
    {
      result = (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      while (1)
      {
        v4 += 7;
        if (v4 == v6)
          break;
        if (*v4)
          v8 = *v4 == (_QWORD)&stru_1E4B40D18;
        else
          v8 = 1;
        if (!v8)
          goto LABEL_13;
      }
      v4 = v6;
LABEL_13:
      ;
    }
    while (v4 != (_QWORD *)v7);
  }
  return result;
}

@end
