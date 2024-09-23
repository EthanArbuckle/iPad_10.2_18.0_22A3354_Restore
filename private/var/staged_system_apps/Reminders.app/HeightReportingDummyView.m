@implementation HeightReportingDummyView

- (void)layoutSubviews
{
  id v2;
  CGFloat Height;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v4.receiver;
  -[HeightReportingDummyView layoutSubviews](&v4, "layoutSubviews");
  objc_msgSend(v2, "bounds");
  Height = CGRectGetHeight(v5);
  PassthroughSubject.send(_:)(&Height);

}

- (_TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A24HeightReportingDummyView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  _TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A24HeightReportingDummyView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = OBJC_IVAR____TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A24HeightReportingDummyView_viewHeightSubject;
  v10 = sub_10002A750(&qword_10063F868);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)PassthroughSubject.init()();

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[HeightReportingDummyView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A24HeightReportingDummyView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A24HeightReportingDummyView *v9;
  _TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A24HeightReportingDummyView *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = OBJC_IVAR____TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A24HeightReportingDummyView_viewHeightSubject;
  v7 = sub_10002A750(&qword_10063F868);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  v8 = a3;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)PassthroughSubject.init()();

  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = -[HeightReportingDummyView initWithCoder:](&v12, "initWithCoder:", v8);

  return v10;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A24HeightReportingDummyView_viewHeightSubject));
}

@end
