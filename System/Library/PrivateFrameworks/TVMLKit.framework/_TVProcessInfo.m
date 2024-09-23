@implementation _TVProcessInfo

+ (id)currentProcessInfo
{
  if (currentProcessInfo_onceToken != -1)
    dispatch_once(&currentProcessInfo_onceToken, &__block_literal_global_42);
  return (id)currentProcessInfo_currentProcessInfo;
}

- (_TVProcessInfo)init
{
  _TVProcessInfo *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVProcessInfo;
  v2 = -[_TVProcessInfo init](&v4, sel_init);
  if (v2)
  {
    v2->_currentTask = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
    v2->_hasPrivateEntitlement = -[_TVProcessInfo BOOLValueForEntitlement:](v2, "BOOLValueForEntitlement:", CFSTR("com.apple.tvmlkit.private"));
    v2->_hasiTunesAPIEntitlement = -[_TVProcessInfo valueForEntitlement:containsObject:](v2, "valueForEntitlement:containsObject:", CFSTR("com.apple.tv.api"), CFSTR("iTunes"));
    v2->_hasiTunesStoreEntitlement = -[_TVProcessInfo BOOLValueForEntitlement:](v2, "BOOLValueForEntitlement:", CFSTR("com.apple.itunesstored.private"));
  }
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
  v4.super_class = (Class)_TVProcessInfo;
  -[_TVProcessInfo dealloc](&v4, sel_dealloc);
}

- (id)valueForEntitlement:(id)a3
{
  __CFString *v4;
  __SecTask *v5;
  void *v6;

  v4 = (__CFString *)a3;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The entitlement argument must not be nil."));
  v5 = -[_TVProcessInfo currentTask](self, "currentTask");
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

  -[_TVProcessInfo valueForEntitlement:](self, "valueForEntitlement:", a3);
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
  -[_TVProcessInfo valueForEntitlement:](self, "valueForEntitlement:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "containsObject:", v6);
  else
    v8 = 0;

  return v8;
}

- (BOOL)hasPrivateEntitlement
{
  return self->_hasPrivateEntitlement;
}

- (BOOL)hasiTunesAPIEntitlement
{
  return self->_hasiTunesAPIEntitlement;
}

- (BOOL)hasiTunesStoreEntitlement
{
  return self->_hasiTunesStoreEntitlement;
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
