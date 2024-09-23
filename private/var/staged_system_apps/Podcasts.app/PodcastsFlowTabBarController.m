@implementation PodcastsFlowTabBarController

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _TtC8Podcasts28PodcastsFlowTabBarController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  v5 = objc_msgSend(v3, "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)1)
    return 30;
  else
    return 2;
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC8Podcasts28PodcastsFlowTabBarController *v3;

  v3 = self;
  sub_100307080((uint64_t)v3, v2);

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType(self, a2);
  -[PodcastsFlowTabBarController viewDidLayoutSubviews](&v2, "viewDidLayoutSubviews");
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8Podcasts28PodcastsFlowTabBarController *v4;

  v4 = self;
  sub_10030713C(a3, (uint64_t)v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8Podcasts28PodcastsFlowTabBarController *v6;

  v5 = a3;
  v6 = self;
  sub_100307418(a3);

}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC8Podcasts28PodcastsFlowTabBarController_objectGraph]);
  sub_100007A28((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC8Podcasts28PodcastsFlowTabBarController_flowController], &qword_100554570);
  swift_unknownObjectRelease(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC8Podcasts28PodcastsFlowTabBarController_actionRunner]);
  swift_release(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC8Podcasts28PodcastsFlowTabBarController_presenter]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC8Podcasts28PodcastsFlowTabBarController_libraryStackCache]);
}

@end
