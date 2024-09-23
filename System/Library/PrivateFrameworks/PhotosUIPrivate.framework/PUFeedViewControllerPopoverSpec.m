@implementation PUFeedViewControllerPopoverSpec

- (BOOL)shouldUseFullscreenLayout
{
  return 0;
}

- (void)configureSeparatorMetrics:(PUFeedSeparatorMetrics *)a3 betweenSectionWithInfo:(id)a4 andSectionWithInfo:(id)a5 joined:(BOOL)a6 collectionViewType:(int64_t)a7
{
  __int128 v7;

  v7 = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)&a3->var1.bottom = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  a3->var0 = (CGSize)*MEMORY[0x1E0C9D820];
  *(_OWORD *)&a3->var1.top = v7;
}

@end
