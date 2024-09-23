@implementation FMLocationAlertViewController

- (_TtC6FindMy29FMLocationAlertViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000973E0();
}

- (void)viewWillAppear:(BOOL)a3
{
  sub_10007F904(self, (uint64_t)a2, a3, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_10007F904(self, (uint64_t)a2, a3, (SEL *)&selRef_viewWillDisappear_);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMLocationAlertViewController(0);
  v4 = a3;
  v5 = (char *)v6.receiver;
  -[FMLocationAlertViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_tableView], "reloadData", v6.receiver, v6.super_class);

}

- (void)cancel
{
  void *v3;
  _TtC6FindMy29FMLocationAlertViewController *v4;
  _QWORD v5[6];

  v5[4] = State.rawValue.getter;
  v5[5] = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_100037DF8;
  v5[3] = &unk_1005421C0;
  v3 = _Block_copy(v5);
  v4 = self;
  -[FMLocationAlertViewController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 1, v3);
  _Block_release(v3);

}

- (void)saveAlert
{
  _TtC6FindMy29FMLocationAlertViewController *v2;

  v2 = self;
  sub_100087B8C();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_delegate);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_locationAlert, (uint64_t *)&unk_1005E5940);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_tableView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_mapSnapshotter));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_friendHandles));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_friendForAlert, &qword_1005D3380);
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_alertTarget;
  v4 = type metadata accessor for FMFLocationAlertTarget(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_myCurrentLocation, (uint64_t *)&unk_1005D3350);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_myCurrentUnshiftedLocation, (uint64_t *)&unk_1005D3350);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_friendLocation, (uint64_t *)&unk_1005D3350);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_friendUnshiftedLocation, (uint64_t *)&unk_1005D3350);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_customLocation, (uint64_t *)&unk_1005D3350);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_locationShifter));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController__selectedLocation, (uint64_t *)&unk_1005D3350);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_selectedLocationTimeZone, &qword_1005D3318);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_imageCache));
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_triggerType;
  v6 = type metadata accessor for FMFLocationAlertTriggerType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_schedule;
  v8 = type metadata accessor for FMFSchedule(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_removeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_doneButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_removeCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_dateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_timeFormatterWithTimezone));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMLocationAlertViewController_timeFormatterNoTimezone));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy29FMLocationAlertViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10008B840((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)showRemoveAlert
{
  _TtC6FindMy29FMLocationAlertViewController *v2;

  v2 = self;
  sub_10008D8F4();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC6FindMy29FMLocationAlertViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_100098AB0(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC6FindMy29FMLocationAlertViewController *v6;
  NSString v7;
  id v8;

  v5 = a3;
  v6 = self;
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", v7);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t v5;
  id v6;
  _TtC6FindMy29FMLocationAlertViewController *v7;
  double v8;

  v5 = qword_1005D1B68;
  v6 = a3;
  v7 = self;
  if (v5 != -1)
    swift_once(&qword_1005D1B68, sub_10007BE54);
  v8 = *(double *)&qword_1005F4D20;

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC6FindMy29FMLocationAlertViewController *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v6 = a3;
  v7 = self;
  sub_100098E28(a4);
  v9 = v8;

  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC6FindMy29FMLocationAlertViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1000990E4();

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy29FMLocationAlertViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100099580((uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

@end
