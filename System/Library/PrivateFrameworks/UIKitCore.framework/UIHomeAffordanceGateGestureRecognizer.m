@implementation UIHomeAffordanceGateGestureRecognizer

void __69___UIHomeAffordanceGateGestureRecognizer_tapRecognizerRecognizedTap___block_invoke(uint64_t a1)
{
  id WeakRetained;
  unint64_t v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = kGateTimeout_block_invoke___s_category;
  if (!kGateTimeout_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("HomeAffordanceGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&kGateTimeout_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 134217984;
    v5 = WeakRetained;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "<%p> Home affordance gate timed out.", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(WeakRetained, "setState:", 5);

}

@end
