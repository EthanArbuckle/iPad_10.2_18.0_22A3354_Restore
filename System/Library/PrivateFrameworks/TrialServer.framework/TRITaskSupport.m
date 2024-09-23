@implementation TRITaskSupport

- (Class)taskClassForTaskType:(int)a3
{
  objc_class *v3;
  objc_class *v6;
  void *v8;
  void *v9;

  if ((a3 - 1) <= 0x1F && ((0xFFFFF77F >> (a3 - 1)) & 1) != 0)
  {
    v3 = (objc_class *)objc_opt_class();
    if (v3)
    {
      v6 = v3;
      if ((-[objc_class conformsToProtocol:](v3, "conformsToProtocol:", &unk_1EFC7A788) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITaskSupport.m"), 159, CFSTR("taskClassForTaskType returning class %@ which is not a TRITask"), v9);

      }
      v3 = v6;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)XPCTaskAllowlist
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__TRITaskSupport_XPCTaskAllowlist__block_invoke;
  block[3] = &unk_1E932F918;
  block[4] = self;
  if (qword_1EFC741C8 != -1)
    dispatch_once(&qword_1EFC741C8, block);
  return (id)_MergedGlobals_32;
}

void __34__TRITaskSupport_XPCTaskAllowlist__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1D8232A5C]();
  v3 = (void *)objc_opt_new();
  v4 = 0;
  do
  {
    if (v4 <= 0x20 && ((1 << v4) & 0x1FFFFEEFELL) != 0)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "taskClassForTaskType:", v4);
      if (v5)
        objc_msgSend(v3, "addObject:", v5);
    }
    v4 = (v4 + 1);
  }
  while ((_DWORD)v4 != 1000);
  v6 = (void *)_MergedGlobals_32;
  _MergedGlobals_32 = (uint64_t)v3;

  objc_autoreleasePoolPop(v2);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__TRITaskSupport_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EFC741D8 != -1)
    dispatch_once(&qword_1EFC741D8, block);
  return (id)qword_1EFC741D0;
}

void __32__TRITaskSupport_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1D8232A5C]();
  v1 = objc_opt_new();
  v2 = (void *)qword_1EFC741D0;
  qword_1EFC741D0 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
