@implementation ICMiniPlayerViewController

- (ICAttachment)attachment
{
  return (ICAttachment *)sub_1AC9EA30C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICMiniPlayerViewController_attachment);
}

- (void)setAttachment:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  ICMiniPlayerViewController *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_attachment);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_1AC9EA4FC(v6);

}

- (void)loadView
{
  ICMiniPlayerViewController *v2;

  v2 = self;
  sub_1AC9EABF8();

}

- (void)viewDidLayoutSubviews
{
  ICMiniPlayerViewController *v2;

  v2 = self;
  sub_1AC9EB7C4();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (NSString)accessibilityIdentifierForPlayerView
{
  return (NSString *)(id)sub_1ACA42090();
}

- (void)swipe:(id)a3
{
  id v4;
  BOOL v5;
  char v6;
  ICMiniPlayerViewController *v7;

  v4 = a3;
  v7 = self;
  v5 = objc_msgSend(v4, sel_direction) == (id)2;
  v6 = *((_BYTE *)&v7->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_showCloseButton);
  *((_BYTE *)&v7->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_showCloseButton) = v5;
  sub_1AC9EBCB8(v6);

}

- (void)close:(id)a3
{
  ICMiniPlayerViewController *v4;
  ICMiniPlayerViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1ACA4299C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AC9EC15C();

  sub_1AC7C3AB0((uint64_t)v6, &qword_1ED6E9150);
}

- (void)hideCloseButton:(id)a3
{
  char v4;
  id v5;
  ICMiniPlayerViewController *v6;

  v4 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_showCloseButton);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_showCloseButton) = 0;
  v5 = a3;
  v6 = self;
  sub_1AC9EBCB8(v4);

}

- (ICMiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1ACA420C0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (ICMiniPlayerViewController *)MiniPlayerViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (ICMiniPlayerViewController)initWithCoder:(id)a3
{
  return (ICMiniPlayerViewController *)MiniPlayerViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1AC8C5C14(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_closeHandler));

}

@end
