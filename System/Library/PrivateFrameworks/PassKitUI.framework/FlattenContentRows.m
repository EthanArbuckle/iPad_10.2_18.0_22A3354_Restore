@implementation FlattenContentRows

void __FlattenContentRows_block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __FlattenContentRows_block_invoke_2;
  v3[3] = &unk_1E3E675D0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);

}

uint64_t __FlattenContentRows_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
