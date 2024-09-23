@implementation CALayer(TextEffectsLayerOrdering)

- (uint64_t)compareTextEffectsOrdering:()TextEffectsLayerOrdering
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compareTextEffectsOrdering:", v6);
  return v7;
}

@end
