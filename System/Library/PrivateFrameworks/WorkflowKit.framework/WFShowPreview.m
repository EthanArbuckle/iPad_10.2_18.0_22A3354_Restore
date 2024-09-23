@implementation WFShowPreview

void __WFShowPreview_block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

@end
