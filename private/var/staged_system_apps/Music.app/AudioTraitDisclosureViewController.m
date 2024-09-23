@implementation AudioTraitDisclosureViewController

- (_TtC5Music34AudioTraitDisclosureViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC5Music34AudioTraitDisclosureViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Music34AudioTraitDisclosureViewController_dismissHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC5Music34AudioTraitDisclosureViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/AudioTraitDisclosureViewController.swift", 46, 2, 44, 0);
  __break(1u);
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(__n128);
  uint64_t v6;
  __n128 v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = (char *)v8.receiver;
  -[AudioTraitDisclosureViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
  v5 = *(void (**)(__n128))&v4[OBJC_IVAR____TtC5Music34AudioTraitDisclosureViewController_dismissHandler];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC5Music34AudioTraitDisclosureViewController_dismissHandler + 8];
    v7 = swift_retain();
    v5(v7);
    sub_10004BA30((uint64_t)v5, v6);
  }

}

- (_TtC5Music34AudioTraitDisclosureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music34AudioTraitDisclosureViewController *result;

  v4 = a4;
  result = (_TtC5Music34AudioTraitDisclosureViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.AudioTraitDisclosureViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Music34AudioTraitDisclosureViewController_dismissHandler), *(_QWORD *)&self->dismissHandler[OBJC_IVAR____TtC5Music34AudioTraitDisclosureViewController_dismissHandler]);
}

@end
