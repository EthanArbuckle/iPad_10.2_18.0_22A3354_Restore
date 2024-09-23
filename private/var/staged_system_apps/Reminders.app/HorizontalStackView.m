@implementation HorizontalStackView

- (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  unsigned __int8 *v9;
  _TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = &self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_rootStackViewWidth];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  *(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache] = &_swiftEmptyDictionarySingleton;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[HorizontalStackView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  -[HorizontalStackView setNeverCacheEffectiveLayoutSize:](v10, "setNeverCacheEffectiveLayoutSize:", 1);
  return v10;
}

- (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView)initWithArrangedSubviews:(id)isa
{
  objc_class *ObjectType;
  double v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  _TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView *v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (isa)
  {
    v7 = sub_100005ED8(0, (unint64_t *)&qword_1006406F0, UIView_ptr);
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v7);
    v9 = &self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_rootStackViewWidth];
    *(_QWORD *)v9 = 0;
    v9[8] = 1;
    *(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache] = _swiftEmptyDictionarySingleton;
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)&v6 = swift_bridgeObjectRelease(v8).n128_u64[0];
  }
  else
  {
    v10 = &self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_rootStackViewWidth];
    *(_QWORD *)v10 = 0;
    v10[8] = 1;
    *(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache] = _swiftEmptyDictionarySingleton;
  }
  v13.receiver = self;
  v13.super_class = ObjectType;
  v11 = -[HorizontalStackView initWithArrangedSubviews:](&v13, "initWithArrangedSubviews:", isa, v6);

  -[HorizontalStackView setNeverCacheEffectiveLayoutSize:](v11, "setNeverCacheEffectiveLayoutSize:", 1);
  return v11;
}

- (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  _TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView *result;

  v4 = &self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_rootStackViewWidth];
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  *(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache] = &_swiftEmptyDictionarySingleton;
  v5 = a3;

  result = (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIRemindersListHashtagCollectionCell.swift", 54, 2, 534, 0);
  __break(1u);
  return result;
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height;
  double width;
  id v7;
  _TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = self;
  sub_100505068((uint64_t)v7, v9, width, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  _TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v7 = sub_100505188(width, height, (uint64_t)v5, v6);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  char v7[24];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  v4 = (char *)v8.receiver;
  -[HorizontalStackView invalidateInternalStateForInvalidation:](&v8, "invalidateInternalStateForInvalidation:", a3);
  if (a3 > 1)
  {
    v5 = &v4[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache];
    swift_beginAccess(&v4[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache], v7, 1, 0);
    v6 = *(_QWORD *)v5;
    *(_QWORD *)v5 = &_swiftEmptyDictionarySingleton;

    swift_bridgeObjectRelease(v6);
  }
  else
  {

  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache]);
}

@end
