@implementation PCSIdentitySetCreateManatee

void __PCSIdentitySetCreateManatee_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v11)
    v9 = (const void *)PCSIdentityCreateFromPersistentReference(v11, *(void **)(a1 + 32));
  else
    v9 = 0;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v9)
    CFRelease(v9);

}

uint64_t __PCSIdentitySetCreateManatee_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
