@implementation SBDisplayConnectionDonationTimer

void __57___SBDisplayConnectionDonationTimer_resetTimerOnConnect___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57___SBDisplayConnectionDonationTimer_resetTimerOnConnect___block_invoke_2;
  v5[3] = &unk_1E8EB8270;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 0.5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

uint64_t __57___SBDisplayConnectionDonationTimer_resetTimerOnConnect___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "stateChanged");
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
  }
  return result;
}

@end
