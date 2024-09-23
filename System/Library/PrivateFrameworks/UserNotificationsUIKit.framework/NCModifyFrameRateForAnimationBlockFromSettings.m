@implementation NCModifyFrameRateForAnimationBlockFromSettings

uint64_t __NCModifyFrameRateForAnimationBlockFromSettings_block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  LODWORD(a3) = *(_DWORD *)(a1 + 44);
  LODWORD(a4) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", *(unsigned int *)(a1 + 52), *(_QWORD *)(a1 + 32), a2, a3, a4);
}

@end
