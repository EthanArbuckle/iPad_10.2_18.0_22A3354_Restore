@implementation SessionAudioPlayerViewController

- (NSArray)keyCommands
{
  return (NSArray *)0;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI32SessionAudioPlayerViewController *v2;

  v2 = self;
  sub_22B3ABF34();

}

- (_TtC9SeymourUI32SessionAudioPlayerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B3ACC18();
}

- (void)updateViewConstraints
{
  sub_22B3AC548(self, (uint64_t)a2, (SEL *)&selRef_updateViewConstraints);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SessionAudioPlayerViewController();
  v4 = v9.receiver;
  v5 = a3;
  -[SessionAudioPlayerViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v5);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v4, sel_traitCollection, v9.receiver, v9.super_class);
    sub_22B0F1718(0, &qword_255B937A0);
    v8 = sub_22BA80FAC();

    if ((v8 & 1) == 0)
      sub_22B3AC2BC();

    v4 = v6;
  }
  else
  {
    sub_22B3AC2BC();
  }

}

- (void)viewSafeAreaInsetsDidChange
{
  sub_22B3AC548(self, (uint64_t)a2, (SEL *)&selRef_viewSafeAreaInsetsDidChange);
}

- (_TtC9SeymourUI32SessionAudioPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI32SessionAudioPlayerViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI32SessionAudioPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_delegate);
  objc_release(*(id *)((char *)&self->super._toolbarItems
                     + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_currentLayoutEnvironment));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_contentOverlayView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_settingsPopoverSourceView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_playerView));
}

@end
