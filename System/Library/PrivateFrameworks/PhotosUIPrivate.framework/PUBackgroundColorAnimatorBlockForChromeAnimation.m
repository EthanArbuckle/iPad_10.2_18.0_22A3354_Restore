@implementation PUBackgroundColorAnimatorBlockForChromeAnimation

uint64_t __PUBackgroundColorAnimatorBlockForChromeAnimation_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, a2, a3, *(double *)(a1 + 32), 0.0);
}

uint64_t __PUBackgroundColorAnimatorBlockForChromeAnimation_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, a2, a3, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

uint64_t __PUBackgroundColorAnimatorBlockForChromeAnimation_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", *(_QWORD *)(a1 + 40), a2, a3, *(double *)(a1 + 32), 0.0);
}

@end
