@implementation SharedListening.InvitationActivityViewController.PreviewViewController

- (void)viewDidLoad
{
  _TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController *v2;

  v2 = self;
  sub_60CEB8();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_s32InvitationActivityViewControllerC21PreviewViewControllerCMa();
  v2 = (char *)v6.receiver;
  -[SharedListening.InvitationActivityViewController.PreviewViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController_stackView];
  v4 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

  }
  else
  {
    __break(1u);
  }
}

- (_TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController *v10;
  id v11;
  NSString v12;
  _TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = OBJC_IVAR____TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController_stackView;
  v9 = objc_allocWithZone((Class)UIStackView);
  v10 = self;
  v11 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, "init");

  if (v7)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)_s32InvitationActivityViewControllerC21PreviewViewControllerCMa();
  v13 = -[SharedListening.InvitationActivityViewController.PreviewViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v12, v11);

  return v13;
}

- (_TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController *v8;
  _TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController_stackView;
  v6 = objc_allocWithZone((Class)UIStackView);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  v11.receiver = v8;
  v11.super_class = (Class)_s32InvitationActivityViewControllerC21PreviewViewControllerCMa();
  v9 = -[SharedListening.InvitationActivityViewController.PreviewViewController initWithCoder:](&v11, "initWithCoder:", v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCE16MusicApplicationO9MusicCore15SharedListening32InvitationActivityViewControllerP33_4A44C4B9B3611FF8F7F2EB31B7C64A7B21PreviewViewController_stackView));
}

@end
