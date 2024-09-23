@implementation SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController

- (NSArray)keyCommands
{
  return (NSArray *)0;
}

- (_TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_22BA8067C();
    v6 = a4;
    v7 = (void *)sub_22BA8064C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController();
  v9 = -[SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController();
  return -[SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtCC9SeymourUI32SessionVideoPlayerViewControllerP33_B8375A4CE4C4E315AD41C55B9F4AE73534NoKeyCommandAVPlayerViewController)initWithPlayerLayerView:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController();
  return -[SessionVideoPlayerViewController.NoKeyCommandAVPlayerViewController initWithPlayerLayerView:](&v5, sel_initWithPlayerLayerView_, a3);
}

@end
