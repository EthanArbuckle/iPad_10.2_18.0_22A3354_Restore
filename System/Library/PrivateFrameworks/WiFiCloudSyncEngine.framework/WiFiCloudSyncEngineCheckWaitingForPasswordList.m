@implementation WiFiCloudSyncEngineCheckWaitingForPasswordList

uint64_t ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke(uint64_t a1)
{
  return __WiFiCloudSyncEngineCheckWaitingForPasswordList(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t ____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_2(uint64_t a1)
{
  return __WiFiCloudSyncEngineCheckWaitingForPasswordList(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

const void *____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_40(uint64_t a1)
{
  const void *result;

  result = *(const void **)(*(_QWORD *)(a1 + 40) + 248);
  if (result)
  {
    CFRelease(result);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248) = 0;
    return (const void *)__WiFiCloudSyncEngineCheckWaitingForPasswordList(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  return result;
}

NSObject *____WiFiCloudSyncEngineCheckWaitingForPasswordList_block_invoke_2_42(uint64_t a1)
{
  NSObject *result;
  uint64_t v3;

  result = *(NSObject **)(*(_QWORD *)(a1 + 40) + 256);
  if (result)
  {
    dispatch_release(result);
    v3 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v3 + 256) = 0;
    return __WiFiCloudSyncEngineCheckWaitingForPasswordList(v3, *(_QWORD *)(a1 + 32));
  }
  return result;
}

@end
