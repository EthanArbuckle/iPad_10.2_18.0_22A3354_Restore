@implementation SYScreenScale

void __SYScreenScale_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getUIScreenClass_softClass;
  v8 = getUIScreenClass_softClass;
  if (!getUIScreenClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getUIScreenClass_block_invoke;
    v4[3] = &unk_1E757B260;
    v4[4] = &v5;
    __getUIScreenClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  SYScreenScale___scale = v3;

}

@end
