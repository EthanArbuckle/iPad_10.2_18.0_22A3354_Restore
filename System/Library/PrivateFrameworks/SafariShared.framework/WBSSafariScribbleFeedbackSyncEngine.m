@implementation WBSSafariScribbleFeedbackSyncEngine

- (WBSSafariScribbleFeedbackSyncEngine)init
{
  WBSSafariScribbleFeedbackSyncEngine *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  WBSSafariScribbleFeedbackSyncEngine *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSSafariScribbleFeedbackSyncEngine;
  v2 = -[WBSSafariScribbleFeedbackSyncEngine init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WBSSafariScribbleFeedbackSyncEngine.internalQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)syncScribbleFeedbackUp:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__WBSSafariScribbleFeedbackSyncEngine_syncScribbleFeedbackUp_withCompletion___block_invoke;
  v11[3] = &unk_1E4B2A250;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, v11);

}

void __77__WBSSafariScribbleFeedbackSyncEngine_syncScribbleFeedbackUp_withCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncScribbleFeedbackUp:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
