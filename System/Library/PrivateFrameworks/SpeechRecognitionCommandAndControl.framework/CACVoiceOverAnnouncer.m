@implementation CACVoiceOverAnnouncer

- (CACVoiceOverAnnouncer)init
{
  CACVoiceOverAnnouncer *v2;
  uint64_t v3;
  NSMutableArray *voiceOverAnnouncementQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *announcerQueue;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CACVoiceOverAnnouncer;
  v2 = -[CACVoiceOverAnnouncer init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    voiceOverAnnouncementQueue = v2->_voiceOverAnnouncementQueue;
    v2->_voiceOverAnnouncementQueue = (NSMutableArray *)v3;

    v5 = dispatch_queue_create("CACVoiceOverAnnouncer", 0);
    announcerQueue = v2->_announcerQueue;
    v2->_announcerQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__didFinishAnnouncement_, *MEMORY[0x24BEBDDA0], 0);

  }
  return v2;
}

- (void)announceMessage:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *announcerQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CACVoiceOverAnnouncer *v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  announcerQueue = self->_announcerQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__CACVoiceOverAnnouncer_announceMessage_type_completion___block_invoke;
  v13[3] = &unk_24F2AC430;
  v16 = v9;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v11 = v9;
  v12 = v8;
  dispatch_async(announcerQueue, v13);

}

void __57__CACVoiceOverAnnouncer_announceMessage_type_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  CACVoiceOverAnnouncement *v6;

  v6 = -[CACVoiceOverAnnouncement initWithMessage:type:completion:]([CACVoiceOverAnnouncement alloc], "initWithMessage:type:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "voiceOverAnnouncementQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 40), "currentAnnouncement");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3, v5 = objc_msgSend(*(id *)(a1 + 40), "shouldInterruptCurrentAnnouncement"), v4, v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "_dequeueNextAnnouncement");
  }

}

- (void)prepareForImmediateAnnouncement
{
  NSObject *announcerQueue;
  _QWORD block[5];

  announcerQueue = self->_announcerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CACVoiceOverAnnouncer_prepareForImmediateAnnouncement__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(announcerQueue, block);
}

void __56__CACVoiceOverAnnouncer_prepareForImmediateAnnouncement__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setShouldInterruptCurrentAnnouncement:", 1);
  objc_msgSend(*(id *)(a1 + 32), "voiceOverAnnouncementQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_dequeueNextAnnouncement
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CACVoiceOverAnnouncer setCurrentAnnouncement:](self, "setCurrentAnnouncement:", 0);
  -[CACVoiceOverAnnouncer setShouldInterruptCurrentAnnouncement:](self, "setShouldInterruptCurrentAnnouncement:", 0);
  -[CACVoiceOverAnnouncer voiceOverAnnouncementQueue](self, "voiceOverAnnouncementQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CACVoiceOverAnnouncer voiceOverAnnouncementQueue](self, "voiceOverAnnouncementQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[CACVoiceOverAnnouncer voiceOverAnnouncementQueue](self, "voiceOverAnnouncementQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", 0);

    LODWORD(v6) = *MEMORY[0x24BEBDDB0];
    objc_msgSend(v8, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v7);

    -[CACVoiceOverAnnouncer setCurrentAnnouncement:](self, "setCurrentAnnouncement:", v8);
  }
}

- (void)_didFinishAnnouncement:(id)a3
{
  id v4;
  NSObject *announcerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CACVoiceOverAnnouncer *v9;

  v4 = a3;
  announcerQueue = self->_announcerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__CACVoiceOverAnnouncer__didFinishAnnouncement___block_invoke;
  v7[3] = &unk_24F2AAD70;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(announcerQueue, v7);

}

void __48__CACVoiceOverAnnouncer__didFinishAnnouncement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEBDDA8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "currentAnnouncement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentAnnouncement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completion");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
  objc_msgSend(*(id *)(a1 + 40), "_dequeueNextAnnouncement");

}

- (NSMutableArray)voiceOverAnnouncementQueue
{
  return self->_voiceOverAnnouncementQueue;
}

- (void)setVoiceOverAnnouncementQueue:(id)a3
{
  objc_storeStrong((id *)&self->_voiceOverAnnouncementQueue, a3);
}

- (CACVoiceOverAnnouncement)currentAnnouncement
{
  return self->_currentAnnouncement;
}

- (void)setCurrentAnnouncement:(id)a3
{
  objc_storeStrong((id *)&self->_currentAnnouncement, a3);
}

- (BOOL)shouldInterruptCurrentAnnouncement
{
  return self->_shouldInterruptCurrentAnnouncement;
}

- (void)setShouldInterruptCurrentAnnouncement:(BOOL)a3
{
  self->_shouldInterruptCurrentAnnouncement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnnouncement, 0);
  objc_storeStrong((id *)&self->_voiceOverAnnouncementQueue, 0);
  objc_storeStrong((id *)&self->_announcerQueue, 0);
}

@end
