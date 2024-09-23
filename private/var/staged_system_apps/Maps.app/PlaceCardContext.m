@implementation PlaceCardContext

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v7;
  _TtC4Maps16PlaceCardContext *v8;
  id v9;
  _TtC4Maps16PlaceCardContext *v10;
  _OWORD v11[2];

  if (a4)
  {
    v7 = a3;
    v8 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v11);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v9 = a3;
    v10 = self;
  }
  sub_10001B7B4();

  sub_10000C180((uint64_t)v11);
}

- (id)desiredCards
{
  _TtC4Maps16PlaceCardContext *v2;
  void *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10003D164();

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

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (BOOL)supportsDuplicationInStack
{
  return 0;
}

- (id)personalizedItemSources
{
  _TtC4Maps16PlaceCardContext *v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = self;
  sub_10003D2EC();
  v4 = v3;

  sub_10000E4BC(0, qword_101494578, off_101197E28);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  id v4;
  _TtC4Maps16PlaceCardContext *v5;

  v4 = a3;
  v5 = self;
  sub_10003D95C();

}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps16PlaceCardContext *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _TtC4Maps16PlaceCardContext *v13;
  _QWORD v14[5];
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v7, "isAnimated");
  v10 = swift_allocObject(&unk_10119D568, 25, 7);
  *(_QWORD *)(v10 + 16) = v8;
  *(_BYTE *)(v10 + 24) = v9;
  v14[4] = sub_10003D934;
  v15 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1001BB8D4;
  v14[3] = &unk_10119D580;
  v11 = _Block_copy(v14);
  v12 = v15;
  v13 = v8;
  swift_release(v12);
  objc_msgSend(v7, "addAnimations:", v11);
  _Block_release(v11);

}

- (void)leaveStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps16PlaceCardContext *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10003D64C(v6, v7);

}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC4Maps16PlaceCardContext *v13;
  uint64_t v14;

  v7 = sub_100008B04((uint64_t *)&unk_101499B30);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = a3;
  v13 = self;
  sub_1000D61EC((uint64_t)v9);

  sub_100010CC4((uint64_t)v9, (uint64_t *)&unk_101499B30);
}

- (void)placeCardViewController:(id)a3 placeCardItemWillChange:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps16PlaceCardContext *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000D6334(a4);

}

- (void)placeCardViewController:(id)a3 mapItemDidChange:(id)a4
{
  _TtC4Maps16PlaceCardContext *v6;
  _TtC4Maps16PlaceCardContext *v7;
  id v8;
  void *v9;
  _TtC4Maps16PlaceCardContext *v10;
  _TtC4Maps16PlaceCardContext *v11;
  id v12;

  v6 = self;
  v12 = a3;
  v7 = (_TtC4Maps16PlaceCardContext *)a4;
  v8 = -[PlaceCardContext iosBasedChromeViewController](v6, "iosBasedChromeViewController");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 1);

  }
  v10 = (_TtC4Maps16PlaceCardContext *)-[PlaceCardContext iosChromeViewController](v6, "iosChromeViewController");
  if (v10)
  {
    v11 = v10;
    -[PlaceCardContext updateComponentsIfNeeded](v10, "updateComponentsIfNeeded");

    v7 = v6;
    v6 = v11;
  }

}

- (void)placeCardViewController:(id)a3 selectTransitLineItem:(id)a4
{
  id v6;
  _TtC4Maps16PlaceCardContext *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1000D6578((uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (void)placeCardViewController:(id)a3 showTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  id v8;
  id v9;
  _TtC4Maps16PlaceCardContext *v10;
  id v11;
  id v12;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  v11 = -[PlaceCardContext iosBasedChromeViewController](v10, "iosBasedChromeViewController");
  v12 = objc_msgSend(v11, "appCoordinator");

  objc_msgSend(v12, "displayTransitSchedulesForMapItem:departureSequence:", v9, a5);
  swift_unknownObjectRelease(a5);

}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  if (!a4)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (!a5)
  {
LABEL_5:
    __break(1u);
    return (char)self;
  }
  LOBYTE(self) = objc_msgSend((id)objc_opt_self(TransitSchedulesViewController), "shouldShowScheduleForTransitMapItem:sequence:", a4, a5);
  return (char)self;
}

- (void)placeCardViewController:(id)a3 editNameOfMapItem:(id)a4 saveHandler:(id)a5 cancelHandler:(id)a6
{
  uint64_t (*v10)();
  void *v11;
  uint64_t v12;
  id v13;
  _TtC4Maps16PlaceCardContext *v14;
  id v15;

  v10 = (uint64_t (*)())_Block_copy(a5);
  v11 = _Block_copy(a6);
  if (v10)
  {
    v12 = swift_allocObject(&unk_1011A21A8, 24, 7);
    *(_QWORD *)(v12 + 16) = v10;
    v10 = sub_1000D6A90;
  }
  else
  {
    v12 = 0;
  }
  v13 = a3;
  v15 = a4;
  v14 = self;
  if (v11)
    _Block_release(v11);
  sub_10000BF74((uint64_t)v10, v12);

}

- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
  id v7;
  unint64_t v8;
  void *v9;

  v7 = a4;
  if (a4)
  {
    v8 = sub_1000D6A00();
    v7 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);
  }
  if (a5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v9;
  }
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(a5);
}

