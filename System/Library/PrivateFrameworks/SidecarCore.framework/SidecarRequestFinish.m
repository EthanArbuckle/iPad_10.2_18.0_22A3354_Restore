@implementation SidecarRequestFinish

void __SidecarRequestFinish_block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  uint64_t v4;
  id v5;
  void *v6;
  int8x16_t v7;
  void (*v8)(int8x16_t *);
  void *v9;
  id v10;
  uint64_t v11;
  BOOL v12;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    v3 = objc_msgSend(*(id *)(a1 + 32), "code") == 3072;
  else
    v3 = 0;

  v7.i64[0] = MEMORY[0x24BDAC760];
  v7.i64[1] = 3221225472;
  v8 = __SidecarRequestFinish_block_invoke_2;
  v9 = &unk_24E5E0CB8;
  v4 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v4;
  v12 = v3;
  v5 = v10;
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "willChangeValueForKey:", CFSTR("cancelled"));
    __SidecarRequestFinish_block_invoke_2(&v7);
    objc_msgSend(v6, "didChangeValueForKey:", CFSTR("cancelled"));
  }
  else
  {
    __SidecarRequestFinish_block_invoke_2(&v7);
  }

}

void __SidecarRequestFinish_block_invoke_2(int8x16_t *a1)
{
  int8x16_t v1;
  id v2;
  _QWORD v3[4];
  int8x16_t v4;
  __int8 v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __SidecarRequestFinish_block_invoke_3;
  v3[3] = &unk_24E5E0CB8;
  v1 = a1[2];
  v4 = vextq_s8(v1, v1, 8uLL);
  v5 = a1[3].i8[0];
  v2 = (id)v1.i64[0];
  objc_msgSend(v2, "willChangeValueForKey:", CFSTR("finished"));
  __SidecarRequestFinish_block_invoke_3((uint64_t)v3);
  objc_msgSend(v2, "didChangeValueForKey:", CFSTR("finished"));

}

void __SidecarRequestFinish_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  int64_t v4;
  _QWORD v5[6];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(os_unfair_lock_s **)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __SidecarRequestFinish_block_invoke_4;
    v5[3] = &unk_24E5E1640;
    v5[4] = v3;
    v5[5] = v2;
    SidecarTransferLocked(v3, v5);
  }
  if (*(_BYTE *)(a1 + 48))
  {
    v4 = 5;
  }
  else if (*(_QWORD *)(a1 + 32))
  {
    v4 = 6;
  }
  else
  {
    v4 = 4;
  }
  SidecarRequestSetState(*(void **)(a1 + 40), v4);
  SidecarRequestDisconnectSession(*(void **)(a1 + 40));
}

void __SidecarRequestFinish_block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v1 + 104);
  v2 = (id *)(v1 + 104);
  if (v3)
    __assert_rtn("SidecarRequestFinish_block_invoke_4", "SidecarRequest.m", 243, "self->_error == nil");
  objc_storeStrong(v2, *(id *)(a1 + 40));
}

@end
