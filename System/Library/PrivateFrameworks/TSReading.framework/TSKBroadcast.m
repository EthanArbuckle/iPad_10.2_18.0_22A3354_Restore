@implementation TSKBroadcast

+ (void)twoPhaseNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeKind:(int)a5 details:(id)a6 changeSource:(id)a7
{
  uint64_t v10;
  TSKChangeGroup *v12;

  if (a3)
  {
    if (a4)
    {
      v10 = *(_QWORD *)&a5;
      v12 = objc_alloc_init(TSKChangeGroup);
      -[TSKChangeGroup registerChange:details:forChangeSource:](v12, "registerChange:details:forChangeSource:", v10, a6, a7);
      +[TSKBroadcast twoPhaseNotificationWithAccessController:changeNotifier:changeGroup:](TSKBroadcast, "twoPhaseNotificationWithAccessController:changeNotifier:changeGroup:", a3, a4, v12);

    }
  }
}

+ (void)twoPhaseNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeGroup:(id)a5
{
  void *v8;
  uint64_t v9;

  if (a3 && a4)
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "isMainThread") & 1) == 0)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKBroadcast twoPhaseNotificationWithAccessController:changeNotifier:changeGroup:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKBroadcast.m"), 58, CFSTR("Must request performing commands on the main thread."));
    }
    if (a5)
      objc_msgSend(a3, "performRead:thenWrite:thenReadOnMainThread:withTarget:argument:", 0, sel_syncProcessChanges_, sel_asyncProcessChanges_, a4, a5);
  }
}

+ (void)asyncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeKind:(int)a5 details:(id)a6 changeSource:(id)a7
{
  uint64_t v10;
  TSKChangeGroup *v12;

  if (a3)
  {
    if (a4)
    {
      v10 = *(_QWORD *)&a5;
      v12 = objc_alloc_init(TSKChangeGroup);
      -[TSKChangeGroup registerChange:details:forChangeSource:](v12, "registerChange:details:forChangeSource:", v10, a6, a7);
      +[TSKBroadcast asyncNotificationWithAccessController:changeNotifier:changeGroup:](TSKBroadcast, "asyncNotificationWithAccessController:changeNotifier:changeGroup:", a3, a4, v12);

    }
  }
}

+ (void)asyncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeGroup:(id)a5
{
  _QWORD block[7];

  if (a3 && a4 && a5)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "isMainThread"))
    {
      objc_msgSend(a4, "asyncProcessChanges:", a5);
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __81__TSKBroadcast_asyncNotificationWithAccessController_changeNotifier_changeGroup___block_invoke;
      block[3] = &unk_24D82AB70;
      block[4] = a3;
      block[5] = a4;
      block[6] = a5;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __81__TSKBroadcast_asyncNotificationWithAccessController_changeNotifier_changeGroup___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__TSKBroadcast_asyncNotificationWithAccessController_changeNotifier_changeGroup___block_invoke_2;
  v3[3] = &unk_24D82A5C8;
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "performRead:", v3);
}

uint64_t __81__TSKBroadcast_asyncNotificationWithAccessController_changeNotifier_changeGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "asyncProcessChanges:", *(_QWORD *)(a1 + 40));
}

+ (void)syncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeKind:(int)a5 details:(id)a6 changeSource:(id)a7
{
  uint64_t v10;
  TSKChangeGroup *v12;

  if (a3)
  {
    if (a4)
    {
      v10 = *(_QWORD *)&a5;
      v12 = objc_alloc_init(TSKChangeGroup);
      -[TSKChangeGroup registerChange:details:forChangeSource:](v12, "registerChange:details:forChangeSource:", v10, a6, a7);
      +[TSKBroadcast syncNotificationWithAccessController:changeNotifier:changeGroup:](TSKBroadcast, "syncNotificationWithAccessController:changeNotifier:changeGroup:", a3, a4, v12);

    }
  }
}

+ (void)syncNotificationWithAccessController:(id)a3 changeNotifier:(id)a4 changeGroup:(id)a5
{
  if (a3 && a4)
  {
    if (a5)
      objc_msgSend(a3, "performRead:thenWrite:thenReadOnMainThread:withTarget:argument:", 0, sel_syncProcessChanges_, 0, a4, a5);
  }
}

@end
