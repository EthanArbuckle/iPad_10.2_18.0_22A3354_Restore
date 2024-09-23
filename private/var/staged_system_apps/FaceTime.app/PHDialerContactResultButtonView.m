@implementation PHDialerContactResultButtonView

- (UILabel)primaryLabel
{
  PHDialerContactResultButtonView *v2;
  id v3;

  v2 = self;
  v3 = sub_10004C234();

  return (UILabel *)v3;
}

- (void)setPrimaryLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel) = (Class)a3;
  v3 = a3;

}

- (PHDialerContactResultButtonView)initWithType:(int64_t)a3
{
  return (PHDialerContactResultButtonView *)sub_10004C764(a3, (uint64_t)a2);
}

- (PHDialerContactResultButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10004DC2C();
}

- (void)shouldPrioritizeName
{
  sub_10004CDD0(self, 1000.0, 750.0);
}

- (void)shouldPrioritizeNumber
{
  sub_10004CDD0(self, 750.0, 1000.0);
}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4
{
  id v6;
  id v7;
  PHDialerContactResultButtonView *v8;
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10004C234();
  objc_msgSend(v9, "setAttributedText:", v6);

  v10 = sub_10004C3D4();
  objc_msgSend(v10, "setAttributedText:", v7);

}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4 searchString:(id)a5 isNumberPriority:(BOOL)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  PHDialerContactResultButtonView *v15;

  if (a5)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10004D384(a3, (uint64_t)a4, v10, v12, a6);

  swift_bridgeObjectRelease(v12);
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  PHDialerContactResultButtonView *v11;
  uint64_t v12;

  v5 = sub_10001283C(&qword_1000A2F88);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = type metadata accessor for Notification(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = type metadata accessor for Notification(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = self;
  sub_10004D56C((uint64_t)v8);

  sub_10001287C((uint64_t)v8, &qword_1000A2F88);
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (NSString)largeContentTitle
{
  PHDialerContactResultButtonView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10004D8A0();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (PHDialerContactResultButtonView)initWithFrame:(CGRect)a3
{
  PHDialerContactResultButtonView *result;

  result = (PHDialerContactResultButtonView *)_swift_stdlib_reportUnimplementedInitializer("FaceTime.DialerContactResultButtonView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel));
  sub_10004DBC4(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel));
  v3 = (char *)self + OBJC_IVAR___PHDialerContactResultButtonView_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView));
}

@end
