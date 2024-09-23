@implementation RCPointerInteractionButton

- (RCPointerInteractionButton)initWithFrame:(CGRect)a3
{
  RCPointerInteractionButton *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCPointerInteractionButton;
  v3 = -[RCPointerInteractionButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    -[RCPointerInteractionButton setPointerInteractionEnabled:](v3, "setPointerInteractionEnabled:", objc_msgSend(v4, "supportsPointerInteractions"));
    -[RCPointerInteractionButton setShowsLargeContentViewer:](v3, "setShowsLargeContentViewer:", 1);

  }
  return v3;
}

@end
