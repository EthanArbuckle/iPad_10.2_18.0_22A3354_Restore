@implementation CRLChangeRecord

- (unsigned)kind
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLChangeRecord_kind);
}

- (void)setKind:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLChangeRecord_kind) = a3;
}

- (_TtC8Freeform14CRLPropertyMap)details
{
  return (_TtC8Freeform14CRLPropertyMap *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC8Freeform15CRLChangeRecord_details));
}

- (void)setDetails:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLChangeRecord_details);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLChangeRecord_details) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform15CRLChangeRecord)initWithKind:(unsigned int)a3 details:(id)a4
{
  id v6;
  _TtC8Freeform15CRLChangeRecord *v7;

  v6 = a4;
  v7 = (_TtC8Freeform15CRLChangeRecord *)sub_100D6B504(a3, a4);

  return v7;
}

- (_TtC8Freeform15CRLChangeRecord)init
{
  _TtC8Freeform15CRLChangeRecord *result;

  result = (_TtC8Freeform15CRLChangeRecord *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLChangeRecord", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
