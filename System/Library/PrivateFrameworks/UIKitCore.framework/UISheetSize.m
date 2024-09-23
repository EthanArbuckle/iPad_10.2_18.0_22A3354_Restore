@implementation UISheetSize

void ___UISheetSize_block_invoke()
{
  _UISheetLayoutInfo *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  UIViewController *v4;

  v0 = [_UISheetLayoutInfo alloc];
  _UIFallbackSheetMetrics();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[_UISheetLayoutInfo initWithMetrics:](v0, "initWithMetrics:", v1);
  v3 = (void *)qword_1ECD7D400;
  qword_1ECD7D400 = v2;

  v4 = objc_alloc_init(UIViewController);
  objc_msgSend((id)qword_1ECD7D400, "_setPresentedViewController:", v4);

}

@end
