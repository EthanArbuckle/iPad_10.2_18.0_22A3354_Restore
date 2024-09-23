@implementation SFCurrentAppIconData

void __SFCurrentAppIconData_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  SFDataFromCGImage((void *)objc_msgSend(*(id *)(a1 + 32), "CGImage"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __SFCurrentAppIconData_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    SFDataFromCGImage((void *)objc_msgSend(a2, "CGImage"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __SFCurrentAppIconData_block_invoke_3;
  v6[3] = &unk_1E482E0F0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __SFCurrentAppIconData_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
