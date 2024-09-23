@implementation FMClusterAnnotation

- (BOOL)isEqual:(id)a3
{
  _TtC6FindMy19FMClusterAnnotation *v5;
  uint64_t v6;
  _TtC6FindMy19FMClusterAnnotation *v7;
  uint64_t v8;
  char *v9;
  char v10;
  char *v12;
  _BYTE v13[24];
  uint64_t v14;
  _OWORD v15[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v15, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v7 = self;
  }
  sub_10014581C((uint64_t)v15, (uint64_t)v13);
  if (!v14)
  {
    sub_10005D03C((uint64_t)v13);
    goto LABEL_8;
  }
  v8 = type metadata accessor for FMClusterAnnotation();
  if ((swift_dynamicCast(&v12, v13, (char *)&type metadata for Any + 8, v8, 6) & 1) == 0)
  {
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  v9 = v12;
  v10 = sub_100353E5C(v12, (char *)self);

LABEL_9:
  sub_10005D03C((uint64_t)v15);
  return v10 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC6FindMy19FMClusterAnnotation__memberAnnotations));

}

@end
