@implementation FMMapViewController

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC6FindMy19FMMapViewController *v10;

  v7 = sub_100006C5C(0, &qword_1005E3BD0, MKAnnotationView_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100013BE0(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)viewDidLoad
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMMapViewController(0);
  v2 = v3.receiver;
  -[FMMapViewController viewDidLoad](&v3, "viewDidLoad");
  sub_1000205E4();
  sub_100029594();
  sub_10002C688(1, 0, 0);
  v2[OBJC_IVAR____TtC6FindMy19FMMapViewController_isAnimationEnabled] = 1;

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  _TtC6FindMy19FMMapViewController *v7;
  char *v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_10000FDEC(v6, (unint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMMapViewController(0);
  v4 = v7.receiver;
  -[FMMapViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  sub_100026698();
  v5 = (void *)objc_opt_self(NSNotificationCenter);
  v6 = objc_msgSend(v5, "defaultCenter", v7.receiver, v7.super_class);
  if (qword_1005D20D8 != -1)
    swift_once(&qword_1005D20D8, sub_10005D2D8);
  objc_msgSend(v6, "addObserver:selector:name:object:", v4, "cardPositionChangedWithNotification:", qword_1005F61F8, 0);

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  id v10;
  _TtC6FindMy19FMMapViewController *v11;
  _TtC6FindMy19FMMapViewController *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];

  v6 = sub_100053F2C((uint64_t *)&unk_1005D3320);
  __chkstk_darwin(v6);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = *((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC6FindMy19FMMapViewController_isAutomaticCenteringEnabled);
  v10 = a3;
  v11 = self;
  v12 = v11;
  if ((v9 & 1) == 0)
  {
    Date.init()(v11);
    v13 = type metadata accessor for Date(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 0, 1, v13);
    v14 = (uint64_t)v12 + OBJC_IVAR____TtC6FindMy19FMMapViewController_lastCenterAnimationDisableDate;
    swift_beginAccess((char *)v12 + OBJC_IVAR____TtC6FindMy19FMMapViewController_lastCenterAnimationDisableDate, v16, 33, 0);
    sub_100362788((uint64_t)v8, v14);
    swift_endAccess(v16);
  }
  sub_100031F08(1);

}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v6;
  _TtC6FindMy19FMMapViewController *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = self;
  v8 = objc_msgSend(v13, "annotations");
  v9 = sub_100053F2C(&qword_1005E1120);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

  if ((unint64_t)v10 >> 62)
  {
    if (v10 < 0)
      v12 = v10;
    else
      v12 = v10 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v10);
    v11 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(v10);
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v10);
  if (v11 == 1)
    sub_10002C688(1, 0, 0);

}

- (void)cardPositionChangedWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC6FindMy19FMMapViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100025B5C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  id v5;
  _TtC6FindMy19FMMapViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10002B190(v5);

}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
  id v6;
  _TtC6FindMy19FMMapViewController *v7;

  v6 = a3;
  v7 = self;
  sub_100031DEC(a4);

}

- (int64_t)userTrackingMode
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMMapViewController_mapView), "userTrackingMode");
}

- (BOOL)hasUserLocation
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMMapViewController_mapView), "hasUserLocation");
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC6FindMy19FMMapViewController *v4;

  v4 = self;
  sub_10000E808(a3);

}

- (_TtC6FindMy19FMMapViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10035FD14();
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy19FMMapViewController *v4;

  v4 = self;
  sub_1003579CC(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy19FMMapViewController *v5;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6FindMy19FMMapViewController_isAutomaticCenteringEnabled) = 1;
  v4 = a3;
  v5 = self;
  sub_100026698();
  sub_10002C688(1, 0, 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for FMMapViewController(0);
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[FMMapViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_10055D3B0, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_100363074;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1003AA008;
  v12[3] = &unk_10055D3C8;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v9, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void).cxx_destruct
{
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMMapViewController_lastCenterAnimationDisableDate, (uint64_t *)&unk_1005D3320);

  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy19FMMapViewController_dataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy19FMMapViewController_selectionSubscription));
  sub_10004FCB8((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMMapViewController_previousSelectedSection, type metadata accessor for FMSelectedSection);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMMapViewController_mapOptionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMMapViewController_statusBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMMapViewController_compassButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMMapViewController_userTrackingAnnotationView));
}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  id v6;
  _TtC6FindMy19FMMapViewController *v7;

  v6 = a3;
  v7 = self;
  sub_10035FE5C(a4);

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  _TtC6FindMy19FMMapViewController *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_10035FF84((uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy19FMMapViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10036026C(v7);

}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy19FMMapViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1003620E4(v7);

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  id v7;
  _TtC6FindMy19FMMapViewController *v8;

  v7 = a3;
  v8 = self;
  sub_100362570(a4);

}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  _TtC6FindMy19FMMapViewController *v7;

  v7 = self;
  sub_1003627D0(a3, a5);

}

- (BOOL)canRotateForHeading
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMMapViewController_mapView), "canRotateForHeading");
}

- (BOOL)isCurrentlyRotated
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMMapViewController_mapView), "isCurrentlyRotated");
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  id v8;
  _TtC6FindMy19FMMapViewController *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  v5 = sub_100053F2C((uint64_t *)&unk_1005D3320);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6FindMy19FMMapViewController_isAutomaticCenteringEnabled) = 0;
  v8 = a3;
  v9 = self;
  Date.init()(v9);
  v10 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 0, 1, v10);
  v11 = (uint64_t)v9 + OBJC_IVAR____TtC6FindMy19FMMapViewController_lastCenterAnimationDisableDate;
  swift_beginAccess((char *)v9 + OBJC_IVAR____TtC6FindMy19FMMapViewController_lastCenterAnimationDisableDate, v13, 33, 0);
  sub_100362788((uint64_t)v7, v11);
  swift_endAccess(v13);

}

@end
