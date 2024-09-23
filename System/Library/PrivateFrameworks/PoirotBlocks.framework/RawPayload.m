@implementation RawPayload

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *ObjCClassMetadata;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  objc_super v13;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v6 = a3;
  v7 = sub_2445333FC();
  v9 = v8;

  v10 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(_DWORD *)&v10[OBJC_IVAR____TtC12PoirotBlocks10RawPayload_dataVersion] = 1;
  v11 = (uint64_t *)&v10[OBJC_IVAR____TtC12PoirotBlocks10RawPayload_data];
  *v11 = v7;
  v11[1] = v9;
  v13.receiver = v10;
  v13.super_class = ObjCClassMetadata;
  return objc_msgSendSuper2(&v13, sel_init);
}

- (id)serialize
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PoirotBlocks10RawPayload_data);
  v3 = *(unint64_t *)((char *)&self->super.__validators + OBJC_IVAR____TtC12PoirotBlocks10RawPayload_data);
  sub_2444F538C(v2, v3);
  v4 = (void *)sub_2445333E4();
  sub_2444F53D0(v2, v3);
  return v4;
}

- (_TtC12PoirotBlocks10RawPayload)init
{
  _TtC12PoirotBlocks10RawPayload *result;

  result = (_TtC12PoirotBlocks10RawPayload *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PoirotBlocks10RawPayload)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  _TtC12PoirotBlocks10RawPayload *result;

  result = (_TtC12PoirotBlocks10RawPayload *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2444F53D0(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PoirotBlocks10RawPayload_data), *(unint64_t *)((char *)&self->super.__validators + OBJC_IVAR____TtC12PoirotBlocks10RawPayload_data));
}

@end
