@implementation TRIPETLogHandler

- (void)logEvent:(id)a3 subgroupName:(id)a4 queue:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__TRIPETLogHandler_logEvent_subgroupName_queue___block_invoke;
  v11[3] = &unk_1E3BFEA18;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  dispatch_async((dispatch_queue_t)a5, v11);

}

void __48__TRIPETLogHandler_logEvent_subgroupName_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v2)
    objc_msgSend(v3, "logMessage:subGroup:", v4, *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v3, "logMessage:", v4);

}

@end
