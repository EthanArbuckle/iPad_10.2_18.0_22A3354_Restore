@implementation ConnectionManager

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC13appleaccountd17ConnectionManager *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100005FD4(v6, v7);

  return v9 & 1;
}

- (_TtC13appleaccountd17ConnectionManager)init
{
  return (_TtC13appleaccountd17ConnectionManager *)sub_100165D54();
}

- (void)dealloc
{
  _TtC13appleaccountd17ConnectionManager *v2;

  v2 = self;
  sub_100167680();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100006F58((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_custodianDefaults));
  sub_100006F58((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_healthScheduler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_custodianServiceListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_identityServiceListener));
  sub_100006F58((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_trustedContactsPreflightScheduler));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_inheritanceCleanupController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_inheritanceMessageProcessor));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_custodianDaemonContainer));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_identityDaemonContainer));
  sub_100006F58((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_identityScheduler));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_identityContactsNotificationHandler));
  v3 = (char *)self + OBJC_IVAR____TtC13appleaccountd17ConnectionManager__syncManager;
  v4 = sub_1000080B4(&qword_10028E860);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_postInstallActivityScheduler));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_notificationServiceListener));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_appleIDAvailabilityScheduler));
}

@end
