@implementation UIView

uint64_t __50__UIView_PGAdditions__PG_performWithoutAnimation___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __61__UIView_PGAdditions__PG_performWithoutRetargetingAnimation___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __85__UIView_PGAdditions__PG_animateUsingDefaultTimingWithOptions_animations_completion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v2 = (void *)MEMORY[0x1E0CD28B0];
  objc_msgSend(*(id *)(a1 + 40), "_currentAnimationDuration");
  objc_msgSend(v2, "setAnimationDuration:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __105__UIView_PGAdditions__PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity_animations_completion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v2 = (void *)MEMORY[0x1E0CD28B0];
  objc_msgSend(*(id *)(a1 + 40), "_currentAnimationDuration");
  objc_msgSend(v2, "setAnimationDuration:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

@end
