@implementation TransitLineContext

- (BOOL)chromeDidSelectTransitLineMarker:(id)a3
{
  id v4;
  _TtC4Maps18TransitLineContext *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1000BC95C(v4);

  return self & 1;
}

- (BOOL)chromeDidClearMapSelection
{
  _TtC4Maps18TransitLineContext *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1000BCA38();

  return v3 & 1;
}

- (void)lineCardViewController:(id)a3 doDirectionItem:(id)a4
{
  _TtC4Maps18TransitLineContext *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  Class isa;
  id v13;

  v6 = self;
  v13 = a3;
  v7 = a4;
  v8 = -[TransitLineContext iosBasedChromeViewController](v6, "iosBasedChromeViewController");
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "appCoordinator");

    if (v10)
    {
      v11 = sub_100009758((uint64_t)_swiftEmptyArrayStorage);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v11);
      objc_msgSend(v10, "enterRoutePlanningWithDirectionItem:withUserInfo:", v7, isa);

      v7 = v10;
      v6 = (_TtC4Maps18TransitLineContext *)isa;
    }
  }

}

- (void)lineCardViewController:(id)a3 selectMapItem:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps18TransitLineContext *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000CD360((uint64_t)a4);

}

- (void)lineCardViewController:(id)a3 displayMapRegion:(id)a4
{
  void *v4;
  _TtC4Maps18TransitLineContext *v7;
  _TtC4Maps18TransitLineContext *v8;
  _TtC4Maps18TransitLineContext *v9;
  _TtC4Maps18TransitLineContext *v10;
  _TtC4Maps18TransitLineContext *v11;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController);
  if (v4)
  {
    v11 = self;
    v7 = (_TtC4Maps18TransitLineContext *)a3;
    v8 = (_TtC4Maps18TransitLineContext *)a4;
    v9 = (_TtC4Maps18TransitLineContext *)objc_msgSend(v4, "mapCameraController");
    if (!v9)
    {
LABEL_5:

      return;
    }
    if (v8)
    {
      v10 = v9;
      -[TransitLineContext displayMapRegion:animated:completion:](v9, "displayMapRegion:animated:completion:", v8, 1, 0);

      v7 = v8;
      v8 = v11;
      v11 = v10;
      goto LABEL_5;
    }
    __break(1u);
  }
}

- (void)lineCardViewController:(id)a3 openURL:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC4Maps18TransitLineContext *v13;
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
  sub_1000CD484((uint64_t)v9);

  sub_1000CD5C4((uint64_t)v9);
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController));
}

- (void)setChromeViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController) = (Class)a3;
  v3 = a3;

}

- (GEOTransitLineItem)lineItem
{
  return (GEOTransitLineItem *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC4Maps18TransitLineContext_lineItem)));
}

- (void)setLineItem:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_lineItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_lineItem) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (VKLabelMarker)labelMarker
{
  return (VKLabelMarker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC4Maps18TransitLineContext_labelMarker));
}

- (void)setLabelMarker:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_labelMarker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_labelMarker) = (Class)a3;
  v3 = a3;

}

- (LineCardViewController)lineCardViewController
{
  return (LineCardViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC4Maps18TransitLineContext_lineCardViewController));
}

