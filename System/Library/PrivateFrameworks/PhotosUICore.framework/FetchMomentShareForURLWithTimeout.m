@implementation FetchMomentShareForURLWithTimeout

void ___FetchMomentShareForURLWithTimeout_block_invoke(_QWORD *a1)
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[5] + 8) + 32));
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1011, CFSTR("Fetch timed out"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[4] + 16))();

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[5] + 8) + 32));
}

void ___FetchMomentShareForURLWithTimeout_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v7 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = ___FetchMomentShareForURLWithTimeout_block_invoke_3;
    block[3] = &unk_1E5145688;
    v11 = *(id *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));

}

uint64_t ___FetchMomentShareForURLWithTimeout_block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
