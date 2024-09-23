@implementation PFLGeneratePhotosFaceWithOptions

void __PFLGeneratePhotosFaceWithOptions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = 0;
  v7 = v5;
  if (a2 && !v5)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
