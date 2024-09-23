@implementation SFAppleIDParseValidationRecordData

void __SFAppleIDParseValidationRecordData_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);

  v4 = *(void **)(a1 + 32);
  v6 = (void (**)(id, void *, _QWORD))*(id *)(a1 + 40);
  handleValidationRecordTrustResultSync(v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2](v6, v5, 0);

}

uint64_t __SFAppleIDParseValidationRecordData_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

@end
