@implementation FMSettingsUpdateViewController

- (_TtC6FindMy30FMSettingsUpdateViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002D788C();
}

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMSettingsUpdateViewController();
  v2 = v6.receiver;
  v3 = -[FMSettingsUpdateViewController viewDidLoad](&v6, "viewDidLoad");
  (*(void (**)(id))((swift_isaMask & *v2) + 0xF8))(v3);
  sub_1002D6C84();
  (*(void (**)(uint64_t, uint64_t))((swift_isaMask & *v2) + 0x108))(v4, v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMSettingsUpdateViewController();
  v4 = v6.receiver;
  v5 = -[FMSettingsUpdateViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
  (*(void (**)(id))((swift_isaMask & *v4) + 0x110))(v5);

}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy30FMSettingsUpdateViewController *v2;

  v2 = self;
  sub_1002D7558();

}

- (void)backAction
{
  void *v3;
  _TtC6FindMy30FMSettingsUpdateViewController *v4;
  _QWORD v5[6];

  v5[4] = State.rawValue.getter;
  v5[5] = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_100037DF8;
  v5[3] = &unk_100557848;
  v3 = _Block_copy(v5);
  v4 = self;
  -[FMSettingsUpdateViewController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 1, v3);
  _Block_release(v3);

}

- (UIButton)accessibilityButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_button));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_heightConstraint));
}

@end
