@implementation AccessSuppressionSetForMutation

void ___AccessSuppressionSetForMutation_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.passkit.passview", 0);
  v1 = (void *)qword_1EE4C8460;
  qword_1EE4C8460 = (uint64_t)v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithCapacity:", 2);
  v3 = (void *)qword_1EE4C8468;
  qword_1EE4C8468 = v2;

}

void ___AccessSuppressionSetForMutation_block_invoke_2(uint64_t a1)
{
  id v1;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (id)objc_msgSend((id)qword_1EE4C8468, "copy");
  SBSSetAlertSuppressionContexts();

}

@end
