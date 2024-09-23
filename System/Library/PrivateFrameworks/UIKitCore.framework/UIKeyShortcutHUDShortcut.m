@implementation UIKeyShortcutHUDShortcut

void __43___UIKeyShortcutHUDShortcut_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "setBaseShortcutForAlternate:", v4);
  objc_msgSend(v5, "setAlternateForBaseShortcut:", v6);

}

@end
