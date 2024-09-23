@implementation SiriSceneViewController

- (_TtC15SiriInteractive23SiriSceneViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_246463914();
}

- (void)viewDidLoad
{
  _TtC15SiriInteractive23SiriSceneViewController *v2;

  v2 = self;
  SiriSceneViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC15SiriInteractive23SiriSceneViewController *v2;

  v2 = self;
  SiriSceneViewController.viewDidLayoutSubviews()();

}

- (_TtC15SiriInteractive23SiriSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_2464823EC();
  v5 = a4;
  SiriSceneViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end
