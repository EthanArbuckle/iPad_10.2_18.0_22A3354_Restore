@implementation ALGetPhotosAndVideosCount

void __ALGetPhotosAndVideosCount_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (a4)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 32), 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v7, v6);

  }
}

@end