- (void)setLineCardViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_lineCardViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_lineCardViewController) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps18TransitLineContext)initWithLineItem:(id)a3
{
  _TtC4Maps18TransitLineContext *v4;

  swift_unknownObjectRetain(a3);
  v4 = (_TtC4Maps18TransitLineContext *)sub_100116770((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (_TtC4Maps18TransitLineContext)initWithLabelMarker:(id)a3 preferredLayout:(unint64_t)a4
{
  id v4;
  _TtC4Maps18TransitLineContext *v5;

  v4 = a3;
  v5 = (_TtC4Maps18TransitLineContext *)sub_1001167F8(v4);

  return v5;
}

- (BOOL)isShowingLineWithLabelMarker:(id)a3
{
  id v4;
  _TtC4Maps18TransitLineContext *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100114A58(v4);

  return self & 1;
}

- (BOOL)isShowingLineWithLineItem:(id)a3
{
  return 0;
}

- (BOOL)isShowingLineWithIdentifier:(id)a3
{
  id v4;
  _TtC4Maps18TransitLineContext *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100114C5C(v4);

  return self & 1;
}

- (GEOMapServiceTraits)loadingTraits
{
  _TtC4Maps18TransitLineContext *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100114E38();
  v4 = v3;

  return (GEOMapServiceTraits *)v4;
}

- (void)selectLineFor:(id)a3 zoomToMapRegion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _TtC4Maps18TransitLineContext *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_100114F5C(v6, v4);

}

- (void)selectLineWithLine:(id)a3 zoomToMapRegion:(BOOL)a4
{
  _BOOL4 v4;
  _TtC4Maps18TransitLineContext *v7;

  v4 = a4;
  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_100115908(a3, v4);
  swift_unknownObjectRelease(a3);

}

- (void)prepareLineCardViewControllerForFirstUse
{
  _TtC4Maps18TransitLineContext *v2;

  v2 = self;
  sub_100115ED0();

}

- (TransitLineDisambiguationViewController)disambiguationViewController
{
  return (TransitLineDisambiguationViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC4Maps18TransitLineContext_disambiguationViewController));
}

- (void)setDisambiguationViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_disambiguationViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_disambiguationViewController) = (Class)a3;
  v3 = a3;

}

- (void)disambiguateSelectedLineFor:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC4Maps18TransitLineContext *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1011A3638, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_10011618C(v8, (uint64_t)sub_1000B4E3C, v7);

  swift_release();
}

- (_TtC4Maps18TransitLineContext)init
{
  _TtC4Maps18TransitLineContext *result;

  result = (_TtC4Maps18TransitLineContext *)_swift_stdlib_reportUnimplementedInitializer("Maps.TransitLineContext", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_lineItem));
}

- (id)desiredCards
{
  _TtC4Maps18TransitLineContext *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10011710C();

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

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  uint64_t v7;
  void *v8;
  _TtC4Maps18TransitLineContext *v9;
  id v10;
  id v11;
  _QWORD v12[6];

  v7 = swift_allocObject(&unk_1011A3778, 24, 7);
  *(_QWORD *)(v7 + 16) = self;
  v12[4] = sub_100117724;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1001BB8D4;
  v12[3] = &unk_1011A3790;
  v8 = _Block_copy(v12);
  v9 = self;
  v10 = a3;
  v11 = a4;
  swift_release();
  objc_msgSend(v11, "addPreparation:", v8);
  _Block_release(v8);

}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  _TtC4Maps18TransitLineContext *v10;
  id v11;
  _TtC4Maps18TransitLineContext *v12;
  id v13;
  _QWORD v14[6];

  v7 = swift_allocObject(&unk_1011A3728, 32, 7);
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = self;
  v14[4] = sub_1001176E0;
  v14[5] = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1001BB8D4;
  v14[3] = &unk_1011A3740;
  v8 = _Block_copy(v14);
  v9 = a3;
  v10 = self;
  v11 = v9;
  v12 = v10;
  v13 = a4;
  swift_release();
  objc_msgSend(v13, "addPreparation:", v8);
  _Block_release(v8);

}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  void *v4;
  id v7;
  _TtC4Maps18TransitLineContext *v8;
  id v9;
  _TtC4Maps18TransitLineContext *v10;
  void *v11;
  _TtC4Maps18TransitLineContext *v12;
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
  v11 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController);
  if (v11)
  {
    v12 = v11;
    if (-[TransitLineContext isTopContext:](v12, "isTopContext:", self))
      -[TransitLineContext popContext:animated:completion:](v12, "popContext:animated:completion:", self, 1, 0);

    v4 = self;
  }
  else
  {
    v12 = self;
  }

  sub_10000C180((uint64_t)v13);
}

@end
