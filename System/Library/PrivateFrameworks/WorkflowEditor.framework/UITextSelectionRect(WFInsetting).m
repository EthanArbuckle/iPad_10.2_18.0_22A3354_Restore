@implementation UITextSelectionRect(WFInsetting)

- (WFInsetTextSelectionRect)wf_selectionRectByInsetting:()WFInsetting
{
  return -[WFInsetTextSelectionRect initWithSelectionRect:insets:]([WFInsetTextSelectionRect alloc], "initWithSelectionRect:insets:", a1, a2, a3, a4, a5);
}

@end
