@implementation PXDiagnosticsNotificationCenter

- (PXDiagnosticsNotificationCenter)init
{
  PXDiagnosticsNotificationCenter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingReplyHandles;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXDiagnosticsNotificationCenter;
  v2 = -[PXDiagnosticsNotificationCenter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingReplyHandles = v2->_pendingReplyHandles;
    v2->_pendingReplyHandles = v3;

  }
  return v2;
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t nextReplyID;
  _PXDiagnosticsNotificationReplyHandle *v12;
  id v13;
  _PXDiagnosticsNotificationReplyHandle *v14;
  NSMutableDictionary *pendingReplyHandles;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  nextReplyID = self->_nextReplyID;
  self->_nextReplyID = nextReplyID + 1;
  objc_initWeak(&location, self);
  v12 = [_PXDiagnosticsNotificationReplyHandle alloc];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__PXDiagnosticsNotificationCenter_postNotificationWithName_userInfo_resultHandler___block_invoke;
  v19[3] = &unk_1E5118438;
  v13 = v10;
  v20 = v13;
  objc_copyWeak(&v21, &location);
  v14 = -[_PXDiagnosticsNotificationReplyHandle initWithIDNumber:replyBlock:](v12, "initWithIDNumber:replyBlock:", nextReplyID, v19);
  pendingReplyHandles = self->_pendingReplyHandles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", nextReplyID);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](pendingReplyHandles, "setObject:forKeyedSubscript:", v14, v16);

  v17 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("PXDiagnosticsNotificationCenterReplyHandleKey"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:userInfo:", v8, 0, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_didReplyToIDNumber:(int64_t)a3
{
  NSMutableDictionary *pendingReplyHandles;
  id v4;

  pendingReplyHandles = self->_pendingReplyHandles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](pendingReplyHandles, "removeObjectForKey:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReplyHandles, 0);
}

void __83__PXDiagnosticsNotificationCenter_postNotificationWithName_userInfo_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didReplyToIDNumber:", a2);

}

@end
