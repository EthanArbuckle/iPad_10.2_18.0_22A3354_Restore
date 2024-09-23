@implementation _UIViewServiceReplyAwaitingTrampoline

- (void)forwardInvocation:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__228;
  v18 = __Block_byref_object_dispose__228;
  v19 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59___UIViewServiceReplyAwaitingTrampoline_forwardInvocation___block_invoke;
  v11 = &unk_1E16E9530;
  v13 = &v14;
  v6 = v5;
  v12 = v6;
  -[_UIViewServiceReplyControlTrampoline _forwardInvocation:withIncomingReplyDispatchBlock:](self, "_forwardInvocation:withIncomingReplyDispatchBlock:", v4, &v8);
  v7 = dispatch_time(0, 2000000000);
  if (!dispatch_semaphore_wait(v6, v7))
    objc_msgSend((id)v15[5], "invoke", v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);
}

@end
