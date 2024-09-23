@implementation VCVoiceShortcutsFromWorkflows

void __VCVoiceShortcutsFromWorkflows_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __VCVoiceShortcutsFromWorkflows_block_invoke_2;
  v9[3] = &unk_1E7AA73F8;
  v10 = v6;
  v8 = v6;
  VCVoiceShortcutFromWorkflow(a2, v7, a1, 0, v9);

}

uint64_t __VCVoiceShortcutsFromWorkflows_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
