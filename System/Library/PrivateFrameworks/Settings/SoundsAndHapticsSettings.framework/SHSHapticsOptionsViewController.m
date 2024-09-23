@implementation SHSHapticsOptionsViewController

- (void)viewDidLoad
{
  _TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController *v2;

  v2 = self;
  sub_228D2E75C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController *v4;

  v4 = self;
  sub_228D2E924(a3);

}

- (_TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_228D31FC4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController *)sub_228D2EDDC(v5, v7, a4);
}

- (_TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController)initWithCoder:(id)a3
{
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_selectedOption) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SHSHapticsOptionsViewController();
  return -[SHSHapticsOptionsViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_228D2E4A4((uint64_t)self + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_delegate);
  swift_release();
}

@end
