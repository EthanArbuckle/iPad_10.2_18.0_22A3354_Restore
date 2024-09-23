@implementation WFPerformCustomModificationsStep

void __WFPerformCustomModificationsStep_block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  id v8;

  v2 = (void *)MEMORY[0x1C3BB3598]();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v8 = 0;
  v5 = objc_msgSend(v3, "performModificationsWithContext:error:", v4, &v8);
  v6 = v8;
  v7 = v8;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v6);
  objc_autoreleasePoolPop(v2);

}

@end
