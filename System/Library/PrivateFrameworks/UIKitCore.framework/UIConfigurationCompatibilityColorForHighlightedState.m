@implementation UIConfigurationCompatibilityColorForHighlightedState

id ___UIConfigurationCompatibilityColorForHighlightedState_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
