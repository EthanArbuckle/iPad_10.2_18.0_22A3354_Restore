@implementation TransitSchedulesContext

- (id)desiredCards
{
  _TtC4Maps23TransitSchedulesContext *v2;
  void *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10001AD38();

  if (v3)
  {
    sub_100008B04((uint64_t *)&unk_101493290);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  void *v4;
  id v5;
  _TtC4Maps23TransitSchedulesContext *v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController);
  v5 = a3;
  v6 = self;
  objc_msgSend(v4, "setContaineeDelegate:", v6);
  objc_msgSend(v4, "setTransitSchedulesDelegate:", v6);

}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC4Maps23TransitSchedulesContext *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;

  v7 = swift_allocObject(&unk_10119C5E8, 32, 7);
  *(_QWORD *)(v7 + 16) = self;
  *(_QWORD *)(v7 + 24) = a3;
  v14[4] = sub_10001B08C;
  v15 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1001BB8D4;
  v14[3] = &unk_10119C600;
  v8 = _Block_copy(v14);
  v9 = v15;
  v10 = a3;
  v11 = self;
  v12 = v10;
  v13 = a4;
  swift_release(v9);
  objc_msgSend(v13, "addPreparation:", v8);
  _Block_release(v8);

}

- (id)routeAnnotationsProvider
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController));
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps23TransitSchedulesContext_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_chromeViewController, a3);
}

- (TransitSchedulesViewController)viewController
{
  return (TransitSchedulesViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController));
}

+ (BOOL)shouldDisplayScheduleFor:(id)a3 departureSequence:(id)a4
{
  return objc_msgSend((id)objc_opt_self(TransitSchedulesViewController), "shouldShowScheduleForTransitMapItem:sequence:", a3, a4);
}

- (_TtC4Maps23TransitSchedulesContext)initWithMapItem:(id)a3 departureSequence:(id)a4
{
  id v7;
  id v8;
  _TtC4Maps23TransitSchedulesContext *v9;
  objc_class *v10;
  _TtC4Maps23TransitSchedulesContext *v11;
  objc_super v13;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_chromeViewController, 0);
  v7 = objc_allocWithZone((Class)TransitSchedulesViewController);
  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = self;
  v10 = (objc_class *)objc_msgSend(v7, "initWithTransitMapItem:departureSequence:", v8, a4);
  *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController) = v10;

  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for TransitSchedulesContext();
  v11 = -[TransitSchedulesContext init](&v13, "init");

  swift_unknownObjectRelease(a4);
  return v11;
}

- (_TtC4Maps23TransitSchedulesContext)initWithRouteStep:(id)a3
{
  id v5;
  id v6;
  _TtC4Maps23TransitSchedulesContext *v7;
  objc_class *v8;
  _TtC4Maps23TransitSchedulesContext *v9;
  objc_super v11;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_chromeViewController, 0);
  v5 = objc_allocWithZone((Class)TransitSchedulesViewController);
  v6 = a3;
  v7 = self;
  v8 = (objc_class *)objc_msgSend(v5, "initWithTransitRouteStep:", v6);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController) = v8;

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for TransitSchedulesContext();
  v9 = -[TransitSchedulesContext init](&v11, "init");

  return v9;
}

- (_TtC4Maps23TransitSchedulesContext)initWithDepartureSequence:(id)a3 timeZone:(id)a4 scheduleWindowStartDate:(id)a5 includeAllDirections:(BOOL)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _TtC4Maps23TransitSchedulesContext *v22;
  uint64_t v24;

  v10 = sub_100008B04((uint64_t *)&unk_10149E140);
  __chkstk_darwin(v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100008B04((uint64_t *)&unk_10149E730);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static TimeZone._unconditionallyBridgeFromObjectiveC(_:)(a4, v14);
    v17 = type metadata accessor for TimeZone(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    v18 = type metadata accessor for TimeZone(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  if (a5)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v19 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v12, 0, 1, v19);
  }
  else
  {
    v20 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v12, 1, 1, v20);
  }
  v21 = swift_unknownObjectRetain(a3);
  v22 = (_TtC4Maps23TransitSchedulesContext *)sub_100074830(v21, (uint64_t)v16, (uint64_t)v12, a6);
  swift_unknownObjectRelease(a3);
  return v22;
}

