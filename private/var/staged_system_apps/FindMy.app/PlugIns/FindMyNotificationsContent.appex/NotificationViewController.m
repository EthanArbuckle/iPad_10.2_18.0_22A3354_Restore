@implementation NotificationViewController

- (void)viewDidLoad
{
  _TtC26FindMyNotificationsContent26NotificationViewController *v2;

  v2 = self;
  sub_1000028D0();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC26FindMyNotificationsContent26NotificationViewController *v4;

  v4 = self;
  sub_100002B1C(a3);

}

- (void)didReceiveNotification:(id)a3
{
  id v4;
  _TtC26FindMyNotificationsContent26NotificationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100002C48(v4);

}

- (_TtC26FindMyNotificationsContent26NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC26FindMyNotificationsContent26NotificationViewController *)sub_100005120(v5, v7, a4);
}

- (_TtC26FindMyNotificationsContent26NotificationViewController)initWithCoder:(id)a3
{
  return (_TtC26FindMyNotificationsContent26NotificationViewController *)sub_1000052B8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_monogrammer));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_contactsDataController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->fmfSession[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText]);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  _TtC26FindMyNotificationsContent26NotificationViewController *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100006BD8(v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  _TtC26FindMyNotificationsContent26NotificationViewController *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100006D10((uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

@end
