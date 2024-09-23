@implementation CRLTextPosition

- (BOOL)eolAffinity
{
  return *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_caretAffinity) == (Class)1;
}

- (unint64_t)insertionEdge
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_insertionEdge);
}

- (void)setInsertionEdge:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_insertionEdge) = (Class)a3;
}

- (int64_t)location
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
}

- (unint64_t)caretAffinity
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_caretAffinity);
}

- (id)init:(int64_t)a3 caretAffinity:(unint64_t)a4
{
  objc_class *ObjectType;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_insertionEdge) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location) = (Class)a3;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_caretAffinity) = (Class)a4;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[CRLTextPosition init](&v9, "init");
}

- (id)init:(int64_t)a3
{
  return -[CRLTextPosition init:caretAffinity:](self, "init:caretAffinity:", a3, 0);
}

- (BOOL)isAtStartOfParagraphIn:(id)a3
{
  id v3;

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
  return objc_msgSend(a3, "textRangeForParagraphAtCharIndex:", v3) == v3;
}

- (id)offset:(int64_t)a3 in:(id)a4
{
  id v6;
  _TtC8Freeform15CRLTextPosition *v7;
  id v8;

  v6 = a4;
  v7 = self;
  v8 = sub_1008AE4EC(a3, (uint64_t)v6);

  return v8;
}

- (id)clampedTo:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC8Freeform15CRLTextPosition *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v6, "range");
  v10 = v8;
  v11 = *(uint64_t *)((char *)&v7->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
  if (v11 >= (uint64_t)v8)
  {
    v12 = sub_1008AF008((uint64_t)v8, v9);
    if (v12 >= v11)
      v10 = (id)v11;
    else
      v10 = (id)v12;
  }
  v13 = objc_msgSend(objc_allocWithZone(ObjectType), "init:caretAffinity:", v10, 0);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform15CRLTextPosition *v5;
  uint64_t v6;
  _TtC8Freeform15CRLTextPosition *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1008AEAE8((uint64_t)v10);

  sub_1004D28EC((uint64_t)v10);
  return v8 & 1;
}

- (NSString)description
{
  _TtC8Freeform15CRLTextPosition *v2;
  NSString v3;

  v2 = self;
  sub_1008AEC7C();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  _TtC8Freeform15CRLTextPosition *v2;
  NSString v3;

  v2 = self;
  sub_1008AEC7C();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8Freeform15CRLTextPosition)init
{
  _TtC8Freeform15CRLTextPosition *result;

  result = (_TtC8Freeform15CRLTextPosition *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLTextPosition", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (int64_t)compare:(id)a3
{
  swift_getObjectType(a3);
  return sub_1008AEFA8((uint64_t)a3, (uint64_t)self);
}

@end
