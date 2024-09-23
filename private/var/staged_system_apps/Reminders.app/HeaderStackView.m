@implementation HeaderStackView

- (void)layoutSubviews
{
  id v2;
  CGFloat Height;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v4.receiver;
  -[HeaderStackView layoutSubviews](&v4, "layoutSubviews");
  objc_msgSend(v2, "bounds");
  Height = CGRectGetHeight(v5);
  PassthroughSubject.send(_:)(&Height);

}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

- (_TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  _TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = OBJC_IVAR____TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView_viewHeightSubject;
  v10 = sub_10002A750(&qword_10063F868);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = self;
  *(_QWORD *)&self->NUIContainerStackView_opaque[v9] = PassthroughSubject.init()();

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[HeaderStackView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView)initWithArrangedSubviews:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView *v10;
  NSArray v11;
  _TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    v6 = sub_100005ED8(0, (unint64_t *)&qword_1006406F0, UIView_ptr);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = OBJC_IVAR____TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView_viewHeightSubject;
  v9 = sub_10002A750(&qword_10063F868);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  v10 = self;
  *(_QWORD *)&self->NUIContainerStackView_opaque[v8] = PassthroughSubject.init()();

  if (v7)
  {
    sub_100005ED8(0, (unint64_t *)&qword_1006406F0, UIView_ptr);
    v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v11.super.isa = 0;
  }
  v14.receiver = v10;
  v14.super_class = ObjectType;
  v12 = -[HeaderStackView initWithArrangedSubviews:](&v14, "initWithArrangedSubviews:", v11.super.isa);

  return v12;
}

- (_TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView *v9;
  _TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = OBJC_IVAR____TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView_viewHeightSubject;
  v7 = sub_10002A750(&qword_10063F868);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  v8 = a3;
  v9 = self;
  *(_QWORD *)&self->NUIContainerStackView_opaque[v6] = PassthroughSubject.init()();

  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = -[HeaderStackView initWithCoder:](&v12, "initWithCoder:", v8);

  return v10;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->NUIContainerStackView_opaque[OBJC_IVAR____TtC9RemindersP33_9720CD1AB887D176DDBBBD34D80FC8A015HeaderStackView_viewHeightSubject]);
}

@end
