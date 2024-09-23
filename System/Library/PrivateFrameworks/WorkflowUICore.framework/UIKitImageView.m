@implementation UIKitImageView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_22707B8F4();
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithImage:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView *)sub_22707B900(a3);
}

- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  return (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView *)sub_22707B97C(a3, a4);
}

- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithFrame:(CGRect)a3
{
  return (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView *)sub_22707BA24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithCoder:(id)a3
{
  return (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView *)sub_22707BAA8(a3);
}

@end
