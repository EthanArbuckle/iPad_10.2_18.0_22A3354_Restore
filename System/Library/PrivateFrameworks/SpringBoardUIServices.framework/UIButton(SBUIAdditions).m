@implementation UIButton(SBUIAdditions)

- (void)sbui_removePointerInteraction
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "interactions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", &__block_literal_global_20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v3, "removeObjectsAtIndexes:", v2);
    objc_msgSend(a1, "setInteractions:", v3);

  }
}

@end
