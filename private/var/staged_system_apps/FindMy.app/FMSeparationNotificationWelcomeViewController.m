@implementation FMSeparationNotificationWelcomeViewController

- (_TtC6FindMy45FMSeparationNotificationWelcomeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100292054();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMSeparationNotificationWelcomeViewController(0);
  v4 = v8.receiver;
  -[FMSeparationNotificationWelcomeViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "parentViewController", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_opt_self(UIPageViewController);
    if (swift_dynamicCastObjCClass(v6, v7))
      sub_10010D39C();

  }
  else
  {
    v6 = v4;
  }

}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy45FMSeparationNotificationWelcomeViewController *v2;

  v2 = self;
  sub_10028DD28();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMSeparationNotificationWelcomeViewController(0);
  v4 = v7.receiver;
  -[FMSeparationNotificationWelcomeViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  v5 = objc_msgSend(v4, "navigationItem", v7.receiver, v7.super_class);
  v6 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v4, "cancelAction");
  objc_msgSend(v5, "setLeftBarButtonItem:", v6);

}

- (void)secondaryAction
{
  char *v2;
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  _TtC6FindMy45FMSeparationNotificationWelcomeViewController *v8;
  _TtC6FindMy45FMSeparationNotificationWelcomeViewController *v9;

  v2 = (char *)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = *((_QWORD *)v2 + 1);
    ObjectType = swift_getObjectType(Strong);
    v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v8 = self;
    v7(ObjectType, v5);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    v9 = self;
  }
  -[FMSeparationNotificationWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)cancelAction
{
  -[FMSeparationNotificationWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC6FindMy45FMSeparationNotificationWelcomeViewController *v7;

  v3 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollHandler];
    v6 = a3;
    v7 = self;
    sub_1000A190C((uint64_t)v3, v5);
    v3(v6);
    sub_1000327F0((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollHandler), *(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollHandler]);
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_informativeImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_heightConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_beaconUUIDs));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_singleItem, (uint64_t *)&unk_1005D3AA0);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_singleDevice, &qword_1005D6710);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_safeLocationSuggestion, (uint64_t *)&unk_1005E2270);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_separationTime]);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_separationLocation, &qword_1005DDFA0);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy45FMSeparationNotificationWelcomeViewController_mapSnapshotter));
}

@end
