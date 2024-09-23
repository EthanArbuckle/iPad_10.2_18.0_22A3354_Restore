@implementation FMFindingExperiencePresenter

- (void)dealloc
{
  uint64_t v2;
  _TtC6FindMy28FMFindingExperiencePresenter *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  objc_super v9;

  v2 = qword_1005D1DE8;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1005D1DE8, sub_100005ADC);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100056D88(v4, (uint64_t)qword_1005F5748);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter(v6);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "FMFindingExperiencePresenter: Deinit, tearing down", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  sub_10012B5AC();
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for FMFindingExperiencePresenter(0);
  -[FMFindingExperiencePresenter dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_mediator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_conditionSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_itemProviderSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_peopleProviderSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_locationSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_selectionSubscription));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_presentedMode, (uint64_t *)&unk_1005D72C0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_presentedViewController));

  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_backgroundedDate, (uint64_t *)&unk_1005D3320);
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy28FMFindingExperiencePresenter_delegate);
}

- (_TtC6FindMy28FMFindingExperiencePresenter)init
{
  _TtC6FindMy28FMFindingExperiencePresenter *result;

  result = (_TtC6FindMy28FMFindingExperiencePresenter *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMFindingExperiencePresenter", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _TtC6FindMy28FMFindingExperiencePresenter *v13;
  id v14;

  v9 = objc_allocWithZone((Class)type metadata accessor for FMR1FindingViewPresentedTransition());
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = objc_msgSend(v9, "init");

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5;
  id v6;
  _TtC6FindMy28FMFindingExperiencePresenter *v7;
  id v8;

  v5 = objc_allocWithZone((Class)type metadata accessor for FMR1FindingViewDismissedTransition());
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "init");

  return v8;
}

@end
