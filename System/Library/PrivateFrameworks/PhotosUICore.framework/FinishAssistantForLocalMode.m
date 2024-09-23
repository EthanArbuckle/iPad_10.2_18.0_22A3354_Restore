@implementation FinishAssistantForLocalMode

void ___FinishAssistantForLocalMode_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setTitle:", CFSTR("Created Local Shared Library"));
  objc_msgSend(v3, "setMessage:", CFSTR("This Shared Library is “local only” and doesn’t sync with iCloud. The “local only” mode supports development and testing workflows."));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___FinishAssistantForLocalMode_block_invoke_2;
  v4[3] = &unk_1E5148A40;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("OK"), 0, v4);

}

uint64_t ___FinishAssistantForLocalMode_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
