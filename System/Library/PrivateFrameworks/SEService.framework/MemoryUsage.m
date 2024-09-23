@implementation MemoryUsage

- (_TtC9SEService11MemoryUsage)initWithPHeap:(int64_t)a3 cor:(int64_t)a4 cod:(int64_t)a5 usedIndices:(int64_t)a6
{
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11MemoryUsage_pHeap) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11MemoryUsage_cor) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11MemoryUsage_cod) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11MemoryUsage_usedIndices) = (Class)a6;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MemoryUsage();
  return -[MemoryUsage init](&v7, sel_init);
}

+ (_TtC9SEService11MemoryUsage)empty
{
  objc_class *v2;
  char *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for MemoryUsage();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC9SEService11MemoryUsage_pHeap] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9SEService11MemoryUsage_cor] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9SEService11MemoryUsage_cod] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9SEService11MemoryUsage_usedIndices] = 0;
  v5.receiver = v3;
  v5.super_class = v2;
  return (_TtC9SEService11MemoryUsage *)objc_msgSendSuper2(&v5, sel_init);
}

- (int64_t)pHeap
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_pHeap);
  swift_beginAccess();
  return *v2;
}

- (void)setPHeap:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_pHeap);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)cor
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_cor);
  swift_beginAccess();
  return *v2;
}

- (void)setCor:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_cor);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)cod
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_cod);
  swift_beginAccess();
  return *v2;
}

- (void)setCod:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_cod);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)usedIndices
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_usedIndices);
  swift_beginAccess();
  return *v2;
}

- (void)setUsedIndices:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SEService11MemoryUsage_usedIndices);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)description
{
  return (NSString *)sub_20A09BD6C(self, (uint64_t)a2, (void (*)(void))sub_20A0B7D04);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2545CA3A1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2545CA3A1 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9SEService11MemoryUsage *v5;

  v4 = a3;
  v5 = self;
  sub_20A0B8058(v4);

}

- (_TtC9SEService11MemoryUsage)initWithCoder:(id)a3
{
  id v3;
  _TtC9SEService11MemoryUsage *v4;

  v3 = a3;
  v4 = (_TtC9SEService11MemoryUsage *)sub_20A0BA984(v3);

  return v4;
}

- (_TtC9SEService11MemoryUsage)init
{
  _TtC9SEService11MemoryUsage *result;

  result = (_TtC9SEService11MemoryUsage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
