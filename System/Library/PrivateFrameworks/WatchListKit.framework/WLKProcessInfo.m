@implementation WLKProcessInfo

+ (id)currentProcessInfo
{
  if (currentProcessInfo_onceToken != -1)
    dispatch_once(&currentProcessInfo_onceToken, &__block_literal_global_9);
  return (id)currentProcessInfo_currentProcessInfo;
}

void __36__WLKProcessInfo_currentProcessInfo__block_invoke()
{
  WLKProcessInfo *v0;
  void *v1;

  v0 = objc_alloc_init(WLKProcessInfo);
  v1 = (void *)currentProcessInfo_currentProcessInfo;
  currentProcessInfo_currentProcessInfo = (uint64_t)v0;

}

- (WLKProcessInfo)init
{
  WLKProcessInfo *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLKProcessInfo;
  v2 = -[WLKProcessInfo init](&v4, sel_init);
  if (v2)
    v2->_currentTask = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  return v2;
}

- (void)dealloc
{
  __SecTask *currentTask;
  objc_super v4;

  currentTask = self->_currentTask;
  if (currentTask)
    CFRelease(currentTask);
  v4.receiver = self;
  v4.super_class = (Class)WLKProcessInfo;
  -[WLKProcessInfo dealloc](&v4, sel_dealloc);
}

- (id)valueForEntitlement:(id)a3
{
  __CFString *v4;
  __SecTask *v5;
  void *v6;

  v4 = (__CFString *)a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The entitlement argument must not be nil."));
  v5 = -[WLKProcessInfo currentTask](self, "currentTask");
  if (v5)
    v6 = (void *)SecTaskCopyValueForEntitlement(v5, v4, 0);
  else
    v6 = 0;

  return v6;
}

- (BOOL)BOOLValueForEntitlement:(id)a3
{
  void *v3;
  char v4;

  -[WLKProcessInfo valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)valueForEntitlement:(id)a3 containsObject:(id)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a4;
  -[WLKProcessInfo valueForEntitlement:](self, "valueForEntitlement:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "containsObject:", v6);
  else
    v8 = 0;

  return v8;
}

- (__SecTask)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(__SecTask *)a3
{
  self->_currentTask = a3;
}

@end