- (_TtC4Maps23TransitSchedulesContext)init
{
  _TtC4Maps23TransitSchedulesContext *result;

  result = (_TtC4Maps23TransitSchedulesContext *)_swift_stdlib_reportUnimplementedInitializer("Maps.TransitSchedulesContext", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_chromeViewController);

}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  void *v4;
  id v7;
  _TtC4Maps23TransitSchedulesContext *v8;
  id v9;
  _TtC4Maps23TransitSchedulesContext *v10;
  _TtC4Maps23TransitSchedulesContext *Strong;
  _TtC4Maps23TransitSchedulesContext *v12;
  _OWORD v13[2];

  v4 = a3;
  if (a4)
  {
    v7 = a3;
    v8 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v13);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v9 = a3;
    v10 = self;
  }
  Strong = (_TtC4Maps23TransitSchedulesContext *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps23TransitSchedulesContext_chromeViewController);
  if (Strong)
  {
    v12 = Strong;
    if (-[TransitSchedulesContext isTopContext:](Strong, "isTopContext:", self))
      -[TransitSchedulesContext popContext:animated:completion:](v12, "popContext:animated:completion:", self, 1, 0);

    v4 = self;
  }
  else
  {
    v12 = self;
  }

  sub_10000C180((uint64_t)v13);
}

- (void)transitSchedulesViewController:(id)a3 wantsToShowInfoForLine:(id)a4
{
  id v6;
  _TtC4Maps23TransitSchedulesContext *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1001767AC((uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (void)transitSchedulesViewControllerWantsToUpdateRouteAnnotations:(id)a3
{
  uint64_t Strong;
  id v6;
  _TtC4Maps23TransitSchedulesContext *v7;
  id v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_chromeViewController);
  if (Strong)
  {
    v8 = (id)Strong;
    v6 = a3;
    v7 = self;
    objc_msgSend(v8, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

  }
}

- (id)routeAnnotationsControllerFor:(id)a3
{
  return sub_1001764D8((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_routeAnnotationsController);
}

- (id)mapCameraControllerForTransitSchedulesViewController:(id)a3
{
  return sub_1001764D8((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_mapCameraController);
}

- (void)transitSchedulesViewController:(id)a3 wantsToDoDirectionItem:(id)a4 withUserInfo:(id)a5
{
  uint64_t v8;
  id v9;
  _TtC4Maps23TransitSchedulesContext *v10;
  id v11;
  void *v12;
  id v13;
  Class isa;
  id v15;

  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v9 = a3;
  v15 = a4;
  v10 = self;
  v11 = -[TransitSchedulesContext iosBasedChromeViewController](v10, "iosBasedChromeViewController");
  if (v11
    && (v12 = v11, v13 = objc_msgSend(v11, "appCoordinator"), v12, v13))
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v13, "enterRoutePlanningWithDirectionItem:withUserInfo:", v15, isa);

    swift_bridgeObjectRelease(v8);
  }
  else
  {

    swift_bridgeObjectRelease(v8);
  }

}

- (void)transitSchedulesViewController:(id)a3 wantsToOpenURL:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Maps23TransitSchedulesContext *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSURL *v17;
  _TtC4Maps23TransitSchedulesContext *v18;
  _TtC4Maps23TransitSchedulesContext *v19;
  uint64_t v20;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = -[TransitSchedulesContext iosBasedChromeViewController](v12, "iosBasedChromeViewController");
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, "_currentContainerViewController");

    if (v15)
    {
      v16 = objc_msgSend(objc_allocWithZone((Class)MapsWebLinkPresenter), "initWithPresentingViewController:", v15);
      URL._bridgeToObjectiveC()(v17);
      v19 = v18;
      objc_msgSend(v16, "presentWebURL:", v18);

      v11 = v16;
      v12 = v19;
    }
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
