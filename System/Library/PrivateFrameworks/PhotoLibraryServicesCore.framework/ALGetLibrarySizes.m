@implementation ALGetLibrarySizes

void __ALGetLibrarySizes_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;

  v7 = a3;
  v8 = objc_msgSend(a2, "integerValue");
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if ((v8 & ~v9) == 0)
  {
    v10 = v8;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ALGetLibrarySizes_block_invoke_2;
    block[3] = &unk_1E3769578;
    v11 = *(NSObject **)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v15 = v10;
    v13 = v7;
    dispatch_async(v11, block);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) &= ~v10;

    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (!v9)
    *a4 = 1;

}

uint64_t __ALGetLibrarySizes_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), -1);
}

uint64_t __ALGetLibrarySizes_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "unsignedLongLongValue"));
}

@end
