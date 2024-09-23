@implementation SBHIconDragItemWithIconAndIconView

uint64_t __SBHIconDragItemWithIconAndIconView_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D50];
  v3 = a2;
  objc_msgSend(v2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

  return 0;
}

@end
