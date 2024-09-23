@implementation SBIN_FCActivityManager

+ (id)sharedActivityManager
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getFCActivityManagerClass_softClass;
  v9 = getFCActivityManagerClass_softClass;
  if (!getFCActivityManagerClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getFCActivityManagerClass_block_invoke;
    v5[3] = &unk_25190EBB8;
    v5[4] = &v6;
    __getFCActivityManagerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "sharedActivityManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
