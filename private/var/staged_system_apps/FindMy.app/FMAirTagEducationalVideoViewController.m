@implementation FMAirTagEducationalVideoViewController

- (_TtC6FindMy38FMAirTagEducationalVideoViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10026A99C();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  v4 = v9.receiver;
  -[FMAirTagEducationalVideoViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "view", v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setNeedsLayout");

    v7 = objc_msgSend(v4, "view");
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "layoutIfNeeded");

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  v4 = v5.receiver;
  -[FMAirTagEducationalVideoViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  if ((v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_animating] & 1) == 0
    && (v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_shouldAnimate] & 1) != 0)
  {
    v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_animating] = 1;
    sub_100269DA8();
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  v4 = v5.receiver;
  -[FMAirTagEducationalVideoViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  if (v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_animating] == 1)
    v4[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_animating] = 0;

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  v2 = v3.receiver;
  -[FMAirTagEducationalVideoViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_100269808();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FMAirTagEducationalVideoViewController();
  v4 = a3;
  v5 = v11.receiver;
  -[FMAirTagEducationalVideoViewController traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  if (qword_1005D1DE8 != -1)
    swift_once(&qword_1005D1DE8, sub_100005ADC);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100056D88(v6, (uint64_t)qword_1005F5748);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter(v8);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "FMAirTagEducationalVideoViewController: traitCollectionDidChange", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  sub_100269808();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void (*v5)(id);
  uint64_t v6;
  _TtC6FindMy38FMAirTagEducationalVideoViewController *v7;

  v4 = a3;
  v7 = self;
  sub_100269808();
  v5 = *(void (**)(id))((char *)&v7->super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollHandler);
  if (v5)
  {
    v6 = *(_QWORD *)&v7->scrollHandler[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollHandler];
    swift_retain(v6);
    v5(v4);
    sub_1000327F0((uint64_t)v5, v6);
  }

}

- (void)doneAction
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _TtC6FindMy38FMAirTagEducationalVideoViewController *v8;

  v2 = qword_1005D1DE8;
  v8 = self;
  if (v2 != -1)
    swift_once(&qword_1005D1DE8, sub_100005ADC);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100056D88(v3, (uint64_t)qword_1005F5748);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter(v5);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "FMAirTagEducationalVideoViewController: Done button pressed", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  -[FMAirTagEducationalVideoViewController dismissViewControllerAnimated:completion:](v8, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC6FindMy38FMAirTagEducationalVideoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy38FMAirTagEducationalVideoViewController *result;

  v4 = a4;
  result = (_TtC6FindMy38FMAirTagEducationalVideoViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAirTagEducationalVideoViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollHandler), *(_QWORD *)&self->scrollHandler[OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_mediator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_actionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_playerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_videoTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy38FMAirTagEducationalVideoViewController_bottomConstraint));
}

- (void)actionTriggered
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint8_t *v18;
  uint8_t *v19;
  uint64_t v20;
  __n128 v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  NSURL *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  Class isa;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;

  v0 = sub_100053F2C((uint64_t *)&unk_1005D3470);
  __chkstk_darwin(v0);
  v2 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for FMIPConfigValue(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1005D1DE8 != -1)
    swift_once(&qword_1005D1DE8, sub_100005ADC);
  v11 = type metadata accessor for Logger(0);
  v33 = sub_100056D88(v11, (uint64_t)qword_1005F5748);
  v12 = Logger.logObject.getter(v33);
  v13 = static os_log_type_t.default.getter(v12);
  if (os_log_type_enabled(v12, v13))
  {
    v14 = v2;
    v15 = v4;
    v16 = v3;
    v17 = v6;
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "FMAirTagEducationalVideoViewController: Action button pressed", v18, 2u);
    v19 = v18;
    v6 = v17;
    v3 = v16;
    v4 = v15;
    v2 = v14;
    swift_slowDealloc(v19, -1, -1);
  }

  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for FMIPConfigValue.batteryRecyclingLink(_:), v7);
  v34[0] = 0;
  v34[1] = 0xE000000000000000;
  FMIPGlobalConfig<A>(_:fallback:)(&v35, v10, v34, &type metadata for String);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v20 = v36;
  URL.init(string:)(v35, v36);
  v21 = swift_bridgeObjectRelease(v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t, __n128))(v4 + 48))(v2, 1, v3, v21) == 1)
  {
    v22 = sub_10009ADFC((uint64_t)v2);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter(v23);
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "FMAirTagEducationalVideoViewController: Cannot open invalid URL", v25, 2u);
      swift_slowDealloc(v25, -1, -1);
    }

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v26 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    URL._bridgeToObjectiveC()(v27);
    v29 = v28;
    v30 = sub_10011D84C((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_100008000((unint64_t *)&qword_1005D2610, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_1004814BC);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v26, "openURL:options:completionHandler:", v29, isa, 0, swift_bridgeObjectRelease(v30).n128_f64[0]);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

@end
