@implementation UIAccessibilityWindowForContextId

void __UIAccessibilityWindowForContextId_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
