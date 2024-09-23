@implementation UIApplicationLoadWebKit

void ___UIApplicationLoadWebKit_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  if (!qword_1EDDC8428)
    qword_1EDDC8428 = _sl_dlopen();
  v0 = (void *)qword_1EDDC8428;
  if (!qword_1EDDC8428)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *WebKitLegacyLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("UIApplication.m"), 5485, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  WebKitFramework = (uint64_t)v0;
  off_1EDDC8220 = (uint64_t (*)(void))dlsym(v0, "WebKitInitialize");
  off_1EDDC8228 = (uint64_t (*)(_QWORD, _QWORD))dlsym((void *)WebKitFramework, "WebKitSetBackgroundAndForegroundNotificationNames");
  off_1EDDC8230 = (uint64_t (*)(_QWORD))dlsym((void *)WebKitFramework, "WebKitSetInvalidWebBackgroundTaskIdentifier");
  off_1EDDC8238 = (uint64_t (*)(_QWORD))dlsym((void *)WebKitFramework, "WebKitSetStartBackgroundTaskBlock");
  off_1EDDC8240 = (uint64_t (*)(_QWORD))dlsym((void *)WebKitFramework, "WebKitSetEndBackgroundTaskBlock");
  off_1EDDC8220();
  off_1EDDC8228(CFSTR("UIApplicationDidEnterBackgroundNotification"), CFSTR("UIApplicationWillEnterForegroundNotification"));
  off_1EDDC8230(0);
  off_1EDDC8238(&__block_literal_global_1093);
  off_1EDDC8240(&__block_literal_global_1095);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("UIApplicationLoadedWebKit"), 0);

}

uint64_t ___UIApplicationLoadWebKit_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)UIApp, "_beginBackgroundTaskWithExpirationHandler:", a2);
}

uint64_t ___UIApplicationLoadWebKit_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)UIApp, "_endBackgroundTask:", a2);
}

@end
