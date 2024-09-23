@implementation DistanceAccessoryLabelViewModel

- (_TtC4Maps31DistanceAccessoryLabelViewModel)init
{
  return (_TtC4Maps31DistanceAccessoryLabelViewModel *)sub_100185E04();
}

- (void)setString:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC4Maps31DistanceAccessoryLabelViewModel *v13;
  uint64_t KeyPath;
  uint64_t v15;
  _TtC4Maps31DistanceAccessoryLabelViewModel *v16;
  uint64_t v17;

  v5 = type metadata accessor for AttributedString(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v17 - v10;
  v12 = a3;
  v13 = self;
  AttributedString.init(_:)(v12);
  KeyPath = swift_getKeyPath(&unk_100E30DE0);
  v15 = swift_getKeyPath(&unk_100E30E08);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v16 = v13;
  static Published.subscript.setter(v9, v16, KeyPath, v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);

}

- (UIView)labelView
{
  _TtC4Maps31DistanceAccessoryLabelViewModel *v2;
  id v3;

  v2 = self;
  v3 = sub_100186094();

  return (UIView *)v3;
}

- (void)setLabelView:(id)a3
{
  void *v3;
  id v4;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps31DistanceAccessoryLabelViewModel____lazy_storage___labelView);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC4Maps31DistanceAccessoryLabelViewModel____lazy_storage___labelView) = (Class)a3;
  v4 = a3;
  sub_100042EEC(v3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC4Maps31DistanceAccessoryLabelViewModel__distanceString;
  v4 = sub_100008B04(&qword_10149E450);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100042EEC(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC4Maps31DistanceAccessoryLabelViewModel____lazy_storage___labelView));
}

@end
