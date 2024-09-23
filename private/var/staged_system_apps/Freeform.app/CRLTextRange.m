@implementation CRLTextRange

- (unint64_t)caretAffinity
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_caretAffinity);
}

- (void)setCaretAffinity:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_caretAffinity) = (Class)a3;
}

- (unint64_t)insertionEdge
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_insertionEdge);
}

- (void)setInsertionEdge:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_insertionEdge) = (Class)a3;
}

- (BOOL)eolAffinity
{
  return *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_caretAffinity) == (Class)1;
}

- (_NSRange)nsRange
{
  _TtC8Freeform12CRLTextRange *v2;
  _TtC8Freeform15CRLTextPosition *v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  BOOL v10;
  _NSRange result;

  v2 = self;
  v3 = -[CRLTextRange start](v2, "start");
  v4 = *(uint64_t *)((char *)&v3->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);

  if (v4 == NSNotFound.getter())
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = 0;

  }
  else
  {
    v5 = *(uint64_t *)((char *)&v2->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_range);
    v7 = *(_QWORD *)&v2->range[OBJC_IVAR____TtC8Freeform12CRLTextRange_range];

    v10 = __OFSUB__(v7, v5);
    v6 = v7 - v5;
    if (v10)
    {
      __break(1u);
      goto LABEL_6;
    }
  }
  v8 = v5;
  v9 = v6;
LABEL_6:
  result.length = v9;
  result.location = v8;
  return result;
}

- (BOOL)isInsertionPointRange
{
  return -[CRLTextRange isEmpty](self, "isEmpty");
}

- (BOOL)isEmpty
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_range);
  v2 = *(_QWORD *)&self->range[OBJC_IVAR____TtC8Freeform12CRLTextRange_range];
  if (__OFSUB__(v2, v3))
    __break(1u);
  else
    LOBYTE(self) = v2 == v3;
  return (char)self;
}

- (_TtC8Freeform15CRLTextPosition)start
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  objc_super v7;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_range);
  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_caretAffinity);
  v4 = (objc_class *)type metadata accessor for CRLTextPosition();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Freeform15CRLTextPosition_insertionEdge] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Freeform15CRLTextPosition_location] = v2;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Freeform15CRLTextPosition_caretAffinity] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  return (_TtC8Freeform15CRLTextPosition *)-[CRLTextRange init](&v7, "init");
}

- (_TtC8Freeform15CRLTextPosition)end
{
  _TtC8Freeform12CRLTextRange *v2;
  id v3;

  v2 = self;
  v3 = sub_10060EC58();

  return (_TtC8Freeform15CRLTextPosition *)v3;
}

- (int64_t)length
{
  _TtC8Freeform12CRLTextRange *v2;
  _TtC8Freeform15CRLTextPosition *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t result;
  BOOL v9;

  v2 = self;
  v3 = -[CRLTextRange start](v2, "start");
  v4 = *(uint64_t *)((char *)&v3->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);

  if (v4 == NSNotFound.getter())
  {
    v5 = 0;

    return v5;
  }
  v6 = *(uint64_t *)((char *)&v2->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_range);
  v7 = *(_QWORD *)&v2->range[OBJC_IVAR____TtC8Freeform12CRLTextRange_range];

  v9 = __OFSUB__(v7, v6);
  v5 = v7 - v6;
  if (!v9)
    return v5;
  __break(1u);
  return result;
}

- (_TtC8Freeform12CRLTextRange)initWithRange:(_NSRange)a3
{
  return (_TtC8Freeform12CRLTextRange *)sub_10060EDE4(a3.location, a3.length);
}

+ (_TtC8Freeform12CRLTextRange)textRangeWith:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  v5 = objc_allocWithZone((Class)type metadata accessor for CRLTextRange());
  return (_TtC8Freeform12CRLTextRange *)(id)sub_10060EDE4(location, length);
}

+ (id)textRangeForAllOf:(id)a3
{
  return sub_10060EF88((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10061093C);
}

+ (id)textRangeForStartOf:(id)a3
{
  return sub_100610B24();
}

+ (id)textRangeForEndOf:(id)a3
{
  return sub_10060EF88((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100610864);
}

- (BOOL)isAtParagraphBoundaryIn:(id)a3
{
  id v4;
  _TtC8Freeform12CRLTextRange *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_10060EFE8(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (id)textRangeByExpandingTo:(id)a3
{
  char *v4;
  _TtC8Freeform12CRLTextRange *v5;
  char *v6;

  v4 = (char *)a3;
  v5 = self;
  v6 = sub_10060F42C(v4);

  return v6;
}

- (id)textRangeByCollapsingToZeroLength
{
  _TtC8Freeform12CRLTextRange *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_10060F510();

  return v3;
}

- (id)makeLeadingInsertionPoint
{
  _TtC8Freeform12CRLTextRange *v2;
  id v3;

  v2 = self;
  v3 = sub_10060F544();

  return v3;
}

- (id)makeTrailingInsertionPoint
{
  _TtC8Freeform12CRLTextRange *v2;
  id v3;

  v2 = self;
  v3 = sub_10060F64C();

  return v3;
}

- (id)textRangeByMovingLocationBy:(int64_t)a3
{
  _TtC8Freeform12CRLTextRange *v4;
  char *v5;

  v4 = self;
  v5 = sub_10060F758((char *)a3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return sub_100610434(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_10060F9CC);
}

- (BOOL)containsTextRange:(id)a3
{
  char *v4;
  _TtC8Freeform12CRLTextRange *v5;

  v4 = (char *)a3;
  v5 = self;
  LOBYTE(self) = sub_10060FA78(v4);

  return self & 1;
}

- (BOOL)containsPosition:(id)a3
{
  id v4;
  _TtC8Freeform12CRLTextRange *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10060FBC0((uint64_t)v4);

  return self & 1;
}

- (NSString)debugDescription
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_10060FCB8);
}

- (_TtC8Freeform12CRLTextRange)init
{
  _TtC8Freeform12CRLTextRange *result;

  result = (_TtC8Freeform12CRLTextRange *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLTextRange", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (id)description
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "debugDescription");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

@end
