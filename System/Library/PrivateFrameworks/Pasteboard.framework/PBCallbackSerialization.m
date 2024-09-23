@implementation PBCallbackSerialization

- (void)sendBeginBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PBCallbackSerialization_sendBeginBlock___block_invoke;
  v6[3] = &unk_1E24314A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  PBDispatchAsyncCallback(v6);

}

uint64_t __42__PBCallbackSerialization_sendBeginBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendEndBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PBCallbackSerialization_sendEndBlock___block_invoke;
  v6[3] = &unk_1E24314A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  PBDispatchAsyncCallback(v6);

}

void __40__PBCallbackSerialization_sendEndBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v3 + 16))
  {
    (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    v4 = MEMORY[0x18D782EA4](v2);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v4;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endBlock, 0);
}

@end
