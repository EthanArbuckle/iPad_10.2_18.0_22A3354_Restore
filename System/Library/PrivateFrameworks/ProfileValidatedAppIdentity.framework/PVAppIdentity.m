@implementation PVAppIdentity

void __PVAppIdentity_GenerateDigestWithCompletion_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  PVAppIdentityDigest *v4;
  NSObject *v5;
  PVAppIdentityDigest *v6;
  _QWORD block[4];
  PVAppIdentityDigest *v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1540], "pvai_wrappedError:error:", -10002, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PVAppIdentityDigest initWithError:version:]([PVAppIdentityDigest alloc], "initWithError:version:", v3, &unk_2515D32A0);
  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_6;
  block[3] = &unk_2515D2C88;
  v10 = *(id *)(a1 + 48);
  v8 = v4;
  v9 = *(id *)(a1 + 40);
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_3;
  block[3] = &unk_2515D2C88;
  v9 = *(id *)(a1 + 48);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

@end
