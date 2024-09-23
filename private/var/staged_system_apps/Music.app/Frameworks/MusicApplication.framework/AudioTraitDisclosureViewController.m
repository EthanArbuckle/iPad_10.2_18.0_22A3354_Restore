@implementation AudioTraitDisclosureViewController

- (_TtC16MusicApplication34AudioTraitDisclosureViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplication34AudioTraitDisclosureViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication34AudioTraitDisclosureViewController_dismissHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC16MusicApplication34AudioTraitDisclosureViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/AudioTraitDisclosureViewController.swift", 57, 2, 44, 0);
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
  v5 = *(void (**)(__n128))&v4[OBJC_IVAR____TtC16MusicApplication34AudioTraitDisclosureViewController_dismissHandler];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplication34AudioTraitDisclosureViewController_dismissHandler + 8];
    v7 = swift_retain(v6);
    v5(v7);
    sub_5C198((uint64_t)v5, v6);
  }

}

- (_TtC16MusicApplication34AudioTraitDisclosureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication34AudioTraitDisclosureViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication34AudioTraitDisclosureViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.AudioTraitDisclosureViewController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication34AudioTraitDisclosureViewController_dismissHandler), *(_QWORD *)&self->dismissHandler[OBJC_IVAR____TtC16MusicApplication34AudioTraitDisclosureViewController_dismissHandler]);
}

@end
