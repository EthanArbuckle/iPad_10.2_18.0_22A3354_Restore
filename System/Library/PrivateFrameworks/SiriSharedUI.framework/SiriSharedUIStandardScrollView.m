@implementation SiriSharedUIStandardScrollView

- (SiriSharedUIStandardScrollView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUIStandardScrollView;
  return -[SiriSharedUIStandardScrollView init](&v3, sel_init);
}

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[SiriSharedUIStandardScrollView contentInsetAdjustmentBehavior](self, "contentInsetAdjustmentBehavior") == 2)
  {
    v3 = *MEMORY[0x1E0DC49E8];
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SiriSharedUIStandardScrollView;
    -[SiriSharedUIStandardScrollView safeAreaInsets](&v7, sel_safeAreaInsets);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)isSemanticContentAttributeRightToLeft
{
  return -[SiriSharedUIStandardScrollView semanticContentAttribute](self, "semanticContentAttribute") == 4;
}

@end
