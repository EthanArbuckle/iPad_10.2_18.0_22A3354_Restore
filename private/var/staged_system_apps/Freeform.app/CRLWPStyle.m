@implementation CRLWPStyle

- (id)boxedValueForProperty:(unint64_t)a3
{
  _TtC8Freeform10CRLWPStyle *v3;

  v3 = self;
  sub_100757E04(&_mh_execute_header, (uint64_t)"boxedValue(for:)", 16, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Style/CRLWPStyleProxy.swift", 87, 2, 47, "Requesting value for invalid property", 37, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"boxedValue(for:)", 16, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Style/CRLWPStyleProxy.swift", 87, 2u, 47, (uint64_t)"Requesting value for invalid property", 37, 2u);
  swift_unknownObjectRetain(0);

  return 0;
}

- (id)valueForProperty:(unint64_t)a3
{
  uint64_t (*v4)(unint64_t);
  _TtC8Freeform10CRLWPStyle *v5;
  void *v6;

  v4 = *(uint64_t (**)(unint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v5 = self;
  v6 = (void *)v4(a3);

  return v6;
}

- (int)intValueForProperty:(unint64_t)a3
{
  uint64_t (*v4)(unint64_t);
  _TtC8Freeform10CRLWPStyle *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  v4 = *(uint64_t (**)(unint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v5 = self;
  v6 = v4(a3);
  if (v6)
  {
    v7 = v6;
    v8 = objc_opt_self(NSNumber);
    v9 = (void *)swift_dynamicCastObjCClass(v7, v8);
    if (v9)
    {
      v10 = objc_msgSend(v9, "intValue");

      swift_unknownObjectRelease(v7);
      return v10;
    }
    swift_unknownObjectRelease(v7);
  }

  return 0x80000000;
}

- (float)floatValueForProperty:(unint64_t)a3
{
  uint64_t (*v4)(unint64_t);
  _TtC8Freeform10CRLWPStyle *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  float v10;
  float v11;

  v4 = *(uint64_t (**)(unint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v5 = self;
  v6 = v4(a3);
  if (!v6)
    goto LABEL_5;
  v7 = v6;
  v8 = objc_opt_self(NSNumber);
  v9 = (void *)swift_dynamicCastObjCClass(v7, v8);
  if (!v9)
  {
    swift_unknownObjectRelease(v7);
LABEL_5:
    v11 = INFINITY;

    return v11;
  }
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  swift_unknownObjectRelease(v7);
  return v11;
}

- (BOOL)wantsCustomResolveLogicForProperty:(unint64_t)a3 forStyles:(id)a4
{
  return 0;
}

- (id)resolvedValueForProperty:(unint64_t)a3 inStyles:(id)a4
{
  return 0;
}

- (int)resolvedIntForProperty:(unint64_t)a3 inStyles:(id)a4
{
  return 0x80000000;
}

- (float)resolvedFloatForProperty:(unint64_t)a3 inStyles:(id)a4
{
  return INFINITY;
}

- (_TtC8Freeform10CRLWPStyle)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLWPStyle();
  return -[CRLWPStyle init](&v3, "init");
}

@end
