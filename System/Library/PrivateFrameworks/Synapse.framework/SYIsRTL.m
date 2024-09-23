@implementation SYIsRTL

void __SYIsRTL_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getUIApplicationClass_softClass;
  v7 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUIApplicationClass_block_invoke;
    v3[3] = &unk_1E757B260;
    v3[4] = &v4;
    __getUIApplicationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  objc_msgSend(v1, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SYIsRTL___isRTL = objc_msgSend(v2, "userInterfaceLayoutDirection") == 1;

}

@end
