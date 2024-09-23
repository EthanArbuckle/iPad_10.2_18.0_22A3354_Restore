@implementation SBSRequestPasscodeCheckUI

void __SBSRequestPasscodeCheckUI_block_invoke(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  char v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __SBSRequestPasscodeCheckUI_block_invoke_2;
  v7 = &unk_1E288D800;
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], &v4);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v4, v5, v6, v7);

}

uint64_t __SBSRequestPasscodeCheckUI_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

@end