- (void)placeCardViewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  if (v5)
    _Block_release(v5);
}

- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4
{
  id v7;
  _TtC4Maps16PlaceCardContext *v8;
  id v9;
  _TtC4Maps16PlaceCardContext *v10;
  _OWORD v11[2];

  if (a4)
  {
    v7 = a3;
    v8 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v11);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v9 = a3;
    v10 = self;
  }
  sub_1000D6694((uint64_t)v11);

  sub_100010CC4((uint64_t)v11, (uint64_t *)&unk_101493350);
}

- (void)placeCardViewController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 libraryAccessProvider:(id)a5 placeMUID:(unint64_t)a6 completion:(id)a7
{
  void (*v12)(uint64_t, void *);
  void (*v13)(uint64_t, void *);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _TtC4Maps16PlaceCardContext *v18;

  v12 = (void (*)(uint64_t, void *))_Block_copy(a7);
  v13 = v12;
  if (!a4)
  {
    v14 = 0;
    if (v12)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v15;
  if (!v13)
    goto LABEL_5;
LABEL_3:
  v16 = swift_allocObject(&unk_1011A2130, 24, 7);
  *(_QWORD *)(v16 + 16) = v13;
  v13 = sub_1000D696C;
LABEL_6:
  v17 = a3;
  swift_unknownObjectRetain(a5);
  v18 = self;
  sub_1000D67CC(v14, (unint64_t)a4, a6, (uint64_t)v13, v16);
  sub_10000BF74((uint64_t)v13, v16);

  swift_unknownObjectRelease(a5);
  swift_bridgeObjectRelease(a4);
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  id v4;
  _TtC4Maps16PlaceCardContext *v5;

  v4 = a3;
  v5 = self;
  sub_10011DAB8((uint64_t)v4);

  return 1;
}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  _TtC4Maps16PlaceCardContext *v5;
  char v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_10011DBF0(a3);
  swift_unknownObjectRelease(a3);

  return v6 & 1;
}

- (BOOL)chromeDidSelectUserLocationAnnotation:(id)a3
{
  id v4;
  _TtC4Maps16PlaceCardContext *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10011DE28(v4);

  return self & 1;
}

- (BOOL)chromeDidClearMapSelection
{
  uint64_t Strong;
  void *v4;
  _TtC4Maps16PlaceCardContext *v5;
  unsigned int v6;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Maps16PlaceCardContext_chromeViewController);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    v6 = objc_msgSend(v4, "isTopContext:", v5);
    if (v6)
      objc_msgSend(v4, "popContext:animated:completion:", v5, 1, 0);

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (_TtC4Maps29PlaceCardContextConfiguration)configuration
{
  return (_TtC4Maps29PlaceCardContextConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC4Maps16PlaceCardContext_configuration));
}

- (void)setConfiguration:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_configuration);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_configuration) = (Class)a3;
  v3 = a3;

}

- (GEOMapServiceTraits)newTraits
{
  return (GEOMapServiceTraits *)objc_retain(*(id *)((char *)&self->super.isa
                                                  + OBJC_IVAR____TtC4Maps16PlaceCardContext_newTraits));
}

- (void)setNewTraits:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_newTraits);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_newTraits) = (Class)a3;
  v3 = a3;

}

- (int64_t)displayedViewMode
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_displayedViewMode);
}

- (void)setDisplayedViewMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_displayedViewMode) = (Class)a3;
}

- (PlaceCardViewController)placeViewController
{
  return (PlaceCardViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR____TtC4Maps16PlaceCardContext_placeViewController));
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps16PlaceCardContext_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps16PlaceCardContext_chromeViewController, a3);
}

- (_TtC4Maps27PlaceNoteEditViewController)noteEditorViewController
{
  return (_TtC4Maps27PlaceNoteEditViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                           + OBJC_IVAR____TtC4Maps16PlaceCardContext_noteEditorViewController));
}

- (void)setNoteEditorViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_noteEditorViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_noteEditorViewController) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps16PlaceCardContext)initWithConfiguration:(id)a3
{
  id v3;
  _TtC4Maps16PlaceCardContext *v4;

  v3 = a3;
  v4 = (_TtC4Maps16PlaceCardContext *)sub_1001ECE80(v3);

  return v4;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC4Maps16PlaceCardContext *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps16PlaceCardContext_placeViewController);
  v5 = self;
  objc_msgSend(v4, "resetState");
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[PlaceCardContext dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC4Maps16PlaceCardContext_chromeViewController);
}

- (void)updateConfiguration:(id)a3
{
  id v4;
  _TtC4Maps16PlaceCardContext *v5;

  v4 = a3;
  v5 = self;
  sub_1001EC884(v4);

}

- (void)showAndSelectPlaceOnMapIfNeededWithAnimated:(BOOL)a3
{
  _TtC4Maps16PlaceCardContext *v4;

  v4 = self;
  sub_1001EC5B8(a3);

}

- (_TtC4Maps16PlaceCardContext)init
{
  _TtC4Maps16PlaceCardContext *result;

  result = (_TtC4Maps16PlaceCardContext *)_swift_stdlib_reportUnimplementedInitializer("Maps.PlaceCardContext", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
