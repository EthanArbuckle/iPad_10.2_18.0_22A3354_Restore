@implementation UIGestureEnvironmentSubgraphForGestureRecognizer

uint64_t ___UIGestureEnvironmentSubgraphForGestureRecognizer_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "propertyForKey:", CFSTR("gestureRecognizerNode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

@end
