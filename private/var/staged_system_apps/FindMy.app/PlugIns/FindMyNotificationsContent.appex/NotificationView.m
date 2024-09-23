@implementation NotificationView

- (MKMapView)mapView
{
  return (MKMapView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView);
}

- (void)setMapView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView, a3);
}

- (UILabel)notificationBodyLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel);
}

- (void)setNotificationBodyLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel, a3);
}

- (_TtC26FindMyNotificationsContent16NotificationView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NotificationView();
  return -[NotificationView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC26FindMyNotificationsContent16NotificationView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NotificationView();
  return -[NotificationView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView, a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel, v3);
}

@end
