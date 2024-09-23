@implementation DOCUIImageMenuItem

- (_TtC5Files18DOCUIImageMenuItem)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files18DOCUIImageMenuItem_longTitle);
  v6 = (objc_class *)type metadata accessor for DOCUIImageMenuItem();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[DOCUIImageMenuItem initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->longTitle[OBJC_IVAR____TtC5Files18DOCUIImageMenuItem_longTitle]);
}

@end
