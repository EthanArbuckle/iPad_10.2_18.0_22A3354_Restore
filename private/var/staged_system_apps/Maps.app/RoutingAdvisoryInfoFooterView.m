@implementation RoutingAdvisoryInfoFooterView

+ (NSString)reuseIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;

  v7 = type metadata accessor for RoutingAdvisoryInfoFooterView();
  v2 = sub_100008B04(&qword_101498CE8);
  String.init<A>(describing:)(&v7, v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (UILabel)descriptionLabel
{
  _TtC4Maps29RoutingAdvisoryInfoFooterView *v2;
  id v3;

  v2 = self;
  v3 = sub_1000AE8A8();

  return (UILabel *)v3;
}

- (void)setDescriptionLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView____lazy_storage___descriptionLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView____lazy_storage___descriptionLabel) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps29RoutingAdvisoryInfoFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps29RoutingAdvisoryInfoFooterView *)sub_1000AEA5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps29RoutingAdvisoryInfoFooterView)initWithCoder:(id)a3
{
  return (_TtC4Maps29RoutingAdvisoryInfoFooterView *)sub_1000AEB64(a3);
}

- (void)prepareForReuse
{
  id v2;
  id v3;
  NSString v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoutingAdvisoryInfoFooterView();
  v2 = v5.receiver;
  -[RoutingAdvisoryInfoFooterView prepareForReuse](&v5, "prepareForReuse");
  v3 = sub_1000AE8A8();
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setText:", v4, v5.receiver, v5.super_class);

}

- (id)tapActionHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler))
    return 0;
  v2 = *(_QWORD *)&self->horizontalMargin[OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler];
  v5[4] = *(Class *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler);
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_1001BB8D4;
  v5[3] = &unk_1011A0948;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setTapActionHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_1011A0930, 24, 7);
    v4[2] = v5;
    v6 = sub_1000AFCE0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler);
  v8 = *(_QWORD *)&self->horizontalMargin[OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_10000BF74(v9, v8);
}

- (void)updateDescriptionInfo:(id)a3 tapHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC4Maps29RoutingAdvisoryInfoFooterView *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1011A0908, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1000268B4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000AF150(v8, (uint64_t)v6, v7);
  sub_10000BF74((uint64_t)v6, v7);

}

- (void)advisoryInfoTapped:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC4Maps29RoutingAdvisoryInfoFooterView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->horizontalMargin[OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10000C128((uint64_t)v3, v5);
    v3(v7);
    sub_10000BF74((uint64_t)v3, v5);

  }
}

+ (id)learnMoreText
{
  Swift::String v2;
  Swift::String v3;
  void *object;
  NSString v5;
  Swift::String v7;

  if (qword_101490ED0 != -1)
    swift_once(&qword_101490ED0, sub_10011833C);
  v7._countAndFlagsBits = 0xD000000000000045;
  v7._object = (void *)0x8000000100E46B60;
  v2._object = (void *)0x8000000100E46B30;
  v2._countAndFlagsBits = 0xD000000000000021;
  v3._countAndFlagsBits = 0x6F4D206E7261654CLL;
  v3._object = (void *)0xEA00000000006572;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v2, (Swift::String_optional)0, (NSBundle)qword_1014D4B80, v3, v7)._object;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView____lazy_storage___descriptionLabel));
  sub_10000BF74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler), *(_QWORD *)&self->horizontalMargin[OBJC_IVAR____TtC4Maps29RoutingAdvisoryInfoFooterView_tapActionHandler]);
}

@end
