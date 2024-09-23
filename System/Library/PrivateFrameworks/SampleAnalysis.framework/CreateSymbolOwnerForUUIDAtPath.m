@implementation CreateSymbolOwnerForUUIDAtPath

uint64_t __CreateSymbolOwnerForUUIDAtPath_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3010000000;
  v9 = 0;
  v10 = 0;
  v8 = &unk_1B9CEFD9F;
  v2 = objc_retainAutorelease(a2);
  objc_msgSend(v2, "UTF8String");
  CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification();
  v3 = v6[4];
  _Block_object_dispose(&v5, 8);

  return v3;
}

uint64_t __CreateSymbolOwnerForUUIDAtPath_block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = CSIsNull();
  if ((_DWORD)result)
  {
    CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
    result = CSIsNull();
    if ((result & 1) == 0)
    {
      result = CSRetain();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_QWORD *)(v3 + 32) = result;
      *(_QWORD *)(v3 + 40) = v4;
    }
  }
  return result;
}

@end
