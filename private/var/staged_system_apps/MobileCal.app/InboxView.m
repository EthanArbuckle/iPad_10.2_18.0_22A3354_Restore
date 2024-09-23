@implementation InboxView

- (InboxView)initWithFrame:(CGRect)a3
{
  InboxView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)InboxView;
  v3 = -[InboxView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[InboxView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

@end
