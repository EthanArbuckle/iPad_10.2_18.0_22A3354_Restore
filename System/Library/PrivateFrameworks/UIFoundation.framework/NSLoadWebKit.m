@implementation NSLoadWebKit

uint64_t ____NSLoadWebKit_block_invoke()
{
  return softLink_UIApplicationLoadWebKit[0]();
}

void ____NSLoadWebKit_block_invoke_2(uint64_t a1)
{
  int v2;
  void (**v3)(_QWORD);

  v2 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = *(void (***)(_QWORD))(a1 + 32);
  if (v2)
    v3[2](*(_QWORD *)(a1 + 32));
  else
    dispatch_sync(MEMORY[0x1E0C80D38], v3);
}

@end
