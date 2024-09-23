@implementation VUIMPHomeShareMediaLibrary

- (id)enqueueKeepAliveWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[VUIMediaLibrary manager](self, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__VUIMPHomeShareMediaLibrary_enqueueKeepAliveWithCompletion___block_invoke;
    v8[3] = &unk_1E9F98E68;
    v9 = v4;
    objc_msgSend(v5, "_enqueueCompletionQueueBlock:", v8);

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", 0);

  return v6;
}

uint64_t __61__VUIMPHomeShareMediaLibrary_enqueueKeepAliveWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
