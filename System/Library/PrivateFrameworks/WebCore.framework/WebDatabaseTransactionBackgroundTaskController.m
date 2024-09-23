@implementation WebDatabaseTransactionBackgroundTaskController

+ (void)startBackgroundTask
{
  id v4;
  uint64_t v5;
  int v6;
  _QWORD v7[5];

  if (__ldaxr(byte_1ECE81CB0))
  {
    __clrex();
  }
  else if (!__stxr(1u, byte_1ECE81CB0))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](byte_1ECE81CB0, a2);
LABEL_5:
  v4 = +[WebBackgroundTaskController sharedController](WebBackgroundTaskController, "sharedController");
  if (qword_1ECE81D18 != -1)
    dispatch_once(&qword_1ECE81D18, &__block_literal_global_673);
  v5 = qword_1ECE81D20;
  if (v5 == objc_msgSend(v4, "invalidBackgroundTaskIdentifier"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__WebDatabaseTransactionBackgroundTaskController_startBackgroundTask__block_invoke;
    v7[3] = &unk_1E3203658;
    v7[4] = a1;
    qword_1ECE81D20 = objc_msgSend(v4, "startBackgroundTaskWithExpirationHandler:", v7);
  }
  v6 = __ldxr(byte_1ECE81CB0);
  if (v6 != 1)
  {
    __clrex();
    goto LABEL_13;
  }
  if (__stlxr(0, byte_1ECE81CB0))
LABEL_13:
    WTF::Lock::unlockSlow((WTF::Lock *)byte_1ECE81CB0);
}

uint64_t __69__WebDatabaseTransactionBackgroundTaskController_startBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = WebCore::staticTracker;
  if (!WebCore::staticTracker)
  {
    v2 = WTF::fastMalloc((WTF *)0x88);
    *(_BYTE *)v2 = 0;
    *(_QWORD *)(v2 + 8) = 0;
    *(_BYTE *)(v2 + 16) = 0;
    *(_DWORD *)(v2 + 24) = 0;
    *(_QWORD *)(v2 + 32) = 0;
    *(_DWORD *)(v2 + 40) = -1;
    *(_WORD *)(v2 + 44) = 0;
    *(_BYTE *)(v2 + 46) = 0;
    *(_QWORD *)(v2 + 48) = 0;
    *(_BYTE *)(v2 + 56) = 0;
    *(_QWORD *)(v2 + 64) = 0;
    *(_BYTE *)(v2 + 72) = 0;
    *(_DWORD *)(v2 + 76) = 1;
    *(_QWORD *)(v2 + 80) = 0;
    *(_QWORD *)(v2 + 88) = 0;
    WTF::String::isolatedCopy();
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    WebCore::staticTracker = v2;
  }
  WebCore::DatabaseTracker::closeAllDatabases(v2, 0);
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask");
}

+ (void)endBackgroundTask
{
  id v3;
  uint64_t v4;
  int v5;

  if (__ldaxr(byte_1ECE81CB0))
  {
    __clrex();
  }
  else if (!__stxr(1u, byte_1ECE81CB0))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](byte_1ECE81CB0, a2);
LABEL_5:
  v3 = +[WebBackgroundTaskController sharedController](WebBackgroundTaskController, "sharedController");
  if (qword_1ECE81D18 != -1)
    dispatch_once(&qword_1ECE81D18, &__block_literal_global_673);
  v4 = qword_1ECE81D20;
  if (v4 != objc_msgSend(v3, "invalidBackgroundTaskIdentifier"))
  {
    if (qword_1ECE81D18 != -1)
      dispatch_once(&qword_1ECE81D18, &__block_literal_global_673);
    objc_msgSend(v3, "endBackgroundTaskWithIdentifier:", qword_1ECE81D20);
    qword_1ECE81D20 = objc_msgSend(v3, "invalidBackgroundTaskIdentifier");
  }
  v5 = __ldxr(byte_1ECE81CB0);
  if (v5 != 1)
  {
    __clrex();
    goto LABEL_15;
  }
  if (__stlxr(0, byte_1ECE81CB0))
LABEL_15:
    WTF::Lock::unlockSlow((WTF::Lock *)byte_1ECE81CB0);
}

@end
