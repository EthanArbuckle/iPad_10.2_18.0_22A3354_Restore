@implementation NoticePresenter.PassthroughWindow

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)_canUpdateSceneFocus
{
  return 0;
}

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_100339C78((uint64_t)a4, x, y);

  return v10;
}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow_canReceiveTouches) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoticePresenter.PassthroughWindow();
  return -[NoticePresenter.PassthroughWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3);
}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow_canReceiveTouches) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NoticePresenter.PassthroughWindow();
  return -[NoticePresenter.PassthroughWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow_canReceiveTouches) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoticePresenter.PassthroughWindow();
  return -[NoticePresenter.PassthroughWindow initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow_canReceiveTouches) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NoticePresenter.PassthroughWindow();
  return -[NoticePresenter.PassthroughWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end
