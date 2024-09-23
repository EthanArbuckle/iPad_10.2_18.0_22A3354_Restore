@implementation FMMapAnnotationView

- (_TtC26FindMyNotificationsContent19FMMapAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a4)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = swift_unknownObjectRetain(a3);
  return (_TtC26FindMyNotificationsContent19FMMapAnnotationView *)sub_100009714(v8, v5, v7);
}

- (_TtC26FindMyNotificationsContent19FMMapAnnotationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000C514();
}

- (void)prepareForDisplay
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  v2 = v7.receiver;
  -[FMMapAnnotationView prepareForDisplay](&v7, "prepareForDisplay");
  v3 = objc_msgSend(v2, "annotation", v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = type metadata accessor for FMAnnotation();
    v6 = (_QWORD *)swift_dynamicCastClass(v4, v5);
    if (v6)
      sub_10000A368(v6);

    swift_unknownObjectRelease(v4);
  }
  else
  {

  }
}

- (void)_updateFromMap
{
  _TtC26FindMyNotificationsContent19FMMapAnnotationView *v2;

  v2 = self;
  sub_10000A8B4();

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _TtC26FindMyNotificationsContent19FMMapAnnotationView *v6;

  v6 = self;
  sub_10000AEB4(a3, a4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC26FindMyNotificationsContent19FMMapAnnotationView *v9;
  char *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_10000B67C((uint64_t)a4, x, y);

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  v4 = a3;
  v5 = v6.receiver;
  -[FMMapAnnotationView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_10000B85C();

}

- (BOOL)shouldShowCallout
{
  _TtC26FindMyNotificationsContent19FMMapAnnotationView *v2;
  char v3;
  char v4;

  v2 = self;
  if (-[FMMapAnnotationView isSelected](v2, "isSelected"))
  {
    v3 = *((_BYTE *)&v2->super.super.super.super.isa
         + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCallout);

    v4 = v3 ^ 1;
  }
  else
  {

    v4 = 0;
  }
  return v4 & 1;
}

- (void)prepareForReuse
{
  unsigned __int8 *v2;
  int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  v2 = (unsigned __int8 *)v4.receiver;
  -[FMMapAnnotationView prepareForReuse](&v4, "prepareForReuse");
  objc_msgSend(v2, "setUserInteractionEnabled:", 1, v4.receiver, v4.super_class);
  v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] = 1;
  v3 = v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated];
  v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = 0;
  if (v3 == 1)
    sub_10000BC20();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeCircleLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer));
}

@end
