@implementation SessionVideoPlayerViewController

- (NSArray)keyCommands
{
  return (NSArray *)0;
}

- (NSArray)preferredFocusEnvironments
{
  _TtC9SeymourUI32SessionVideoPlayerViewController *v2;
  void *v3;

  v2 = self;
  sub_22B85E774();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v3 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC9SeymourUI32SessionVideoPlayerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B861668();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI32SessionVideoPlayerViewController *v2;

  v2 = self;
  sub_22B85EF50();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController();
  v4 = (char *)v8.receiver;
  -[SessionVideoPlayerViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_presenter];
  if (MEMORY[0x22E2F3FFC](v5 + 16))
  {
    v6 = *(_QWORD *)(v5 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v6 + 200))(ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController();
  v4 = (char *)v8.receiver;
  -[SessionVideoPlayerViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_presenter];
  if (MEMORY[0x22E2F3FFC](v5 + 16))
  {
    v6 = *(_QWORD *)(v5 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v6 + 208))(ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController();
  v2 = v3.receiver;
  -[SessionVideoPlayerViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  sub_22B85F36C();

}

- (_TtC9SeymourUI32SessionVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI32SessionVideoPlayerViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI32SessionVideoPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_airplayAndSettingsControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_settingsControlItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_gymKitResumeMachineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_settingsPopoverSourceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_playbackViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_videoBoundsObserver));
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController__requiresLinearPlayback;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BA1020);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)didTapMediaPlayerViewWithTapGestureRecognizer:(id)a3
{
  id v4;
  _TtC9SeymourUI32SessionVideoPlayerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22B1D4AD0();

}

@end
